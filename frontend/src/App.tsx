import React, { useState, useEffect } from 'react';
import { Menu, LogOut, LayoutDashboard, Building2, FileCheck, CircleDollarSign, Users, Globe, ShieldCheck, FileSearch, UserCog, Eye, EyeOff, Pencil, Trash2, Bell, FileSpreadsheet, Mail, BarChart2, Calendar, X, Settings } from 'lucide-react';
import axios from 'axios';
import * as XLSX from 'xlsx-js-style';
import { BarChart, Bar, XAxis, YAxis, Tooltip, CartesianGrid } from 'recharts';

type Role = 'master' | 'admin' | 'editor' | 'visualizador';

interface UserData {
  nome: string;
  email: string;
  role: Role;
  two_factor_enabled?: boolean;
}

function getStatusColor(val: string) {
  if (!val) return 'gray';
  const v = val.toLowerCase();
  if (v.includes('2026') || v.includes('2027') || v.includes('vigente')) return 'green';
  if (v.includes('2025') || v.includes('atenção')) return 'amber';
  if (v.includes('2024') || v.includes('2023') || v.includes('venceu')) return 'red';
  return 'gray';
}

// Validade default fallback
const DOC_VALIDADE_ANOS: Record<string, number> = { PGR: 2, LTCAT: 2, AEP: 2, AET: 2, NR01: 2 };

function parseLocalDate(raw: string): Date | null {
  if (!raw) return null;
  const s = String(raw).trim();
  const m = s.match(/^(\d{4})-(\d{2})-(\d{2})/);
  if (m) return new Date(+m[1], +m[2] - 1, +m[3]);
  const br = s.match(/^(\d{2})\/(\d{2})\/(\d{4})/);
  if (br) return new Date(+br[3], +br[2] - 1, +br[1]);
  if (/^\d{4}$/.test(s)) return new Date(+s, 0, 1);
  return null;
}

function getDocValidity(doc: string, raw: string, vencimentoRaw?: string, configValidadeAnos?: number) {
  const anos = configValidadeAnos !== undefined ? configValidadeAnos : (DOC_VALIDADE_ANOS[doc] || 2);
  const vencReal = vencimentoRaw ? parseLocalDate(vencimentoRaw) : null;
  let emissao: Date;
  let vencimento: Date;
  if (vencReal) {
    vencimento = vencReal;
    emissao = new Date(vencReal); emissao.setFullYear(emissao.getFullYear() - anos);
  } else {
    const e = parseLocalDate(raw);
    if (!e) return null;
    emissao = e;
    vencimento = new Date(emissao);
    vencimento.setFullYear(vencimento.getFullYear() + anos);
  }
  const hoje = new Date(); hoje.setHours(0, 0, 0, 0);
  const dias = Math.round((vencimento.getTime() - hoje.getTime()) / 86400000);
  return { emissao, vencimento, dias, valido: dias >= 0 };
}

function isTech(u: any) { return !!u?.tipo_predio && String(u.tipo_predio).toLowerCase().includes('tech'); }

type TipoKey = 'loja' | 'predio' | 'dg' | 'tech' | 'outro';
function getTipoKey(u: any): TipoKey {
  if (u.is_dg) return 'dg';
  if (isTech(u)) return 'tech';
  const t = String(u.tipo_predio || '').toLowerCase();
  if (t.includes('loja')) return 'loja';
  if (t.includes('pr')) return 'predio';
  return 'outro';
}

const TIPO_TABS: { key: 'todas' | TipoKey; label: string }[] = [
  { key: 'todas', label: 'Todas' },
  { key: 'loja', label: 'Lojas' },
  { key: 'predio', label: 'Prédios' },
  { key: 'dg', label: 'DGs' },
  { key: 'tech', label: 'TECHs' },
];

function tipoBadge(u: any) {
  if (u.is_dg) return { label: 'DG', color: 'var(--amber)', bg: '#fef3e2' };
  if (isTech(u)) return { label: 'TECH', color: '#0d9488', bg: '#ccfbf1' };
  if (u.tipo_predio?.toLowerCase().includes('loja')) return { label: 'Loja', color: 'var(--purple)', bg: '#f3e8ff' };
  if (u.tipo_predio?.toLowerCase().includes('pr')) return { label: 'Prédio', color: '#3b82f6', bg: '#eff6ff' };
  return { label: u.tipo_predio || '—', color: 'var(--muted)', bg: '#f3f4f6' };
}

