import { query } from '../db';

export async function logAction(usuario_email: string, acao: string, detalhes: string) {
  try {
    await query(
      `INSERT INTO sistema_logs (usuario_email, acao, detalhes) VALUES ($1, $2, $3)`,
      [usuario_email || 'sistema@vivo.com', acao, detalhes]
    );
  } catch (error) {
    console.error('Falha ao registrar log de auditoria:', error);
  }
}
