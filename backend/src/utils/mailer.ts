import nodemailer from 'nodemailer';

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: parseInt(process.env.SMTP_PORT || '587'),
  secure: false, // true for 465, false for other ports
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS,
  },
  tls: {
    rejectUnauthorized: false
  }
});

export const generateEmailTemplate = (bodyContent: string, frontendUrl: string) => `
  <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: 0 auto; border: 1px solid #eaeaea; border-radius: 12px; overflow: hidden; background-color: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.05);">
    <div style="background-color: #fff; padding: 30px 20px 20px 20px; text-align: center;">
      <img src="${frontendUrl}/icone.png" alt="Ícone" style="height: 45px; margin-right: 12px; vertical-align: middle; display: inline-block;" />
      <img src="${frontendUrl}/principal.png" alt="Logo" style="height: 30px; vertical-align: middle; display: inline-block;" />
    </div>
    <div style="text-align: center; margin-bottom: 10px;">
      <div style="height: 2px; background-color: #6324c6; width: 60%; margin: 0 auto; border-radius: 4px;"></div>
    </div>
    <div style="padding: 20px 30px 30px 30px;">
      ${bodyContent}
      <br/>
      <p style="line-height: 1.5; color: #555; margin-bottom: 0;">Atenciosamente,<br/><strong>Equipe Vivo DocSafe</strong></p>
    </div>
    <div style="background-color: #f4f4f4; padding: 15px; text-align: center; color: #999; font-size: 11px;">
      &copy; ${new Date().getFullYear()} Vivo DocSafe. Todos os direitos reservados.
    </div>
  </div>
`;

export const sendWelcomeEmail = async (to: string, nome: string, token: string, frontendUrl: string) => {
  const resetLink = `${frontendUrl}?token=${token}`;
  
  const bodyContent = `
    <h2 style="color: #6324c6; margin-top: 0; font-size: 22px;">Bem-vindo ao Vivo DocSafe, ${nome}!</h2>
    <p style="line-height: 1.6; color: #555; font-size: 15px;">Sua conta foi configurada com sucesso pelo administrador do sistema.</p>
    <p style="line-height: 1.6; color: #555; font-size: 15px;">Para garantir a segurança dos seus dados, por favor defina sua senha de acesso exclusiva clicando no botão abaixo:</p>
    <div style="margin: 30px 0; text-align: center;">
      <a href="${resetLink}" style="background-color: #6324c6; color: #fff; padding: 14px 28px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block; font-size: 16px; box-shadow: 0 2px 4px rgba(99,36,198,0.3);">Criar minha senha</a>
    </div>
    <p style="color: #888; font-size: 13px; line-height: 1.5;">Se o botão não funcionar, copie e cole o link abaixo no seu navegador:</p>
    <p style="word-break: break-all; color: #6324c6; font-size: 12px; background-color: #f9f9f9; padding: 10px; border-radius: 4px; border: 1px solid #eee;">${resetLink}</p>
  `;

  try {
    const info = await transporter.sendMail({
      from: `"Vivo DocSafe" <${process.env.SMTP_USER}>`,
      to,
      subject: "Bem-vindo ao Vivo DocSafe - Seus dados de acesso",
      html: generateEmailTemplate(bodyContent, frontendUrl),
    });
    console.log("Email enviado: %s", info.messageId);
    return true;
  } catch (error) {
    console.error("Erro ao enviar email:", error);
    return false;
  }
};