function App() {
  const [user, setUser] = useState<UserData | null>(null);
  const [loginEmail, setLoginEmail] = useState('');
  const [loginPassword, setLoginPassword] = useState('');
  const [req2fa, setReq2fa] = useState(false);
  const [tempToken, setTempToken] = useState('');
  const [code2fa, setCode2fa] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [isForgotPassword, setIsForgotPassword] = useState(false);
  const [forgotEmail, setForgotEmail] = useState('');

  const [sidebarOpen, setSidebarOpen] = useState(true);
  const [activeTab, setActiveTab] = useState('dashboard');
  const [notificationsOpen, setNotificationsOpen] = useState(false);
  
  const [resetToken, setResetToken] = useState('');
  const [newPassword, setNewPassword] = useState('');

  const [profileModalOpen, setProfileModalOpen] = useState(false);
  const [qrCodeUrl, setQrCodeUrl] = useState('');
  const [setupCode2fa, setSetupCode2fa] = useState('');
  const [profilePassword, setProfilePassword] = useState('');

  const [searchQuery, setSearchQuery] = useState('');

  const [dashboardData, setDashboardData] = useState<any>({ total_ativas: 0, total_desmobilizadas: 0, total_dgs: 0, total_techs: 0, total_sesmt: 0, total_iso: 0, pgrs_vigentes: 0, pgrs_vencendo: 0, pgrs_vencidos: 0, ltcat_vigentes: 0, ltcat_vencendo: 0, ltcat_vencidos: 0, aet_vigentes: 0, aet_vencendo: 0, aet_vencidos: 0, pendentes: 0, cobertura: 0 });
  const [matriz, setMatriz] = useState<any[]>([]);
  const [faturamento, setFaturamento] = useState<any[]>([]);
  const [faturamentoResumo, setFaturamentoResumo] = useState<any>({});
  
  const [adminUsers, setAdminUsers] = useState<any[]>([]);
  const [adminLogs, setAdminLogs] = useState<any[]>([]);
  
  const [unitSubTab, setUnitSubTab] = useState<'todas' | TipoKey | 'desmobilizadas'>('todas');
  const [adminSubTab, setAdminSubTab] = useState<'users'|'logs'|'notificacoes'>('users');
  const [selectedUnit, setSelectedUnit] = useState<any>(null);
  const [editUnit, setEditUnit] = useState<any>(null);
  const [deleteTarget, setDeleteTarget] = useState<any>(null);
  const [expiryInfo, setExpiryInfo] = useState<{ doc: string; raw?: string; venc?: string; lista?: string; statusTxt?: string; docId?: number; fileName?: string } | null>(null);
  const [matrizTipo, setMatrizTipo] = useState<'todas' | 'lojas' | 'predios' | 'dgs' | 'techs'>('todas');
  const [regionalFilter, setRegionalFilter] = useState('');
  const [isoFilter, setIsoFilter] = useState(false);
  const [sesmtFilter, setSesmtFilter] = useState(false);
  const [hiddenLegend, setHiddenLegend] = useState<Record<string, boolean>>({});
  const [notifConfig, setNotifConfig] = useState({ dias_alerta_1: 60, dias_alerta_2: 30, dias_alerta_3: 15, email_customizado: '', validade_pgr: 2, validade_ltcat: 2, validade_aep: 2, validade_aet: 2, validade_nr01: 2 });
  const [clearedNotifs, setClearedNotifs] = useState<number[]>([]);
  
  const getValidadeAnos = (doc: string) => {
    const map: any = { PGR: notifConfig.validade_pgr, LTCAT: notifConfig.validade_ltcat, AEP: notifConfig.validade_aep, AET: notifConfig.validade_aet, NR01: notifConfig.validade_nr01 };
    return map[doc] || 2;
  };

  const [faturamentoModalOpen, setFaturamentoModalOpen] = useState(false);
  const [faturamentoChartOpen, setFaturamentoChartOpen] = useState(false);
  const [novoFat, setNovoFat] = useState({
    id: null as number | null,
    lista_lote: '', justificativa: '',
    qtd_pgr: 0, valor_unit_pgr: 0,
    qtd_ltcat: 0, valor_unit_ltcat: 0,
    qtd_aep: 0, valor_unit_aep: 0,
    qtd_aet: 0, valor_unit_aet: 0,
    qtd_insalubridade: 0, valor_unit_insalubridade: 0,
    qtd_diversos: 0, valor_unit_diversos: 0,
    desconto: 0,
    unidades: [] as number[]
  });
  const [deleteFatTarget, setDeleteFatTarget] = useState<any>(null);

  const handleExportExcel = (filteredData: any[], fileName: string) => {
    const ws_data = [
      ['CNPJ', 'Filial', 'Tipo', 'Cidade', 'UF', 'Regional', 'ISO 45001', 'Compõe SESMT', 'PGR Data', 'PGR Validade', 'LTCAT Data', 'AEP Data', 'AET Data']
    ];
    
    filteredData.forEach(u => {
      ws_data.push([
        u.cnpj,
        u.filial,
        getTipoKey(u).toUpperCase(),
        u.cidade || '',
        u.uf || '',
        u.regional || '',
        u.escopo_iso_45001 ? 'Sim' : 'Não',
        u.compoe_sesmt ? 'Sim' : 'Não',
        u.pgr_ano || u.pgr_data || '',
        u.pgr_vencimento ? new Date(u.pgr_vencimento).toLocaleDateString('pt-BR') : '',
        u.ltcat_ano || u.ltcat_data || '',
        u.aep_ano || u.aep_data || '',
        u.aet_ano || u.aet_data || '',
      ]);
    });

    const ws = XLSX.utils.aoa_to_sheet(ws_data);
    const headerStyle = { font: { bold: true, color: { rgb: "FFFFFF" } }, fill: { fgColor: { rgb: "6B21A8" } }, alignment: { horizontal: "center", vertical: "center" } };
    const range = XLSX.utils.decode_range(ws['!ref'] || 'A1:M1');
    for (let C = range.s.c; C <= range.e.c; ++C) {
      const addr = XLSX.utils.encode_cell({ r: 0, c: C });
      if (!ws[addr]) continue;
      ws[addr].s = headerStyle;
    }
    ws['!cols'] = [{ wch: 20 }, { wch: 40 }, { wch: 10 }, { wch: 20 }, { wch: 5 }, { wch: 20 }, { wch: 12 }, { wch: 15 }, { wch: 15 }, { wch: 15 }, { wch: 15 }, { wch: 15 }, { wch: 15 }];
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Dados");
    XLSX.writeFile(wb, `${fileName}_${new Date().toISOString().split('T')[0]}.xlsx`);
  };

  const [modal, setModal] = useState<any>({isOpen: false, type: 'alert', title: '', message: ''});

  const openAlert = (title: string, message: string) => setModal({ isOpen: true, type: 'alert', title, message });
  const openConfirm = (title: string, message: string, onConfirm: () => void) => setModal({ isOpen: true, type: 'confirm', title, message, onConfirm });
  const openUserForm = (u?: any) => setModal({ isOpen: true, type: 'userForm', title: u ? 'Editar Usuário' : 'Novo Usuário', message: '', formData: u || { nome: '', email: '', nivel_acesso: 'visualizador', recebe_notificacao: true } });
  const closeModal = () => setModal({isOpen: false});

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      if (req2fa) {
        const res = await axios.post('/api/auth/2fa/verify-login', { tempToken, code: code2fa });
        setUser(res.data.user);
      } else {
        const res = await axios.post('/api/auth/login', { email: loginEmail, senha: loginPassword });
        if (res.data.requires_2fa) {
          setReq2fa(true);
          setTempToken(res.data.tempToken);
        } else {
          setUser(res.data.user);
        }
      }
    } catch (err: any) {
      openAlert('Falha no Login', err.response?.data?.error || 'Erro ao fazer login');
    }
  };

  const fetchDashboard = async () => {
    try { const res = await axios.get('/api/unidades/dashboard'); setDashboardData(res.data); } catch (e) {}
  };
  const fetchMatriz = async () => {
    try { const res = await axios.get('/api/unidades/matriz'); setMatriz(res.data); } catch (e) {}
  };
  const fetchFaturamento = async () => {
    try { 
      const res = await axios.get('/api/faturamento'); setFaturamento(res.data);
      const res2 = await axios.get('/api/faturamento/resumo'); setFaturamentoResumo(res2.data);
    } catch (e) {}
  };
  const fetchAdminUsers = async () => {
    try { const res = await axios.get('/api/auth/users'); setAdminUsers(res.data); } catch (e) {}
  };
  const fetchAdminLogs = async () => {
    try { const res = await axios.get('/api/auth/logs'); setAdminLogs(res.data); } catch (e) {}
  };

  const handleUpload = async (unidadeId: number, tipoDocumento: string, file?: File) => {
    if (!file) return;
    const formData = new FormData();
    formData.append('unidade_id', unidadeId.toString());
    formData.append('tipo_documento', tipoDocumento);
    formData.append('file', file);
    if (user?.email) formData.append('user_email', user.email);

    try {
      await axios.post('/api/documentos/upload', formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      openAlert('Sucesso', 'Arquivo anexado com sucesso!');
      fetchMatriz(); // Refresh data to get new file links
      
      // Update selected unit in modal if it's open
      if (selectedUnit && selectedUnit.id === unidadeId) {
        setSelectedUnit(null); // Close modal so user can reopen to see new file, or update state
      }
      
      if (editUnit && editUnit.id === unidadeId) {
        setEditUnit({
          ...editUnit,
          [`${tipoDocumento.toLowerCase()}_arquivo_nome`]: file.name
        });
      }
    } catch (e) {
      openAlert('Erro', 'Falha ao anexar arquivo.');
    }
  };

  const handleDownload = async (docId: number) => {
    try {
      const res = await axios.get(`/api/documentos/${docId}/download`);
      window.open(res.data.downloadUrl, '_blank');
    } catch (e) {
      openAlert('Erro', 'Falha ao gerar link de download.');
    }
  };

  const start2FASetup = async () => {
    try {
      const res = await axios.post('/api/auth/2fa/generate', { email: user?.email });
      setQrCodeUrl(res.data.qrCodeUrl);
    } catch(err) {
      openAlert('Erro', 'Não foi possível gerar o 2FA.');
    }
  };

  const confirm2FASetup = async () => {
    try {
      await axios.post('/api/auth/2fa/enable', { email: user?.email, code: setupCode2fa });
      openAlert('Sucesso', 'Autenticação de 2 Fatores ativada com sucesso!');
      setQrCodeUrl('');
      setSetupCode2fa('');
      if(user) setUser({...user, two_factor_enabled: true});
    } catch(err: any) {
      openAlert('Erro', err.response?.data?.error || 'Código inválido.');
    }
  };

  const disable2FA = async () => {
    try {
      await axios.post('/api/auth/2fa/disable', { email: user?.email, senha: profilePassword });
      openAlert('Sucesso', 'Autenticação de 2 Fatores desativada.');
      setProfilePassword('');
      if(user) setUser({...user, two_factor_enabled: false});
    } catch(err: any) {
      openAlert('Erro', err.response?.data?.error || 'Senha incorreta.');
    }
  };

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const token = params.get('token');
    if (token) setResetToken(token);
    
    if (user) {
      if (activeTab === 'dashboard') { fetchDashboard(); fetchMatriz(); }
      if (activeTab === 'unidades' || activeTab === 'matriz') fetchMatriz();
      if (activeTab === 'financeiro') fetchFaturamento();
      if (activeTab === 'admin') { 
        fetchAdminUsers(); 
        fetchAdminLogs(); 
        axios.get('/api/auth/notificacoes-config').then(res => setNotifConfig(res.data)).catch(() => {});
      }
    }
  }, [user, activeTab]);
  const handleUpdateUnit = async () => {
    if (!editUnit) return;
    try {
      if (editUnit.id) {
        await axios.put(`/api/unidades/${editUnit.id}`, { ...editUnit, userEmail: user?.email });
        openAlert('Sucesso', `Unidade "${editUnit.filial}" atualizada com sucesso!`);
      } else {
        await axios.post(`/api/unidades`, { ...editUnit, userEmail: user?.email });
        openAlert('Sucesso', `Unidade "${editUnit.filial}" cadastrada com sucesso!`);
      }
      setEditUnit(null);
      setSelectedUnit(null);
      fetchMatriz();
      fetchDashboard();
    } catch (err) {
      openAlert('Erro', 'Não foi possível salvar a unidade.');
    }
  };

  const handleDeleteUnit = async () => {
    if (!deleteTarget) return;
    try {
      await axios.delete(`/api/unidades/${deleteTarget.id}`, { data: { userEmail: user?.email } });
      openAlert('Excluído', `Unidade "${deleteTarget.filial}" foi removida permanentemente.`);
      setDeleteTarget(null);
      setSelectedUnit(null);
      fetchMatriz();
      fetchDashboard();
    } catch (err) {
      openAlert('Erro', 'Não foi possível excluir a unidade.');
    }
  };

  const handleDeleteFaturamento = async () => {
    if (!deleteFatTarget) return;
    try {
      await axios.delete(`/api/faturamento/${deleteFatTarget.id}`);
      openAlert('Excluído', 'Lançamento excluído com sucesso.');
      setDeleteFatTarget(null);
      fetchFaturamento();
    } catch (err) {
      openAlert('Erro', 'Não foi possível excluir o lançamento.');
    }
  };

  const handleSalvarFaturamento = async () => {
    try {
      const calcTotal = (
        novoFat.qtd_pgr * novoFat.valor_unit_pgr +
        novoFat.qtd_ltcat * novoFat.valor_unit_ltcat +
        novoFat.qtd_aep * novoFat.valor_unit_aep +
        novoFat.qtd_aet * novoFat.valor_unit_aet +
        novoFat.qtd_insalubridade * novoFat.valor_unit_insalubridade +
        novoFat.qtd_diversos * novoFat.valor_unit_diversos
      );
      const payload = { ...novoFat, valor_total: calcTotal - novoFat.desconto };
      if (novoFat.id) {
        await axios.put(`/api/faturamento/${novoFat.id}`, payload);
        openAlert('Sucesso', 'Lançamento editado!');
      } else {
        await axios.post('/api/faturamento', payload);
        openAlert('Sucesso', 'Lançamento salvo!');
      }
      setFaturamentoModalOpen(false);
      setNovoFat({ id: null, lista_lote: '', justificativa: '', qtd_pgr: 0, valor_unit_pgr: 0, qtd_ltcat: 0, valor_unit_ltcat: 0, qtd_aep: 0, valor_unit_aep: 0, qtd_aet: 0, valor_unit_aet: 0, qtd_insalubridade: 0, valor_unit_insalubridade: 0, qtd_diversos: 0, valor_unit_diversos: 0, desconto: 0, unidades: [] });
      fetchFaturamento();
    } catch (err) {
      openAlert('Erro', 'Erro ao salvar lançamento');
    }
  };

  if (!user) {
    if (resetToken) {
      const handleSetPassword = async (e: React.FormEvent) => {
        e.preventDefault();
        try {
          await axios.post('/api/auth/reset-password-with-token', { token: resetToken, newPassword });
          openAlert('Sucesso', 'Senha criada com sucesso! Você já pode fazer login.');
          window.history.replaceState(null, '', window.location.pathname);
          setResetToken('');
        } catch (err: any) {
          openAlert('Erro', err.response?.data?.error || 'Erro ao criar senha.');
        }
      };
      return (
        <div className="layout">
          <div className="login-container" style={{ width: '100%', height: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
            <div className="login-card">
              <div className="login-brand" style={{ justifyContent: 'center' }}>
                <img src="/logo.png?v=4" alt="DocSafe" style={{ maxHeight: '46px', objectFit: 'contain' }} />
              </div>
              <div className="login-header-text">Criar Senha de Acesso</div>
              <form className="login-form" onSubmit={handleSetPassword}>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
                  <label>Nova Senha</label>
                  <input type="password" value={newPassword} onChange={(e) => setNewPassword(e.target.value)} required placeholder="••••••••" />
                </div>
                <button type="submit" className="login-btn">Salvar Senha e Entrar</button>
              </form>
            </div>
          </div>
          {modal.isOpen && (
            <div className="modal-overlay" style={{ zIndex: 10001 }}>
              <div className="modal-box" style={{ width: '400px' }}>
                <div className="modal-header">
                  <div className="modal-title"><h2>{modal.title}</h2></div>
                  <button className="modal-close" onClick={closeModal}>×</button>
                </div>
                <div className="modal-body"><p>{modal.message}</p></div>
                <div className="modal-footer">
                  <button className="btn primary" onClick={closeModal}>OK</button>
                </div>
              </div>
            </div>
          )}
        </div>
      );
    }
    const handleForgotPassword = async (e: React.FormEvent) => {
      e.preventDefault();
      try {
        await axios.post('/api/auth/forgot-password', { email: forgotEmail, frontendUrl: window.location.origin });
        openAlert('Sucesso', 'Um link de redefinição de senha foi enviado para o seu e-mail.');
        setIsForgotPassword(false);
        setForgotEmail('');
      } catch (err: any) {
        openAlert('Erro', err.response?.data?.error || 'Erro ao solicitar redefinição.');
      }
    };

    return (
      <div className="layout">
        <div className="login-container" style={{ width: '100%', height: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <div className="login-card">
          <div className="login-brand" style={{ justifyContent: 'center' }}>
            <img src="/logo.png?v=4" alt="DocSafe" style={{ maxHeight: '46px', objectFit: 'contain' }} />
          </div>
          <div className="login-header-text">Segurança do Trabalho</div>
          
          {isForgotPassword ? (
            <form className="login-form" onSubmit={handleForgotPassword}>
              <p style={{ fontSize: '13px', color: 'var(--muted)', marginBottom: '10px', textAlign: 'center' }}>Informe seu e-mail para receber um link de redefinição de senha.</p>
              <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
                <label>Email</label>
                <input type="email" value={forgotEmail} onChange={(e) => setForgotEmail(e.target.value)} required placeholder="seu.email@exemplo.com" />
              </div>
              <button type="submit" className="login-btn">Enviar link</button>
              <div style={{ textAlign: 'center', marginTop: '10px' }}>
                <button type="button" onClick={() => setIsForgotPassword(false)} style={{ background: 'none', border: 'none', color: 'var(--purple)', cursor: 'pointer', fontSize: '13px' }}>Voltar para o login</button>
              </div>
            </form>
          ) : (
            <form className="login-form" onSubmit={handleLogin}>
              {!req2fa ? (
                <>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
                    <label>Email</label>
                    <input type="email" value={loginEmail} onChange={(e) => setLoginEmail(e.target.value)} required placeholder="seu.email@exemplo.com" />
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
                    <label>Senha</label>
                    <div style={{ position: 'relative', display: 'flex', alignItems: 'center' }}>
                      <input type={showPassword ? 'text' : 'password'} value={loginPassword} onChange={(e) => setLoginPassword(e.target.value)} required placeholder="••••••••" style={{ width: '100%', paddingRight: '40px' }} />
                      <button type="button" onClick={() => setShowPassword(!showPassword)} style={{ position: 'absolute', right: '10px', background: 'none', border: 'none', color: 'var(--muted)', cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                        {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
                      </button>
                    </div>
                    <div style={{ textAlign: 'right' }}>
                      <button type="button" onClick={() => setIsForgotPassword(true)} style={{ background: 'none', border: 'none', color: 'var(--purple)', cursor: 'pointer', fontSize: '12px' }}>Esqueci minha senha</button>
                    </div>
                  </div>
                </>
              ) : (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
                  <label>Código do Authenticator (2FA)</label>
                  <input type="text" value={code2fa} onChange={(e) => setCode2fa(e.target.value)} required placeholder="000000" maxLength={6} style={{ textAlign: 'center', fontSize: '20px', letterSpacing: '4px', fontWeight: 'bold' }} />
                </div>
              )}
              <button type="submit" className="login-btn">{req2fa ? 'Verificar e Entrar' : 'Entrar'}</button>
            </form>
          )}
        </div>
        </div>
        {modal.isOpen && (
          <div className="modal-overlay" style={{ zIndex: 10001 }}>
            <div className="modal-box" style={{ width: '400px' }}>
              <div className="modal-header">
                <div className="modal-title"><h2>{modal.title}</h2></div>
                <button className="modal-close" onClick={closeModal}>×</button>
              </div>
              <div className="modal-body"><p>{modal.message}</p></div>
              <div className="modal-footer">
                <button className="btn primary" onClick={closeModal}>OK</button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
  }
  const renderDashboard = () => {
    // Pie chart metrics based ONLY on PGR against total active units
    const totalAtivas = dashboardData.total_ativas || 1; // prevent division by zero
    const pgrVigentes = hiddenLegend['vigentes'] ? 0 : dashboardData.pgrs_vigentes;
    const pgrVencendo = hiddenLegend['vencendo'] ? 0 : dashboardData.pgrs_vencendo;
    const pgrVencidos = hiddenLegend['vencidos'] ? 0 : dashboardData.pgrs_vencidos;
    const pgrPendentes = hiddenLegend['pendentes'] ? 0 : Math.max(0, totalAtivas - (dashboardData.pgrs_vigentes + dashboardData.pgrs_vencendo + dashboardData.pgrs_vencidos));
    
    const sumPgr = Math.max(1, pgrVigentes + pgrVencendo + pgrVencidos + pgrPendentes);
    const p1 = (pgrVigentes / sumPgr) * 100;
    const p2 = p1 + (pgrVencendo / sumPgr) * 100;
    const p3 = p2 + (pgrVencidos / sumPgr) * 100;

    // Cobertura PGR = (Vigentes + Vencendo) / Total Ativas
    const coberturaPgr = Math.round(((pgrVigentes + pgrVencendo) / totalAtivas) * 100);

    const toggleLegend = (key: string) => setHiddenLegend(prev => ({ ...prev, [key]: !prev[key] }));

    return (
      <>
        <header className="topbar"><div><h1>Painel Geral</h1></div></header>
        <section className="content">
          <div className="cards">
            <div className="card interactive" style={{ position: 'relative', border: '1px solid var(--purple)', borderLeft: '4px solid var(--purple)', borderRadius: '8px' }} onClick={() => { setActiveTab('matriz'); }}>
              <Globe size={48} color="var(--purple)" style={{ position: 'absolute', right: '16px', top: '40%', transform: 'translateY(-50%)', opacity: 0.15 }} />
              <small style={{ color: 'var(--ink)', fontWeight: 'bold' }}>CNPJs Monitorados</small>
              <strong className="purple" style={{ position: 'relative', zIndex: 1 }}>{dashboardData.cobertura}%</strong>
              <small style={{ position: 'relative', zIndex: 1 }}>Unidades Ativas</small>
            </div>

            <div className="card interactive" style={{ position: 'relative', border: '1px solid var(--green)', borderLeft: '4px solid var(--green)', borderRadius: '8px' }} onClick={() => { setActiveTab('matriz'); }}>
              <ShieldCheck size={48} color="var(--green)" style={{ position: 'absolute', right: '16px', top: '40%', transform: 'translateY(-50%)', opacity: 0.15 }} />
              <small style={{ color: 'var(--ink)', fontWeight: 'bold' }}>Controle PGR</small>
              
              <div style={{ display: 'flex', gap: '24px', margin: '10px 0 5px', position: 'relative', zIndex: 1 }}>
                <div>
                  <strong className="green" style={{ margin: 0 }}>{dashboardData.pgrs_vigentes}</strong>
                  <span style={{ fontSize: '10px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase' }}>Vigência</span>
                </div>
                <div style={{ width: '2px', backgroundColor: 'var(--line)', alignSelf: 'stretch' }}></div>
                <div>
                  <strong style={{ margin: 0, color: 'var(--red)' }}>{dashboardData.pgrs_vencidos}</strong>
                  <span style={{ fontSize: '10px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase' }}>Vencidos</span>
                </div>
              </div>
            </div>

            <div className="card interactive" style={{ position: 'relative', border: '1px solid var(--amber)', borderLeft: '4px solid var(--amber)', borderRadius: '8px' }} onClick={() => { setActiveTab('matriz'); }}>
              <FileSearch size={48} color="var(--amber)" style={{ position: 'absolute', right: '16px', top: '40%', transform: 'translateY(-50%)', opacity: 0.15 }} />
              <small style={{ color: 'var(--ink)', fontWeight: 'bold' }}>Controle LTCAT</small>
              <strong className="amber" style={{ position: 'relative', zIndex: 1 }}>
                {dashboardData.ltcat_vigentes + dashboardData.ltcat_vencendo + dashboardData.ltcat_vencidos}
              </strong>
              <small style={{ position: 'relative', zIndex: 1 }}>Documentos emitidos</small>
            </div>

            <div className="card interactive" style={{ position: 'relative', border: '1px solid #3b82f6', borderLeft: '4px solid #3b82f6', borderRadius: '8px' }} onClick={() => { setActiveTab('matriz'); }}>
              <UserCog size={48} color="#3b82f6" style={{ position: 'absolute', right: '16px', top: '40%', transform: 'translateY(-50%)', opacity: 0.15 }} />
              <small style={{ color: 'var(--ink)', fontWeight: 'bold' }}>Controle AEP/AET</small>
              <strong style={{ color: '#3b82f6', position: 'relative', zIndex: 1 }}>
                {dashboardData.aet_vigentes + dashboardData.aet_vencendo + dashboardData.aet_vencidos}
              </strong>
              <small style={{ position: 'relative', zIndex: 1 }}>Documentos emitidos</small>
            </div>
          </div>

          <div className="grid">
            <div className="panel" style={{ padding: 0, overflow: 'hidden' }}>
              <div style={{ backgroundColor: '#f3f4f6', padding: '16px 24px', borderBottom: '1px solid var(--line)' }}>
                <h2 style={{ fontSize: '13px', color: '#4b5563', textTransform: 'uppercase', letterSpacing: '0.5px', margin: 0, fontWeight: 'bold' }}>
                  PANORAMA DE CONFORMIDADE
                </h2>
              </div>
              <div className="chart" style={{ display: 'flex', alignItems: 'center', gap: '50px', padding: '24px 24px', backgroundColor: '#fff' }}>
                <div className="donut" style={{
                  width: '180px', height: '180px', borderRadius: '50%',
                  background: `conic-gradient(var(--green) 0 ${p1}%, var(--amber) ${p1}% ${p2}%, var(--red) ${p2}% ${p3}%, #e5e7eb ${p3}% 100%)`,
                  display: 'flex', alignItems: 'center', justifyContent: 'center'
                }}>
                  <div style={{ width: '130px', height: '130px', backgroundColor: '#fff', borderRadius: '50%', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', zIndex: 10 }}>
                    <span style={{color: '#1e1b4b', fontSize: '32px', fontWeight: '900', lineHeight: 1, position: 'relative', top: 0, left: 0, transform: 'none'}}>{coberturaPgr}%</span>
                    <span style={{color: 'var(--muted)', fontSize: '12px', marginTop: '4px', position: 'relative', top: 0, left: 0, transform: 'none'}}>cobertura</span>
                  </div>
                </div>
                
                <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer', opacity: hiddenLegend['vigentes'] ? 0.5 : 1 }} onClick={() => toggleLegend('vigentes')}>
                    <div style={{ width: '12px', height: '12px', borderRadius: '50%', backgroundColor: 'var(--green)' }}></div>
                    <span style={{ color: '#4b5563', fontSize: '14px', fontWeight: '500', textDecoration: hiddenLegend['vigentes'] ? 'line-through' : 'none' }}>Vigentes ({dashboardData.pgrs_vigentes})</span>
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer', opacity: hiddenLegend['vencendo'] ? 0.5 : 1 }} onClick={() => toggleLegend('vencendo')}>
                    <div style={{ width: '12px', height: '12px', borderRadius: '50%', backgroundColor: 'var(--amber)' }}></div>
                    <span style={{ color: '#4b5563', fontSize: '14px', fontWeight: '500', textDecoration: hiddenLegend['vencendo'] ? 'line-through' : 'none' }}>Vencendo em 60 dias ({dashboardData.pgrs_vencendo})</span>
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer', opacity: hiddenLegend['vencidos'] ? 0.5 : 1 }} onClick={() => toggleLegend('vencidos')}>
                    <div style={{ width: '12px', height: '12px', borderRadius: '50%', backgroundColor: 'var(--red)' }}></div>
                    <span style={{ color: '#4b5563', fontSize: '14px', fontWeight: '500', textDecoration: hiddenLegend['vencidos'] ? 'line-through' : 'none' }}>Vencidos ({dashboardData.pgrs_vencidos})</span>
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', cursor: 'pointer', opacity: hiddenLegend['pendentes'] ? 0.5 : 1 }} onClick={() => toggleLegend('pendentes')}>
                    <div style={{ width: '12px', height: '12px', borderRadius: '50%', backgroundColor: '#e5e7eb' }}></div>
                    <span style={{ color: '#4b5563', fontSize: '14px', fontWeight: '500', textDecoration: hiddenLegend['pendentes'] ? 'line-through' : 'none' }}>Pendentes ({Math.max(0, totalAtivas - (dashboardData.pgrs_vigentes + dashboardData.pgrs_vencendo + dashboardData.pgrs_vencidos))})</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div className="insights">
              <div className="panel" style={{ padding: 0, overflow: 'hidden' }}>
                <div style={{ backgroundColor: '#f3f4f6', padding: '16px 24px', borderBottom: '1px solid var(--line)' }}>
                  <h2 style={{ fontSize: '13px', color: '#4b5563', textTransform: 'uppercase', letterSpacing: '0.5px', margin: 0, fontWeight: 'bold' }}>
                    VISÃO GERAL DE UNIDADES
                  </h2>
                </div>
                
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', backgroundColor: 'var(--line)', gap: '1px' }}>
                  {/* Row 1 */}
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setMatrizTipo('todas'); setActiveTab('matriz'); }}>
                    <strong style={{ fontSize: '24px', color: 'var(--green)', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_ativas}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Ativas</small>
                  </div>
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setUnitSubTab('desmobilizadas'); setActiveTab('unidades'); }}>
                    <strong style={{ fontSize: '24px', color: 'var(--red)', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_desmobilizadas}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Desativadas</small>
                  </div>

                  {/* Row 2 */}
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setMatrizTipo('dgs'); setActiveTab('matriz'); }}>
                    <strong style={{ fontSize: '24px', color: 'var(--amber)', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_dgs}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>DGs</small>
                  </div>
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setMatrizTipo('techs'); setActiveTab('matriz'); }}>
                    <strong style={{ fontSize: '24px', color: 'var(--purple)', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_techs}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>TECHs</small>
                  </div>

                  {/* Row 3 */}
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setIsoFilter(true); setActiveTab('matriz'); }}>
                    <strong style={{ fontSize: '24px', color: '#f97316', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_iso}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>ISO 45001</small>
                  </div>
                  <div className="interactive" style={{ display: 'flex', flexDirection: 'column', backgroundColor: '#fff', padding: '16px 24px', cursor: 'pointer' }} onClick={() => { setSesmtFilter(true); setActiveTab('matriz'); }}>
                    <strong style={{ fontSize: '24px', color: '#000', fontWeight: '800', lineHeight: '1', marginBottom: '2px' }}>{dashboardData.total_sesmt}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>SESMT</small>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </>
    );
  };

  const renderExpiryModal = () => {
    if (!expiryInfo) return null;
    const v = expiryInfo.raw ? getDocValidity(expiryInfo.doc, expiryInfo.raw, expiryInfo.venc, getValidadeAnos(expiryInfo.doc)) : null;
    
    let color = 'var(--muted)';
    let bg = '#f3f4f6';
    let statusTitle = 'Sem Data Informada';
    let daysText = 'Não é possível calcular o vencimento';
    let dateText = '—';
    
    if (v) {
      color = v.valido ? 'var(--green)' : 'var(--red)';
      bg = v.valido ? '#ecfdf5' : '#fef2f2';
      statusTitle = v.valido ? 'Vence em' : 'Venceu em';
      dateText = v.vencimento.toLocaleDateString('pt-BR');
      const abs = Math.abs(v.dias);
      daysText = v.valido ? (v.dias === 0 ? 'Vence hoje' : `Faltam ${abs} dia${abs === 1 ? '' : 's'}`) : `Vencido há ${abs} dia${abs === 1 ? '' : 's'}`;
    } else if (expiryInfo.statusTxt) {
      const s = expiryInfo.statusTxt.toLowerCase();
      if (s.includes('venc')) { color = 'var(--red)'; bg = '#fef2f2'; statusTitle = 'Vencido (Manual)'; }
      else if (s.includes('vigente') || s === 'ok') { color = 'var(--green)'; bg = '#ecfdf5'; statusTitle = 'Vigente (Manual)'; }
    }
    
    return (
      <div className="modal-overlay" style={{ zIndex: 10001 }} onClick={() => setExpiryInfo(null)}>
        <div className="modal-box" style={{ width: '360px' }} onClick={(e) => e.stopPropagation()}>
          <div className="modal-header">
            <div className="modal-title"><h2>Detalhes do {expiryInfo.doc}</h2></div>
            <button className="modal-close" onClick={() => setExpiryInfo(null)}>×</button>
          </div>
          <div className="modal-body" style={{ textAlign: 'center' }}>
            <div style={{ fontSize: '11px', color: 'var(--muted)', textTransform: 'uppercase', fontWeight: '600', letterSpacing: '0.5px' }}>{statusTitle}</div>
            <div style={{ fontSize: '26px', fontWeight: '800', color, margin: '4px 0 8px' }}>{dateText}</div>
            <span style={{ display: 'inline-block', padding: '4px 12px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: bg, color, border: `1px solid ${color}` }}>
              {daysText}
            </span>
            {expiryInfo.lista && (
              <div style={{ marginTop: '14px' }}>
                <span style={{ fontSize: '13px', fontWeight: '600', color: 'var(--purple)', background: '#f3e8ff', padding: '6px 14px', borderRadius: '20px' }}>
                  Lista de Entrega: {expiryInfo.lista}
                </span>
              </div>
            )}
            <div style={{ fontSize: '11px', color: 'var(--muted)', marginTop: '14px' }}>
              {v ? (expiryInfo.venc ? 'Vencimento informado no documento' : `Emitido em ${v.emissao.toLocaleDateString('pt-BR')} · validade de ${DOC_VALIDADE_ANOS[expiryInfo.doc]} anos`) : 'Verifique o sistema para atualizar a data deste documento.'}
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderUnidades = () => {
    const ativasAll = matriz.filter(u => u.status_funcionamento === 'ATIVA');
    const tabCount = (k: string) => k === 'desmobilizadas'
      ? matriz.filter(u => u.status_funcionamento === 'DESMOBILIZADA').length
      : k === 'todas' ? ativasAll.length : ativasAll.filter(u => getTipoKey(u) === k).length;
    const filtered = matriz.filter(u => {
      if (unitSubTab === 'desmobilizadas') {
        if (u.status_funcionamento !== 'DESMOBILIZADA') return false;
      } else {
        if (u.status_funcionamento !== 'ATIVA') return false;
        if (unitSubTab !== 'todas' && getTipoKey(u) !== unitSubTab) return false;
      }
      if (regionalFilter && u.regional !== regionalFilter) return false;
      if (isoFilter && !u.escopo_iso_45001) return false;
      return `${u.cnpj} ${u.filial} ${u.cidade} ${u.uf} ${u.bairro} ${getTipoKey(u)}`.toLowerCase().includes(searchQuery.toLowerCase());
    });

    const allRegionais = [...new Set(matriz.map((u: any) => u.regional).filter(Boolean))].sort();

    return (
      <>
        <header className="topbar">
          <div><h1>Consulta CNPJ</h1></div>
          <div className="actions" style={{ gap: '8px', flexWrap: 'wrap', marginLeft: 'auto' }}>
            <input
              className="search"
              placeholder="Buscar por CNPJ, nome, cidade, tipo..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
            <label style={{display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13px', cursor: 'pointer', background: '#fff', padding: '0 12px', height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px'}}>
              <input type="checkbox" checked={isoFilter} onChange={e => setIsoFilter(e.target.checked)} style={{accentColor: 'var(--purple)', width: '16px', height: '16px'}} />
              Escopo ISO
            </label>
            <select value={regionalFilter} onChange={(e) => setRegionalFilter(e.target.value)} style={{ height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px', padding: '0 10px', background: '#fff', color: 'var(--ink)', fontSize: '13px', outline: 'none' }}>
              <option value="">Todas Regionais</option>
              {allRegionais.map((r: any) => <option key={r} value={r}>{r}</option>)}
            </select>
            <button className="btn" title="Baixar Planilha" style={{ background: '#10b981', color: '#fff', borderColor: '#10b981', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '0 12px', height: '40px' }} onClick={() => handleExportExcel(filtered, 'Consulta_CNPJ')}>
               <FileSpreadsheet size={18} />
            </button>
            {['master', 'admin', 'editor'].includes(user?.role) && (
              <button className="btn primary" onClick={() => setEditUnit({ status_funcionamento: 'ATIVA' })}>＋ Unidade</button>
            )}
          </div>
        </header>
        <section className="content">
          <div className="tabs-header">
            {TIPO_TABS.map(t => (
              <button key={t.key} className={`tab-link ${unitSubTab === t.key ? 'active' : ''}`} onClick={() => setUnitSubTab(t.key)}>{t.label} ({tabCount(t.key)})</button>
            ))}
            <button className={`tab-link ${unitSubTab === 'desmobilizadas' ? 'active' : ''}`} onClick={() => setUnitSubTab('desmobilizadas')}>Desmobilizadas ({tabCount('desmobilizadas')})</button>
          </div>
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Unidade</th><th>Tipo</th><th>Localização</th><th>Região</th><th>Regional</th><th style={{textAlign: 'center'}}>ISO 45001</th><th style={{textAlign: 'center'}}>SESMT</th><th>Ações</th></tr></thead>
              <tbody>
                {filtered.length === 0
                  ? <tr><td colSpan={8} className="empty">Nenhuma unidade encontrada.</td></tr>
                  : filtered.map((u: any) => {
                    const badge = tipoBadge(u);
                    return (
                      <tr key={u.id}>
                        <td>
                          <b>{u.filial}</b>
                          <small style={{ color: 'var(--muted)' }}>{u.cnpj}</small>
                        </td>
                        <td>
                          <span style={{ background: badge.bg, color: badge.color, borderRadius: '12px', padding: '3px 9px', fontSize: '11px', fontWeight: '700' }}>
                            {badge.label}
                          </span>
                        </td>
                        <td>{u.cidade || '—'} {u.bairro ? `· ${u.bairro}` : ''}</td>
                        <td><b>{u.uf || '—'}</b></td>
                        <td>{u.regional || '—'}</td>
                        <td style={{ fontSize: '14px', textAlign: 'center' }}>
                          {u.escopo_iso_45001 ? <span style={{ color: 'var(--green)', fontWeight: 'bold' }}>✓</span> : <span style={{ color: 'var(--red)', fontWeight: 'bold' }}>✗</span>}
                        </td>
                        <td style={{ fontSize: '14px', textAlign: 'center' }}>
                          {u.compoe_sesmt ? <span style={{ color: 'var(--green)', fontWeight: 'bold' }}>✓</span> : <span style={{ color: 'var(--red)', fontWeight: 'bold' }}>✗</span>}
                        </td>
                        <td>
                          <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
                            <button
                              title="Ver Ficha"
                              style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--muted)', transition: 'all 0.15s' }}
                              onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#f0e7fb'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--purple)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--purple)'; }}
                              onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--muted)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                              onClick={() => setSelectedUnit(u)}
                            ><Eye size={14} /></button>
                            {(user?.role === 'master' || user?.role === 'admin') && (<>
                              <button
                                title="Editar Unidade"
                                style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--muted)', transition: 'all 0.15s' }}
                                onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#f0e7fb'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--purple)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--purple)'; }}
                                onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--muted)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                                onClick={() => setEditUnit({ ...u })}
                              ><Pencil size={14} /></button>
                              <button
                                title="Excluir Unidade"
                                style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--muted)', transition: 'all 0.15s' }}
                                onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#fef2f2'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--red)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--red)'; }}
                                onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--muted)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                                onClick={() => setDeleteTarget(u)}
                              ><Trash2 size={14} /></button>
                            </>)}
                          </div>
                        </td>
                      </tr>
                    );
                  })
                }
              </tbody>
            </table>
          </div>
        </section>

        {/* Unit Detail Modal */}
        {selectedUnit && (
          <div className="modal-overlay" onClick={() => setSelectedUnit(null)}>
            <div className="modal-box" style={{ width: '560px' }} onClick={(e) => e.stopPropagation()}>
              
              {selectedUnit.status_funcionamento === 'DESMOBILIZADA' && (
                <div className="modal-banner-danger">⚠️ Unidade Desmobilizada</div>
              )}

              <div className="modal-header">
                <div className="modal-title">
                  <h2>{selectedUnit.filial || '—'}</h2>
                  <small>CNPJ: {selectedUnit.cnpj}</small>
                </div>
                <div className="modal-header-right">
                  {(() => { const b = tipoBadge(selectedUnit); return <span style={{ background: b.bg, color: b.color, borderRadius: '12px', padding: '3px 10px', fontSize: '11px', fontWeight: '700' }}>{b.label}</span>; })()}
                  <button className="modal-close" onClick={() => setSelectedUnit(null)}>×</button>
                </div>
              </div>

              <div className="modal-body">

                {/* Grid de dados */}
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '20px' }}>
                  {[
                    { label: 'Cidade', value: selectedUnit.cidade },
                    { label: 'UF', value: selectedUnit.uf },
                    { label: 'Bairro', value: selectedUnit.bairro },
                    { label: 'Endereço', value: selectedUnit.endereco },
                    { label: 'Regional', value: selectedUnit.regional },
                    { label: 'Status', value: selectedUnit.status_funcionamento },
                  ].map(({ label, value }) => (
                    <div key={label} style={{ background: '#f9f8fb', borderRadius: '8px', padding: '12px 14px' }}>
                      <div style={{ fontSize: '10px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '4px' }}>{label}</div>
                      <div style={{ fontSize: '13px', color: 'var(--ink)', fontWeight: '600' }}>{value || '—'}</div>
                    </div>
                  ))}
                </div>

                <div style={{ borderTop: '1px solid var(--line)', paddingTop: '16px', marginBottom: '20px' }}>
                  <div style={{ fontSize: '11px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '12px' }}>Datas dos Documentos</div>
                  <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '16px' }}>
                    {[
                      { doc: 'PGR', raw: selectedUnit.pgr_data, venc: selectedUnit.pgr_vencimento, docId: selectedUnit.pgr_doc_id, fileName: selectedUnit.pgr_arquivo_nome },
                      { doc: 'LTCAT', raw: selectedUnit.ltcat_data, venc: selectedUnit.ltcat_vencimento, docId: selectedUnit.ltcat_doc_id, fileName: selectedUnit.ltcat_arquivo_nome },
                      { doc: 'AEP', raw: selectedUnit.aep_data, venc: selectedUnit.aep_vencimento, docId: selectedUnit.aep_doc_id, fileName: selectedUnit.aep_arquivo_nome },
                    ].map(({ doc, raw, venc, docId, fileName }) => {
                      const v = getDocValidity(doc, raw, venc, getValidadeAnos(doc));
                      const color = !v ? 'var(--muted)' : v.valido ? 'var(--green)' : 'var(--red)';
                      const bg = !v ? '#f9f8fb' : v.valido ? '#ecfdf5' : '#fef2f2';
                      return (
                        <div
                          key={doc}
                          title={v ? 'Clique para ver o vencimento' : undefined}
                          onClick={() => v && setExpiryInfo({ doc, raw, venc })}
                          style={{ background: bg, borderRadius: '10px', padding: '12px 14px', cursor: v ? 'pointer' : 'default', border: `1px solid ${v ? color : 'transparent'}`, transition: 'transform 0.15s, box-shadow 0.15s', display: 'flex', flexDirection: 'column', gap: '4px' }}
                          onMouseEnter={e => { if (v) { e.currentTarget.style.transform = 'translateY(-2px)'; e.currentTarget.style.boxShadow = '0 4px 12px rgba(0,0,0,0.08)'; } }}
                          onMouseLeave={e => { e.currentTarget.style.transform = 'none'; e.currentTarget.style.boxShadow = 'none'; }}
                        >
                          <div>
                            <div style={{ fontSize: '10px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '4px' }}>Último {doc}</div>
                            <div style={{ fontSize: '13px', color, fontWeight: '700' }}>{v ? v.emissao.toLocaleDateString('pt-BR') : '—'}</div>
                            {v && <div style={{ fontSize: '10px', color, fontWeight: '600', marginTop: '2px' }}>{v.valido ? '● Válido' : '● Vencido'}</div>}
                          </div>

                          <div onClick={e => e.stopPropagation()} style={{ marginTop: 'auto', paddingTop: '8px', borderTop: '1px solid rgba(0,0,0,0.05)', display: 'flex', flexDirection: 'column', gap: '6px' }}>
                            {fileName && (
                              <button
                                onClick={() => handleDownload(docId)}
                                style={{ background: 'transparent', border: 'none', color: 'var(--blue)', fontSize: '11px', fontWeight: 'bold', cursor: 'pointer', textAlign: 'center', padding: '4px', borderRadius: '4px', backgroundColor: 'rgba(59,130,246,0.1)' }}
                              >
                                ⬇ Abrir Documento
                              </button>
                            )}
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>

                {/* Certificações */}
                <div style={{ borderTop: '1px solid var(--line)', paddingTop: '16px', marginBottom: '20px' }}>
                  <div style={{ fontSize: '11px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '12px' }}>Certificações e Composição</div>
                  <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap' }}>
                    <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.escopo_iso_45001 ? '#ecfdf5' : '#fef2f2', color: selectedUnit.escopo_iso_45001 ? 'var(--green)' : 'var(--red)', border: `1px solid ${selectedUnit.escopo_iso_45001 ? 'var(--green)' : 'var(--red)'}` }}>
                      {selectedUnit.escopo_iso_45001 ? '✓' : '✗'} ISO 45001
                    </span>
                    <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.compoe_sesmt ? '#ecfdf5' : '#fef2f2', color: selectedUnit.compoe_sesmt ? 'var(--green)' : 'var(--red)', border: `1px solid ${selectedUnit.compoe_sesmt ? 'var(--green)' : 'var(--red)'}` }}>
                      {selectedUnit.compoe_sesmt ? '✓' : '✗'} Compõe SESMT
                    </span>
                    <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.is_nr20 ? '#ecfdf5' : '#fef2f2', color: selectedUnit.is_nr20 ? 'var(--green)' : 'var(--red)', border: `1px solid ${selectedUnit.is_nr20 ? 'var(--green)' : 'var(--red)'}` }}>
                      {selectedUnit.is_nr20 ? '✓' : '✗'} NR 20
                    </span>
                    <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.is_dg ? '#ecfdf5' : '#fef2f2', color: selectedUnit.is_dg ? 'var(--green)' : 'var(--red)', border: `1px solid ${selectedUnit.is_dg ? 'var(--green)' : 'var(--red)'}` }}>
                      {selectedUnit.is_dg ? '✓' : '✗'} Distribuidor (DG)
                    </span>
                  </div>
                </div>

              </div>

              {/* Footer fixo com ações */}
              {['master', 'admin', 'editor'].includes(user?.role) && (
                <div className="modal-footer start">
                  <button title="Editar" style={{ background: '#f0e7fb', border: '1px solid var(--purple)', color: 'var(--purple)', borderRadius: '8px', padding: '8px', cursor: 'pointer', display: 'flex', transition: 'all 0.15s' }} onClick={() => { setSelectedUnit(null); setEditUnit({ ...selectedUnit }); }}><Pencil size={18} /></button>
                  {['master', 'admin'].includes(user?.role) && (
                    <button title="Excluir" style={{ background: '#fef2f2', border: '1px solid var(--red)', color: 'var(--red)', borderRadius: '8px', padding: '8px', cursor: 'pointer', display: 'flex', transition: 'all 0.15s' }} onClick={() => { setSelectedUnit(null); setDeleteTarget(selectedUnit); }}><Trash2 size={18} /></button>
                  )}
                </div>
              )}
            </div>
          </div>
        )}

        {renderExpiryModal()}

        {/* Edit Unit Modal */}
        {editUnit && (
          <div className="modal-overlay" onClick={() => setEditUnit(null)}>
            <div className="modal-box" style={{ width: '620px' }} onClick={(e) => e.stopPropagation()}>
              
              {editUnit.status_funcionamento === 'DESMOBILIZADA' && (
                <div className="modal-banner-danger">⚠️ Unidade Desmobilizada</div>
              )}

              <div className="modal-header">
                <div className="modal-title">
                  <h2>{editUnit.id ? 'Editar Unidade' : 'Cadastrar Nova Unidade'}</h2>
                  <small>{editUnit.filial ? `${editUnit.filial} — ${editUnit.cnpj}` : 'Preencha os dados abaixo'}</small>
                </div>
                <div className="modal-header-right">
                  {editUnit.id && (() => { const b = tipoBadge(editUnit); return <span style={{ background: b.bg, color: b.color, borderRadius: '12px', padding: '3px 10px', fontSize: '11px', fontWeight: '700' }}>{b.label}</span>; })()}
                  <button className="modal-close" onClick={() => setEditUnit(null)}>×</button>
                </div>
              </div>
              <div className="modal-body">
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '14px' }}>
                  {[
                    { key: 'filial', label: 'Nome / Filial', full: false },
                    { key: 'cnpj', label: 'CNPJ', full: false },
                    { key: 'tipo_predio', label: 'Tipo (Loja/Prédio/TECH)', full: false },
                    { key: 'status_funcionamento', label: 'Status', full: false, isSelect: true },
                    { key: 'cidade', label: 'Cidade', full: false },
                    { key: 'uf', label: 'UF', full: false },
                    { key: 'bairro', label: 'Bairro', full: false },
                    { key: 'regional', label: 'Regional', full: false },
                    { key: 'endereco', label: 'Endereço', full: true },
                    { key: 'pgr_data', label: 'Data do Último PGR', full: false, type: 'date' },
                    { key: 'ltcat_data', label: 'Data do Último LTCAT', full: false, type: 'date' },
                    { key: 'aep_data', label: 'Data do Último AEP', full: false, type: 'date' },
                  ].map(({ key, label, full, isSelect, type }) => (
                    <div key={key} className="modal-form-group" style={{ gridColumn: full ? '1 / -1' : undefined }}>
                      <label>{label}</label>
                      {isSelect
                        ? (user?.role === 'editor' 
                            ? <input type="text" value={editUnit[key] || 'ATIVA'} disabled style={{ background: '#f5f5f5', color: '#999', cursor: 'not-allowed' }} />
                            : <select value={editUnit[key] || 'ATIVA'} onChange={(e) => setEditUnit({ ...editUnit, [key]: e.target.value })}>
                                <option value="ATIVA">ATIVA</option>
                                <option value="DESMOBILIZADA">DESMOBILIZADA</option>
                              </select>)
                        : <input type={type || 'text'} value={editUnit[key] || ''} onChange={(e) => setEditUnit({ ...editUnit, [key]: e.target.value })} />
                      }
                      {(key === 'pgr_data' || key === 'ltcat_data' || key === 'aep_data') && editUnit.id && (
                        <div style={{ marginTop: '8px', display: 'flex', gap: '8px', alignItems: 'center' }}>
                          <label style={{ fontSize: '11px', cursor: 'pointer', color: 'var(--blue)', background: 'rgba(59,130,246,0.1)', padding: '4px 8px', borderRadius: '4px', fontWeight: 'bold' }}>
                            📎 Anexar PDF
                            <input 
                              type="file" 
                              accept=".pdf,application/pdf"
                              style={{ display: 'none' }} 
                              onChange={(e) => handleUpload(editUnit.id, key === 'pgr_data' ? 'PGR' : key === 'ltcat_data' ? 'LTCAT' : 'AEP', e.target.files?.[0])} 
                            />
                          </label>
                          {editUnit[`${key.split('_')[0]}_arquivo_nome`] && (
                            <span style={{ fontSize: '10px', color: 'var(--green)' }}>✓ Arquivo salvo</span>
                          )}
                        </div>
                      )}
                    </div>
                  ))}
                  <div style={{ gridColumn: '1 / -1' }}>
                    <div style={{ fontSize: '11px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', marginBottom: '10px' }}>Flags</div>
                    <div style={{ display: 'flex', gap: '20px', flexWrap: 'wrap' }}>
                      {[
                        { key: 'escopo_iso_45001', label: 'Escopo ISO 45001' },
                        { key: 'compoe_sesmt', label: 'Compõe SESMT' },
                        { key: 'is_nr20', label: 'NR 20' },
                        { key: 'is_dg', label: 'É Distribuidor (DG)' },
                      ].map(({ key, label }) => (
                        <label key={key} style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '13px' }}>
                          <input type="checkbox" checked={!!editUnit[key]} onChange={(e) => setEditUnit({ ...editUnit, [key]: e.target.checked })} style={{ width: '16px', height: '16px', accentColor: 'var(--purple)' }} />
                          {label}
                        </label>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
              <div className="modal-footer">
                <button className="btn" onClick={() => setEditUnit(null)}>Cancelar</button>
                <button className="btn primary" onClick={handleUpdateUnit}>Salvar Alterações</button>
              </div>
            </div>
          </div>
        )}

        {/* Delete Confirmation Modal */}
        {deleteTarget && (
          <div className="modal-overlay" onClick={() => setDeleteTarget(null)}>
            <div className="modal-box" style={{ width: '420px' }} onClick={(e) => e.stopPropagation()}>
              <div className="modal-header">
                <div className="modal-title"><h2 style={{ color: 'var(--red)' }}>⚠️ Excluir Unidade</h2></div>
                <button className="modal-close" onClick={() => setDeleteTarget(null)}>×</button>
              </div>
              <div className="modal-body" style={{ textAlign: 'center' }}>
                <p style={{ color: 'var(--muted)', lineHeight: '1.7', margin: 0 }}>
                  Você está prestes a excluir permanentemente a unidade<br />
                  <strong style={{ color: 'var(--ink)', fontSize: '14px' }}>"{deleteTarget.filial}"</strong><br />
                  <small>{deleteTarget.cnpj}</small><br /><br />
                  <strong style={{ color: 'var(--red)' }}>⚠ Esta ação não poderá ser desfeita.</strong><br />
                  Todos os documentos SST vinculados também serão removidos.
                </p>
              </div>
              <div className="modal-footer">
                <button className="btn" onClick={() => setDeleteTarget(null)}>Cancelar</button>
                <button className="btn" style={{ background: 'var(--red)', border: '1px solid var(--red)', color: '#fff', fontWeight: 'bold' }} onClick={handleDeleteUnit}>Sim, excluir</button>
              </div>
            </div>
          </div>
        )}
      </>
    );
  };


  const renderMatriz = () => {
    const ativas = matriz.filter(u => u.status_funcionamento === 'ATIVA');
    const counts = {
      todas: ativas.length,
      lojas: ativas.filter(u => getTipoKey(u) === 'loja').length,
      predios: ativas.filter(u => getTipoKey(u) === 'predio').length,
      dgs: ativas.filter(u => getTipoKey(u) === 'dg').length,
      techs: ativas.filter(u => getTipoKey(u) === 'tech').length,
    };
    const filtered = ativas.filter(u => {
      const k = getTipoKey(u);
      if (matrizTipo === 'lojas' && k !== 'loja') return false;
      if (matrizTipo === 'predios' && k !== 'predio') return false;
      if (matrizTipo === 'dgs' && k !== 'dg') return false;
      if (matrizTipo === 'techs' && k !== 'tech') return false;
      if (regionalFilter && u.regional !== regionalFilter) return false;
      if (isoFilter && !u.escopo_iso_45001) return false;
      if (sesmtFilter && !u.compoe_sesmt) return false;
      return `${u.cnpj} ${u.filial} ${u.cidade} ${u.uf} ${u.bairro} ${k}`.toLowerCase().includes(searchQuery.toLowerCase());
    });

    const allRegionais = [...new Set(matriz.map((u: any) => u.regional).filter(Boolean))].sort();

    const pill = (bg: string, color: string, text: string, clickable: boolean, title?: string, onClick?: () => void) => (
      <span
        title={title}
        onClick={onClick}
        style={{ display: 'inline-flex', alignItems: 'center', gap: '4px', padding: '3px 10px', borderRadius: '20px', fontSize: '11px', fontWeight: 700, background: bg, color, border: `1px solid ${color}`, cursor: clickable ? 'pointer' : 'default', whiteSpace: 'nowrap' }}
      >{text}</span>
    );

    const docCell = (doc: string, raw: string, venc: string | undefined, statusTxt: string, lista?: string, docId?: number, fileName?: string) => {
      const v = getDocValidity(doc, raw, venc, getValidadeAnos(doc));
      if (v) {
        return v.valido
          ? pill('#ecfdf5', 'var(--green)', '● Válido', true, `Vence em ${v.vencimento.toLocaleDateString('pt-BR')} — clique para detalhes`, () => setExpiryInfo({ doc, raw, venc, lista, statusTxt, docId, fileName }))
          : pill('#fef2f2', 'var(--red)', '● Vencido', true, `Venceu em ${v.vencimento.toLocaleDateString('pt-BR')} — clique para detalhes`, () => setExpiryInfo({ doc, raw, venc, lista, statusTxt, docId, fileName }));
      }
      const s = (statusTxt || '').toLowerCase();
      if (s.includes('venc')) return pill('#fef2f2', 'var(--red)', '● Vencido', true, 'Clique para detalhes', () => setExpiryInfo({ doc, raw: '', venc: '', lista, statusTxt, docId, fileName }));
      if (s.includes('vigente') || s === 'ok') return pill('#ecfdf5', 'var(--green)', '● Válido', true, 'Clique para detalhes', () => setExpiryInfo({ doc, raw: '', venc: '', lista, statusTxt, docId, fileName }));
      return pill('#f3f4f6', 'var(--muted)', 'S/D', true, 'Clique para detalhes', () => setExpiryInfo({ doc, raw: '', venc: '', lista, statusTxt, docId, fileName }));
    };

    const check = (ok: boolean) => ok
      ? <span style={{ color: 'var(--green)', fontWeight: 800, fontSize: '15px' }}>✓</span>
      : <span style={{ color: 'var(--red)', fontWeight: 800, fontSize: '15px' }}>✗</span>;

    const th: React.CSSProperties = { textAlign: 'center' };
    const td: React.CSSProperties = { textAlign: 'center' };

    return (
      <>
        <header className="topbar">
          <div><h1>Conformidade</h1></div>
          <div className="actions" style={{ gap: '8px', flexWrap: 'wrap' }}>
            <input className="search" placeholder="Buscar CNPJ, nome, cidade, tipo..." value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} />
            <label style={{display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13px', cursor: 'pointer', background: '#fff', padding: '0 12px', height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px'}}>
              <input type="checkbox" checked={isoFilter} onChange={e => setIsoFilter(e.target.checked)} style={{accentColor: 'var(--purple)', width: '16px', height: '16px'}} />
              Escopo ISO
            </label>
            <label style={{display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13px', cursor: 'pointer', background: '#fff', padding: '0 12px', height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px'}}>
              <input type="checkbox" checked={sesmtFilter} onChange={e => setSesmtFilter(e.target.checked)} style={{accentColor: 'var(--purple)', width: '16px', height: '16px'}} />
              SESMT
            </label>
            <select value={regionalFilter} onChange={(e) => setRegionalFilter(e.target.value)} style={{ height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px', padding: '0 10px', background: '#fff', color: 'var(--ink)', fontSize: '13px', outline: 'none' }}>
              <option value="">Todas Regionais</option>
              {allRegionais.map((r: any) => <option key={r} value={r}>{r}</option>)}
            </select>
            <button className="btn" title="Baixar Planilha" style={{ background: '#10b981', color: '#fff', borderColor: '#10b981', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '0 12px', height: '40px' }} onClick={() => handleExportExcel(filtered, 'Matriz_Conformidade')}>
               <FileSpreadsheet size={18} />
            </button>
          </div>
        </header>
        <section className="content">
          <div className="tabs-header">
            <button className={`tab-link ${matrizTipo === 'todas' ? 'active' : ''}`} onClick={() => setMatrizTipo('todas')}>Todas ({counts.todas})</button>
            <button className={`tab-link ${matrizTipo === 'lojas' ? 'active' : ''}`} onClick={() => setMatrizTipo('lojas')}>Lojas ({counts.lojas})</button>
            <button className={`tab-link ${matrizTipo === 'predios' ? 'active' : ''}`} onClick={() => setMatrizTipo('predios')}>Prédios ({counts.predios})</button>
            <button className={`tab-link ${matrizTipo === 'dgs' ? 'active' : ''}`} onClick={() => setMatrizTipo('dgs')}>DGs ({counts.dgs})</button>
            <button className={`tab-link ${matrizTipo === 'techs' ? 'active' : ''}`} onClick={() => setMatrizTipo('techs')}>TECHs ({counts.techs})</button>
          </div>
          <div className="table-wrap">
            <table className="table">
              <thead>
                <tr>
                  <th>CNPJ / Filial</th>
                  <th style={th}>Tipo</th>
                  <th style={th}>PGR</th>
                  <th style={th}>LTCAT</th>
                  <th style={th}>AEP</th>
                  <th style={th}>AET</th>
                  <th style={th}>NR01</th>
                  <th style={{ ...th, borderLeft: '2px solid var(--line)' }}>SESMT</th>
                  <th style={th}>ISO 45001</th>
                  <th style={th}>NR 20</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 && (
                  <tr><td colSpan={10} style={{ textAlign: 'center', color: 'var(--muted)', padding: '24px' }}>Nenhuma unidade encontrada.</td></tr>
                )}
                {filtered.map(u => {
                  const b = tipoBadge(u);
                  return (
                    <tr key={u.id}>
                      <td><b>{u.filial}</b><small>{u.cnpj}</small></td>
                      <td style={td}><span style={{ background: b.bg, color: b.color, borderRadius: '12px', padding: '3px 10px', fontSize: '11px', fontWeight: 700 }}>{b.label}</span></td>
                      <td style={td}>{docCell('PGR', u.pgr_data, u.pgr_vencimento, u.pgr, u.pgr_lista, u.pgr_doc_id, u.pgr_arquivo_nome)}</td>
                      <td style={td}>{docCell('LTCAT', u.ltcat_data, u.ltcat_vencimento, u.ltcat, u.ltcat_lista, u.ltcat_doc_id, u.ltcat_arquivo_nome)}</td>
                      <td style={td}>{docCell('AEP', u.aep_data, u.aep_vencimento, u.aep, u.aep_lista, u.aep_doc_id, u.aep_arquivo_nome)}</td>
                      <td style={td}>{docCell('AET', u.aet_data, u.aet_vencimento, u.aet, u.aet_lista, u.aet_doc_id, u.aet_arquivo_nome)}</td>
                      <td style={td}>{docCell('NR01', u.nr01_data, u.nr01_vencimento, u.nr01, u.nr01_lista, u.nr01_doc_id, u.nr01_arquivo_nome)}</td>
                      <td style={{ ...td, borderLeft: '2px solid var(--line)' }}>{check(!!u.compoe_sesmt)}</td>
                      <td style={td}>{check(!!u.escopo_iso_45001)}</td>
                      <td style={td}>{check(!!u.is_nr20)}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </section>
        {renderExpiryModal()}
      </>
    );
  };

  const renderFinanceiro = () => (
    <>
      <header className="topbar">
        <div><h1>Faturamento e Custos</h1></div>
        <div className="actions" style={{ display: 'flex', gap: '8px' }}>
          <button className="btn" style={{ background: '#f3e8ff', color: 'var(--purple)', borderColor: 'var(--purple)', display: 'flex', alignItems: 'center', gap: '6px' }} onClick={() => setFaturamentoChartOpen(true)}>
            <BarChart2 size={16} /> Evolução Mensal
          </button>
          <button className="btn primary" onClick={() => setFaturamentoModalOpen(true)}>＋ Lançamento</button>
        </div>
      </header>
      <section className="content">
        <div className="cards" style={{ marginBottom: '20px' }}>
          <div className="card" style={{ background: '#f8fdf9', border: '1px solid #cce8d6' }}>
            <small>Total Líquido (Faturado)</small>
            <strong className="green">R$ {parseFloat(faturamentoResumo.total_liquido || '0').toLocaleString('pt-BR', {minimumFractionDigits: 2})}</strong>
            <small>Bruto: R$ {parseFloat(faturamentoResumo.total_valor_bruto || '0').toLocaleString('pt-BR', {minimumFractionDigits: 2})}</small>
          </div>
          <div className="card"><small>PGRs Medidos</small><strong>{faturamentoResumo.total_pgr || 0}</strong></div>
          <div className="card"><small>LTCATs Medidos</small><strong>{faturamentoResumo.total_ltcat || 0}</strong></div>
          <div className="card"><small>AETs / Outros</small><strong>{faturamentoResumo.total_aet || 0}</strong></div>
        </div>
        <div className="table-wrap">
          <table className="table">
            <thead><tr><th>Lote / Período</th><th>PGR / LTCAT / AET</th><th>Descontos</th><th>Líquido</th><th>Data Envio</th><th>Ações</th></tr></thead>
            <tbody>
              {faturamento.map(f => {
                const total = parseFloat(f.valor_total || '0');
                const desc = parseFloat(f.desconto || '0');
                return (
                  <tr key={f.id}>
                    <td><b>{f.lista_lote}</b><br/><small>{f.justificativa}</small></td>
                    <td>
                      <small>PGR: {f.qtd_pgr} | LTCAT: {f.qtd_ltcat} | AET: {f.qtd_aet}</small>
                    </td>
                    <td style={{ color: 'var(--red)' }}>R$ {desc.toLocaleString('pt-BR', {minimumFractionDigits: 2})}</td>
                    <td><b>R$ {total.toLocaleString('pt-BR', {minimumFractionDigits: 2})}</b></td>
                    <td>{f.created_at ? new Date(f.created_at).toLocaleDateString('pt-BR') : '—'}</td>
                    <td>
                      <div style={{ display: 'flex', gap: '4px' }}>
                        <button title="Editar Lançamento" style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', color: 'var(--muted)' }} onClick={() => { setNovoFat({ id: f.id, lista_lote: f.lista_lote, justificativa: f.justificativa || '', qtd_pgr: f.qtd_pgr || 0, valor_unit_pgr: f.valor_unit_pgr || 0, qtd_ltcat: f.qtd_ltcat || 0, valor_unit_ltcat: f.valor_unit_ltcat || 0, qtd_aep: f.qtd_aep || 0, valor_unit_aep: f.valor_unit_aep || 0, qtd_aet: f.qtd_aet || 0, valor_unit_aet: f.valor_unit_aet || 0, qtd_insalubridade: f.qtd_insalubridade || 0, valor_unit_insalubridade: f.valor_unit_insalubridade || 0, qtd_diversos: f.qtd_diversos || 0, valor_unit_diversos: f.valor_unit_diversos || 0, desconto: f.desconto || 0, unidades: [] }); setFaturamentoModalOpen(true); }}><Pencil size={14} /></button>
                        <button title="Excluir Lançamento" style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', color: 'var(--muted)' }} onClick={() => { setDeleteFatTarget(f); openConfirm('Excluir', 'Deseja excluir este lançamento?', () => { setDeleteFatTarget(f); handleDeleteFaturamento(); }); }}><Trash2 size={14} /></button>
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </section>
      {faturamentoModalOpen && (
        <div className="modal-overlay" style={{ zIndex: 10001 }}>
          <div className="modal-box" style={{ width: '800px', maxHeight: '90vh', overflowY: 'auto' }}>
            <div className="modal-header">
              <div className="modal-title"><h2>{novoFat.id ? 'Editar Lançamento' : 'Novo Lançamento (Medição)'}</h2></div>
              <button className="modal-close" onClick={() => setFaturamentoModalOpen(false)}>×</button>
            </div>
            <div className="modal-body" style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '4px' }}>
                  <label>Lista / Lote pertencente</label>
                  <input placeholder="Ex: LISTA 29" value={novoFat.lista_lote} onChange={e => setNovoFat({...novoFat, lista_lote: e.target.value})} style={{ padding: '8px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '4px' }}>
                  <label>Mês / Justificativas (Texto Livre)</label>
                  <input placeholder="Ex: Faturamento referente a Maio/2026..." value={novoFat.justificativa} onChange={e => setNovoFat({...novoFat, justificativa: e.target.value})} style={{ padding: '8px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
              </div>
              <h3 style={{ margin: '10px 0 0 0', fontSize: '14px', color: 'var(--purple)' }}>Valores Unitários</h3>
              
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>PGR</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_pgr || ''} onChange={e => setNovoFat({...novoFat, qtd_pgr: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_pgr || ''} onChange={e => setNovoFat({...novoFat, valor_unit_pgr: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>LTCAT</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_ltcat || ''} onChange={e => setNovoFat({...novoFat, qtd_ltcat: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_ltcat || ''} onChange={e => setNovoFat({...novoFat, valor_unit_ltcat: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>AEP</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_aep || ''} onChange={e => setNovoFat({...novoFat, qtd_aep: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_aep || ''} onChange={e => setNovoFat({...novoFat, valor_unit_aep: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>AET</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_aet || ''} onChange={e => setNovoFat({...novoFat, qtd_aet: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_aet || ''} onChange={e => setNovoFat({...novoFat, valor_unit_aet: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>Insalubridade</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_insalubridade || ''} onChange={e => setNovoFat({...novoFat, qtd_insalubridade: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_insalubridade || ''} onChange={e => setNovoFat({...novoFat, valor_unit_insalubridade: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                  <span style={{ width: '100px', fontWeight: 'bold' }}>Diversos</span>
                  <input type="number" placeholder="Qtd" value={novoFat.qtd_diversos || ''} onChange={e => setNovoFat({...novoFat, qtd_diversos: Number(e.target.value)})} style={{ width: '70px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                  <input type="number" placeholder="R$ Unit" value={novoFat.valor_unit_diversos || ''} onChange={e => setNovoFat({...novoFat, valor_unit_diversos: Number(e.target.value)})} style={{ width: '90px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
              </div>
              
              <h3 style={{ margin: '10px 0 0 0', fontSize: '14px', color: 'var(--purple)' }}>Selecione as Unidades (CNPJs)</h3>
              <div style={{ maxHeight: '180px', overflowY: 'auto', border: '1px solid var(--line)', borderRadius: '6px', padding: '10px', display: 'flex', flexDirection: 'column', gap: '6px' }}>
                {matriz.map(u => (
                  <label key={u.id} style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', fontSize: '12px' }}>
                    <input type="checkbox" checked={novoFat.unidades.includes(u.id)} onChange={e => {
                      if (e.target.checked) setNovoFat({...novoFat, unidades: [...novoFat.unidades, u.id]});
                      else setNovoFat({...novoFat, unidades: novoFat.unidades.filter(uid => uid !== u.id)});
                    }} style={{ accentColor: 'var(--purple)' }} />
                    <b>{u.cnpj}</b> - {u.filial}
                  </label>
                ))}
              </div>

              <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px', marginTop: '16px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginRight: 'auto' }}>
                  <b>Desconto (R$):</b>
                  <input type="number" value={novoFat.desconto || ''} onChange={e => setNovoFat({...novoFat, desconto: Number(e.target.value)})} style={{ width: '100px', padding: '6px', border: '1px solid var(--line)', borderRadius: '6px' }} />
                </div>
                <button className="btn" onClick={() => setFaturamentoModalOpen(false)}>Cancelar</button>
                <button className="btn primary" onClick={handleSalvarFaturamento}>Salvar Lançamento</button>
              </div>
            </div>
          </div>
        </div>
      )}

      {faturamentoChartOpen && (
        <div className="modal-overlay" style={{ zIndex: 10001 }} onClick={() => setFaturamentoChartOpen(false)}>
          <div className="modal-box" style={{ width: '800px', maxWidth: '90vw' }} onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <div className="modal-title"><h2>Evolução Mensal do Faturamento</h2></div>
              <button className="modal-close" onClick={() => setFaturamentoChartOpen(false)}>×</button>
            </div>
            <div className="modal-body" style={{ display: 'flex', justifyContent: 'center', paddingTop: '20px' }}>
                <BarChart width={740} height={360} data={faturamento.map(f => ({ name: (f.lista_lote ? String(f.lista_lote).split('-')[0].trim() : 'N/A'), valor: parseFloat(f.valor_total || '0') })).reverse()} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                  <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e5e7eb" />
                  <XAxis dataKey="name" tick={{ fill: '#6b7280', fontSize: 12 }} axisLine={false} tickLine={false} />
                  <YAxis tickFormatter={(val) => `R$ ${(val/1000)}k`} tick={{ fill: '#6b7280', fontSize: 12 }} axisLine={false} tickLine={false} width={80} />
                  <Tooltip formatter={(value: any) => [`R$ ${Number(value).toLocaleString('pt-BR', {minimumFractionDigits: 2})}`, 'Total']} cursor={{ fill: '#f3f4f6' }} />
                  <Bar dataKey="valor" fill="var(--purple)" radius={[6, 6, 0, 0]} />
                </BarChart>
            </div>
            <div className="modal-footer" style={{ justifyContent: 'center' }}>
               <small style={{ color: 'var(--muted)' }}>Dados baseados nos lançamentos registrados.</small>
            </div>
          </div>
        </div>
      )}
    </>
  );

  const renderAdmin = () => (
    <>
      <header className="topbar">
        <div><h1>Administrativo</h1></div>
        {adminSubTab === 'users' && <div className="actions" style={{ marginLeft: 'auto' }}><button className="btn primary" onClick={() => openUserForm()}>＋ Usuário</button></div>}
      </header>
      <section className="content">
        <div className="tabs-header">
          <button className={`tab-link ${adminSubTab === 'users' ? 'active' : ''}`} onClick={() => setAdminSubTab('users')}>Usuários</button>
          <button className={`tab-link ${adminSubTab === 'notificacoes' ? 'active' : ''}`} onClick={() => setAdminSubTab('notificacoes')}>Notificações (Alertas)</button>
          <button className={`tab-link ${adminSubTab === 'logs' ? 'active' : ''}`} onClick={() => setAdminSubTab('logs')}>Logs de Acesso</button>
        </div>
        {adminSubTab === 'users' && (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Nome</th><th>E-mail</th><th>Nível</th><th>Ações</th></tr></thead>
              <tbody>
                {adminUsers.filter(u => {
                  if (user?.role === 'master') return true;
                  if (user?.role === 'admin' && u.nivel_acesso === 'master') return false;
                  return true;
                }).map(u => {
                  const canEdit = user?.role === 'master' || (user?.role === 'admin' && u.nivel_acesso !== 'admin' && u.nivel_acesso !== 'master');
                  return (
                  <tr key={u.id}>
                    <td><b>{u.nome}</b></td>
                    <td>{u.email}</td>
                    <td><span className="status">{u.nivel_acesso.toUpperCase()}</span></td>
                    <td>
                      <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
                        {canEdit && (
                          <>
                            <button
                              title="Reenviar Senha"
                              style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--amber)', transition: 'all 0.15s' }}
                              onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#fffbeb'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--amber)'; }}
                              onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                              onClick={() => openConfirm('Atenção', `Reenviar e-mail de senha para ${u.nome}?`, () => {
                                axios.post(`/api/auth/users/${u.id}/reset`, { frontendUrl: window.location.origin }).then(() => {
                                  openAlert('Sucesso', 'E-mail de redefinição enviado com sucesso!');
                                });
                              })}
                            ><Mail size={14} /></button>
                            <button
                              title="Editar Usuário"
                              style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--muted)', transition: 'all 0.15s' }}
                              onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#f0e7fb'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--purple)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--purple)'; }}
                              onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.color = 'var(--muted)'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                              onClick={() => openUserForm(u)}
                            ><Pencil size={14} /></button>
                            <button
                              title="Excluir Usuário"
                              style={{ background: 'none', border: '1px solid var(--line)', borderRadius: '6px', padding: '5px', cursor: 'pointer', display: 'flex', color: 'var(--red)', transition: 'all 0.15s' }}
                              onMouseEnter={e => { (e.currentTarget as HTMLButtonElement).style.background = '#fef2f2'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--red)'; }}
                              onMouseLeave={e => { (e.currentTarget as HTMLButtonElement).style.background = 'none'; (e.currentTarget as HTMLButtonElement).style.borderColor = 'var(--line)'; }}
                              onClick={() => openConfirm('Atenção', `Excluir ${u.nome}?`, () => {
                                axios.delete(`/api/auth/users/${u.id}`).then(fetchAdminUsers);
                              })}
                            ><Trash2 size={14} /></button>
                          </>
                        )}
                      </div>
                    </td>
                  </tr>
                )})}
              </tbody>
            </table>
          </div>
        )}

        {adminSubTab === 'logs' && (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Data</th><th>Usuário</th><th>Ação</th></tr></thead>
              <tbody>
                {adminLogs.map((l:any) => (
                  <tr key={l.id}>
                    <td>{new Date(l.created_at).toLocaleString()}</td>
                    <td>{l.usuario_email}</td>
                    <td><b>{l.acao}</b> - {l.detalhes}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {adminSubTab === 'notificacoes' && (
          <div style={{ display: 'flex', gap: '24px', flexWrap: 'wrap' }}>
            {/* Alertas Card */}
            <div className="card" style={{ flex: '1', minWidth: '340px' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '20px' }}>
                <div style={{ background: '#f0e7fb', color: 'var(--purple)', padding: '10px', borderRadius: '12px' }}><Bell size={20} /></div>
                <h3 style={{ margin: 0, color: 'var(--ink)', fontSize: '18px' }}>Alertas de Vencimento</h3>
              </div>
              
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(110px, 1fr))', gap: '16px', marginBottom: '24px' }}>
                <div className="modal-form-group">
                  <label>1º Alerta (Dias)</label>
                  <input type="number" value={notifConfig.dias_alerta_1} onChange={e => setNotifConfig({...notifConfig, dias_alerta_1: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>2º Alerta (Dias)</label>
                  <input type="number" value={notifConfig.dias_alerta_2} onChange={e => setNotifConfig({...notifConfig, dias_alerta_2: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>3º Alerta (Dias)</label>
                  <input type="number" value={notifConfig.dias_alerta_3} onChange={e => setNotifConfig({...notifConfig, dias_alerta_3: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
              </div>

              <div className="modal-form-group">
                <label>E-mails adicionais (separados por vírgula)</label>
                <input placeholder="Ex: diretor@empresa.com, seguranca@empresa.com" value={notifConfig.email_customizado || ''} onChange={e => setNotifConfig({...notifConfig, email_customizado: e.target.value})} />
                <small style={{ color: 'var(--muted)', display: 'block', marginTop: '6px' }}>Os usuários Master/Admin já recebem os alertas automaticamente.</small>
              </div>
            </div>

            {/* Validade Card */}
            <div className="card" style={{ flex: '1', minWidth: '340px' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '20px' }}>
                <div style={{ background: '#ecfdf5', color: 'var(--green)', padding: '10px', borderRadius: '12px' }}><Calendar size={20} /></div>
                <h3 style={{ margin: 0, color: 'var(--ink)', fontSize: '18px' }}>Validade dos Documentos (Anos)</h3>
              </div>
              
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(120px, 1fr))', gap: '16px', marginBottom: '24px' }}>
                <div className="modal-form-group">
                  <label>PGR</label>
                  <input type="number" value={notifConfig.validade_pgr} onChange={e => setNotifConfig({...notifConfig, validade_pgr: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>LTCAT</label>
                  <input type="number" value={notifConfig.validade_ltcat} onChange={e => setNotifConfig({...notifConfig, validade_ltcat: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>AEP</label>
                  <input type="number" value={notifConfig.validade_aep} onChange={e => setNotifConfig({...notifConfig, validade_aep: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>AET</label>
                  <input type="number" value={notifConfig.validade_aet} onChange={e => setNotifConfig({...notifConfig, validade_aet: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
                <div className="modal-form-group">
                  <label>NR01</label>
                  <input type="number" value={notifConfig.validade_nr01} onChange={e => setNotifConfig({...notifConfig, validade_nr01: parseInt(e.target.value) || 0})} style={{ textAlign: 'center', fontWeight: 'bold' }} />
                </div>
              </div>
            </div>
            
            <div style={{ width: '100%', display: 'flex', justifyContent: 'flex-end', marginTop: '10px' }}>
              <button className="btn primary" style={{ padding: '12px 30px', fontSize: '16px' }} onClick={() => {
                axios.put('/api/auth/notificacoes-config', notifConfig).then(() => {
                  openAlert('Sucesso', 'Configurações de notificação e validade salvas com sucesso!');
                  fetchMatriz(); // Refresh matriz so that validity states are recalculated
                });
              }}>Salvar Todas as Configurações</button>
            </div>
          </div>
        )}
      </section>
    </>
  );

  const expiringUnits = matriz.filter(u => ['red', 'amber'].includes(getStatusColor(u.pgr)) || ['red', 'amber'].includes(getStatusColor(u.ltcat)) || ['red', 'amber'].includes(getStatusColor(u.aet)) || ['red', 'amber'].includes(getStatusColor(u.aep)));
  const activeNotifs = expiringUnits.filter(u => !clearedNotifs.includes(u.id));

  return (
    <div className="layout">
      <header className="global-header">
        <div className="header-left">
          <button className="menu-toggle" onClick={() => setSidebarOpen(!sidebarOpen)}><Menu size={24} /></button>
          <div className="header-brand"><img src="/logo.png?v=4" alt="DocSafe" style={{ maxHeight: '35px' }} /></div>
        </div>
        <div className="header-right">
          <div style={{ position: 'relative' }}>
            <button onClick={() => setNotificationsOpen(!notificationsOpen)} className="logout-btn" style={{ position: 'relative' }}>
              <Bell size={20} />
              {activeNotifs.length > 0 && (
                <span style={{ position: 'absolute', top: 0, right: 0, background: 'var(--red)', color: '#fff', borderRadius: '50%', width: '16px', height: '16px', fontSize: '9px', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 'bold', transform: 'translate(20%, -20%)' }}>
                  {activeNotifs.length}
                </span>
              )}
            </button>
            {notificationsOpen && (
              <div style={{ position: 'absolute', top: '100%', right: '0', background: '#fff', border: '1px solid var(--line)', borderRadius: '8px', width: '320px', boxShadow: '0 4px 15px rgba(0,0,0,0.1)', zIndex: 999, maxHeight: '400px', overflowY: 'auto' }}>
                <div style={{ padding: '12px 16px', borderBottom: '1px solid var(--line)', fontWeight: 'bold', backgroundColor: '#fcfcf0', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span>Alertas de Vencimento</span>
                  {activeNotifs.length > 0 && <button onClick={() => setClearedNotifs(expiringUnits.map(u => u.id))} style={{ background: 'none', border: 'none', color: 'var(--purple)', fontSize: '11px', cursor: 'pointer', fontWeight: 'bold' }}>Limpar Todos</button>}
                </div>
                {activeNotifs.length === 0 ? (
                  <div style={{ padding: '16px', color: 'var(--muted)', textAlign: 'center', fontSize: '12px' }}>Nenhuma nova notificação.</div>
                ) : (
                  activeNotifs.map((u: any) => (
                    <div key={u.id} style={{ padding: '12px 16px', borderBottom: '1px solid var(--line)', fontSize: '12px', display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', cursor: 'pointer' }} onClick={() => { setNotificationsOpen(false); setActiveTab('unidades'); setSelectedUnit(u); }} className="notification-item">
                      <div style={{ flex: 1, paddingRight: '8px' }}>
                        <div style={{ fontWeight: 'bold', marginBottom: '4px', color: 'var(--ink)' }}>{u.filial}</div>
                        <div style={{ color: 'var(--muted)' }}>Possui documentos próximos ao vencimento ou vencidos.</div>
                      </div>
                      <button style={{ background: 'none', border: 'none', cursor: 'pointer', color: 'var(--muted)', padding: '2px' }} onClick={(e) => { e.stopPropagation(); setClearedNotifs([...clearedNotifs, u.id]); }}>
                        <X size={14} />
                      </button>
                    </div>
                  ))
                )}
              </div>
            )}
          </div>
          <button onClick={() => setProfileModalOpen(true)} className="logout-btn" title="Meu Perfil"><Settings size={20} /></button>
          <button onClick={() => setUser(null)} className="logout-btn" title="Sair"><LogOut size={20} /></button>
        </div>
      </header>

      <div className="body-wrapper">
        <aside className={`sidebar ${sidebarOpen ? '' : 'closed'}`}>
          <div className="sidebar-content" style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
            <div className="label">MENU PRINCIPAL</div>
            <div className="nav">
              <button className={activeTab === 'dashboard' ? 'active' : ''} onClick={() => setActiveTab('dashboard')}>
                <LayoutDashboard size={18} /> <span>Painel Geral</span>
              </button>
              <button className={activeTab === 'unidades' ? 'active' : ''} onClick={() => setActiveTab('unidades')}>
                <Building2 size={18} /> <span>Consulta CNPJ</span>
              </button>
              <button className={activeTab === 'matriz' ? 'active' : ''} onClick={() => setActiveTab('matriz')}>
                <FileCheck size={18} /> <span>Matriz de Conformidade</span>
              </button>
              {['master','admin'].includes(user.role) && (
                <>
                  <button className={activeTab === 'financeiro' ? 'active' : ''} onClick={() => setActiveTab('financeiro')}>
                    <CircleDollarSign size={18} /> <span>Faturamento (Custos)</span>
                  </button>
                  <button className={activeTab === 'admin' ? 'active' : ''} onClick={() => setActiveTab('admin')}>
                    <Users size={18} /> <span>Administrativo</span>
                  </button>
                </>
              )}
            </div>
            <div className="spacer"></div>
            <div className="user-profile">
              <div className="user-profile-info">
                <b style={{ textTransform: 'capitalize', display: 'block', color: '#5b4e64' }}>{user.nome}</b>
                <small style={{ color: '#a8a0ad' }}>Nível: {user.role}</small>
              </div>
            </div>
          </div>
        </aside>

        <main className="main">
          {activeTab === 'dashboard' && renderDashboard()}
          {activeTab === 'unidades' && renderUnidades()}
          {activeTab === 'matriz' && renderMatriz()}
          {activeTab === 'financeiro' && renderFinanceiro()}
          {activeTab === 'admin' && renderAdmin()}
        </main>
      </div>

      {modal.isOpen && (
        <div className="modal-overlay" onClick={closeModal}>
          <div className="modal-box" style={{ width: modal.type === 'userForm' ? '460px' : '400px' }} onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <div className="modal-title"><h2>{modal.title}</h2></div>
              <button className="modal-close" onClick={closeModal}>×</button>
            </div>
            <div className="modal-body">
              {(modal.type === 'alert' || modal.type === 'confirm') && <p style={{ margin: 0 }}>{modal.message}</p>}
              {modal.type === 'userForm' && (
                <>
                  <div className="modal-form-group"><label>Nome</label><input value={modal.formData.nome} onChange={e => setModal({...modal, formData: {...modal.formData, nome: e.target.value}})} /></div>
                  <div className="modal-form-group"><label>E-mail</label><input value={modal.formData.email} onChange={e => setModal({...modal, formData: {...modal.formData, email: e.target.value}})} /></div>
                  <div className="modal-form-group" style={{ marginBottom: 0 }}>
                    <label>Nível</label>
                    <select value={modal.formData.nivel_acesso} onChange={e => setModal({...modal, formData: {...modal.formData, nivel_acesso: e.target.value}})}>
                      <option value="master">Master</option><option value="admin">Admin</option><option value="editor">Editor</option><option value="visualizador">Visualizador</option>
                    </select>
                  </div>
                  {(modal.formData.nivel_acesso === 'admin' || modal.formData.nivel_acesso === 'master') && (
                    <div className="modal-form-group" style={{ marginTop: '16px', marginBottom: 0 }}>
                      <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
                        <input type="checkbox" checked={!!modal.formData.recebe_notificacao} onChange={e => setModal({...modal, formData: {...modal.formData, recebe_notificacao: e.target.checked}})} style={{ accentColor: 'var(--purple)', width: '16px', height: '16px' }} />
                        Receber alertas de vencimento por e-mail
                      </label>
                    </div>
                  )}
                </>
              )}
            </div>
            <div className="modal-footer">
              {modal.type === 'alert' && <button className="btn primary" onClick={closeModal}>OK</button>}
              {modal.type === 'confirm' && <><button className="btn" onClick={closeModal}>Cancelar</button><button className="btn primary" onClick={() => { if(modal.onConfirm) modal.onConfirm(); closeModal(); }}>Confirmar</button></>}
              {modal.type === 'userForm' && <><button className="btn" onClick={closeModal}>Cancelar</button><button className="btn primary" onClick={() => {
                const u = { ...modal.formData, frontendUrl: window.location.origin };
                if (u.id) axios.put(`/api/auth/users/${u.id}`, u).then(() => { fetchAdminUsers(); closeModal(); });
                else axios.post('/api/auth/users', u).then(() => { fetchAdminUsers(); openAlert('Sucesso', 'Usuário criado! Um e-mail foi enviado para ele com a senha temporária.'); });
              }}>Salvar</button></>}
            </div>
          </div>
        </div>
      )}

      {profileModalOpen && (
        <div className="modal-overlay" onClick={() => setProfileModalOpen(false)}>
          <div className="modal-content" onClick={e => e.stopPropagation()} style={{ maxWidth: '400px' }}>
            <div className="modal-header">
              <div className="modal-title">
                <h2>Meu Perfil / Segurança</h2>
              </div>
              <button className="close-btn" onClick={() => setProfileModalOpen(false)}>✕</button>
            </div>
            <div className="modal-body" style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
              <div style={{ padding: '16px', background: '#f8f9fa', borderRadius: '8px', border: '1px solid var(--line)' }}>
                <div style={{ fontWeight: 'bold', color: 'var(--ink)' }}>{user?.nome}</div>
                <div style={{ color: 'var(--muted)', fontSize: '13px' }}>{user?.email}</div>
                <div style={{ display: 'inline-block', marginTop: '6px', background: 'var(--purple-light)', color: 'var(--purple)', padding: '2px 8px', borderRadius: '4px', fontSize: '11px', fontWeight: 'bold' }}>{user?.role.toUpperCase()}</div>
              </div>

              <div>
                <h3 style={{ fontSize: '14px', borderBottom: '1px solid var(--line)', paddingBottom: '8px', marginBottom: '12px' }}>Autenticação de 2 Fatores (2FA)</h3>
                {!user?.two_factor_enabled ? (
                  !qrCodeUrl ? (
                    <div>
                      <p style={{ fontSize: '13px', color: 'var(--muted)', marginBottom: '12px' }}>Aumente a segurança da sua conta exigindo um código gerado no seu celular (ex: Google Authenticator) a cada login.</p>
                      <button className="btn primary" style={{ width: '100%', display: 'flex', justifyContent: 'center' }} onClick={start2FASetup}>Configurar 2FA</button>
                    </div>
                  ) : (
                    <div>
                      <p style={{ fontSize: '13px', color: 'var(--ink)', marginBottom: '12px', fontWeight: 'bold' }}>1. Escaneie o QR Code abaixo com seu Authenticator</p>
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '16px', background: '#fff', padding: '10px', borderRadius: '8px', border: '1px solid var(--line)' }}>
                        <img src={qrCodeUrl} alt="QR Code" style={{ width: '150px', height: '150px' }} />
                      </div>
                      <p style={{ fontSize: '13px', color: 'var(--ink)', marginBottom: '8px', fontWeight: 'bold' }}>2. Digite o código de 6 dígitos gerado</p>
                      <div style={{ display: 'flex', gap: '8px' }}>
                        <input type="text" value={setupCode2fa} onChange={e => setSetupCode2fa(e.target.value)} placeholder="000000" maxLength={6} style={{ flex: 1, padding: '10px', borderRadius: '8px', border: '1px solid var(--line)', outline: 'none', textAlign: 'center', letterSpacing: '4px', fontSize: '16px', fontWeight: 'bold' }} />
                        <button className="btn primary" onClick={confirm2FASetup}>Ativar</button>
                      </div>
                      <button style={{ background: 'none', border: 'none', color: 'var(--muted)', fontSize: '12px', cursor: 'pointer', marginTop: '12px', width: '100%' }} onClick={() => setQrCodeUrl('')}>Cancelar</button>
                    </div>
                  )
                ) : (
                  <div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', color: 'var(--green)', fontWeight: 'bold', fontSize: '13px', marginBottom: '16px' }}>
                      <ShieldCheck size={18} /> 2FA Ativado
                    </div>
                    <p style={{ fontSize: '13px', color: 'var(--muted)', marginBottom: '12px' }}>Para desativar o 2FA, digite sua senha de login abaixo:</p>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <input type="password" value={profilePassword} onChange={e => setProfilePassword(e.target.value)} placeholder="Sua senha..." style={{ flex: 1, padding: '10px', borderRadius: '8px', border: '1px solid var(--line)', outline: 'none' }} />
                      <button className="btn" style={{ background: '#fef2f2', color: 'var(--red)', borderColor: 'var(--red)' }} onClick={disable2FA}>Desativar</button>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
