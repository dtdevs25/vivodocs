import React, { useState, useRef, useEffect } from 'react';
import { Menu, LogOut, LayoutDashboard, Building2, FileCheck, CircleDollarSign, Users, Globe, ShieldCheck, FileSearch, UserCog } from 'lucide-react';
import axios from 'axios';

type Role = 'master' | 'admin' | 'editor' | 'visualizador';

interface UserData {
  nome: string;
  email: string;
  role: Role;
}

function getStatusColor(val: string) {
  if (!val) return 'gray';
  const v = val.toLowerCase();
  if (v.includes('2026') || v.includes('2027') || v.includes('vigente')) return 'green';
  if (v.includes('2025') || v.includes('atenção')) return 'amber';
  if (v.includes('2024') || v.includes('2023') || v.includes('venceu')) return 'red';
  return 'gray';
}

function App() {
  const [user, setUser] = useState<UserData | null>(null);
  const [loginEmail, setLoginEmail] = useState('');
  const [loginPassword, setLoginPassword] = useState('');

  const [sidebarOpen, setSidebarOpen] = useState(true);
  const [activeTab, setActiveTab] = useState('dashboard');

  const [searchQuery, setSearchQuery] = useState('');
  const fileInputRef = useRef<HTMLInputElement>(null);

  const [dashboardData, setDashboardData] = useState<any>({ total_ativas: 0, total_desmobilizadas: 0, total_dgs: 0, total_sesmt: 0, total_iso: 0, pgrs_vigentes: 0, pgrs_vencendo: 0, pgrs_vencidos: 0, ltcat_vigentes: 0, ltcat_vencendo: 0, ltcat_vencidos: 0, aet_vigentes: 0, aet_vencendo: 0, aet_vencidos: 0, pendentes: 0, cobertura: 0 });
  const [matriz, setMatriz] = useState<any[]>([]);
  const [faturamento, setFaturamento] = useState<any[]>([]);
  const [faturamentoResumo, setFaturamentoResumo] = useState<any>({});
  
  const [adminUsers, setAdminUsers] = useState<any[]>([]);
  const [adminLogs, setAdminLogs] = useState<any[]>([]);
  
  const [unitSubTab, setUnitSubTab] = useState<'ativas'|'dgs'|'desmobilizadas'>('ativas');
  const [adminSubTab, setAdminSubTab] = useState<'users'|'logs'>('users');
  const [selectedUnit, setSelectedUnit] = useState<any>(null);
  const [ufFilter, setUfFilter] = useState('');

  const [modal, setModal] = useState<any>({isOpen: false, type: 'alert', title: '', message: ''});

  const openAlert = (title: string, message: string) => setModal({ isOpen: true, type: 'alert', title, message });
  const openConfirm = (title: string, message: string, onConfirm: () => void) => setModal({ isOpen: true, type: 'confirm', title, message, onConfirm });
  const openUserForm = (u?: any) => setModal({ isOpen: true, type: 'userForm', title: u ? 'Editar Usuário' : 'Novo Usuário', message: '', formData: u || { nome: '', email: '', nivel_acesso: 'visualizador' } });
  const closeModal = () => setModal({isOpen: false});

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const res = await axios.post('/api/auth/login', { email: loginEmail, senha: loginPassword });
      setUser(res.data.user);
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

  useEffect(() => {
    if (user) {
      if (activeTab === 'dashboard') { fetchDashboard(); fetchMatriz(); }
      if (activeTab === 'unidades' || activeTab === 'matriz') fetchMatriz();
      if (activeTab === 'financeiro') fetchFaturamento();
      if (activeTab === 'admin') { fetchAdminUsers(); fetchAdminLogs(); }
    }
  }, [user, activeTab]);

  const handleImport = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    const formData = new FormData(); formData.append('file', file);
    try {
      openAlert('Aguarde', 'Processando planilha...');
      await axios.post('/api/unidades/upload-seed', formData);
      openAlert('Sucesso', 'Dados atualizados!');
      fetchMatriz(); fetchDashboard();
    } catch (err) { openAlert('Erro', 'Erro ao processar planilha.'); }
  };

  if (!user) {
    return (
      <div className="login-container">
        <div className="login-card">
          <div className="login-brand" style={{ justifyContent: 'center' }}>
            <img src="/logo.png" alt="Vivo Docs" style={{ maxHeight: '55px', objectFit: 'contain' }} />
          </div>
          <div className="login-header-text">Segurança do Trabalho</div>
          <form className="login-form" onSubmit={handleLogin}>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Email</label>
              <input type="email" value={loginEmail} onChange={(e) => setLoginEmail(e.target.value)} required placeholder="seu.email@exemplo.com" />
            </div>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px' }}>
              <label>Senha</label>
              <input type="password" value={loginPassword} onChange={(e) => setLoginPassword(e.target.value)} required placeholder="••••••••" />
            </div>
            <button type="submit" className="login-btn">Entrar na plataforma</button>
          </form>
        </div>
      </div>
    );
  }

  const canEdit = user.role === 'master' || user.role === 'admin' || user.role === 'editor';

  const renderDashboard = () => {
    const totalVigentes = dashboardData.pgrs_vigentes + dashboardData.ltcat_vigentes + dashboardData.aet_vigentes;
    const totalVencendo = dashboardData.pgrs_vencendo + dashboardData.ltcat_vencendo + dashboardData.aet_vencendo;
    const totalVencidos = dashboardData.pgrs_vencidos + dashboardData.ltcat_vencidos + dashboardData.aet_vencidos;
    const totalPendentes = dashboardData.pendentes;
    const totalDocs = totalVigentes + totalVencendo + totalVencidos + totalPendentes;
    const percVigente = totalDocs ? Math.round((totalVigentes / totalDocs) * 100) : 0;
    
    return (
      <>
        <header className="topbar"><div><h1>Painel Geral</h1></div></header>
        <section className="content">
          <div className="cards">
            <div className="card" style={{ border: '1px solid var(--purple)', borderLeft: '4px solid var(--purple)', borderRadius: '8px' }}>
              <small style={{ display: 'flex', alignItems: 'center', color: 'var(--ink)', fontWeight: 'bold' }}>
                <Globe size={16} color="var(--purple)" style={{ marginRight: '6px' }} /> Cobertura Global
              </small>
              <strong className="purple">{dashboardData.cobertura}%</strong>
              <small>Das unidades ativas possuem docs</small>
            </div>

            <div className="card" style={{ border: '1px solid var(--green)', borderLeft: '4px solid var(--green)', borderRadius: '8px' }}>
              <small style={{ display: 'flex', alignItems: 'center', color: 'var(--ink)', fontWeight: 'bold' }}>
                <ShieldCheck size={16} color="var(--green)" style={{ marginRight: '6px' }} /> Controle PGR (Vig | Venc)
              </small>
              <strong className="green">
                {dashboardData.pgrs_vigentes} <span style={{color: 'var(--line)', fontWeight: 'normal', margin: '0 4px'}}>|</span> <span style={{color: 'var(--red)'}}>{dashboardData.pgrs_vencidos}</span>
              </strong>
              <small>{dashboardData.pgrs_vencendo} vencendo (Alerta)</small>
            </div>

            <div className="card" style={{ border: '1px solid var(--amber)', borderLeft: '4px solid var(--amber)', borderRadius: '8px' }}>
              <small style={{ display: 'flex', alignItems: 'center', color: 'var(--ink)', fontWeight: 'bold' }}>
                <FileSearch size={16} color="var(--amber)" style={{ marginRight: '6px' }} /> Controle LTCAT (Vig | Venc)
              </small>
              <strong className="green">
                {dashboardData.ltcat_vigentes} <span style={{color: 'var(--line)', fontWeight: 'normal', margin: '0 4px'}}>|</span> <span style={{color: 'var(--red)'}}>{dashboardData.ltcat_vencidos}</span>
              </strong>
              <small>{dashboardData.ltcat_vencendo} vencendo (Alerta)</small>
            </div>

            <div className="card" style={{ border: '1px solid #3b82f6', borderLeft: '4px solid #3b82f6', borderRadius: '8px' }}>
              <small style={{ display: 'flex', alignItems: 'center', color: 'var(--ink)', fontWeight: 'bold' }}>
                <UserCog size={16} color="#3b82f6" style={{ marginRight: '6px' }} /> Controle AET (Vig | Venc)
              </small>
              <strong className="green">
                {dashboardData.aet_vigentes} <span style={{color: 'var(--line)', fontWeight: 'normal', margin: '0 4px'}}>|</span> <span style={{color: 'var(--red)'}}>{dashboardData.aet_vencidos}</span>
              </strong>
              <small>{dashboardData.aet_vencendo} vencendo (Alerta)</small>
            </div>
          </div>

          <div className="grid">
            <div className="panel" style={{ padding: 0, overflow: 'hidden' }}>
              <div style={{ backgroundColor: '#f3f4f6', padding: '16px 24px', borderBottom: '1px solid var(--line)' }}>
                <h2 style={{ fontSize: '13px', color: '#4b5563', textTransform: 'uppercase', letterSpacing: '0.5px', margin: 0, fontWeight: 'bold' }}>
                  Saúde dos Programas (PGR, LTCAT, AET)
                </h2>
              </div>
              <div className="chart" style={{ display: 'flex', alignItems: 'center', gap: '40px', padding: '24px' }}>
                <div className="donut" style={{
                  background: `conic-gradient(var(--green) 0 ${totalDocs > 0 ? (totalVigentes / totalDocs) * 100 : 0}%, var(--amber) ${totalDocs > 0 ? (totalVigentes / totalDocs) * 100 : 0}% ${totalDocs > 0 ? ((totalVigentes + totalVencendo) / totalDocs) * 100 : 0}%, var(--red) ${totalDocs > 0 ? ((totalVigentes + totalVencendo) / totalDocs) * 100 : 0}% ${totalDocs > 0 ? ((totalVigentes + totalVencendo + totalVencidos) / totalDocs) * 100 : 0}%, var(--line) ${totalDocs > 0 ? ((totalVigentes + totalVencendo + totalVencidos) / totalDocs) * 100 : 0}%)`
                }}>
                  <span id="coverage" style={{color: 'var(--green)'}}>{percVigente}%</span>
                </div>
                
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', rowGap: '24px', columnGap: '20px', flex: 1 }}>
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--green)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{totalVigentes}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Vigentes</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', borderLeft: '1px solid var(--line)', paddingLeft: '20px' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--amber)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{totalVencendo}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Vencendo</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--red)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{totalVencidos}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Vencidos</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', borderLeft: '1px solid var(--line)', paddingLeft: '20px' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--muted)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{totalPendentes}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Pendentes / S.Info</small>
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
                
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', rowGap: '24px', padding: '24px' }}>
                  {/* Row 1 */}
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--red)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{dashboardData.total_ativas}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Ativas</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', borderLeft: '1px solid var(--line)', paddingLeft: '20px' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--purple)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{dashboardData.total_desmobilizadas}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>Desativadas</small>
                  </div>

                  {/* Row 2 */}
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--amber)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{dashboardData.total_dgs}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>DG</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', borderLeft: '1px solid var(--line)', paddingLeft: '20px' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--green)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{dashboardData.total_iso}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>ISO 45001</small>
                  </div>

                  {/* Row 3 */}
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <strong style={{ fontSize: '26px', color: 'var(--ink)', fontWeight: '800', lineHeight: '1', marginBottom: '4px' }}>{dashboardData.total_sesmt}</strong>
                    <small style={{ color: 'var(--muted)', fontSize: '12px', fontWeight: '500' }}>SESMT</small>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', borderLeft: '1px solid transparent', paddingLeft: '20px' }}>
                    {/* Placeholder for alignment */}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </>
    );
  };

  const renderUnidades = () => {
    const filtered = matriz.filter(u => {
      if (unitSubTab === 'ativas' && (u.status_funcionamento !== 'ATIVA' || u.is_dg)) return false;
      if (unitSubTab === 'desmobilizadas' && u.status_funcionamento !== 'DESMOBILIZADA') return false;
      if (unitSubTab === 'dgs' && !u.is_dg) return false;
      if (ufFilter && u.uf !== ufFilter) return false;
      return `${u.cnpj} ${u.filial} ${u.cidade} ${u.uf} ${u.bairro}`.toLowerCase().includes(searchQuery.toLowerCase());
    });

    const allUfs = [...new Set(matriz.map((u: any) => u.uf).filter(Boolean))].sort();

    const tipoBadge = (u: any) => {
      if (u.is_dg) return { label: 'DG', color: 'var(--amber)', bg: '#fef3e2' };
      if (u.tipo_predio?.toLowerCase().includes('loja')) return { label: 'Loja', color: 'var(--purple)', bg: '#f3e8ff' };
      if (u.tipo_predio?.toLowerCase().includes('pr')) return { label: 'Prédio', color: '#3b82f6', bg: '#eff6ff' };
      return { label: u.tipo_predio || '—', color: 'var(--muted)', bg: '#f3f4f6' };
    };

    return (
      <>
        <header className="topbar">
          <div><h1>Gestão de Unidades</h1></div>
          <div className="actions" style={{ gap: '8px' }}>
            <input
              className="search"
              placeholder="Buscar por CNPJ ou nome..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
            <select
              value={ufFilter}
              onChange={(e) => setUfFilter(e.target.value)}
              style={{ height: '40px', border: '1px solid #e8e2ed', borderRadius: '8px', padding: '0 10px', background: '#fff', color: 'var(--ink)', fontSize: '13px', outline: 'none' }}
            >
              <option value="">Todas as UFs</option>
              {allUfs.map((uf: string) => <option key={uf} value={uf}>{uf}</option>)}
            </select>
            {canEdit && <button className="btn" onClick={() => fileInputRef.current?.click()}>↥ Importar CSV</button>}
            <input ref={fileInputRef} className="hidden" type="file" accept=".csv" onChange={handleImport} />
          </div>
        </header>
        <section className="content">
          <div className="tabs-header">
            <button className={`tab-link ${unitSubTab === 'ativas' ? 'active' : ''}`} onClick={() => setUnitSubTab('ativas')}>Ativas</button>
            <button className={`tab-link ${unitSubTab === 'dgs' ? 'active' : ''}`} onClick={() => setUnitSubTab('dgs')}>Distribuidores (DGs)</button>
            <button className={`tab-link ${unitSubTab === 'desmobilizadas' ? 'active' : ''}`} onClick={() => setUnitSubTab('desmobilizadas')}>Desmobilizadas</button>
          </div>
          <div style={{ marginBottom: '10px', color: 'var(--muted)', fontSize: '12px' }}>
            {filtered.length} unidade{filtered.length !== 1 ? 's' : ''} encontrada{filtered.length !== 1 ? 's' : ''}
          </div>
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Unidade</th><th>Tipo</th><th>Localização</th><th>Região</th><th>ISO / SESMT</th><th>Ações</th></tr></thead>
              <tbody>
                {filtered.length === 0
                  ? <tr><td colSpan={6} className="empty">Nenhuma unidade encontrada.</td></tr>
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
                        <td style={{ fontSize: '11px' }}>
                          {u.escopo_iso_45001 && <span style={{ color: 'var(--green)', fontWeight: 'bold', marginRight: '6px' }}>✓ ISO</span>}
                          {u.compoe_sesmt && <span style={{ color: 'var(--purple)', fontWeight: 'bold' }}>✓ SESMT</span>}
                          {!u.escopo_iso_45001 && !u.compoe_sesmt && <span style={{ color: 'var(--muted)' }}>—</span>}
                        </td>
                        <td>
                          <button
                            className="btn"
                            style={{ padding: '4px 10px', fontSize: '11px' }}
                            onClick={() => setSelectedUnit(u)}
                          >
                            Ver Ficha
                          </button>
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
            <div
              className="modal-box"
              style={{ width: '560px', maxWidth: '95%', maxHeight: '85vh', overflowY: 'auto' }}
              onClick={(e) => e.stopPropagation()}
            >
              {/* Header */}
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '20px' }}>
                <div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '4px' }}>
                    {(() => { const b = tipoBadge(selectedUnit); return <span style={{ background: b.bg, color: b.color, borderRadius: '12px', padding: '4px 12px', fontSize: '12px', fontWeight: '700' }}>{b.label}</span>; })()}
                    {selectedUnit.status_funcionamento === 'DESMOBILIZADA' &&
                      <span style={{ background: '#fef2f2', color: 'var(--red)', borderRadius: '12px', padding: '4px 12px', fontSize: '12px', fontWeight: '700' }}>Desmobilizada</span>
                    }
                  </div>
                  <h2 style={{ margin: 0, fontSize: '20px', fontWeight: '800', color: 'var(--ink)' }}>{selectedUnit.filial || '—'}</h2>
                  <small style={{ color: 'var(--muted)' }}>CNPJ: {selectedUnit.cnpj}</small>
                </div>
                <button onClick={() => setSelectedUnit(null)} style={{ background: 'none', border: 'none', fontSize: '22px', color: 'var(--muted)', cursor: 'pointer', lineHeight: 1 }}>×</button>
              </div>

              {/* Grid de dados */}
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '20px' }}>
                {[
                  { label: 'Cidade', value: selectedUnit.cidade },
                  { label: 'UF', value: selectedUnit.uf },
                  { label: 'Bairro', value: selectedUnit.bairro },
                  { label: 'Endereço', value: selectedUnit.endereco },
                  { label: 'Regional', value: selectedUnit.regional },
                  { label: 'Tipo de Prédio', value: selectedUnit.tipo_predio },
                ].map(({ label, value }) => (
                  <div key={label} style={{ background: '#f9f8fb', borderRadius: '8px', padding: '12px 14px' }}>
                    <div style={{ fontSize: '10px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '4px' }}>{label}</div>
                    <div style={{ fontSize: '13px', color: 'var(--ink)', fontWeight: '600' }}>{value || '—'}</div>
                  </div>
                ))}
              </div>

              {/* Certificações */}
              <div style={{ borderTop: '1px solid var(--line)', paddingTop: '16px', marginBottom: '20px' }}>
                <div style={{ fontSize: '11px', color: 'var(--muted)', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.5px', marginBottom: '12px' }}>Certificações e Composição</div>
                <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap' }}>
                  <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.escopo_iso_45001 ? '#ecfdf5' : '#f3f4f6', color: selectedUnit.escopo_iso_45001 ? 'var(--green)' : 'var(--muted)', border: `1px solid ${selectedUnit.escopo_iso_45001 ? 'var(--green)' : 'var(--line)'}` }}>
                    {selectedUnit.escopo_iso_45001 ? '✓' : '✗'} ISO 45001
                  </span>
                  <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.compoe_sesmt ? '#f5f0ff' : '#f3f4f6', color: selectedUnit.compoe_sesmt ? 'var(--purple)' : 'var(--muted)', border: `1px solid ${selectedUnit.compoe_sesmt ? 'var(--purple)' : 'var(--line)'}` }}>
                    {selectedUnit.compoe_sesmt ? '✓' : '✗'} Compõe SESMT
                  </span>
                  <span style={{ padding: '6px 14px', borderRadius: '20px', fontSize: '12px', fontWeight: '700', background: selectedUnit.is_dg ? '#fff7ed' : '#f3f4f6', color: selectedUnit.is_dg ? 'var(--amber)' : 'var(--muted)', border: `1px solid ${selectedUnit.is_dg ? 'var(--amber)' : 'var(--line)'}` }}>
                    {selectedUnit.is_dg ? '✓' : '✗'} Distribuidor (DG)
                  </span>
                </div>
              </div>

              <div style={{ display: 'flex', justifyContent: 'flex-end' }}>
                <button className="btn" onClick={() => setSelectedUnit(null)}>Fechar</button>
              </div>
            </div>
          </div>
        )}
      </>
    );
  };


  const renderMatriz = () => {
    const filtered = matriz.filter(u => u.status_funcionamento === 'ATIVA' && `${u.cnpj} ${u.filial}`.toLowerCase().includes(searchQuery.toLowerCase()));
    return (
      <>
        <header className="topbar">
          <div><h1>Matriz de Conformidade (Documentos)</h1></div>
          <div className="actions">
            <input className="search" placeholder="Buscar unidade..." value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} />
          </div>
        </header>
        <section className="content">
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>CNPJ / Filial</th><th>PGR</th><th>LTCAT</th><th>AEP</th><th>AET</th><th>NR01</th></tr></thead>
              <tbody>
                {filtered.map(u => (
                  <tr key={u.id}>
                    <td><b>{u.filial}</b><small>{u.cnpj}</small></td>
                    <td>{u.pgr ? <span className={`status ${getStatusColor(u.pgr)}`}>{u.pgr}</span> : '—'}</td>
                    <td>{u.ltcat ? <span className={`status ${getStatusColor(u.ltcat)}`}>{u.ltcat}</span> : '—'}</td>
                    <td>{u.aep ? <span className={`status ${getStatusColor(u.aep)}`}>{u.aep}</span> : '—'}</td>
                    <td>{u.aet ? <span className={`status ${getStatusColor(u.aet)}`}>{u.aet}</span> : '—'}</td>
                    <td>{u.nr01 ? <span className={`status ${getStatusColor(u.nr01)}`}>{u.nr01}</span> : '—'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      </>
    );
  };

  const renderFinanceiro = () => (
    <>
      <header className="topbar"><div><h1>Faturamento e Custos</h1></div></header>
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
            <thead><tr><th>Lote / Período</th><th>PGR / LTCAT / AET</th><th>Descontos</th><th>Líquido</th><th>Data Envio</th></tr></thead>
            <tbody>
              {faturamento.map(f => {
                const bruto = parseFloat(f.valor_bruto || '0');
                const desc = parseFloat(f.descontos || '0');
                return (
                  <tr key={f.id}>
                    <td><b>{f.lote_entrega}</b><br/><small>{f.observacoes}</small></td>
                    <td>
                      <small>PGR: {f.quantidade_pgr} | LTCAT: {f.quantidade_ltcat} | AET: {f.quantidade_aet}</small>
                    </td>
                    <td style={{ color: 'var(--red)' }}>R$ {desc.toLocaleString('pt-BR', {minimumFractionDigits: 2})}</td>
                    <td><b>R$ {(bruto-desc).toLocaleString('pt-BR', {minimumFractionDigits: 2})}</b></td>
                    <td>{f.data_envio_pagamento ? new Date(f.data_envio_pagamento).toLocaleDateString('pt-BR') : '—'}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </section>
    </>
  );

  const renderAdmin = () => (
    <>
      <header className="topbar">
        <div><h1>Administrativo</h1></div>
        {adminSubTab === 'users' && <div className="actions"><button className="btn primary" onClick={() => openUserForm()}>＋ Novo Usuário</button></div>}
      </header>
      <section className="content">
        <div className="tabs-header">
          <button className={`tab-link ${adminSubTab === 'users' ? 'active' : ''}`} onClick={() => setAdminSubTab('users')}>Usuários</button>
          <button className={`tab-link ${adminSubTab === 'logs' ? 'active' : ''}`} onClick={() => setAdminSubTab('logs')}>Logs de Acesso</button>
        </div>
        {adminSubTab === 'users' && (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Nome / E-mail</th><th>Nível</th><th>Ações</th></tr></thead>
              <tbody>
                {adminUsers.map(u => (
                  <tr key={u.id}>
                    <td><b>{u.nome}</b><small>{u.email}</small></td>
                    <td><span className="status">{u.nivel_acesso.toUpperCase()}</span></td>
                    <td>
                      <button className="btn" style={{fontSize:'11px', marginRight: '5px'}} onClick={() => openUserForm(u)}>Editar</button>
                      <button className="btn" style={{fontSize:'11px', color:'var(--red)'}} onClick={() => openConfirm('Atenção', `Excluir ${u.nome}?`, () => {
                        axios.delete(`/api/auth/users/${u.id}`).then(fetchAdminUsers);
                      })}>Excluir</button>
                    </td>
                  </tr>
                ))}
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
      </section>
    </>
  );

  return (
    <div className="layout">
      <header className="global-header">
        <div className="header-left">
          <button className="menu-toggle" onClick={() => setSidebarOpen(!sidebarOpen)}><Menu size={24} /></button>
          <div className="header-brand"><img src="/logo.png" alt="Vivo Docs" style={{ maxHeight: '35px' }} /></div>
        </div>
        <div className="header-right"><button onClick={() => setUser(null)} className="logout-btn"><LogOut size={20} /></button></div>
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
                <Building2 size={18} /> <span>Gestão de Unidades</span>
              </button>
              <button className={activeTab === 'matriz' ? 'active' : ''} onClick={() => setActiveTab('matriz')}>
                <FileCheck size={18} /> <span>Matriz de Conformidade</span>
              </button>
              <button className={activeTab === 'financeiro' ? 'active' : ''} onClick={() => setActiveTab('financeiro')}>
                <CircleDollarSign size={18} /> <span>Faturamento (Custos)</span>
              </button>
              {['master','admin'].includes(user.role) && (
                <button className={activeTab === 'admin' ? 'active' : ''} onClick={() => setActiveTab('admin')}>
                  <Users size={18} /> <span>Administrativo</span>
                </button>
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
        <div className="modal-overlay">
          <div className="modal-box">
            <h2>{modal.title}</h2>
            {modal.type === 'alert' && <><p>{modal.message}</p><div className="modal-actions"><button className="btn primary" onClick={closeModal}>OK</button></div></>}
            {modal.type === 'confirm' && <><p>{modal.message}</p><div className="modal-actions"><button className="btn" onClick={closeModal}>Cancelar</button><button className="btn primary" onClick={() => { if(modal.onConfirm) modal.onConfirm(); closeModal(); }}>Confirmar</button></div></>}
            {modal.type === 'userForm' && (
              <>
                <div className="modal-form-group"><label>Nome</label><input value={modal.formData.nome} onChange={e => setModal({...modal, formData: {...modal.formData, nome: e.target.value}})} /></div>
                <div className="modal-form-group"><label>E-mail</label><input value={modal.formData.email} onChange={e => setModal({...modal, formData: {...modal.formData, email: e.target.value}})} /></div>
                <div className="modal-form-group">
                  <label>Nível</label>
                  <select value={modal.formData.nivel_acesso} onChange={e => setModal({...modal, formData: {...modal.formData, nivel_acesso: e.target.value}})}>
                    <option value="master">Master</option><option value="admin">Admin</option><option value="editor">Editor</option><option value="visualizador">Visualizador</option>
                  </select>
                </div>
                <div className="modal-actions"><button className="btn" onClick={closeModal}>Cancelar</button><button className="btn primary" onClick={() => {
                  const u = modal.formData;
                  if (u.id) axios.put(`/api/auth/users/${u.id}`, u).then(() => { fetchAdminUsers(); closeModal(); });
                  else axios.post('/api/auth/users', u).then(() => { fetchAdminUsers(); closeModal(); });
                }}>Salvar</button></div>
              </>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
