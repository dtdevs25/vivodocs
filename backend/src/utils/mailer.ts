import nodemailer from 'nodemailer';

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST || 'mail.ehspro.com.br',
  port: parseInt(process.env.SMTP_PORT || '587'),
  secure: false, // true for 465, false for other ports
  auth: {
    user: process.env.SMTP_USER || 'vivodocsafe@ehspro.com.br',
    pass: process.env.SMTP_PASS || 'nova@2026',
  },
  tls: {
    rejectUnauthorized: false
  }
});

export const sendWelcomeEmail = async (to: string, nome: string, token: string) => {
  const frontendUrl = process.env.FRONTEND_URL || 'http://localhost:5173';
  const resetLink = `${frontendUrl}?token=${token}`;
  try {
    const info = await transporter.sendMail({
      from: `"Vivo DocSafe" <${process.env.SMTP_USER || 'vivodocsafe@ehspro.com.br'}>`,
      to,
      subject: "Bem-vindo ao Vivo DocSafe - Seus dados de acesso",
      html: `
        <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px;">
          <h2 style="color: #6324c6;">Bem-vindo ao Vivo DocSafe, ${nome}!</h2>
          <p>Sua conta foi criada com sucesso pelo administrador do sistema.</p>
          <p>Para acessar, por favor, defina sua senha clicando no botão abaixo:</p>
          <div style="margin: 30px 0; text-align: center;">
            <a href="${resetLink}" style="background-color: #6324c6; color: #fff; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block;">Criar minha senha</a>
          </div>
          <p>Se o botão não funcionar, copie e cole o link abaixo no seu navegador:</p>
          <p style="word-break: break-all; color: #666; font-size: 12px;">${resetLink}</p>
          <br/>
          <p>Atenciosamente,<br/><strong>Equipe Vivo DocSafe</strong></p>
        </div>
      `,
    });
    console.log("Email enviado: %s", info.messageId);
    return true;
  } catch (error) {
    console.error("Erro ao enviar email:", error);
    return false;
  }
};
