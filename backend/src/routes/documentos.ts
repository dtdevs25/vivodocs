import express from 'express';
import multer from 'multer';
import { query } from '../db';
import { uploadToS3, getSignedFileUrl, deleteFromS3 } from '../utils/s3';
import { logAction } from '../utils/logger';

const router = express.Router();
const upload = multer({ storage: multer.memoryStorage() });

// Upload a document for a specific unit
router.post('/upload', upload.single('file'), async (req, res) => {
  const { unidade_id, tipo_documento, ano, lista_entrega, data_revisao, data_vencimento, observacoes, user_email, user_role } = req.body;
  const file = req.file;

  if (!unidade_id || !tipo_documento) {
    return res.status(400).json({ error: 'unidade_id and tipo_documento are required' });
  }

  try {
    let s3Key = null;
    let originalName = null;
    let mimeType = null;
    let size = null;

    if (file) {
      originalName = file.originalname;
      mimeType = file.mimetype;
      size = file.size;
      s3Key = `${unidade_id}/${Date.now()}-${originalName.replace(/[^a-zA-Z0-9.-]/g, '_')}`;
      await uploadToS3(file.buffer, s3Key, mimeType);
    }

    if (user_role === 'editor') {
      await query(`
        INSERT INTO documentos_quarentena (unidade_id, tipo_documento, arquivo_nome, arquivo_url, arquivo_tipo, arquivo_tamanho, data_revisao, data_vencimento, usuario_email, status)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, 'PENDENTE')
      `, [unidade_id, tipo_documento, originalName, s3Key, mimeType, size, data_revisao || null, data_vencimento || null, user_email]);
      
      await logAction(user_email, 'UPLOAD_QUARENTENA', `Enviou ${tipo_documento} para aprovação (Unidade ID ${unidade_id})`);
      return res.json({ message: 'Documento enviado para aprovação' });
    }

    const checkRes = await query('SELECT id, arquivo_url FROM documentos_sst WHERE unidade_id = $1 AND tipo_documento = $2', [unidade_id, tipo_documento]);
    
    let docId;
    if (checkRes.rows.length > 0) {
      docId = checkRes.rows[0].id;
      // Archive old file if exists and we are uploading a new one
      if (file && checkRes.rows[0].arquivo_url) {
        try {
          const oldDoc = await query('SELECT * FROM documentos_sst WHERE id = $1', [docId]);
          const o = oldDoc.rows[0];
          await query(`INSERT INTO documentos_historico (unidade_id, tipo_documento, arquivo_nome, arquivo_url, arquivo_tipo, arquivo_tamanho, data_revisao, data_vencimento, usuario_email) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`, 
            [o.unidade_id, o.tipo_documento, o.arquivo_nome, o.arquivo_url, o.arquivo_tipo, o.arquivo_tamanho, o.data_revisao, o.data_vencimento, user_email]);
        } catch(e) {
          console.error("Failed to archive old document", e);
        }
      }

      const updateQuery = `
        UPDATE documentos_sst SET
          ano = COALESCE($1, ano),
          lista_entrega = COALESCE($2, lista_entrega),
          data_revisao = COALESCE($3, data_revisao),
          data_vencimento = COALESCE($4, data_vencimento),
          observacoes = COALESCE($5, observacoes),
          updated_at = NOW()
          ${file ? `, arquivo_nome = $6, arquivo_url = $7, arquivo_tipo = $8, arquivo_tamanho = $9` : ''}
        WHERE id = $10 RETURNING id
      `;
      const updateValues = file 
        ? [ano || null, lista_entrega || null, data_revisao || null, data_vencimento || null, observacoes || null, originalName, s3Key, mimeType, size, docId]
        : [ano || null, lista_entrega || null, data_revisao || null, data_vencimento || null, observacoes || null, docId];
      
      await query(updateQuery, updateValues);
    } else {
      const insertRes = await query(`
        INSERT INTO documentos_sst (
          unidade_id, tipo_documento, ano, lista_entrega, data_revisao, data_vencimento, observacoes,
          arquivo_nome, arquivo_url, arquivo_tipo, arquivo_tamanho
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
        RETURNING id
      `, [
        unidade_id, tipo_documento, ano || null, lista_entrega || null, data_revisao || null, data_vencimento || null, observacoes || null,
        originalName, s3Key, mimeType, size
      ]);
      docId = insertRes.rows[0].id;
    }

    if (user_email) {
      await logAction(user_email, 'UPLOAD_DOCUMENTO', `Fez upload de documento ${tipo_documento} para unidade ID ${unidade_id}`);
    }

    res.status(201).json({ success: true, id: docId });
  } catch (error) {
    console.error('Error uploading document:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Generate download link for a document
router.get('/:id/download', async (req, res) => {
  try {
    const docRes = await query('SELECT arquivo_url, arquivo_nome FROM documentos_sst WHERE id = $1', [req.params.id]);
    if (docRes.rows.length === 0 || !docRes.rows[0].arquivo_url) {
      return res.status(404).json({ error: 'Document file not found' });
    }

    const s3Key = docRes.rows[0].arquivo_url;
    const downloadUrl = await getSignedFileUrl(s3Key);

    res.json({ downloadUrl });
  } catch (error) {
    console.error('Error generating download url:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a document (and its file from S3)
router.delete('/:id', async (req, res) => {
  const { user_email } = req.body;
  try {
    const docRes = await query('SELECT * FROM documentos_sst WHERE id = $1', [req.params.id]);
    if (docRes.rows.length === 0) {
      return res.status(404).json({ error: 'Document not found' });
    }

    const doc = docRes.rows[0];

    // Delete from S3
    if (doc.arquivo_url) {
      await deleteFromS3(doc.arquivo_url);
    }

    // Delete from DB
    await query('DELETE FROM documentos_sst WHERE id = $1', [req.params.id]);

    if (user_email) {
      await logAction(user_email, 'DELETE_DOCUMENTO', `Excluiu documento ${doc.tipo_documento} (ID ${req.params.id})`);
    }

    res.json({ success: true });
  } catch (error) {
    console.error('Error deleting document:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET historico
router.get('/:unidade_id/historico/:tipo_documento', async (req, res) => {
  try {
    const { unidade_id, tipo_documento } = req.params;
    const { rows } = await query(
      'SELECT * FROM documentos_historico WHERE unidade_id = $1 AND tipo_documento = $2 ORDER BY created_at DESC',
      [unidade_id, tipo_documento]
    );
    res.json(rows);
  } catch(err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao buscar histórico' });
  }
});

// GET historico by doc_id
router.get('/historico-by-doc/:doc_id', async (req, res) => {
  try {
    const { doc_id } = req.params;
    const docRes = await query('SELECT unidade_id, tipo_documento FROM documentos_sst WHERE id = $1', [doc_id]);
    if (docRes.rows.length === 0) return res.json([]);
    
    const { unidade_id, tipo_documento } = docRes.rows[0];
    const { rows } = await query(
      'SELECT * FROM documentos_historico WHERE unidade_id = $1 AND tipo_documento = $2 ORDER BY created_at DESC',
      [unidade_id, tipo_documento]
    );
    res.json(rows);
  } catch(err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao buscar histórico' });
  }
});

// GET Quarantine
router.get('/quarentena/pendentes', async (req, res) => {
  try {
    const { rows } = await query(`
      SELECT q.*, u.filial, u.cnpj 
      FROM documentos_quarentena q 
      JOIN unidades u ON q.unidade_id = u.id 
      WHERE q.status = 'PENDENTE' 
      ORDER BY q.created_at ASC
    `);
    res.json(rows);
  } catch(err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao buscar quarentena' });
  }
});

// POST Approve
router.post('/quarentena/:id/aprovar', async (req, res) => {
  try {
    const qRes = await query('SELECT * FROM documentos_quarentena WHERE id = $1', [req.params.id]);
    if (qRes.rows.length === 0) return res.status(404).json({ error: 'Not found' });
    const q = qRes.rows[0];

    // Transfer to documentos_sst
    const checkRes = await query('SELECT id, arquivo_url FROM documentos_sst WHERE unidade_id = $1 AND tipo_documento = $2', [q.unidade_id, q.tipo_documento]);
    if (checkRes.rows.length > 0) {
      if (checkRes.rows[0].arquivo_url) {
        const oldDoc = await query('SELECT * FROM documentos_sst WHERE id = $1', [checkRes.rows[0].id]);
        const o = oldDoc.rows[0];
        await query(`INSERT INTO documentos_historico (unidade_id, tipo_documento, arquivo_nome, arquivo_url, arquivo_tipo, arquivo_tamanho, data_revisao, data_vencimento, usuario_email) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`, 
          [o.unidade_id, o.tipo_documento, o.arquivo_nome, o.arquivo_url, o.arquivo_tipo, o.arquivo_tamanho, o.data_revisao, o.data_vencimento, o.usuario_email || q.usuario_email]);
      }
      await query(`
        UPDATE documentos_sst SET
          data_revisao = COALESCE($1, data_revisao),
          data_vencimento = COALESCE($2, data_vencimento),
          arquivo_nome = $3, arquivo_url = $4, arquivo_tipo = $5, arquivo_tamanho = $6, updated_at = NOW()
        WHERE id = $7
      `, [q.data_revisao, q.data_vencimento, q.arquivo_nome, q.arquivo_url, q.arquivo_tipo, q.arquivo_tamanho, checkRes.rows[0].id]);
    } else {
      await query(`
        INSERT INTO documentos_sst (unidade_id, tipo_documento, data_revisao, data_vencimento, arquivo_nome, arquivo_url, arquivo_tipo, arquivo_tamanho)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
      `, [q.unidade_id, q.tipo_documento, q.data_revisao, q.data_vencimento, q.arquivo_nome, q.arquivo_url, q.arquivo_tipo, q.arquivo_tamanho]);
    }

    await query('UPDATE documentos_quarentena SET status = $1 WHERE id = $2', ['APROVADO', q.id]);
    await logAction(req.body.user_email || 'admin', 'APROVAR_DOCUMENTO', `Aprovou documento ID ${q.id} de ${q.usuario_email}`);
    res.json({ message: 'Aprovado com sucesso' });
  } catch(err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao aprovar' });
  }
});

// POST Reject
router.post('/quarentena/:id/rejeitar', async (req, res) => {
  try {
    const { motivo, user_email } = req.body;
    await query('UPDATE documentos_quarentena SET status = $1, motivo_rejeicao = $2 WHERE id = $3', ['REJEITADO', motivo, req.params.id]);
    await logAction(user_email || 'admin', 'REJEITAR_DOCUMENTO', `Rejeitou documento ID ${req.params.id}. Motivo: ${motivo}`);
    res.json({ message: 'Rejeitado' });
  } catch(err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao rejeitar' });
  }
});

export default router;
