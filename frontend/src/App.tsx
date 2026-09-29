import React, { useState, useRef } from 'react';
import { Menu, LogOut, LayoutDashboard, Building2, Files, ShieldPlus, ArchiveX, Eye, EyeOff, Users } from 'lucide-react';
import axios from 'axios';

const initialUnits = [
  { cnpj: '02.558.157/0024-59', filial: 'BA SEDE', uf: 'BA', cidade: 'Salvador', hc: 0, due: '14/07/2028', status: 'Vigente' },
  { cnpj: '02.558.157/0061-05', filial: 'SP MTZ ECOBERRI', uf: 'SP', cidade: 'São Paulo', hc: 0, due: '29/04/2029', status: 'Vigente' },
  { cnpj: '02.558.157/0079-22', filial: 'SP CHUCRIZADA', uf: 'SP', cidade: 'São Paulo', hc: 0, due: '16/07/2028', status: 'Vigente' },
  { cnpj: '02.558.157/0741-07', filial: 'SP OSASCO', uf: 'SP', cidade: 'Osasco', hc: 0, due: '28/06/2028', status: 'Vigente' },
  { cnpj: '02.558.157/0017-20', filial: 'RS SEDE', uf: 'RS', cidade: 'Porto Alegre', hc: 0, due: '14/07/2029', status: 'Vigente' },
  { cnpj: '02.558.157/0583-22', filial: 'SP SOROCABA BOA', uf: 'SP', cidade: 'Sorocaba', hc: 0, due: '17/07/2029', status: 'Vigente' },
  { cnpj: '02.558.157/0766-57', filial: 'SP U ENCRUZILHADA', uf: 'SP', cidade: 'Santos', hc: 0, due: '15/07/2028', status: 'Vigente' },
  { cnpj: '02.558.157/0166-25', filial: 'PR MARINGÁ ZONA', uf: 'PR', cidade: 'Maringá', hc: 0, due: '17/07/2028', status: 'Vigente' },
  { cnpj: '02.558.157/0976-54', filial: 'LOJA SHOPPING JOCKEY PLAZA', uf: 'PR', cidade: 'Curitiba', hc: 0, due: '—', status: 'Pendente' },
  { cnpj: '02.558.157/0559-00', filial: 'PA U DOCA', uf: 'PA', cidade: 'Belém', hc: 0, due: '—', status: 'Pendente' }
];

type Role = 'master' | 'admin' | 'editor' | 'visualizador';

interface UserData {
  nome: string;
  email: string;
  role: Role;
}

