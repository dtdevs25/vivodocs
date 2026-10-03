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

export const sendWelcomeEmail = async (to: string, nome: string, token: string, frontendUrl: string) => {
  const resetLink = `${frontendUrl}?token=${token}`;
  try {
    const info = await transporter.sendMail({
      from: `"Vivo DocSafe" <${process.env.SMTP_USER || 'vivodocsafe@ehspro.com.br'}>`,
      to,
      subject: "Bem-vindo ao Vivo DocSafe - Seus dados de acesso",
      html: `
        <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: 0 auto; border: 1px solid #eaeaea; border-radius: 8px; overflow: hidden; background-color: #fff;">
          <div style="background-color: #6324c6; padding: 20px; text-align: center;">
            <img src="${frontendUrl}/logo.png" alt="DocSafe" style="height: 40px; margin-right: 15px; vertical-align: middle;" />
            <img src="https://logodownload.org/wp-content/uploads/2014/02/vivo-logo-1.png" alt="Vivo" style="height: 30px; vertical-align: middle; filter: brightness(0) invert(1);" />
          </div>
          <div style="padding: 30px;">
            <h2 style="color: #6324c6; margin-top: 0;">Bem-vindo ao Vivo DocSafe, ${nome}!</h2>
            <p style="line-height: 1.5; color: #555;">Sua conta foi configurada com sucesso pelo administrador do sistema.</p>
            <p style="line-height: 1.5; color: #555;">Para garantir a segurança dos seus dados, por favor defina sua senha de acesso exclusiva clicando no botão abaixo:</p>
            <div style="margin: 30px 0; text-align: center;">
              <a href="${resetLink}" style="background-color: #6324c6; color: #fff; padding: 14px 28px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block; font-size: 16px;">Criar minha senha</a>
            </div>
            <p style="color: #888; font-size: 13px;">Se o botão não funcionar, copie e cole o link abaixo no seu navegador:</p>
            <p style="word-break: break-all; color: #6324c6; font-size: 12px; background-color: #f9f9f9; padding: 10px; border-radius: 4px;">${resetLink}</p>
            <br/>
            <p style="line-height: 1.5; color: #555; margin-bottom: 0;">Atenciosamente,<br/><strong>Equipe Vivo DocSafe</strong></p>
          </div>
          <div style="background-color: #f4f4f4; padding: 15px; text-align: center; color: #999; font-size: 11px;">
            &copy; ${new Date().getFullYear()} Vivo DocSafe. Todos os direitos reservados.
          </div>
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
