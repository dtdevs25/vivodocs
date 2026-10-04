import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import path from 'path';

dotenv.config();

import { query } from './db';

const app = express();
const port = process.env.PORT || 3000;

const initDb = async () => {
  try {
    await query(`ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS recebe_notificacao BOOLEAN DEFAULT true`);
    await query(`ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS two_factor_secret TEXT`);
    await query(`ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS two_factor_enabled BOOLEAN DEFAULT false`);
    await query(`
      CREATE TABLE IF NOT EXISTS notificacoes_config (
          id SERIAL PRIMARY KEY,
          dias_alerta_1 INTEGER DEFAULT 60,
          dias_alerta_2 INTEGER DEFAULT 30,
          dias_alerta_3 INTEGER DEFAULT 15,
          email_customizado TEXT,
          validade_pgr INTEGER DEFAULT 2,
          validade_ltcat INTEGER DEFAULT 2,
          validade_aep INTEGER DEFAULT 2,
          validade_aet INTEGER DEFAULT 2,
          validade_nr01 INTEGER DEFAULT 2,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    
    // Add columns in case the table already exists
    const cols = ['validade_pgr', 'validade_ltcat', 'validade_aep', 'validade_aet', 'validade_nr01'];
    for (const col of cols) {
      await query(`ALTER TABLE notificacoes_config ADD COLUMN IF NOT EXISTS ${col} INTEGER DEFAULT 2`);
    }

    await query(`INSERT INTO notificacoes_config (id) VALUES (1) ON CONFLICT DO NOTHING`);
    console.log('DB migrations complete.');
  } catch (err) {
    console.error('Migration error:', err);
  }
};
initDb();

app.use(cors());
app.use(express.json());

// Routes will be imported here
import unidadesRoutes from './routes/unidades';
import authRoutes from './routes/auth';
import faturamentoRoutes from './routes/faturamento';
import logsRoutes from './routes/logs';
import documentosRoutes from './routes/documentos';

app.use('/api/unidades', unidadesRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/faturamento', faturamentoRoutes);
app.use('/api/logs', logsRoutes);
app.use('/api/documentos', documentosRoutes);

// Serve static frontend in production
app.use(express.static(path.join(__dirname, '../../frontend/dist')));

app.use((req, res, next) => {
  if (!req.path.startsWith('/api')) {
    res.sendFile(path.join(__dirname, '../../frontend/dist/index.html'));
  } else {
    next();
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