function App() {
  const [user, setUser] = useState<UserData | null>(null);
  const [loginEmail, setLoginEmail] = useState('');
  const [loginPassword, setLoginPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);

  const [sidebarOpen, setSidebarOpen] = useState(true);
  const [activeTab, setActiveTab] = useState('dashboard');

  const [units, setUnits] = useState(initialUnits);
  const [searchQuery, setSearchQuery] = useState('');
  const fileInputRef = useRef<HTMLInputElement>(null);

  const [dashboardData, setDashboardData] = useState<any>({ total_ativas: 0, pgrs_vencendo: 0, pgrs_vencidos: 0, pendentes: 0, hc_monitorado: 0 });
  const [documentos, setDocumentos] = useState<any[]>([]);
  const [sesmt, setSesmt] = useState<any[]>([]);
  const [desmobilizadas, setDesmobilizadas] = useState<any[]>([]);

  const [adminUsers, setAdminUsers] = useState<any[]>([]);
  const [adminLogs, setAdminLogs] = useState<any[]>([]);
  const [adminSubTab, setAdminSubTab] = useState<'users'|'logs'>('users');

  const [modal, setModal] = useState<{isOpen: boolean, type: 'alert'|'confirm'|'userForm', title: string, message: string, onConfirm?: () => void, formData?: any}>({isOpen: false, type: 'alert', title: '', message: ''});
  const openAlert = (title: string, message: string) => setModal({ isOpen: true, type: 'alert', title, message });
  const openConfirm = (title: string, message: string, onConfirm: () => void) => setModal({ isOpen: true, type: 'confirm', title, message, onConfirm });
  const openUserForm = (u?: any) => setModal({ isOpen: true, type: 'userForm', title: u ? 'Editar Usuário' : 'Novo Usuário', message: '', formData: u || { nome: '', email: '', nivel_acesso: 'visualizador' } });
  const closeModal = () => setModal(m => ({...m, isOpen: false}));

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!loginEmail || !loginPassword) return;
    try {
      const res = await axios.post('/api/auth/login', { email: loginEmail, senha: loginPassword });
      setUser(res.data.user);
    } catch (err: any) {
      openAlert('Falha no Login', err.response?.data?.error || 'Erro ao fazer login');
    }
  };

  const handleLogout = () => {
    setUser(null);
  };

  const filteredUnits = units.filter(u => 
    `${u.cnpj} ${u.filial} ${u.cidade} ${u.uf}`.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const fetchUnits = async () => {
    try {
      const res = await axios.get('/api/unidades');
      const dbUnits = res.data.map((u: any) => ({
        id: u.id, cnpj: u.cnpj, filial: u.filial, uf: u.uf, cidade: u.cidade, hc: 0, due: '—', status: 'Pendente' 
      }));
      setUnits(dbUnits.length ? dbUnits : initialUnits);
    } catch (e) { console.error(e); }
  };
  
  const fetchDashboard = async () => {
    try { const res = await axios.get('/api/unidades/dashboard'); setDashboardData(res.data); } catch (e) {}
  };
  const fetchDocumentos = async () => {
    try { const res = await axios.get('/api/unidades/documentos'); setDocumentos(res.data); } catch (e) {}
  };
  const fetchSesmt = async () => {
    try { const res = await axios.get('/api/unidades/sesmt'); setSesmt(res.data); } catch (e) {}
  };
  const fetchDesmobilizadas = async () => {
    try { const res = await axios.get('/api/unidades/desmobilizadas'); setDesmobilizadas(res.data); } catch (e) {}
  };
  const fetchAdminUsers = async () => {
    try { const res = await axios.get('/api/auth/users'); setAdminUsers(res.data); } catch (e) {}
  };
  const fetchAdminLogs = async () => {
    try { const res = await axios.get('/api/auth/logs'); setAdminLogs(res.data); } catch (e) {}
  };

  React.useEffect(() => {
    if (user) {
      if (activeTab === 'unidades') fetchUnits();
      if (activeTab === 'dashboard') { fetchUnits(); fetchDashboard(); }
      if (activeTab === 'documentos') fetchDocumentos();
      if (activeTab === 'sesmt') fetchSesmt();
      if (activeTab === 'desmobilizadas') fetchDesmobilizadas();
      if (activeTab === 'admin') { fetchAdminUsers(); fetchAdminLogs(); }
    }
  }, [user, activeTab]);

  const handleImport = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    
    const formData = new FormData();
    formData.append('file', file);
    
    try {
      openAlert('Aguarde', 'Enviando planilha para o banco de dados. Isso pode demorar alguns segundos...');
      await axios.post('/api/unidades/upload-seed', formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      openAlert('Sucesso', 'Planilha processada com sucesso!');
      fetchUnits();
    } catch (err) {
      console.error(err);
      openAlert('Erro', 'Erro ao processar planilha no servidor.');
    }
  };

  const handleExport = () => {
    const header = 'CNPJ;Filial;UF;Cidade;HC;Vencimento PGR;Status\n';
    const csv = header + units.map(u => [u.cnpj, u.filial, u.uf, u.cidade, u.hc, u.due, u.status].join(';')).join('\n');
    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob([csv], { type: 'text/csv;charset=utf-8' }));
    a.download = 'relatorio_gestao_laudos.csv';
    a.click();
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
              <div className="input-wrapper">
                <input type={showPassword ? 'text' : 'password'} value={loginPassword} onChange={(e) => setLoginPassword(e.target.value)} required placeholder="••••••••" />
                <button type="button" onClick={() => setShowPassword(!showPassword)} title={showPassword ? 'Ocultar senha' : 'Mostrar senha'}>
                  {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
                </button>
              </div>
              <button type="button" className="forgot-password" onClick={() => openAlert('Atenção', 'Recuperação de senha enviada para seu e-mail!')}>Esqueci a senha</button>
            </div>
            <button type="submit" className="login-btn">Entrar na plataforma</button>
          </form>
        </div>
      </div>
    );
  }

  const canImportExport = user.role === 'master' || user.role === 'admin';
  const canEdit = user.role === 'master' || user.role === 'admin' || user.role === 'editor';

  const renderDashboard = () => (
    <>
      <header className="topbar">
        <div>
          <h1>Visão geral</h1>
        </div>
      </header>

      <section className="content">
        <div className="cards">
          <div className="card">
            <small>CNPJs monitorados</small>
            <strong className="purple">{dashboardData.total_ativas}</strong>
            <small>Base ativa</small>
          </div>
          <div className="card">
            <small>PGRs vencendo</small>
            <strong className="amber">{dashboardData.pgrs_vencendo}</strong>
            <small>Alerta em até 60 dias</small>
          </div>
          <div className="card">
            <small>PGRs vencidos</small>
            <strong style={{ color: 'var(--red)' }}>{dashboardData.pgrs_vencidos}</strong>
            <small>Requer ação imediata</small>
          </div>
          <div className="card">
            <small>HC monitorado</small>
            <strong className="green">{dashboardData.hc_monitorado}</strong>
            <small>Soma das lotações</small>
          </div>
        </div>

        <div className="grid">
          <div className="panel">
            <h2>Panorama de conformidade</h2>
            <p>Documentos PGR por status · unidades ativas</p>
            <div className="chart">
              <div className="donut"><span id="coverage">43%</span></div>
              <div className="legend">
                <div><i></i><span>Vigentes</span><b>47</b></div>
                <div><i className="amber"></i><span>Vencendo em 60 dias</span><b>0</b></div>
                <div><i className="red"></i><span>Vencidos</span><b>0</b></div>
                <div><i className="gray"></i><span>Pendentes</span><b>62</b></div>
              </div>
            </div>
          </div>
          
          <div className="insights">
            <div className="panel insight">
              <div style={{ padding: '12px', background: 'var(--bg)', borderRadius: '50%' }}><Files size={24} color="var(--purple)" /></div>
              <div>
                <span>Cobertura de documentos</span>
                <b>0%</b>
                <span>PGR, LTCAT e AEP preenchidos</span>
              </div>
            </div>
            <div className="panel insight">
              <div style={{ padding: '12px', background: 'var(--bg)', borderRadius: '50%' }}><ShieldPlus size={24} color="var(--purple)" /></div>
              <div>
                <span>SESMT registrado</span>
                <b>0 unidades</b>
                <span>com atendimento registrado</span>
              </div>
            </div>
            <div className="panel insight">
              <div style={{ padding: '12px', background: 'var(--bg)', borderRadius: '50%' }}><Building2 size={24} color="var(--purple)" /></div>
              <div>
                <span>Sem SESMT informado</span>
                <b>{units.length} unidades</b>
                <span>confirme a informação cadastral</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );

  const renderUnidades = () => (
    <>
      <header className="topbar">
        <div>
          <h1>Unidades Monitoradas</h1>
        </div>
        <div className="actions">
          <input 
            id="search" 
            className="search" 
            placeholder="Buscar CNPJ, filial ou cidade" 
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          {canImportExport && <button className="btn" onClick={() => fileInputRef.current?.click()}>↥ Importar CSV</button>}
          {canImportExport && <button className="btn" onClick={handleExport}>⇩ Relatório</button>}
          {canEdit && <button className="btn primary">＋ Nova unidade</button>}
          <input 
            ref={fileInputRef} 
            id="file" 
            className="hidden" 
            type="file" 
            accept=".csv,text/csv" 
            onChange={handleImport}
          />
        </div>
      </header>

      <section className="content">
        <div className="toolbar" style={{ marginTop: 0 }}>
          <h2>Unidades em atenção</h2>
          <span>{filteredUnits.length} registros visíveis</span>
        </div>

        <div className="table-wrap">
          <table className="table">
            <thead>
              <tr>
                <th>Unidade</th>
                <th>Localização</th>
                <th>HC</th>
                <th>SESMT</th>
                <th>Vencimento PGR</th>
                <th>Status</th>
                {canEdit && <th>Ações</th>}
              </tr>
            </thead>
            <tbody>
              {filteredUnits.map((u, i) => (
                <tr key={i}>
                  <td><b>{u.filial}</b><small>{u.cnpj}</small></td>
                  <td>{u.cidade} · {u.uf}</td>
                  <td>{u.hc}</td>
                  <td>Sem SESMT</td>
                  <td>{u.due}</td>
                  <td><span className={`status ${u.status === 'Pendente' ? 'pending' : ''}`}>{u.status}</span></td>
                  {canEdit && <td><button style={{ background: 'transparent', border: '1px solid var(--line)', borderRadius: '4px', padding: '4px 8px', fontSize: '10px' }}>Editar</button></td>}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>
    </>
  );

  const renderDocumentos = () => (
    <>
      <header className="topbar">
        <div>
          <h1>Documentos SST</h1>
        </div>
      </header>
      <section className="content">
        {documentos.length === 0 ? (
          <div className="empty">Nenhum documento selecionado no momento. Use a aba de Unidades para ver detalhes.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>CNPJ / Filial</th><th>Tipo</th><th>Ano</th><th>Lista de Entrega</th></tr></thead>
              <tbody>
                {documentos.map((d, i) => (
                  <tr key={i}>
                    <td><b>{d.filial}</b><small>{d.cnpj}</small></td>
                    <td>{d.tipo_documento}</td>
                    <td>{d.ano || '—'}</td>
                    <td>{d.lista_entrega || '—'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </>
  );

  const renderSesmt = () => (
    <>
      <header className="topbar">
        <div>
          <h1>SESMT Registrado (DGs)</h1>
        </div>
      </header>
      <section className="content">
        {sesmt.length === 0 ? (
          <div className="empty">Nenhum registro de SESMT ativo encontrado nesta regional.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Nome</th><th>CNPJ</th><th>PGR / Status</th></tr></thead>
              <tbody>
                {sesmt.map((s, i) => (
                  <tr key={i}>
                    <td><b>{s.nome_empresa}</b></td>
                    <td>{s.cnpj_dg}</td>
                    <td>{s.status_pgr || '—'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </>
  );

  const renderDesmobilizadas = () => (
    <>
      <header className="topbar">
        <div>
          <h1>Unidades Desmobilizadas</h1>
        </div>
      </header>
      <section className="content">
        {desmobilizadas.length === 0 ? (
          <div className="empty">Nenhuma unidade desmobilizada no histórico recente.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Filial / CNPJ</th><th>Local</th><th>Motivo</th><th>Data</th></tr></thead>
              <tbody>
                {desmobilizadas.map((d, i) => (
                  <tr key={i}>
                    <td><b>{d.filial}</b><small>{d.cnpj}</small></td>
                    <td>{d.cidade} - {d.uf}</td>
                    <td>{d.motivo_desmobilizacao || '—'}</td>
                    <td>{d.data_desmobilizacao ? new Date(d.data_desmobilizacao).toLocaleDateString() : '—'}</td>
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
      {/* Global Header */}
      <header className="global-header">
        <div className="header-left">
          <button className="menu-toggle" onClick={() => setSidebarOpen(!sidebarOpen)}>
            <Menu size={24} />
          </button>
          <div className="header-brand">
            <img src="/logo.png" alt="Vivo Docs" style={{ maxHeight: '35px', objectFit: 'contain' }} />
          </div>
        </div>
        
        <div className="header-right">
          <button onClick={handleLogout} className="logout-btn" title="Sair do sistema">
            <LogOut size={20} />
          </button>
        </div>
      </header>

      <div className="body-wrapper">
        <aside className={`sidebar ${sidebarOpen ? '' : 'closed'}`}>
          <div className="sidebar-content" style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
            
            <div className="label">MONITORAMENTO</div>
            <div className="nav">
              <button className={activeTab === 'dashboard' ? 'active' : ''} onClick={() => setActiveTab('dashboard')}>
                <LayoutDashboard size={18} /> <span>Visão geral</span>
              </button>
              <button className={activeTab === 'unidades' ? 'active' : ''} onClick={() => setActiveTab('unidades')}>
                <Building2 size={18} /> <span>Unidades monitoradas</span>
              </button>
              <button className={activeTab === 'documentos' ? 'active' : ''} onClick={() => setActiveTab('documentos')}>
                <Files size={18} /> <span>Documentos</span>
              </button>
              <button className={activeTab === 'sesmt' ? 'active' : ''} onClick={() => setActiveTab('sesmt')}>
                <ShieldPlus size={18} /> <span>SESMT registrado</span>
              </button>
              <button className={activeTab === 'desmobilizadas' ? 'active' : ''} onClick={() => setActiveTab('desmobilizadas')}>
                <ArchiveX size={18} /> <span>Desmobilizadas</span><em>0</em>
              </button>
              {canImportExport && (
                <button className={activeTab === 'admin' ? 'active' : ''} onClick={() => setActiveTab('admin')}>
                  <Users size={18} /> <span>Administrativo</span>
                </button>
              )}
            </div>
            
            <div className="spacer"></div>
            
            {/* User Profile moved back to bottom */}
            <div className="user-profile">
              <div className="user-profile-info">
                <b style={{ textTransform: 'capitalize', display: 'block', color: '#5b4e64', marginBottom: '4px' }}>{user.nome}</b>
                <small style={{ color: '#a8a0ad' }}>Nível: {user.role}</small>
              </div>
            </div>

          </div>
        </aside>

        <main className="main">
          {activeTab === 'dashboard' && renderDashboard()}
          {activeTab === 'unidades' && renderUnidades()}
          {activeTab === 'documentos' && renderDocumentos()}
          {activeTab === 'sesmt' && renderSesmt()}
          {activeTab === 'desmobilizadas' && renderDesmobilizadas()}
          {activeTab === 'admin' && (
            <>
              <header className="topbar">
                <div>
                  <h1>Administrativo</h1>
                </div>
                {adminSubTab === 'users' && (
                  <div className="actions">
                    <button className="btn primary" onClick={() => openUserForm()}>＋ Novo Usuário</button>
                  </div>
                )}
              </header>
              <section className="content">
                <div className="tabs-header">
                  <button className={`tab-link ${adminSubTab === 'users' ? 'active' : ''}`} onClick={() => setAdminSubTab('users')}>Usuários</button>
                  <button className={`tab-link ${adminSubTab === 'logs' ? 'active' : ''}`} onClick={() => setAdminSubTab('logs')}>Logs do Sistema</button>
                </div>
                
                {adminSubTab === 'users' && (
                  <div className="table-wrap">
                    <table className="table">
                      <thead><tr><th>Nome / E-mail</th><th>Nível de Acesso</th><th>Criado em</th><th>Ações</th></tr></thead>
                      <tbody>
                        {adminUsers.map(u => (
                          <tr key={u.id}>
                            <td><b>{u.nome}</b><small>{u.email}</small></td>
                            <td><span className="status">{u.nivel_acesso.toUpperCase()}</span></td>
                            <td>{new Date(u.created_at).toLocaleDateString()}</td>
                            <td>
                              <div style={{ display: 'flex', gap: '5px' }}>
                                <button className="btn" style={{ padding: '4px 8px', fontSize: '11px' }} onClick={() => openUserForm(u)}>Editar</button>

                                <button className="btn" style={{ padding: '4px 8px', fontSize: '11px' }} onClick={() => {
                                  openConfirm('Atenção', 'Deseja resetar a senha deste usuário para "nova@2026"?', () => {
                                    axios.post(`/api/auth/users/${u.id}/reset`).then(() => {
                                      openAlert('Sucesso', 'Senha resetada com sucesso!');
                                    });
                                  });
                                }}>Senha</button>

                                <button className="btn" style={{ padding: '4px 8px', fontSize: '11px', color: 'var(--red)', borderColor: '#ffd1d9' }} onClick={() => {
                                  openConfirm('Atenção', `Tem certeza que deseja excluir o usuário ${u.nome}? Esta ação não pode ser desfeita.`, () => {
                                    axios.delete(`/api/auth/users/${u.id}`).then(() => fetchAdminUsers());
                                  });
                                }}>Excluir</button>
                              </div>
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
                      <thead><tr><th>Data/Hora</th><th>Usuário</th><th>Ação</th><th>Detalhes</th></tr></thead>
                      <tbody>
                        {adminLogs.length === 0 ? <tr><td colSpan={4} className="empty">Nenhum log registrado.</td></tr> : adminLogs.map((l:any) => (
                          <tr key={l.id}>
                            <td>{new Date(l.created_at).toLocaleString()}</td>
                            <td>{l.usuario_email}</td>
                            <td><b>{l.acao}</b></td>
                            <td>{l.detalhes}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                )}
              </section>
            </>
          )}
        </main>
      </div>

      {modal.isOpen && (
        <div className="modal-overlay">
          <div className="modal-box">
            <h2>{modal.title}</h2>
            {modal.type === 'alert' && (
              <>
                <p>{modal.message}</p>
                <div className="modal-actions">
                  <button className="btn primary" onClick={closeModal}>OK</button>
                </div>
              </>
            )}
            {modal.type === 'confirm' && (
              <>
                <p>{modal.message}</p>
                <div className="modal-actions">
                  <button className="btn" onClick={closeModal}>Cancelar</button>
                  <button className="btn primary" style={modal.message.includes('excluir') ? {backgroundColor: 'var(--red)', borderColor: 'var(--red)'} : {}} onClick={() => { if(modal.onConfirm) modal.onConfirm(); closeModal(); }}>Confirmar</button>
                </div>
              </>
            )}
            {modal.type === 'userForm' && (
              <>
                <div className="modal-form-group">
                  <label>Nome</label>
                  <input value={modal.formData.nome} onChange={e => setModal({...modal, formData: {...modal.formData, nome: e.target.value}})} />
                </div>
                <div className="modal-form-group">
                  <label>E-mail</label>
                  <input value={modal.formData.email} onChange={e => setModal({...modal, formData: {...modal.formData, email: e.target.value}})} />
                </div>
                <div className="modal-form-group">
                  <label>Nível de Acesso</label>
                  <select value={modal.formData.nivel_acesso} onChange={e => setModal({...modal, formData: {...modal.formData, nivel_acesso: e.target.value}})}>
                    <option value="master">Master</option>
                    <option value="admin">Admin</option>
                    <option value="editor">Editor</option>
                    <option value="visualizador">Visualizador</option>
                  </select>
                </div>
                <div className="modal-actions">
                  <button className="btn" onClick={closeModal}>Cancelar</button>
                  <button className="btn primary" onClick={() => {
                    const u = modal.formData;
                    if(u.id) {
                      axios.put(`/api/auth/users/${u.id}`, u).then(() => { fetchAdminUsers(); openAlert('Sucesso', 'Usuário atualizado.'); });
                    } else {
                      axios.post('/api/auth/users', u).then(() => { fetchAdminUsers(); openAlert('Sucesso', 'Usuário criado com senha padrão "nova@2026".'); });
                    }
                  }}>Salvar</button>
                </div>
              </>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
