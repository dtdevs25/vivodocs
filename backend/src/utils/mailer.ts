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

export const sendWelcomeEmail = async (to: string, nome: string, senhaPadrao: string) => {
  try {
    const info = await transporter.sendMail({
      from: `"Vivo DocSafe" <${process.env.SMTP_USER || 'vivodocsafe@ehspro.com.br'}>`,
      to,
      subject: "Bem-vindo ao Vivo DocSafe - Seus dados de acesso",
      html: `
        <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px;">
          <h2 style="color: #6324c6;">Bem-vindo ao Vivo DocSafe, ${nome}!</h2>
          <p>Sua conta foi criada com sucesso pelo administrador do sistema.</p>
          <p>Para acessar, utilize suas credenciais abaixo:</p>
          <div style="background-color: #f4f4f4; padding: 15px; border-radius: 5px; margin: 20px 0;">
            <p style="margin: 0;"><strong>Login (E-mail):</strong> ${to}</p>
            <p style="margin: 10px 0 0 0;"><strong>Senha Temporária:</strong> ${senhaPadrao}</p>
          </div>
          <p>Recomendamos que você altere sua senha após o primeiro login.</p>
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
