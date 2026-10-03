BEGIN;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0024-59', 'BA SEDE', 'Prédio', 'SALVADOR', 'BA', 'CABULA', 'RUA SILVEIRA MARTINS, 1036', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0024-59';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0024-59';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0024-59';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-62', 'SP MTZ ECOBERRI', 'Prédio', 'SÃO PAULO', 'SP', 'CIDADE MONCOES', 'AV. ENGENHEIRO LUIZ CARLOS BERRINI, 1376', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 15', 'Vigente', '2026-04-29', '2029-04-29'
FROM unidades WHERE cnpj = '02.558.157/0001-62';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0001-62';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0001-62';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0079-22', 'SP CHUCRI ZAIDA', 'Prédio', 'SÃO PAULO', 'SP', 'MORUMBI', 'RUA ROQUE PETRONI JUNIOR, 1464', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-16', '2028-07-16'
FROM unidades WHERE cnpj = '02.558.157/0079-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0079-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 17', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0079-22';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0827-03', 'SP CAMBUI', '', 'CAMPINAS', 'SP', 'JARDIM PLANALTO', 'AV DOUTOR JESUINO MARCONDES MACHADO, 1380', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0827-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0827-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0827-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0773-86', 'SP MQ S VICENTE', 'Prédio', 'SÃO PAULO', 'SP', 'VARZEA DA BARRA FUNDA', 'AVENIDA MARQUÊS DE SÃO VICENTE, 288', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-06-30', '2028-06-30'
FROM unidades WHERE cnpj = '02.558.157/0773-86';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0773-86';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0773-86';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0142-01', 'SP LJ ECOBERRIN', 'Loja', 'SÃO PAULO', 'SP', 'MORUMBI', 'AV. ENGENHEIRO LUIZ CARLOS BERRINI, 1376', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0096-23', 'SP CCC BAURU', 'Prédio', 'BAURU', 'SP', 'VILA GALVAO', 'RUA ANTONIO GOBETTE, 922', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0096-23';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0096-23';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0096-23';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0082-28', 'SP CAMPINAS ROS', 'Loja', 'CAMPINAS', 'SP', 'CENTRO', 'AV DR CAMPOS SALES, 992,994 E', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0082-28';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0082-28';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0082-28';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0724-06', 'SP RAFAEL SALLE', '', 'CAMPINAS', 'SP', 'BONFIM', 'RUA DOUTOR RAPHAEL SALLES, 583', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 30', 'Vigente', '2025-02-06', '2027-02-06'
FROM unidades WHERE cnpj = '02.558.157/0724-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0724-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0724-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0743-60', 'SP VILA MARIANA', 'Prédio', 'SÃO PAULO', 'SP', 'VILA MARIANA', 'RUA HUMBERTO I, 880', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-10', '2029-07-10'
FROM unidades WHERE cnpj = '02.558.157/0743-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0743-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0743-60';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0594-85', 'SP ARARAQUARA C', 'Prédio', 'ARARAQUARA', 'SP', 'CENTRO', 'AVENIDA CRISTOVÃO COLOMBO, 699', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0594-85';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0594-85';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0594-85';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0877-72', 'SP', 'Prédio', 'RIBEIRÃO PRETO', 'SP', 'CENTRO', 'RUA AMÉRICO BRASILIENSE, 400', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 28', 'Vigente', '2026-07-31', '2028-07-31'
FROM unidades WHERE cnpj = '02.558.157/0877-72';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0877-72';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0877-72';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0163-28', 'SP LJ RIBEIR SH', 'Loja', 'RIBEIRÃO PRETO', 'SP', 'JARDIM CALIFORNIA', 'AV CORONEL FERNANDO FERREIRA LEITE L 105 ALA NOVA, 1540', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0163-28';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0593-02', 'SP PIRACICABA A', 'Prédio', 'PIRACICABA', 'SP', 'ALTO', 'RUA SÃO JOÃO, 1913', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-17', '2028-07-17'
FROM unidades WHERE cnpj = '02.558.157/0593-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0593-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0593-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0694-48', 'PR CURITIBA REB', 'Prédio', 'CURITIBA', 'PR', 'REBOUÇAS', 'AVENIDA DARIO LOPES DOS SANTOS, 2197', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-06-30', '2029-06-30'
FROM unidades WHERE cnpj = '02.558.157/0694-48';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0694-48';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0694-48';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0626-05', 'PR LONDRINA N.', 'Prédio', 'LONDRINA', 'PR', 'N. SRA. LOURDES', 'AVENIDA PAUL HARRIS, 890', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0626-05';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0626-05';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0626-05';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0190-09', 'PR CCC PE GUSSO', 'Prédio', 'CURITIBA', 'PR', 'NOVO MUNDO', 'RUA PEDRO GUSSO, 711', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-03-31', '2027-03-31'
FROM unidades WHERE cnpj = '02.558.157/0190-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0190-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0190-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0695-29', 'PR CURITIBA PRA', 'Prédio', 'CURITIBA', 'PR', 'PRADO VELHO', 'RUA FRANCISCO NUNES, 1395', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-15', '2029-07-15'
FROM unidades WHERE cnpj = '02.558.157/0695-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0695-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0695-29';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0014-87', 'RJ SEDE', 'Prédio', 'RIO DE JANEIRO', 'RJ', 'BARRA DA TIJUCA', 'AV. AYRTON SENNA, 2200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0014-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0014-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0014-87';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0621-92', 'PR CASCAVEL PAR', 'Prédio', 'CASCAVEL', 'PR', 'PARQUE SÃO PAULO', 'RUA PADRE ANCHIETA, 293', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-20', '2027-08-20'
FROM unidades WHERE cnpj = '02.558.157/0621-92';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0621-92';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0621-92';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0430-58', 'SC CCC BLUMENAU', 'Prédio', 'BLUMENAU', 'SC', 'ITOUPAVA SECA', 'RUA IGUACU, 286', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-10', '2027-07-10'
FROM unidades WHERE cnpj = '02.558.157/0430-58';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0430-58';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0430-58';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0798-34', 'SP VOLUNT SP', 'Prédio', 'SÃO JOSÉ DO RIO PRETO', 'SP', 'CENTRO', 'R VOLUNTARIOS DE SAO PAULO, 3235', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0798-34';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0798-34';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0798-34';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0427-52', 'SC CCC SÃO JOSÉ', 'Prédio', 'SÃO JOSÉ', 'SC', 'BARREIROS', 'RUA ANTONIO FRANCISCO FECHADA, 16', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-10', '2027-07-10'
FROM unidades WHERE cnpj = '02.558.157/0427-52';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0427-52';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0427-52';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0606-53', 'RJ NOVA IGUAÇU', 'Prédio', 'NOVA IGUAÇU', 'RJ', 'CENTRO', 'RUA DR ATHAIDE PIMENTA DE MORAIS, 175', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0606-53';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0606-53';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0606-53';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0602-20', 'RJ NITERÓI SANT', 'Prédio', 'NITERÓI', 'RJ', 'SANTA ROSA', 'RUA NORONHA TORREZÃO, 170', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0602-20';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0602-20';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0602-20';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0600-68', 'RJ RIO DE JANEI', 'Prédio', 'RIO DE JANEIRO', 'RJ', 'VILA ISABEL', 'RUA JORGE RUDGE, 71', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-17', '2028-07-17'
FROM unidades WHERE cnpj = '02.558.157/0600-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0600-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0600-68';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0604-91', 'RJ CAMPOS DOS G', 'Prédio', 'CAMPOS DOS GOYTACAZES', 'RJ', 'CENTRO', 'RUA DOS GOYTACAZES, 168/170', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-09-30', '2027-09-30'
FROM unidades WHERE cnpj = '02.558.157/0604-91';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0604-91';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0604-91';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0258-23', '*RJ QUI RIO BAR', 'Loja', 'RIO DE JANEIRO', 'RJ', 'ENGENHO DE DENTRO', 'RUA MONSENHOR JERÔNIMO, 94', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0258-23';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0656-12', 'ES VITÓRIA MATA', 'Prédio', 'VITÓRIA', 'ES', 'MATA DA PRAIA', 'AVENIDA ADALBERTO SIMÃO NADER, 531', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-15', '2028-07-15'
FROM unidades WHERE cnpj = '02.558.157/0656-12';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0656-12';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0656-12';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0003-24', 'ES SEDE', 'Prédio', 'VITÓRIA', 'ES', 'PRAIA SANTA HELENA', 'AV NOSSA SENHORA DA PENHA, 275', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0003-24';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0003-24';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0003-24';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0025-30', 'SE SEDE', 'Prédio', 'ARACAJU', 'SE', 'CENTRO', 'AV BARÃO DE MARUIM, 304', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0025-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0025-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0025-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0538-78', 'SP CD MAUÁ', 'Prédio', 'MAUÁ', 'SP', 'SERTÃOZINHO', 'AV PAPA JOÃO XXIII, 2732', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-04-27', '2027-04-27'
FROM unidades WHERE cnpj = '02.558.157/0538-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0538-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0538-78';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0017-20', 'RS SEDE', 'Prédio', 'PORTO ALEGRE', 'RS', 'FARROUPILHA', 'AV. JOSÉ BONIFÁCIO, 245', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-14', '2029-07-14'
FROM unidades WHERE cnpj = '02.558.157/0017-20';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0017-20';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0017-20';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0002-43', 'DF SEDE', 'Prédio', 'BRASÍLIA', 'DF', 'ASA NORTE', 'SC/NORTE QD 04 BL B, 100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-10', '2028-07-10'
FROM unidades WHERE cnpj = '02.558.157/0002-43';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0002-43';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0002-43';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0008-39', 'PE SEDE', 'Prédio', 'RECIFE', 'PE', 'BOA VIAGEM', 'AV ENGENHEIRO DOMINGOS FERREIRA, 837', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0008-39';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0008-39';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0008-39';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0022-97', 'GO SEDE', 'Prédio', 'GOIÂNIA', 'GO', 'SETOR SUL', 'RUA 136C QD F44  ST SUL, 150', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0022-97';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0022-97';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0022-97';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0021-06', 'MS SEDE', 'Prédio', 'CAMPO GRANDE', 'MS', 'CENTRO', 'AV AFONSO PENA, 2386', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0021-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0021-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0021-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0004-05', 'MA SEDE', 'Prédio', 'SÃO LUÍS', 'MA', 'RENASCENCA', 'AV COLARES MOREIRA, 22', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0004-05';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0004-05';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0004-05';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0007-58', 'PI SEDE', 'Prédio', 'TERESINA', 'PI', 'CENTRO', 'AV. JOQUEI CLUBE, 299', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0007-58';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0007-58';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0007-58';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0011-34', 'CE NOVA SEDE FORTALEZA', 'Prédio', 'FORTALEZA', 'CE', 'MEIRELES', 'AV DESEMBARGADOR MOREIRA, 1300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0011-34';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0011-34';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0011-34';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0680-42', 'MS CAMPO GRANDE', 'Prédio', 'CAMPO GRANDE', 'MS', 'CENTRO', 'RUA MARECHAL RONDON, 1872', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-16', '2028-07-16'
FROM unidades WHERE cnpj = '02.558.157/0680-42';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0680-42';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0680-42';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0027-00', 'MT SEDE', 'Prédio', 'CUIABÁ', 'MT', 'BOSQUE', 'AV GETULIO VARGAS, 1300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0027-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0027-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0027-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0208-64', 'AM DOM PEDRO', 'Prédio', 'MANAUS', 'AM', 'DOM PEDRO', 'AV DOM PEDRO I, 149', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0208-64';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0208-64';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0208-64';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0530-10', 'PA LJ MARABÁ', 'Loja', 'MARABÁ', 'PA', 'CIDADE NOVA', 'AV FREI RAIMUNDO LAMBEZART LOTE 2237 QUADRA 21, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0530-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0530-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0530-10';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0015-68', 'RO SEDE', 'Prédio', 'PORTO VELHO', 'RO', 'SÃO CRISTOVÃO', 'GETULIO VARGAS, 1941', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-09-02', '2027-09-02'
FROM unidades WHERE cnpj = '02.558.157/0015-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0015-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0015-68';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0016-49', 'RR SEDE', 'Prédio', 'BOA VISTA', 'RR', 'SAO FRANCISCO', 'AVENIDA CAPITAO JULIO BEZERRA, 957', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0016-49';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0016-49';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0016-49';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0529-87', 'PA LJ SANTARÉM', 'Loja', 'SANTARÉM', 'PA', 'CENTRO', 'PRACA RODRIGUES DOS SANTOS LOJA 5 E 6, 95', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0529-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0529-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0529-87';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0567-02', 'RS CD PEDREIRA', 'Prédio', 'NOVA SANTA RITA', 'RS', 'PEDREIRA', 'R DA PEDREIRA, 74', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-10', '2027-07-10'
FROM unidades WHERE cnpj = '02.558.157/0567-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0567-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0567-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0051-21', 'SP LJ LITOR P S', 'Loja', 'PRAIA GRANDE', 'SP', 'TUDE BASTOS', 'AV AYRTON SENNA DA SILVA, 1511', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0023-78', 'AC SEDE', 'Prédio', 'RIO BRANCO', 'AC', 'CENTRO', 'TRAVESSA CAMPO DO RIO BRANCO, 450', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0023-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0023-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0023-78';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0255-80', 'RJ LJ CABO FRIO', 'Loja', 'CABO FRIO', 'RJ', 'CENTRO', 'PRACA PORTO ROCHA, 74', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0255-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0255-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0255-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0508-52', 'MA LJ IMPERATRI', 'Loja', 'IMPERATRIZ', 'MA', 'CENTRO', 'AV GETULIO VARGAS, 1462', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0508-52';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0508-52';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0508-52';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0009-10', 'MG SEDE', 'Prédio', 'BELO HORIZONTE', 'MG', 'FUNCIONARIOS', 'RUA LEVINDO LOPES, 258', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0009-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0009-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0009-10';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0558-11', 'BA LJ VIT CONQU', 'Loja', 'VITÓRIA DA CONQUISTA', 'BA', 'RECREIO', 'PRACA ORLANDO LEITE, 1', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0558-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0558-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0558-11';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0630-83', 'PE RECIFE IMBIR', 'Prédio', 'RECIFE', 'PE', 'IMBIRIBEIRA', 'RUA ARQUITETO LUIZ NUNES, 1271', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-17', '2028-07-17'
FROM unidades WHERE cnpj = '02.558.157/0630-83';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0630-83';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0454-25', 'DF CD DF01', 'Prédio', 'BRASÍLIA', 'DF', 'GUARA', 'SCIA QUADRA 14 CONJUNTO 3, LOTE 9', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-30', '2027-07-30'
FROM unidades WHERE cnpj = '02.558.157/0454-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0454-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0454-25';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0058-06', 'SP LJ S PAULIST', 'Loja', 'SÃO PAULO', 'SP', 'PARAISO', 'RUA TREZE DE MAIO, 1947', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0058-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0800-93', 'SP LJ MARILIA S', 'Loja', 'MARÍLIA', 'SP', 'JARDIM MARIA MARTHA', 'RUA DOS TUCUNARES, 500', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0287-68', 'PE ATELECOM', 'Prédio', 'RECIFE', 'PE', 'ILHA DO RETIRO', 'RUA SENADOR FABIO DE BARROS, 250', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 21', 'Vigente', '2025-12-16', '2027-12-16'
FROM unidades WHERE cnpj = '02.558.157/0287-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0287-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 21', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0287-68';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0432-10', 'SC LJ TUBARÃO', 'Loja', 'TUBARÃO', 'SC', 'CENTRO', 'RUA LAURO MULLER, 25 A', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0199-39', 'PR LJ S BARIGU', 'Loja', 'CURITIBA', 'PR', 'MOSSUNGUE', 'R PROF PEDRO VIRIATO PARIGOT DE SOUZA, 600', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0199-39';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0326-09', 'RS LJPASSOFUNDO', 'Loja', 'PASSO FUNDO', 'RS', 'CENTRO', 'RUA MAROM, 1459', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0335-08', 'RS LJ CXDO SUL', 'Loja', 'CAXIAS DO SUL', 'RS', 'CENTRO', 'AV JULIO DE CASTILHO, 2069', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0911-09', 'CE LOJA NORTH SHOPPING II', 'Loja', 'FORTALEZA', 'CE', 'PRESIDENTE KENNEDY', 'AV BEZERRA DE MENEZES, 2450', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0911-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0350-39', 'RS LJ IGUATEMI', 'Loja', 'PORTO ALEGRE', 'RS', 'BOA VISTA', 'RUA JOAO WALLIG, 1800', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0350-39';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0396-11', 'RS LJ S CXS SUL', 'Loja', 'CAXIAS DO SUL', 'RS', 'DISTRITO INDUSTRIAL', 'EST RSC 453  KM 3 5, 2780', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0396-11';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0395-30', 'RS LJ SCRUZ SUL', 'Loja', 'SANTA CRUZ DO SUL', 'RS', 'CENTRO', 'RUA BORGES DE MEDEIROS, 534', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0141-12', 'SP LJ S LT ARIC', 'Loja', 'SÃO PAULO', 'SP', 'STA TEREZINHA', 'AV ARICANDUVA, 555', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-06-30', '2029-06-30'
FROM unidades WHERE cnpj = '02.558.157/0141-12';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0091-19', 'SP LJ JUND MA S', 'Loja', 'JUNDIAÍ', 'SP', 'CENTRO', 'AV ANTONIO FREDERICO OZANAN LOJA 1216, 6000', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0091-19';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0091-19';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0091-19';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0052-02', 'SP LJ ESPLANADA', 'Loja', 'VOTORANTIM', 'SP', 'PARQUE MORUMBI', 'AV GISELE CONSTANTINO L 132 E 133, 1870', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0583-22', 'SP SOROCABA BOA', 'Prédio', 'SOROCABA', 'SP', 'BOA VISTA', 'R. PROF. DIRCEU FERREIRA DA SILVA, 56', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-17', '2029-07-17'
FROM unidades WHERE cnpj = '02.558.157/0583-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0583-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0583-22';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0102-06', 'SP LJ OURINHOS', 'Loja', 'OURINHOS', 'SP', 'CENTRO', 'RUA PARANA, 392', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0075-07', 'SP LJ S C NORTE', 'Loja', 'SÃO PAULO', 'SP', 'VILA GUILHERME', 'TRAV CASALBUONO, 120', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0075-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0094-61', 'SP LJ SH PENHA', 'Loja', 'SÃO PAULO', 'SP', 'PENHA', 'RUA DR JOAO RIBEIRO, 304', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0094-61';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0124-11', 'SP LJ MULTISHOP', 'Loja', 'ARAÇATUBA', 'SP', 'CENTRO', 'RUA MARECHAL DEODORO DA FONSECA LOJAS 04 E 06, 246', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0124-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0124-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0124-11';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0766-57', 'SP SANTOS', 'Prédio', 'SANTOS', 'SP', 'VILA MATHIAS', 'AV WASHINGTON LUIS, 223', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-15', '2028-07-15'
FROM unidades WHERE cnpj = '02.558.157/0766-57';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0766-57';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0766-57';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0108-00', 'SP LJ S MIRAMAR', 'Loja', 'SANTOS', 'SP', 'GONZAGA', 'RUA EUCLIDES DA CUNHA LOJA 78, 5', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0108-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0087-32', 'SP LJ MOGI S CE', 'Loja', 'MOGI DAS CRUZES', 'SP', 'CENTRO CIVICO', 'AV VEREADOR NARCISO YAGUE GUIMARAES, 1001', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0087-32';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0087-32';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0087-32';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0095-42', 'SP LJ IGUA ALPH', 'Loja', 'BARUERI', 'SP', 'CENTRO', 'ALAMEDA RIO NEGRO, 111', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0095-42';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0523-91', 'SP_LJ BERRINI', 'Loja', 'SÃO PEDRO', 'SP', 'CIDADE MONÇÕES', 'AV LUIS CARLOS BERRINI, 1376', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0523-91';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0150-03', 'SP LJ S INTERNA', 'Loja', 'GUARULHOS', 'SP', 'VARZEA DO PALACIO', 'ROD PRES DUTRA KM 397, 650', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0150-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0338-42', 'SP LJ SH PR MAR', 'Loja', 'SANTOS', 'SP', 'APARECIDA', 'RUA ALEXANDRE MARTINS  B APARECIDA  2 PISO L285, 80', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0338-42';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0153-56', 'SP LJ BO S POMP', 'Loja', 'SÃO PAULO', 'SP', 'PERDIZES', 'RUA TURIASSU, 2100', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-06-30', '2029-06-30'
FROM unidades WHERE cnpj = '02.558.157/0153-56';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0076-80', 'SP LJ OSASCO', 'Loja', 'OSASCO', 'SP', 'CENTRO', 'RUA TENENTE AVELAR PIRES DE AZEVEDO, 81', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0145-46', 'SP LJ S HIGIENO', 'Loja', 'SÃO PAULO', 'SP', 'CONSOLACAO', 'AV HIGIENOPOLIS LJ 340 E 341 PISO HIGIENOPOLIS, 674', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0145-46';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0037-73', 'SP LJ S ELDORA', 'Loja', 'SÃO PAULO', 'SP', 'PINHEIROS', 'AV REBOUCAS, 3970', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0037-73';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0085-70', 'SP LJ S IG CAMP', 'Loja', 'CAMPINAS', 'SP', 'VILA BRANDINA', 'AV IGUATEMI, 777', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0072-56', 'SP LJ ABC PLA S', 'Loja', 'SANTO ANDRÉ', 'SP', 'JARDIM', 'AV INDUSTRIAL, 600', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0072-56';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0069-50', 'SP LJ S MORUMBI', 'Loja', 'SÃO PAULO', 'SP', 'JARDIM DAS ACACIAS', 'AV ROQUE PETRONI JR, 1089', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0069-50';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0636-79', 'SP BAURU VILA C', 'Prédio', 'BAURU', 'SP', 'VILA CARDIA', 'AVENIDA DUQUE DE CAXIAS, 24-34', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0636-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0636-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0636-79';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0118-73', 'SP LJ ARARAQUAR', 'Loja', 'ARARAQUARA', 'SP', 'CENTRO', 'RUA SAO BENTO, 743', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0118-73';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0110-16', 'SP LJ S BRISAM', 'Loja', 'SÃO VICENTE', 'SP', 'CENTRO', 'RUA FREI GASPAR LJ 423 E 424, 365', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0044-00', 'SP LJ IGUATE JK', 'Loja', 'SÃO PAULO', 'SP', 'VILA NOVA CONCEIÇÃO', 'AV PRESIDENTE KUBITSCHEK, 2041', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0044-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0512-39', 'SP LJ PSCAETANO', 'Loja', 'SÃO CAETANO DO SUL', 'SP', 'CERÂMICA', 'ALAMEDA TERRACOTA, 545', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0048-26', 'SP LJ SMST CRUZ', 'Loja', 'SÃO PAULO', 'SP', 'VILA MARIANA', 'RUA DOMINGOS DE MORAES, 2564', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0048-26';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0050-40', 'SP LJ S IGUA SP', 'Loja', 'SÃO PAULO', 'SP', 'JARDIM PAULISTANO', 'AV BRIG FARIA LIMA LJ C 24  5  6, 2232', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0050-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0174-80', 'SP LJ SANTOS', 'Loja', 'SANTOS', 'SP', 'CENTRO', 'PRACA DA INDEPENDENCIA, 13L F', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0174-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0114-40', 'SP LJ CENT SH', 'Loja', 'SÃO JOSÉ DOS CAMPOS', 'SP', 'JD OSWALDO CRUZ', 'AV DEPUTADO BENEDITO MATARAZZO LOJAS 307 E 308, 9403', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0070-94', 'SP LJ S METROPO', 'Loja', 'SÃO BERNARDO DO CAMPO', 'SP', 'JARDIM DO MAR', 'PRACA SAMUEL SABATINI, 200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0062-84', 'SP LJ SPD PEDRO', 'Loja', 'CAMPINAS', 'SP', 'PARQUE DOM PEDRO', 'AV PROJETADA LESTE, 500', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0062-84';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/1509-97', 'LOJA OSCAR FREIRE SP', 'Loja', 'SÃO PAULO', 'SP', '0', 'RUA OSCAR FREIRE, 849', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0924-23', 'LJ VIVO ATIBAIA', 'Loja', 'ATIBAIA', 'SP', 'CENTRO', 'RUA JOSE LUCAS, 66', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0046-64', 'SP LJ S V OLIMP', 'Loja', 'SÃO PAULO', 'SP', 'VILA OLIMPIA', 'RUA OLIMPIADAS, 360', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0046-64';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0521-20', 'SP LJ SHP UNIÃO', 'Loja', 'OSASCO', 'SP', 'VILA YARA', 'AV. DOS AUTONOMISTAS, 1400', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0036-92', 'SP LJ S V LOBOS', 'Loja', 'SÃO PAULO', 'SP', 'JURUBATUBA', 'AVENIDA NACOES UNIDAS PISO TERREO LOJA 106, 4777', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0036-92';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0616-25', 'PR MARINGÁ ZONA', 'Prédio', 'MARINGÁ', 'PR', 'ZONA 01', 'AVENIDA JOÃO PAULINO VIEIRA FI, 752', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-17', '2028-07-17'
FROM unidades WHERE cnpj = '02.558.157/0616-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0616-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0616-25';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0894-73', 'SP_CASA VIVO', 'Loja', 'SÃO PAULO', 'SP', 'PINHEIROS', 'RUA JOAQUIM ANTUNES, 162', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 08', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0894-73';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0894-73';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0061-01', 'SP LJ SCG CAMP', 'Loja', 'CAMPINAS', 'SP', 'JD DAS PALMEIRAS', 'ROD D PEDRO I, S/N.', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0061-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0120-98', 'SP LJ SJR PRETO', 'Loja', 'SÃO JOSÉ DO RIO PRETO', 'SP', 'CENTRO', 'RUA BERNARDINO DE CAMPOS, 3085', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0976-54', 'LOJA SHOPPING JOCKEY PLAZA PR', 'Loja', 'CURITIBA', 'PR', 'TARUMA', 'AV VICTOR FERREIRA DO AMARAL, 2633', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0411-95', 'DF LOJA SH JK', 'Loja', 'BRASÍLIA', 'DF', 'GUARA I', 'QE 11 AREA ESPEC L LOJAS 9 A 12, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0261-29', 'MT LOJA SINOP', 'Loja', 'SINOP', 'MT', 'SETOR CENTRAL', 'RUA GOV JULIO JOSE DE CAMPOS, 1213', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0261-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0261-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0261-29';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0559-00', 'PA LJ DOCA', 'Loja', 'BELÉM', 'PA', 'PARQUE VERDE', 'ROD DOS TRABALHADORES, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0449-68', 'DF LJ PÁTIO BRA', 'Loja', 'BRASÍLIA', 'DF', 'ASA SUL', 'SCS QUADRA 07 BLOCO A LOJA 3P 3º PAVIMENTO PARTE LOJA P315, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0265-52', 'MT LJ S TRÊ AMÉ', 'Loja', 'CUIABÁ', 'MT', 'JARDIM DAS AMERICAS', 'AV BRASILIA SALA 220 A SHOP TRES AMERICAS, 146', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0413-57', 'DF LOJA GAMA', 'Loja', 'BRASÍLIA', 'DF', 'SETOR CENTRAL GAMA', 'GAMA SHOPPING EQ 55 E 56 AREA ESPECIAL N 1, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 28', 'Vigente', '2026-04-30', '2028-04-30'
FROM unidades WHERE cnpj = '02.558.157/0413-57';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2026', 'LISTA 28', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0413-57';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0417-80', 'DF LJ CONJ NACI', 'Loja', 'BRASÍLIA', 'DF', 'ASA NORTE', 'SETOR DE DIVERSOES NORTE CONJUNTO A, T75', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0531-00', 'PA LJ REDENÇÃO', 'Loja', 'REDENÇÃO', 'PA', 'JARDIM CARAMURU', 'AV BRASIL LOJA A, 2792', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0207-83', 'AM LJ MARC DIAS', 'Loja', 'MANAUS', 'AM', 'CENTRO', 'RUA MARCILIO DIAS, 171 B', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0544-16', 'BA LJ SCL BARRI', 'Loja', 'SALVADOR', 'BA', 'BARRIS', 'RUA PORTAO DA PIEDADE, 155', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0544-16';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0502-67', 'RJ LJ RIO SUL', 'Loja', 'RIO DE JANEIRO', 'RJ', 'BOTAFOGO', 'AV LAURO MULLER  3 PISO, 116', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0941-24', 'LOJA SHOPPING GRANDE RIO RJ', 'Loja', 'SÃO JOÃO DE MERITI', 'RJ', 'VENDA VELHA', 'R MARIA SOARES SENDAS, 111', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0235-37', 'RJ LJ LEBLON', 'Loja', 'RIO DE JANEIRO', 'RJ', 'LEBLON', 'AVENIDA AFRANIO DE MELO FRANCO, 290', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0169-13', 'ES LJ COLATINA', 'Loja', 'COLATINA', 'ES', 'CENTRO', 'AV GETULIO VARGAS, 245', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0169-13';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0169-13';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0169-13';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/2194-31', 'LJ_NITERÓI PLAZA II RJ', 'Loja', 'NITERÓI', 'RJ', 'CENTRO', 'RUA QUINZE DE NOVEMBRO, 8', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0931-52', 'ES_LOJA PRAIA DO CANTO ES', 'Loja', 'VITÓRIA', 'ES', 'SANTA HELENA', 'AVENIDA DESEMBARGADOR SANTOS NEVES, 200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0552-26', 'BA LJ PT SEGURO', 'Loja', 'PORTO SEGURO', 'BA', 'CENTRO', 'AV GETULIO VARGAS, 348 A', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0552-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0552-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0552-26';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0554-98', 'BA LJ BARREIRAS', 'Loja', 'BARREIRAS', 'BA', 'VILA RICA', 'RODOVIA BR 020  KM 0, 31', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0394-50', 'RJ LJ CENTRO', 'Loja', 'RIO DE JANEIRO', 'RJ', 'CENTRO', 'AV RIO BRANCO, 156', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0247-70', 'RJ LJ V REDONDA', 'Loja', 'VOLTA REDONDA', 'RJ', 'VILA SANTA CECILIA', 'RUA DOZE, 300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0247-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0247-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0247-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0167-51', 'ES LJ CACHOEIRO', 'Loja', 'CACHOEIRO DE ITAPEMIRIM', 'ES', 'CENTRO', 'RUA VINTE E CINCO DE MARCO, 33', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0167-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0167-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0167-51';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0252-38', 'RJ LJ PELINCA', 'Loja', 'CAMPOS DOS GOYTACAZES', 'RJ', 'CENTRO', 'AV PELINCA LJ 36 E 37, 116', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0925-04', 'ES_LOJA SHOPPING MESTRE ALVARO ES', 'Loja', 'SERRA', 'ES', 'EURICO SALLES', 'AVENIDA JOAO PALACIO, 300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0414-38', 'DF LJ LAGO SUL', 'Loja', 'BRASÍLIA', 'DF', 'LAGO SUL', 'SHIS QI 05 BL H LOJAS 5 E 6, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0505-00', 'MA LJ S SÃ LUÍS', 'Loja', 'SÃO LUÍS', 'MA', 'JARACATI', 'AV PROF CARLOS CUNHA LJ 241A E B, 1000', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0557-30', 'BA LJ S SAL CAB', 'Loja', 'SALVADOR', 'BA', 'CAMINHO DAS ARVORES', 'AV TANCREDO NEVES, 2915', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 17', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0557-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0930-71', 'ES_LOJA LARANJEIRAS II ES', 'Loja', 'SERRA', 'ES', 'PARQUE RESIDENCIAL LARANJEIRAS', 'AVENIDA CENTRAL, 765', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0269-86', 'CE CD FORTALEZA', 'Prédio', 'FORTALEZA', 'CE', 'PEDRAS', 'RODOVIA CONTORNO CEASA, 1500', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-17', '2028-07-17'
FROM unidades WHERE cnpj = '02.558.157/0269-86';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0611-10', 'GO RIO VERDE VI', 'Prédio', 'RIO VERDE', 'GO', 'VILA MARIA', 'AVENIDA PRESIDENTE VARGAS, 3200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0611-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0611-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0611-10';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0133-02', 'MS LJ DOURADOS', 'Loja', 'DOURADOS', 'MS', 'JARDIM AMERICA', 'RUA FIRMINO VIEIRA DE MATOS, 610', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0286-87', 'ES LJ S P COSTA', 'Loja', 'VILA VELHA', 'ES', 'PRAIA DA COSTA', 'AV DOUTOR OLIVIO LIRA, 353', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0479-83', 'MG LJ 7 LAGOAS', 'Loja', 'SETE LAGOAS', 'MG', 'CENTRO', 'RUA LASSANCE CUNHA, 4', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0479-83';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0479-83';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0479-83';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0026-10', 'PB SEDE', 'Prédio', 'JOÃO PESSOA', 'PB', 'DOS ESTADOS', 'AV EPITACIO PESSOA, 475', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-14', '2028-07-14'
FROM unidades WHERE cnpj = '02.558.157/0026-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0026-10';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0026-10';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0266-33', 'CE LJ S CE IGUA', 'Loja', 'FORTALEZA', 'CE', 'EDSON QUEIROZ', 'AV WASHINGTON SOARES, 85', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 07', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0266-33';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 7', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0266-33';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0717-79', 'PI LJ F SERAFIM', 'Loja', 'TERESINA', 'PI', 'NOIVOS', 'AV. RAUL LOPES, 1000', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0570-08', 'SP LJ S RIB IGU', 'Loja', 'RIBEIRÃO PRETO', 'SP', 'VILA DO GOLF', 'AV LUIZ EDUARDO TOLEDO PRADO, 900', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0570-08';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0049-07', 'SP LJ S MT TATU', 'Loja', 'SÃO PAULO', 'SP', 'TATUAPE', 'RUA DR MELO FREIRE LOJA 14T, S/N.', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0049-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0236-18', 'RJ LJ BARRA I', 'Loja', 'RIO DE JANEIRO', 'RJ', 'BARRA DA TIJUCA', 'AV DAS AMÉRICAS, NIVEL LOJA, 4666', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0415-19', 'DF LJ TAGUATI S', 'Loja', 'BRASÍLIA', 'DF', 'TAGUATINGA', 'QS 01 RUA 210 LOTE 40 LOJAS 2001E2002, 2001', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0493-31', 'MG LJ PATOS MG', 'Loja', 'PATOS DE MINAS', 'MG', 'CENTRO', 'RUA MAJOR GOTE, 702', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0493-31';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0493-31';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0493-31';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0902-18', 'SP_LJ_JUNDIAI SHOPPING', 'Loja', 'JUNDIAÍ', 'SP', 'ANHANGABAU', 'AV NOVE DE JULHO, 3333', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 08', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0902-18';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0902-18';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0480-17', 'MG LJ JUIZ FORA', 'Loja', 'JUIZ DE FORA', 'MG', 'CENTRO', 'RUA HALFELD, 816', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0638-30', 'CE FZ CENTRO', 'Prédio', 'FORTALEZA', 'CE', 'CENTRO', 'RUA JAIME BENEVOLO, 212', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-15', '2028-07-15'
FROM unidades WHERE cnpj = '02.558.157/0638-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0638-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0638-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0126-83', 'MS LOJA SEDE', 'Loja', 'CAMPO GRANDE', 'MS', 'CENTRO', 'AV AFONSO PENA ED DOLOR DE ANDRADE, 2386', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0487-93', 'MG LJ PASSOS', 'Loja', 'PASSOS', 'MG', 'CENTRO', 'RUA CORONEL NECA MEDEIROS, 5', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0285-04', 'ES LJ GUARAPARI', 'Loja', 'GUARAPARI', 'ES', 'CENTRO', 'AV DR ROBERTO CALMON, 142', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0285-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0285-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0285-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0140-31', 'SP LJ CJTO NACI', 'Loja', 'SÃO PAULO', 'SP', 'CONSOLACAO', 'RUA AUGUSTA LOJA 110, 1781', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0140-31';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0996-06', 'MG_LOJA PARA DE MINAS II MG', 'Loja', 'PARÁ DE MINAS', 'MG', 'CENTRO', 'R BENEDITO VALADARES, 104', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0943-96', 'LOJA ITABORAI RJ', 'Loja', 'ITABORAÍ', 'RJ', 'CENTRO', 'AV 22 DE MAIO, 5632', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0781-96', 'GO LJ GO SHOPPING', 'Loja', 'APARECIDA DE GOIANIA', 'GO', 'SETOR BUENO', 'AV T 10 1300, 1300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0107-10', 'SP LJ S GUAR LP', 'Loja', 'GUARUJÁ', 'SP', 'CENTRO', 'AV MARECHAL D FONSECA LJ 210 E 211, 885', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0484-40', 'MG CCC VARGINHA', 'Prédio', 'VARGINHA', 'MG', 'BOM PASTOR', 'RUA PRESIDENTE TANCREDO NEVES, 6', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0484-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0484-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0484-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0714-26', 'SC CRICIUMA CEN', 'Prédio', 'CRICIÚMA', 'SC', 'CENTRO', 'RUA JORGE DA CUNHA CARNEIRO, 603', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0714-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0714-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0714-26';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0033-40', 'SP LJ S JAR SUL', 'Loja', 'SÃO PAULO', 'SP', 'MORUMBI', 'AV GIOVANNI GRONCHI, 5819', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0033-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0473-98', 'MG LJ GOV VALAD', 'Loja', 'GOVERNADOR VALADARES', 'MG', 'CENTRO', 'AV MINAS GERAIS, 508', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0950-15', 'LOJA SSA NORTE SHOP BA', 'Loja', 'SALVADOR', 'BA', 'SÃO CRISTOVÃO', 'RODOVIA BA - 526, 0305', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0068-70', 'SP LJ S IBIRAPU', 'Loja', 'SÃO PAULO', 'SP', 'MOEMA', 'AV IBIRAPUERA LJ 139 E 140, 3103', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0068-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0042-30', 'SP LJ S MKT PLA', 'Loja', 'SÃO PAULO', 'SP', 'VILA CORDEIRO', 'AV DOUTOR CHUCRI ZAIDAN, 902', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0042-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0490-99', 'MG LJ UBERLANDI', 'Loja', 'UBERLÂNDIA', 'MG', 'CENTRO', 'AV AFONSO PENA, 719', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0225-65', 'RJ LJ SH TIJUCA', 'Loja', 'RIO DE JANEIRO', 'RJ', 'TIJUCA', 'AV MARACANA, 987', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0373-25', 'RS LJ STA MARIA', 'Loja', 'SANTA MARIA', 'RS', 'CENTRO', 'RUA DR BOZANO, 1110', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0971-40', 'LOJA SHOPPING BANGU RJ', 'Loja', 'RIO DE JANEIRO', 'RJ', 'BANGU', 'R FONSECA, 240', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0740-18', 'PA LJ S BOULEVA', 'Loja', 'BELÉM', 'PA', 'REDUTO', 'AV VISCONDE DE SOUZA FRANCO, 776', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0507-71', 'MA LJ RENASCENÇ', 'Loja', 'SÃO LUÍS', 'MA', 'RENASCENCA', 'AV COLARES MOREIRA QD 50, 22', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0304-01', 'GO LJ MARISTA', 'Loja', 'GOIÂNIA', 'GO', 'SETOR SUL', 'AV 136, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0801-74', 'MG LJ ITAU PW S', 'Loja', 'CONTAGEM', 'MG', 'CIDADE INDUSTRIAL', 'AV GENERAL DAVID SARNOFF, 5160', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0762-23', 'SP LJ PQ S PRUD', 'Loja', 'PRESIDENTE PRUDENTE', 'SP', 'VILA ROBERTO', 'R SIQUEIRA CAMPOS, 1545', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0762-23';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0762-23';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0762-23';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0276-05', 'MT LJ RONDONÓPO', 'Loja', 'RONDONÓPOLIS', 'MT', 'SAGRADA FAMILIA', 'AV GOV JULIO JOSE DE CAMPOS SL 602 SHOP PLAZA RONDON, 325', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0722-36', 'BA LJ SHO BARRA', 'Loja', 'SALVADOR', 'BA', 'BARRA', 'AV CENTENARIO, 2992', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0722-36';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0462-35', 'MG LJ CENTRO', 'Loja', 'BELO HORIZONTE', 'MG', 'CENTRO', 'AV AFONSO PENA, 785', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0289-20', 'PE LJ SH RECIFE', 'Loja', 'RECIFE', 'PE', 'BOA VIAGEM', 'RUA PADRE CARAPUCEIRO, 777', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0420-86', 'SC LJ S MUELLE', 'Loja', 'JOINVILLE', 'SC', 'CENTRO', 'RUA VISCONDE DE TAUNAY LJ09, 235', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0420-86';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 4', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0420-86';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0233-75', 'RJ LJ ILH PLAZA', 'Loja', 'RIO DE JANEIRO', 'RJ', 'ILHA DO GOVERNADOR', 'AV MAESTRO PAULO E SILVA, 400', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0912-90', 'CE_LOJA SHOPPING PARANGABA', 'Loja', 'FORTALEZA', 'CE', 'PARANGABA', 'RUA GERMANO FRANCK, 300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0912-90';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0337-61', 'SP LJ MARÍLIA', 'Loja', 'MARÍLIA', 'SP', 'CENTRO', 'AV NOVE DE JULHO, 1283', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0337-61';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0337-61';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0337-61';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0710-00', 'SC JOINVILLE SA', 'Prédio', 'JOINVILLE', 'SC', 'SANTO ANTONIO', 'RUA DOUTOR GERKES DE SELLOS ROCHA, 238', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0710-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0710-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0710-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0683-95', 'SC CHAPECO CENT', 'Prédio', 'CHAPECÓ', 'SC', 'CENTRO', 'AVENIDA NEREU RAMOS - E, 1491', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0683-95';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0683-95';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0683-95';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0965-00', 'LOJA SALVADOR SHOPPING 2 BA', 'Loja', 'SALVADOR', 'BA', 'CAMINHO DAS ARVORES', 'AVENIDA TANCREDO NEVES, 03133', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0760-61', 'RJ ATERRADO', 'Prédio', 'VOLTA REDONDA', 'RJ', 'ATERRADO', 'AVENIDA PAULO DE FRONTIN, 312', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-07-24', '2027-07-24'
FROM unidades WHERE cnpj = '02.558.157/0760-61';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0760-61';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0760-61';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0188-86', 'PR LJ SJPINHAIS', 'Loja', 'SÃO JOSÉ DOS PINHAIS', 'PR', 'CENTRO', 'RUA XV DE NOVEMBRO, 1699', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0178-04', 'PR LJ MAR BRA C', 'Loja', 'MARINGÁ', 'PR', 'CENTRO', 'AV BRASIL, 3207', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0772-03', 'SE LJ SH RIOMAR', 'Loja', 'ARACAJU', 'SE', 'COROA DO MEIO', 'AVENIDA DELMIRO GOUVEIA, 400', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0273-62', 'PR LJ CASCAVEL', 'Loja', 'CASCAVEL', 'PR', 'CENTRO', 'AV BRASIL, 5877', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0047-45', 'SP LJ S PLA SUL', 'Loja', 'SÃO PAULO', 'SP', 'SAUDE', 'AV PROF ABRAO DE MORAES LJ 188 E 189, 1711', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0047-45';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0054-74', 'SP LJ SA FRANCO', 'Loja', 'SÃO PAULO', 'SP', 'TATUAPE', 'AV REGENTE FEIJO  PS TULIPA LJ15, 1739', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0054-74';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0080-66', 'SP LJ S INTERLA', 'Loja', 'SÃO PAULO', 'SP', 'INTERLAGOS', 'AV INTERLAGOS, 2225', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0080-66';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0358-96', 'RS LJ ANDRADAS', 'Loja', 'PORTO ALEGRE', 'RS', 'CENTRO', 'RUA DOS ANDRADAS, 1599', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0650-27', 'RS PELOTAS CENT', 'Prédio', 'PELOTAS', 'RS', 'CENTRO', 'RUA XV DE NOVEMBRO, 657', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0650-27';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0650-27';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0650-27';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0524-72', 'PB LJ CAMP GDE', 'Loja', 'CAMPINA GRANDE', 'PB', 'CATOLE', 'AV PREFEITO SEVERINO BEZERRA CABRAL, 1050', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0182-90', 'PR LJ BOUL LON', 'Loja', 'LONDRINA', 'PR', 'HELENA', 'AV THEODORO VICTORELLI, 150', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0433-09', 'SC LJ ITAJAÍ', 'Loja', 'ITAJAÍ', 'SC', 'CENTRO', 'AV MARCOS KONDER, 2', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-06-30', '2029-06-30'
FROM unidades WHERE cnpj = '02.558.157/0433-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 4', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0433-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0649-93', 'RS PASSO FUNDO', 'Prédio', 'PASSO FUNDO', 'RS', 'VILA RODRIGUES', 'RUA JOÃO DE CESARO, 276', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0649-93';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0649-93';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0649-93';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0183-71', 'PR LJ LON CALÇA', 'Loja', 'LONDRINA', 'PR', 'CENTRO', 'AV PARANA, 203', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0913-70', 'PE_LOJA SHOPPING PLAZA', 'Loja', 'RECIFE', 'PE', 'PARNAMIRIM', 'RUA DOUTOR JOÃO SANTOS FILHO, 255', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0913-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0522-00', 'MA LJ COHAMA', 'Loja', 'SÃO LUÍS', 'MA', 'COHAMA', 'AVENIDA DANIEL DE LA TOUCHE, 987', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0192-62', 'PR LJ S MUELLER', 'Loja', 'CURITIBA', 'PR', 'CENTRO', 'AV CANDIDO DE ABREU, 127', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0192-62';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0078-41', 'SP LJ S CID JAR', 'Loja', 'SÃO PAULO', 'SP', 'BUTANTA', 'RUA MAGALHAES DE CASTRO, 12000', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0078-41';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0170-57', 'ES LJ N VENÉCIA', 'Loja', 'NOVA VENÉCIA', 'ES', 'CENTRO', 'AV VITORIA, 198', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0486-02', 'MG LJ POÇ CALDA', 'Loja', 'POÇOS DE CALDAS', 'MG', 'CENTRO', 'RUA ASSIS FIGUEIREDO, 1003', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0486-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0486-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0486-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0670-70', 'RN NATAL TIROL', 'Prédio', 'NATAL', 'RN', 'TIROL', 'AVENIDA HERMES DA FONSECA, 842', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0670-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0670-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0670-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0813-08', 'LOJA AMAZONAS SHOPPING II AM', 'Loja', 'MANAUS', 'AM', 'PARQUE 10 DE NOVEMBRO', 'AV DJALMA BATISTA, 482', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0483-60', 'MG LJ VARGINHA', 'Loja', 'VARGINHA', 'MG', 'CENTRO', 'AV RIO BRANCO, 280', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0097-04', 'SP PA D CAX BAU', '', 'BAURU', 'SP', 'VILA CARDIA', 'AV DUQUE DE CAXIAS, 11 E 70', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0097-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0097-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0097-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0055-55', 'SP LJ S ITAQUER', 'Loja', 'SÃO PAULO', 'SP', 'VILA CAMPANELA', 'AVENIDA JOSE PINHEIRO BORGES, S/N', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0055-55';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0379-10', 'SE LJ JARDINS', 'Loja', 'ARACAJU', 'SE', 'JARDINS', 'AV MINISTRO GERALDO BARRETO SOBRAL, 215', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0921-80', 'MG_LOJAS UBA', 'Loja', 'UBÁ', 'MG', 'CENTRO', 'RUA CARLOS PEIXOTO FILHO,, 122', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0921-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0191-81', 'PR LJ S PA CURI', 'Loja', 'CURITIBA', 'PR', 'PORTAO', 'AV PRESIDENTE KENNEDY, 4121', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0191-81';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0642-17', 'SC SÃO JOSÉ BAR', 'Prédio', 'SÃO JOSÉ', 'SC', 'BARREIROS', 'AVENIDA LEOBERTO LEAL, 975', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-15', '2029-07-15'
FROM unidades WHERE cnpj = '02.558.157/0642-17';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0642-17';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0642-17';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0745-22', 'SP PALMEIRAS', 'Prédio', 'SÃO PAULO', 'SP', 'BARRA FUNDA', 'RUA BRIGADEIRO GALVÃO, 265', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-15', '2029-07-15'
FROM unidades WHERE cnpj = '02.558.157/0745-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0745-22';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0745-22';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0821-18', 'LOJA PARK SHOPPING II', 'Loja', 'BRASÍLIA', 'DF', 'GUARA', 'SAI/SO ÁREA 6580, 233', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0963-30', 'LOJA SH SAO JOSE PR', 'Loja', 'SÃO JOSÉ DOS PINHAIS', 'PR', 'CENTRO', 'RUA IZABEL A REDENTORA, 1434', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0532-82', 'RN LJ MOSSORO', 'Loja', 'MOSSORÓ', 'RN', 'NOVA BETÂNIA', 'AVENIDA JOÃO DA ESCÓSSIA, 1515', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0802-55', 'MG LJ SHOP DIAM', 'Loja', 'BELO HORIZONTE', 'MG', 'SANTO AGOSTINHO', 'AV OLEGARIO MACIEL, 1600', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0491-70', 'MG CCC UBERLAND', 'Prédio', 'UBERLÂNDIA', 'MG', 'BRASIL', 'AV AFONSO PENA, 4017', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0491-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0491-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0491-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0686-38', 'DF BSB ZN IND', 'Prédio', 'BRASÍLIA', 'DF', 'ZONA INDUSTRIAL (GUARÁ)', 'SIA TRECHO 3, 03', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-06-15', '2028-06-15'
FROM unidades WHERE cnpj = '02.558.157/0686-38';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0686-38';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0742-80', 'SP IPEROIG', 'Prédio', 'SÃO PAULO', 'SP', 'PERDIZES', 'RUA IPEROIG, 486/488', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-03-31', '2027-03-31'
FROM unidades WHERE cnpj = '02.558.157/0742-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0742-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0742-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0961-78', 'LOJA COPACABANA RJ', 'Loja', 'RIO DE JANEIRO', 'RJ', 'COPACABANA', 'AVENIDA NOSSA SENHORA DE COPACABANA, 00643', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0914-51', 'PE_LOJA SHOPPING BOA VISTA', 'Loja', 'RECIFE', 'PE', 'BOA VISTA', 'RUA JOSE DE ALENCAR, 105', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0914-51';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0500-03', 'MG LJ SAVASSI', 'Loja', 'BELO HORIZONTE', 'MG', 'FUNCIONARIOS', 'PRACA DIOGO DE VASCONCELOS, 274', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0937-48', 'LOJA PARQUE BAHIA BA', 'Loja', 'LAURO DE FREITAS', 'BA', 'CENTRO', 'AVENIDA SANTOS DUMONT, 4360', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0577-84', 'SP JUNDIAÍ VILA', 'Prédio', 'JUNDIAÍ', 'SP', 'VILA ARENS II', 'AVENIDA FERNANDO ARENS, 470', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-17', '2029-07-17'
FROM unidades WHERE cnpj = '02.558.157/0577-84';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0577-84';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0577-84';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0328-70', 'RS LJ PELOTAS', 'Loja', 'PELOTAS', 'RS', 'CENTRO', 'RUA ANDRADE NEVES, 1749', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0363-53', 'RS LJ PRA BELAS', 'Loja', 'PORTO ALEGRE', 'RS', 'PRAIA DE BELAS', 'AV PRAIA DE BELAS, 1181', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0129-26', 'MS LJ S CAM GDE', 'Loja', 'CAMPO GRANDE', 'MS', 'CENTRO', 'AV. AFONSO PENA LOJAS 2013/2015, 4909', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0066-08', 'SP LJ CAMPINA S', 'Loja', 'CAMPINAS', 'SP', 'JD DO LAGO', 'RUA JACY TEIXEIRA DE CAMARGO, 940', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0066-08';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0734-70', 'SP VL GUSTAVO', 'Prédio', 'SÃO PAULO', 'SP', 'VILA MEDEIROS', 'R BENEVENUTO JORDÃO, 144', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0734-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0734-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 14', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0734-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0503-48', 'MG LJ MINAS SHO', 'Loja', 'BELO HORIZONTE', 'MG', 'UNIAO', 'AV CRISTIANO MACHADO, 4000', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/2155-25', 'RJ_LJ LEBLON RU RJ', 'Loja', 'RIO DE JANEIRO', 'RJ', '0', 'AV ATAULFO DE PAIVA, Nº 285 - LOJ B PARTE, 285', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0280-91', 'ES LJ LARANJEIR', 'Loja', 'SERRA', 'ES', 'PARQUE RES LARANJEIRAS', 'AV CENTRAL, 811', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0810-65', 'AM MANAUARA SHOPPING II', 'Loja', 'MANAUS', 'AM', 'ADRIANOPOLIS', 'AV MARIO YPIRANGA, 1300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0945-58', 'LOJA SHOPPING PARALELA BA', 'Loja', 'SALVADOR', 'BA', 'PARALELA', 'AVENIDA LUIS VIANA FILHO, 08544', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0057-17', 'SP LJ S C PLAZA', 'Loja', 'SÃO PAULO', 'SP', 'IPIRANGA', 'R DR FRANCISCO MESQUITA, 1000', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0057-17';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0647-21', 'RS CAXIAS DO SU', 'Prédio', 'CAXIAS DO SUL', 'RS', 'SAGRADA FAMILIA', 'RUA ANGELA RANDON, 148', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0647-21';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0647-21';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0647-21';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0472-07', 'MG LJ BETIM', 'Loja', 'BETIM', 'MG', 'CENTRO', 'AV AMAZONAS, 693', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0525-53', 'PA LJ SH IGUATE', 'Loja', 'BELÉM', 'PA', 'CENTRO', 'TRAV PD EUTIQUIO SHOP IGUATEMI 1 PISO, 1078', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0547-69', 'BA LJ S IGUATEM', 'Loja', 'SALVADOR', 'BA', 'CAMINHO DAS ÁRVORES', 'AV. TANCREDO NEVES  LJ. 03 E 04, 148', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0547-69';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0184-52', 'PR CATUAI S CE', 'Loja', 'LONDRINA', 'PR', 'CATUAI', 'RUA CELSO GARCIA CID, S/N.', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0184-52';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0528-04', 'PA LJ CASTANHEI', 'Loja', 'BELÉM', 'PA', 'CENTRO', 'RODOVIA BR 316 KM 01 2º PISO LOJA 184, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0436-43', 'SC LJ S NEUMAR', 'Loja', 'BLUMENAU', 'SC', 'CENTRO', 'RUA SETE DE SETEMBRO, 1213', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0436-43';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0730-46', 'AC LJ VIA VERDE', 'Loja', 'RIO BRANCO', 'AC', 'FLORESTA SUL', 'ESTRADA DA  FLORESTA, 2320', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0445-34', 'AC LJ SEDE', 'Loja', 'RIO BRANCO', 'AC', 'CENTRO', 'TRAVESSA CAMPO RIO BRANCO, 450', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0098-95', 'SP LOJA JAÚ', 'Loja', 'JAÚ', 'SP', 'CENTRO', 'R MAJOR PRADO, 377', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0098-95';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0098-95';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0098-95';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0727-40', 'BA LJ S IGUA II', 'Loja', 'SALVADOR', 'BA', 'CAMINHO DAS ÁRVORES', 'AV. TANCREDO NEVES, 148', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 16', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0727-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0949-81', 'LOJA SHOPPING BELA VISTA BA', 'Loja', 'SALVADOR', 'BA', 'HORTO BELA VISTA', 'ALAMEDA EUVALDO LUZ, 092', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0138-17', 'SP LJ SH TABOÃO', 'Loja', 'TABOÃO DA SERRA', 'SP', 'CIDADE INTERCAP', 'ROD REGIS BITTENCOURT KM 271 5 BR116, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0154-37', 'SP LJ S W PLAZA', 'Loja', 'SÃO PAULO', 'SP', 'AGUA BRANCA', 'AV FRANCISCO MATARAZZO BL A 3 PISO, S/N.', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0154-37';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0932-33', 'PA_LOJA ALTAMIRA PA', 'Loja', 'ALTAMIRA', 'PA', 'CENTRO', 'TRAVESSA CORONEL TANCREDO, 500', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0093-80', 'SP CCC SOROCABA', 'Prédio', 'SOROCABA', 'SP', 'VILA AUGUSTA', 'RUA GENERAL CARNEIRO, 2498', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0093-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0093-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0093-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0171-38', 'ES LJ LINHARES', 'Loja', 'LINHARES', 'ES', 'CENTRO', 'AV NOGUEIRA DA GAMA, 1058', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0171-38';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0171-38';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0171-38';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0770-33', 'PE LJ SH GUARAR', 'Loja', 'JABOATÃO DOS GUARARAPES', 'PE', 'PIEDADE', 'AVENIDA BARRETO DE MENEZES, 800', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0938-29', 'LOJA RUA GRANDE MA', 'Loja', 'SÃO LUÍS', 'MA', 'CENTRO', 'RUA GRANDE/ OSWALDO CRUZ, 388', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0463-16', 'MG LJ SH CIDADE', 'Loja', 'BELO HORIZONTE', 'MG', 'CENTRO', 'RUA RIO DE JANEIRO, 910', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0461-54', 'MG LJ P SAVASSI', 'Loja', 'BELO HORIZONTE', 'MG', 'FUNCIONÁRIOS', 'AV. DO CONTORNO, 6.061', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0147-08', 'SP CCC TATUAPÉ', 'Prédio', 'SÃO PAULO', 'SP', 'BELENZINHO', 'RUA URIEL GASPAR, 260', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-16', '2028-07-16'
FROM unidades WHERE cnpj = '02.558.157/0147-08';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0147-08';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0147-08';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0224-84', '*RJ LJ PILARES', 'Loja', 'RIO DE JANEIRO', 'RJ', 'PILARES', 'AV DOM HELDER CAMARA, 5332', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0297-30', 'GO LJ CATALÃO', 'Loja', 'CATALÃO', 'GO', 'CENTRO', 'RUA MOISES SALOMAO, 100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0297-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0297-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0297-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0467-40', 'MG LJ BH SHOP', 'Loja', 'BELO HORIZONTE', 'MG', 'BELVEDERE', 'RODOVIA BR 356, 3.049', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0423-29', 'SC LJ BLUME CEN', 'Loja', 'BLUMENAU', 'SC', 'CENTRO', 'RUA 15 DE NOVEMBRO, 946', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0916-13', 'SP_CD_CAJAMAR_GALPAO100-PARTE', 'Prédio', 'CAJAMAR', 'SP', 'CRISTAIS (JORDANESIA)', 'AV DOUTOR ANTONIO JOAO ABDALLA, 260', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-09-30', '2027-09-30'
FROM unidades WHERE cnpj = '02.558.157/0916-13';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0916-13';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0916-13';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0741-07', 'SP OSASCO', 'Prédio', 'OSASCO', 'SP', 'CENTRO', 'AV DOS AUTONOMISTAS, 3700', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-06-28', '2028-06-28'
FROM unidades WHERE cnpj = '02.558.157/0741-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0741-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0741-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0657-01', 'SC ITAJAI FAZEN', 'Prédio', 'ITAJAÍ', 'SC', 'FAZENDA', 'AVENIDA SETE DE SETEMBRO, 1515', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0657-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0657-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0657-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0720-74', 'BA SEDE FEIRA S', 'Prédio', 'FEIRA DE SANTANA', 'BA', 'PONTO CENTRAL', 'R JOSE BONIFACIO, 531', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-06-20', '2027-06-20'
FROM unidades WHERE cnpj = '02.558.157/0720-74';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0720-74';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0720-74';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0588-37', 'SP INDAIATUBA C', 'Prédio', 'INDAIATUBA', 'SP', 'CIDADE NOVA 1', 'RUA INDEPENDÊNCIA, 509', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0588-37';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0588-37';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0588-37';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0599-90', 'SP SÃO PAULO CH', 'Prédio', 'SÃO PAULO', 'SP', 'CHACARA SANTO ANTONIO', 'RUA ANTONIO CHAGAS, 1196', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 29', 'Vigente', '2026-07-17', '2029-07-17'
FROM unidades WHERE cnpj = '02.558.157/0599-90';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0599-90';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0599-90';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0314-75', 'TO LJ PALMAS', 'Loja', 'PALMAS', 'TO', 'PLANO DIRETOR SUL', 'ALAMEDA NS 2 QD SUL CJ 3 LT 1 SL 02, 104', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0667-75', 'PR CURITIBA HAU', 'Prédio', 'CURITIBA', 'PR', 'HAUER', 'RUA FREDERICO MAUER, 1255', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-07-10', '2028-07-10'
FROM unidades WHERE cnpj = '02.558.157/0667-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0667-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2026', 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0667-75';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0994-36', 'MG_LOJA VIA SHOPPING BARREIRO MG', 'Loja', 'BELO HORIZONTE', 'MG', 'BARREIRO', 'AV AFONSO VAZ DE MELO, 640', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0137-36', 'SP LJ SS CARLOS', 'Loja', 'SÃO CARLOS', 'SP', 'PARQUE FABER', 'PASSEIO DOS FLAMBOYANT, 200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0137-36';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0137-36';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0137-36';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0682-04', 'MS DOURADOS VIL', 'Prédio', 'DOURADOS', 'MS', 'VILA SANTO ANDRÉ', 'RUA PEDRO RIGOTTI, 585', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-03', '2027-06-03'
FROM unidades WHERE cnpj = '02.558.157/0682-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0682-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0928-57', 'ES_LOJA SHOPPING VILA VELHA ES', 'Loja', 'VILA VELHA', 'ES', 'DIVINO ESPIRITO SANTO', 'RUA LUCIANO DAS NEVES, 2418', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0455-06', 'DF LJ IGUATEMI', 'Loja', 'BRASÍLIA', 'DF', 'LAGO NORTE', 'SHI/NORTE QD CA 04,LOTE A,TÉRREO, LOJA 37', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 28', 'Vigente', '2026-04-30', '2028-04-30'
FROM unidades WHERE cnpj = '02.558.157/0455-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2026', 'LISTA 28', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0455-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0426-71', 'SC LJ S ITAGUA', 'Loja', 'SÃO JOSÉ', 'SC', 'BARREIROS', 'RUA GERONCIO THIVES SALAS 206 E 261, 1079', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0426-71';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0885-82', 'SP_SAÚDE', 'Prédio', 'SÃO PAULO', 'SP', 'SAÚDE', 'RUA FAGUNDES DIAS, 34', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0885-82';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0885-82';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0885-82';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0787-81', 'SP SANTO AMARO', '', 'SÃO PAULO', 'SP', 'JARDIM SANTO AMARO', 'R CONDE DE ITU, 751', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0787-81';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0787-81';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0787-81';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0590-51', 'SP SANTO ANDRÉ', 'Prédio', 'SANTO ANDRÉ', 'SP', 'CAMPESTRE', 'RUA DOS COQUEIROS, 768', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 20', 'Vigente', '2026-07-17', '2029-07-17'
FROM unidades WHERE cnpj = '02.558.157/0590-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0590-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0590-51';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0775-48', 'PR LJ SH PATIO', 'Loja', 'CURITIBA', 'PR', 'BATEL', 'AVENIDA DO BATEL, 1868', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0777-00', 'SP ITAJUBA', 'Prédio', 'GUARULHOS', 'SP', 'CIDADE INDUSTRIAL SATÉLITE DE SÃO PAULO', 'RUA ITAJUBÁ, 42', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-06-30', '2028-06-30'
FROM unidades WHERE cnpj = '02.558.157/0777-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0777-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0777-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0769-08', 'SP FREGUES DO Ó', 'Prédio', 'SÃO PAULO', 'SP', 'JARDIM MARILIZA', 'RUA PADRE FELICIANO DOMINGUES, 373', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2028', 'LISTA 29', 'Vigente', '2026-06-30', '2028-06-30'
FROM unidades WHERE cnpj = '02.558.157/0769-08';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0769-08';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0769-08';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0690-14', 'MG IPATINGA VEN', 'Prédio', 'IPATINGA', 'MG', 'VENEZA', 'AVENIDA LONDRINA, 1145', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0690-14';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0690-14';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0690-14';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0653-70', 'RS SANTA CRUZ D', 'Prédio', 'SANTA CRUZ DO SUL', 'RS', 'CENTRO', 'RUA 28 DE SETEMBO, 588', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0653-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0653-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0653-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0765-76', 'RN LJ NATAL SHP', 'Loja', 'NATAL', 'RN', 'CANDELARIA', 'AVENIDA SENADOR SALGADO FILHO, 2234', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0705-35', 'AL MACEIO CENTRO', 'Prédio', 'MACEIÓ', 'AL', 'CENTRO', 'TRAVESSA DESEMBARGADOR ARTUR JUCÁ, 62', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-25', '2027-07-25'
FROM unidades WHERE cnpj = '02.558.157/0705-35';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0705-35';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0705-35';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0020-25', 'RN SEDE', 'Prédio', 'NATAL', 'RN', 'TIROL', 'AV PRUDENTE DE MORAIS, 744', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0020-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0020-25';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0020-25';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0835-13', 'PR LOJA SHOPPING ESTAÇÃO II', 'Loja', 'CURITIBA', 'PR', 'REBOUÇAS', 'AV SETE DE SETEMBRO, 2775', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0130-60', 'MS LJ COMPER', 'Loja', 'CAMPO GRANDE', 'MS', 'HIPERCENTER', 'AV CEARA LJ 12 HIPER CENTER JD DOS EST, 1553', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0746-03', 'SP ANHANGABAU', 'Prédio', 'SÃO PAULO', 'SP', 'CENTRO', 'RUA BRIGADEIRO TOBIAS, 666', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-05-31', '2027-05-31'
FROM unidades WHERE cnpj = '02.558.157/0746-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0746-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0746-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0779-71', 'BA LJ SH BOU SA', 'Loja', 'FEIRA DE SANTANA', 'BA', 'CASEB', 'AV.GOV. JOAO DURVAL CARNEIRO, 3665', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0550-64', 'BA LJ ITABUNA', 'Loja', 'ITABUNA', 'BA', 'CENTRO', 'AV CINQUENTENARIO, 902', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0550-64';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0550-64';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0550-64';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0878-53', 'SP_JD PAULISTANO', 'Prédio', 'RIBEIRÃO PRETO', 'SP', 'JARDIM PAULISTANO', 'AVENIDA TREZE DE MAIO, 1251', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0878-53';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0878-53';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0878-53';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0947-10', 'LOJA GOLDEN SHOPPING MA', 'Loja', 'SÃO LUÍS', 'MA', 'CALHAU', 'AV DOS HOLANDESES/CONS.HILTON RODRIGUES, 200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0910-28', 'CE LOJA NORTH SHOPPING I', 'Loja', 'FORTALEZA', 'CE', 'PRESIDENTE KENNEDY', 'AV BEZERRA DE MENEZES, 2450', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0910-28';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0576-01', 'PE LJ RIVER PET', 'Loja', 'PETROLINA', 'PE', 'CENTRO', 'AV. MONSENHOR ÂNGELO SAMPAIO, 100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0165-90', 'ES LJ SÃO MATEU', 'Loja', 'SÃO MATEUS', 'ES', 'CENTRO', 'AV JONES DOS SANTOS NEVES, 297', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0948-09', 'LOJA CENTER PIEDADE BA', 'Loja', 'SALVADOR', 'BA', 'BARRIS', 'RUA CONSELHEIRO JUNQUEIRA AYRES, 0165', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0440-20', 'SC LJ S BE MAR', 'Loja', 'FLORIANÓPOLIS', 'SC', 'CENTRO', 'RUA BOCAIUVA, 2468', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0440-20';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0679-09', 'MG JUIZ DE FORA', 'Prédio', 'JUIZ DE FORA', 'MG', 'PASSOS', 'RUA DOM VIÇOSO, 70', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0679-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0679-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0679-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0782-77', 'MG LJ UBERLAN S', 'Loja', 'UBERLÂNDIA', 'MG', 'TIBERY', 'AVENIDA JOÃO NAVES DE ÁVILA, 1331', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0776-29', 'PE DOM JOSE', 'Prédio', 'GARANHUNS', 'PE', 'SANTO ANTÔNIO', 'RUA DOM JOSÉ, 199', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0776-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0776-29';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0776-29';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0818-12', 'MT EST CUIABA', 'Loja', 'CUIABÁ', 'MT', 'JARDIM MARIANA', 'AVENIDA MIGUEL SUTIL, 9300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0595-66', 'SP SÃO PAULO BR', '', 'SÃO PAULO', 'SP', 'BROOKLIN', 'AVENIDA DAS NAÇÕES, 12901', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0595-66';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0595-66';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0595-66';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0393-79', 'PE LJ PETROLINA', 'Loja', 'PETROLINA', 'PE', 'LOTEAMENTO RECIFE', 'LOTEAMENTO TEREZA CRISTINA, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0393-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0393-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0393-79';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0476-30', 'MG LJ DIVINOPOL', 'Loja', 'DIVINÓPOLIS', 'MG', 'CENTRO', 'RUA RIO DE JANEIRO, 420', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0437-24', 'SC LJ S I FLORI', 'Loja', 'FLORIANÓPOLIS', 'SC', 'SANTA MONICA', 'AV MADRE BENVENUTA PISO 2 LOJA 268, 687', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-06-30', '2029-06-30'
FROM unidades WHERE cnpj = '02.558.157/0437-24';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0944-77', 'LOJA ICARAI RJ', 'Loja', 'NITERÓI', 'RJ', 'ICARAI', 'R DOUTOR TAVARES DE MACEDO, 210', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0134-93', 'SP LOJA BAURU', 'Loja', 'BAURU', 'SP', 'CIDADE UNIVERSITARIA', 'RUA HENRIQUE SAVI  LJ 09 E 10  PISO 1, 15 E 55', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0134-93';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0691-03', 'MT RONDONOPOLIS', 'Prédio', 'RONDONÓPOLIS', 'MT', 'CENTRO', 'AVENIDA MARECHAL RONDON, 659', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-09', '2027-06-09'
FROM unidades WHERE cnpj = '02.558.157/0691-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0691-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0691-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0992-74', 'MG_LOJA BIG SHOPPING MG', 'Loja', 'CONTAGEM', 'MG', 'ELDORADO', 'AV JOAO CESAR DE OLIVEIRA, 1275', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0071-75', 'SP LJ S ABC MAP', 'Loja', 'SANTO ANDRÉ', 'SP', 'PARAISO', 'AV PEREIRA BARRETO LJS 54 E 55, 42', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0071-75';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0485-21', 'MG LJ PO ALEGRE', 'Loja', 'POUSO ALEGRE', 'MG', 'CENTRO', 'AV DR LISBOA, 192', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0485-21';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0485-21';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0485-21';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0584-03', 'SP GUARULHOS VI', 'Prédio', 'GUARULHOS', 'SP', 'VILA HULDA', 'AVENIDA DOUTOR TIMOTEO PENTEADO, 950', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-04-20', '2027-04-20'
FROM unidades WHERE cnpj = '02.558.157/0584-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0584-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0584-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0381-35', 'SE LJ RI BRANCO', 'Loja', 'ARACAJU', 'SE', 'CENTRO', 'AV RIO BRANCO, 100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0162-47', 'SP LJ N S RIBEI', 'Loja', 'RIBEIRÃO PRETO', 'SP', 'VILA RIBEIRANEA', 'AV PRESIDENTE KENNEDY LOJA 305, 1500', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0162-47';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0654-50', 'PE CARUARU PETR', 'Prédio', 'CARUARU', 'PE', 'PETROPÓLIS', 'AVENIDA JOÃO DE BARROS, 424', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0654-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0654-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0654-50';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0144-65', 'SP CCC JAGUARÉ', 'Prédio', 'SÃO PAULO', 'SP', 'JAGUARE', 'AV BOLONHA, 277', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-07-28', '2027-07-28'
FROM unidades WHERE cnpj = '02.558.157/0144-65';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0144-65';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0144-65';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0789-43', 'SP LAPA', 'Prédio', 'SÃO PAULO', 'SP', 'BELA ALIANCA', 'R ANDRADE NEVES, 429', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0789-43';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0789-43';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0789-43';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0376-78', 'RS S N HAMBURGO', 'Loja', 'NOVO HAMBURGO', 'RS', 'RIO BRANCO', 'AV NACOES UNIDAS, 2001', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0574-31', 'DF LJ SH BOULEV', 'Loja', 'BRASÍLIA', 'DF', 'ASA NORTE', 'AC STN CONJ J. 2 PISO LOJA T122/123, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0620-01', 'PR PINHAIS EMIL', 'Prédio', 'PINHAIS', 'PR', 'EMILIANO PERNETA', 'RUA UNIFLOR, 1087', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-10', '2027-06-10'
FROM unidades WHERE cnpj = '02.558.157/0620-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0620-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0620-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0758-47', 'LJ CXS CENTRO', 'Loja', 'CAXIAS DO SUL', 'RS', 'CENTRO', 'AV. JÚLIO DE CASTILHOS, 2112', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0758-47';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0880-78', 'GO LJ PAS AGUAS', 'Loja', 'GOIÂNIA', 'GO', 'FAZENDA CRIMEIA CAVEIRAS', 'AV. PERIMETRAL NORTE, 8303', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0470-45', 'MG LJ SH DELREY', 'Loja', 'BELO HORIZONTE', 'MG', 'CAICARA', 'AV PRESIDENTE CARLOS LUZ, 3001', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0571-99', 'AL LJ PK MACEIO', 'Loja', 'MACEIÓ', 'AL', 'CRUZ DAS ALMAS', 'AV. COMENDADOR GUSTAVO PAIVA, 5945', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0815-70', 'MG ADM DIVINOP', 'Prédio', 'DIVINÓPOLIS', 'MG', 'CENTRO', 'RUA RIO DE JANEIRO, 2560', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0815-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0815-70';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0815-70';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0477-11', 'MG CCC DIVINOPO', 'Prédio', 'DIVINÓPOLIS', 'MG', 'CENTRO', 'RUA RIO DE JANEIRO, 426', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-11', '2027-08-11'
FROM unidades WHERE cnpj = '02.558.157/0477-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0477-11';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0477-11';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0018-00', 'TO SEDE', 'Prédio', 'PALMAS', 'TO', 'CENTRO', 'AV. NS-2, 104 SUL', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-30', '2027-08-30'
FROM unidades WHERE cnpj = '02.558.157/0018-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0018-00';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0018-00';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0659-65', 'SC LAGES CORAL', 'Prédio', 'LAGES', 'SC', 'CORAL', 'RUA CARMOSINO CAMARGO, 419', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0659-65';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0659-65';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0659-65';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0504-29', 'MA LJ SH COLONI', 'Loja', 'SÃO LUÍS', 'MA', 'JARDIM DE FATIMA -TURU', 'AVENIDA SÃO LUIS REI DE FRANÇA, 8', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0819-01', 'GO_GOIAS', 'Prédio', 'JATAÍ', 'GO', 'CENTRO', 'RUA JOSÉ MANOEL VILELA, 670 C/ AVENIDA GOIÁS, 1183', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0819-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0819-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0819-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0748-75', 'SP ABERNESIA', 'Prédio', 'SANTO ANDRÉ', 'SP', 'SANTA MARIA', 'RUA ABERNÉSIA, Nº 718', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0748-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0748-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0748-75';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0646-40', 'RS CAXIAS DO SU', 'Prédio', 'CAXIAS DO SUL', 'RS', 'CENTRO', 'RUA MARQUES DE HERVAL, 1397', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-27', '2027-08-27'
FROM unidades WHERE cnpj = '02.558.157/0646-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0646-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0646-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0551-45', 'BA LJ ILHÉUS', 'Loja', 'ILHÉUS', 'BA', 'CENTRO', 'RUA RODOLFO VIEIRA, 52', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0822-07', 'AP LJ MACAPA SH', 'Loja', 'MACAPÁ', 'AP', 'CENTRAL', 'R LEOPOLDO MACHADO, 2334', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0334-19', 'PB LJ MANA S CE', 'Loja', 'JOÃO PESSOA', 'PB', 'MANAIRA', 'R MANOEL ARRUDA CAVALCANTI, 805', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0956-00', 'LOJA MARICA RJ', 'Loja', 'MARICÁ', 'RJ', 'CENTRO', 'RUA RIBEIRO DE ALMEIDA, 233', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0514-09', 'PE LJ RIO MAR', 'Loja', 'RECIFE', 'PE', 'PINA', 'AVENIDA REPÚBLICA DO LÍBANO, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0926-95', 'ES_LOJA SHOPPING MOXUARA ES', 'Loja', 'CARIACICA', 'ES', 'SAO FRANCISCO', 'AVENIDA MARIO GURGEL, 5353', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0829-75', 'MG AV CES ALVIM', 'Prédio', 'UBERLÂNDIA', 'MG', 'NOSSA SENHORA APARECIDA', 'AVENIDA CESÁRIO ALVIM, 2112', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-09-08', '2027-09-08'
FROM unidades WHERE cnpj = '02.558.157/0829-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0829-75';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0829-75';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0645-60', 'RS CANOAS CENTR', 'Prédio', 'CANOAS', 'RS', 'CENTRO', 'RUA AURORA, 377', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0645-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0645-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0645-60';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0218-36', 'MT LJ SH PANTA', 'Loja', 'CUIABÁ', 'MT', 'JARDIM ACLIMACAO', 'AV HISTORIADOR RUBENS MENDONÇA LJ LOJA 21  20  E  21  21, 3300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0352-09', 'RS LJ A BRASIL', 'Loja', 'PORTO ALEGRE', 'RS', 'CRISTO REDENTOR', 'AV ASSIS BRASIL, 2611', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0510-77', 'SC LJ FLORIP SH', 'Loja', 'FLORIANÓPOLIS', 'SC', 'BAIRRO SACO GRANDE', 'ROD SC 401 PISO 1 LJ139, 3116', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0494-12', 'MG LJ MO CLAROS', 'Loja', 'MONTES CLAROS', 'MG', 'CENTRO', 'RUA DR VELOSO, 479', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0494-12';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0494-12';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0494-12';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0308-27', 'GO LJ BURITI SH', 'Loja', 'APARECIDA DE GOIANIA', 'GO', 'VILA SAO TOMAS', 'AV RIO VERDE, S/N.', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0795-91', '_SP_MOGI G CON_LO101060', 'Prédio', 'MOGI DAS CRUZES', 'SP', 'BRAS CUBAS', 'RUA GASPAR CONQUEIRO, 965', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0795-91';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 24', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0795-91';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 14', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0795-91';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0959-53', 'LOJA ARRAIAL DO CABO RJ', 'Loja', 'ARRAIAL DO CABO', 'RJ', 'CENTRO', 'PC DA INDEPENDENCIA, 33', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0896-35', 'PE LJ SHOP RECIFE II', 'Loja', 'RECIFE', 'PE', 'BOA VIAGEM', 'RUA PADRE CARAPUCEIRO, 777', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0116-01', 'SP LJ S TAMBORÉ', 'Loja', 'BARUERI', 'SP', 'TAMBORE', 'AV PIRACEMA LOJA 21 E 22, 669', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0116-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0785-10', 'AM QQ PONTA NEGRA', 'Loja', 'MANAUS', 'AM', 'PONTA NEGRA', 'AV CORONEL TEIXEIRA, 5705', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0735-50', 'ARAÇATUBA', 'Prédio', 'ARAÇATUBA', 'SP', 'CENTRO', 'RUA XV DE NOVEMBRO, 120', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-04-30', '2027-04-30'
FROM unidades WHERE cnpj = '02.558.157/0735-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0735-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0735-50';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0123-30', 'SP Q S C AMERIC', 'Prédio', 'PRESIDENTE PRUDENTE', 'SP', 'VILA SAO JORGE', 'RUA SIQUEIRA CAMPOS, 1545', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 20', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0123-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0123-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2023', 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0123-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0598-09', 'SP SÃO PAULO BR', 'Prédio', 'SÃO PAULO', 'SP', 'BROOKLIN', 'AVENIDA DAS NAÇÕES UNIDAS, 12901', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 16', 'Vigente', '2025-06-30', '2027-06-30'
FROM unidades WHERE cnpj = '02.558.157/0598-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0598-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0598-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0629-40', 'PR GUARAPUAVA C', 'Prédio', 'GUARAPUAVA', 'PR', 'CENTRO', 'RUA CAPITÃO FREDERICO VIRMOND, 1669', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-10', '2027-06-10'
FROM unidades WHERE cnpj = '02.558.157/0629-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0629-40';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0629-40';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0909-94', '09_LOJA SHOPPING  JOQUEI', 'Loja', 'FORTALEZA', 'CE', 'JOQUEI CLUBE', 'AV. LINEU MACHADO, 419', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0909-94';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0301-50', 'GO LJ RIO VERDE', 'Loja', 'RIO VERDE', 'GO', 'CENTRO', 'RUA CORONEL VAIANO, 654', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0572-70', 'CE LJ RIO MAR', 'Loja', 'FORTALEZA', 'CE', 'PAPICU BBB', 'RUA DESEMBARGADOR LAURO NOGUEIRA - DE 851/852 AO FIM, 1500', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0193-43', 'PR LJ S CURITIB', 'Loja', 'CURITIBA', 'PR', 'BATEL', 'R BRIGADEIRO FRANCO, 2300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0104-78', 'SP LJ R PRETO S', 'Loja', 'SÃO JOSÉ DO RIO PRETO', 'SP', 'JARDIM MORUMBI', 'AV BRIGADEIRO FARIA LIMA, 6363', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0458-59', 'PI LJ RIV WAL S', 'Loja', 'TERESINA', 'PI', 'JOQUEI CLUBE', 'AV ININGA, 1201', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0675-85', 'MG BELO HORIZON', 'Prédio', 'BELO HORIZONTE', 'MG', 'ESTORIL', 'AVENIDA BARAO HOMEM DE MELO, 4324', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0675-85';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0675-85';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0675-85';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0624-35', 'PR PONTA GROSSA', 'Prédio', 'PONTA GROSSA', 'PR', 'CENTRO', 'PRAÇA BARÃO DE GUARAUNA, 48', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0624-35';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0624-35';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0624-35';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0632-45', 'RS SANTA MARIA', 'Prédio', 'SANTA MARIA', 'RS', 'CENTRO', 'RUA DOS ANDRADAS, 1759', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0632-45';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0632-45';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0632-45';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0391-07', 'RN LJ MIDWAY SC', 'Loja', 'NATAL', 'RN', 'TIROL', 'AV BERNARDO VIEIRA, 3775', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0356-24', 'RS LJ S MOINHOS', 'Loja', 'PORTO ALEGRE', 'RS', 'MOINHOS DE VENTO', 'RUA OLAVO BARRETO VIANA, 36', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0356-24';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0168-32', 'ES LJ CP GRANDE', 'Loja', 'CARIACICA', 'ES', 'CAMPO GRANDE', 'AV EXPEDITO GARCIA, 173', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0103-97', 'SP LJ FRANCA', 'Loja', 'FRANCA', 'SP', 'CENTRO', 'RUA MAJOR CLAUDIANO, 1868', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0482-89', 'MG LJ CONS LAFA', 'Loja', 'CONSELHEIRO LAFAIETE', 'MG', 'CENTRO', 'RUA MELO VIANA, 162', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0404-66', 'AL LJ S CE IGUA', 'Loja', 'MACEIÓ', 'AL', 'MANGABEIRAS', 'AV COMENDADOR GUSTAVO PAIVA, 2990', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0709-69', 'RJ SEBASTIAO OLIVEIRA', 'Prédio', 'DUQUE DE CAXIAS', 'RJ', 'VILA MERITI', 'R SEBASTIAO DE OLIVEIRA, 261', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0709-69';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0709-69';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0709-69';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0628-69', 'PR FOZ DO IGUAÇ', 'Prédio', 'FOZ DO IGUAÇU', 'PR', 'CENTRO', 'AVENIDA JUSCELINO KUBITSCHEK, 995', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0628-69';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0628-69';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0628-69';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0882-30', 'GO_MORRINHOS', '', 'MORRINHOS', 'GO', 'CENTRO', 'RUA BARÃO DE RIO BRANCO C/ SENADOR HEMENEGILDO DE MORAES, 909', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0882-30';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0882-30';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0202-79', 'PR LJ FOZ IGUA', 'Loja', 'FOZ DO IGUAÇU', 'PR', 'CENTRO', 'RUA EDMUNDO DE BARROS, S/N', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0202-79';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0936-67', 'LOJA CAMPINA GRANDE DO SUL PR', 'Loja', 'CAMPINA GRANDE DO SUL', 'PR', 'JARDIM PAULISTA', 'R LEONARDO FRANCISCHELLI, 266', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0915-32', 'RN_LOJA PARTAGE NATAL', 'Loja', 'NATAL', 'RN', 'POTENGI', 'AV DOUTOR JOÃO MEDEIROS FILHO, 2395', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0915-32';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0215-93', 'RR CD / LJ BVIS', 'Loja', 'BOA VISTA', 'RR', 'SAO FRANCISCO', 'AVENIDA CAPITÃO JÚLIO BEZERRA, 957', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0360-00', 'RS LJ BARRA SHO', 'Loja', 'PORTO ALEGRE', 'RS', 'CRISTAL', 'AV DIARIO DE NOTICIAS, 300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0466-69', 'MG LJ SH BOULEV', 'Loja', 'BELO HORIZONTE', 'MG', 'STA. EFIGÊNCIA', 'AV DOS ANDRADAS, 3000', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0715-07', 'PR UMUARAMA', 'Prédio', 'UMUARAMA', 'PR', 'ZONA II', 'R DOUTOR CAMARGO, 4517', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-10', '2027-06-10'
FROM unidades WHERE cnpj = '02.558.157/0715-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0715-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0715-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0805-06', 'MG LJ SHOP ESTA', 'Loja', 'BELO HORIZONTE', 'MG', 'VILA CLORIS', 'AV CRISTIANO MACHADO, 11833', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0495-01', 'MG CCC MON CLAR', 'Prédio', 'MONTES CLAROS', 'MG', 'CENTRO', 'RUA DR VELOSO, 479', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0495-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0495-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0495-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0811-46', 'SP ALTINO ARANTES', 'Prédio', 'CARAGUATATUBA', 'SP', 'CENTRO', 'R ALTINO ARANTES, 10', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0811-46';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0811-46';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0811-46';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0353-81', 'RS Q BOU IPIRAN', 'Loja', 'PORTO ALEGRE', 'RS', 'JARDIM BOTANICO', 'AV IPIRANGA, 5200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0013-04', 'SC SEDE', 'Prédio', 'JOINVILLE', 'SC', 'CENTRO', 'RUA ALEXANDRE DOHLER, 129', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-09-30', '2027-09-30'
FROM unidades WHERE cnpj = '02.558.157/0013-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0013-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0013-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0929-38', 'ES_LOJA CAMPO GRANDE II ES', 'Loja', 'CARIACICA', 'ES', 'CAMPO GRANDE', 'AVENIDA EXPEDITO GARCIA, 303', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0296-59', 'GO LJ FLAMBOYAN', 'Loja', 'GOIÂNIA', 'GO', 'JARDIM GOIAS', 'AV JAMEL CECILIO, 3300', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0887-44', 'SP_LOJA OUTLET CATARINA SP', 'Loja', 'SÃO ROQUE', 'SP', 'DONA CATARINA', 'R RAFAEL DIAS COSTA, 140', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0407-09', 'RO LOJA SEDE', 'Loja', 'PORTO VELHO', 'RO', 'NOSSA SRA DAS GRACAS', 'RUA GETULIO VARGAS, 1941', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0513-10', 'PE LJS TACARUNA', 'Loja', 'RECIFE', 'PE', 'SANTO AMARO', 'AVENIDA AGAMENON MAGALHÃES, 153', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0665-03', 'PR CURITIBA CID', 'Prédio', 'CURITIBA', 'PR', 'CIDADE INDUSTRIAL', 'RUA SENADOR ACCIOLY FILHO, 2200', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-10', '2027-06-10'
FROM unidades WHERE cnpj = '02.558.157/0665-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0665-03';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0665-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0964-10', 'LOJA SHOPPING PLAZA MACAE RJ', 'Loja', 'MACAÉ', 'RJ', 'GLORIA', 'R BENTO PESSANHA, 800', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0180-29', 'PR LJ MARINGÁ P', 'Loja', 'MARINGÁ', 'PR', 'ZONA 1', 'AV SAO PAULO, 120', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0951-04', 'LOJA PIRAQUARA PR', 'Loja', 'PIRAQUARA', 'PR', 'JARDIM BOM JESUS DOS PASSOS', 'AVENIDA GETULIO VARGAS, 1211', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0970-69', 'LOJA SHOP PARK JACAREPAGUA RJ', 'Loja', 'RIO DE JANEIRO', 'RJ', 'ANIL', 'EST DE JACAREPAGUA, 6069', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0908-03', 'PB LOJA SHOPPING TAMBIA', 'Loja', 'JOÃO PESSOA', 'PB', 'TAMBIA', 'RUA DEPUTADO ODON BEZERRA, 184', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0908-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0569-74', 'RO LJ SHOPPING', 'Loja', 'PORTO VELHO', 'RO', 'FLODOALDO PONTES PINTO', 'AV. RIO MADEIRA, 3288', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0780-05', 'SH CONT P', 'Loja', 'SÃO JOSÉ', 'SC', 'DISTRITO INDUSTRIAL', 'MARG BR 101,  KM210, CONFLUENCIA COM ROD SC, 1', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0573-50', 'CE LJ CARIRI', 'Loja', 'JUAZEIRO DO NORTE', 'CE', 'TRIÂNGULO', 'AV. PADRE CÍCERO, 2555', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0757-66', 'CE LJ S RIO MAR', 'Loja', 'FORTALEZA', 'CE', 'PRESIDENTE KENNEDY', 'AV SARGENTO HERMINIO SAMPAIO, 3100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0820-37', 'SP HUMAITA', 'Prédio', 'SÃO JOSÉ DOS CAMPOS', 'SP', 'CENTRO', 'R HUMAITA, 315', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0820-37';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0820-37';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0820-37';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0933-14', 'ES_LOJA SHOPPING BOULEVARD ES', 'Loja', 'VILA VELHA', 'ES', 'JOCKEY DE ITAPARICA', 'RODOVIA DO SOL, 5000', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0185-33', 'PR LJ S PALADI', 'Loja', 'PONTA GROSSA', 'PR', 'CENTRO', 'RUA ERMELINO DE LEAO, 703', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0441-00', 'SC LJ FEL SCHMI', 'Loja', 'FLORIANÓPOLIS', 'SC', 'CENTRO', 'RUA FELIPE SCHIMIDT, 90', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0678-28', 'MG GOVERNADOR V', 'Prédio', 'GOVERNADOR VALADARES', 'MG', 'SÃO PAULO', 'RUA TREZE DE MAIO, 925', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0678-28';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0678-28';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0678-28';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0806-89', 'PE LJ CARURU PE', 'Loja', 'CARUARU', 'PE', 'INDIANOPOLIS', 'AVENIDA ADJAR DA SILVA CASÉ, 800', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0939-00', 'LOJA JARDIM AMERICPR', 'Loja', 'CURITIBA', 'PR', 'JARDIM DAS AMERICAS', 'AV NOSSA SENHORA DE LOURDES, 63', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0609-04', 'GO ANÁPOLIS SET', 'Prédio', 'ANÁPOLIS', 'GO', 'SETOR CENTRAL', 'RUA ENGENHEIRO PORTELA, 222', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-11', '2027-07-11'
FROM unidades WHERE cnpj = '02.558.157/0609-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0609-04';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0609-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0946-39', 'LOJA SHOP ITAIPU RJ', 'Loja', 'NITERÓI', 'RJ', 'PIRATININGA', 'EST FRANCISCO DA CRUZ NUNES, 6501', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0671-51', 'RN NATAL LAGOA', 'Prédio', 'NATAL', 'RN', 'LAGOA SECA', 'AVENIDA BERNARDO VIEIRA, 3491', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0671-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0671-51';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0671-51';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0997-89', 'MG_LOJA SHOPPING CONTAGEM MG', 'Loja', 'CONTAGEM', 'MG', 'CHÁCARAS COTIA', 'AV SEVERINO BALLESTEROS RODRIGUES, 850', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0674-02', 'SE ARACAJU SÃO', 'Prédio', 'ARACAJU', 'SE', 'SÃO JOSÉ', 'AVENIDA AUGUSTO MAYNARD, 366', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0674-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0674-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0674-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0999-40', 'MG_LOJA PARTAGE SHOPPING BETIM MG', 'Loja', 'BETIM', 'MG', 'SÃO JOÃO', 'ROD BR 381 FERNAO DIAS, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0122-50', 'SP LJ PRUDENSH', 'Loja', 'PRESIDENTE PRUDENTE', 'SP', 'VILA SANTA HELENA', 'AV MANOEL GOULART, 2400', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0039-35', 'SP LJ TOP CENTE', 'Loja', 'SÃO PAULO', 'SP', 'BELA VISTA', 'AV. PAULISTA, 854', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 30', 'Vigente', '2026-08-31', '2029-08-31'
FROM unidades WHERE cnpj = '02.558.157/0039-35';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0553-07', 'BA LJ T FREITAS', 'Loja', 'TEIXEIRA DE FREITAS', 'BA', 'ALAGOAS', 'RUA JUSCELINO KUBISTCHEK, 123', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0903-07', 'PB_LOJA SHOPPING MANAIRA II', 'Loja', 'CABEDELO', 'PB', 'PARQUE VERDE', 'AV GOVERNADOR FLAVIO RIBEIRO COUTINHO, 220', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 08', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0903-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0903-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0716-98', 'PB JOAO PESSOA', 'Prédio', 'JOÃO PESSOA', 'PB', 'TAMBAUZINHO', 'AV PRESIDENTE EPITACIO PESSOA, 2496', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-28', '2027-07-28'
FROM unidades WHERE cnpj = '02.558.157/0716-98';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0716-98';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0716-98';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0294-97', 'GO LJ CAMPINAS', 'Loja', 'GOIÂNIA', 'GO', 'ST FUNCIONARIOS', 'AV 24 DE OUTUBRO, 321', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0824-60', 'MG AV ANTONIO T', 'Prédio', 'POÇOS DE CALDAS', 'MG', 'VILA TOGNI', 'AVENIDA ANTÔNIO TOGNI, 2953', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-09-30', '2027-09-30'
FROM unidades WHERE cnpj = '02.558.157/0824-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0824-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0824-60';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0892-01', 'SP_SANTO ANDRE', 'Prédio', 'SANTO ANDRÉ', 'SP', 'CENTRO', 'RUA PREFEITO JUSTINO PAIXÃO, 40', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0892-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0892-01';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0892-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0995-17', 'MG_LOJA VICOSA MG', 'Loja', 'VIÇOSA', 'MG', 'CENTRO', 'R ARTHUR BERNARDES, 92', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0753-32', 'SP JOAO PASSOS', 'Prédio', 'BOTUCATU', 'SP', 'CENTRO', 'RUA JOÃO PASSOS, 553/569', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0753-32';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0753-32';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0753-32';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0643-06', 'SC BLUMENAU CEN', 'Prédio', 'BLUMENAU', 'SC', 'CENTRO', 'RUA 15 DE NOVEMBRO, 759', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-08-29', '2027-08-29'
FROM unidades WHERE cnpj = '02.558.157/0643-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0643-06';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0643-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0633-26', 'ES LINHARES NOS', 'Prédio', 'LINHARES', 'ES', 'NOSSA SENHORA DA CONCEIÇÃO', 'AVENIDA GUERINO GIUBERT, 128', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0633-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0633-26';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0633-26';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0721-55', 'BA FEIRA SANTAN', 'Prédio', 'FEIRA DE SANTANA', 'BA', 'PONTO CENTRAL', 'AVENIDA GETULIO VARGAS, 1285', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 21', 'Vigente', '2025-12-16', '2027-12-16'
FROM unidades WHERE cnpj = '02.558.157/0721-55';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 21', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0721-55';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 21', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0721-55';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0952-87', 'LOJA SH CIDADE PR', 'Loja', 'CURITIBA', 'PR', 'HAUER', 'AV MARECHAL FLORIANO PEIXOTO, 4984', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0962-59', 'LOJA SHOP PARTAGE S GONCALO RJ', 'Loja', 'SÃO GONÇALO', 'RJ', 'CENTRO', 'AV PRESIDENTE KENNEDY, 425', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0940-43', 'LOJA SAQUAREMA RJ', 'Loja', 'SAQUAREMA', 'RJ', 'CENTRO', 'AVENIDA SAQUAREMA, 5578', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0934-03', 'LOJA DIAS D AVILA BA', 'Loja', 'DIAS D''ÁVILA', 'BA', 'CENTRO', 'AVENIDA RAUL SEIXAS, 218', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0778-90', 'SP ARAUJO LEITE', 'DG', 'BAURU', 'SP', 'CENTRO', 'R ARAUJO LEITE QUADRA, 19-70', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 30', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0778-90';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0778-90';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', '2025', 'LISTA 20', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0778-90';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0619-78', 'PR PONTA GROSSA', 'Prédio', 'PONTA GROSSA', 'PR', 'CENTRO', 'AVENIDA DOUTOR VICENTE MACHADO, 525', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0619-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0619-78';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0619-78';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0791-68', 'SP BARAO DE JUNDIAI', '', 'JUNDIAÍ', 'SP', 'CENTRO', 'R BARAO DE JUNDIAI, 1067', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0791-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0791-68';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0791-68';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0041-50', 'SP T MK PLACE I', '', 'SÃO PAULO', 'SP', 'VILA CORDEIRO', 'AV DR CHUCRI ZAIDAN, 940', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0041-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0041-50';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0041-50';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0648-02', 'RS NOVO HAMBURG', 'Prédio', 'NOVO HAMBURGO', 'RS', 'HAMBURGO VELHO', 'AV. JOSÉ BONIFÁCIO, 245', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-10', '2027-07-10'
FROM unidades WHERE cnpj = '02.558.157/0648-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0648-02';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0648-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0689-80', 'DF BSB ZN IND 1', 'Prédio', 'BRASÍLIA', 'DF', 'ZONA INDUSTRIAL (GUARA)', 'STRC TRECHO 04, CONJUNTO B, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 18', 'Vigente', '2025-07-25', '2027-07-25'
FROM unidades WHERE cnpj = '02.558.157/0689-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0689-80';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0689-80';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0585-94', 'SP SÃO BERNARDO', '', 'SÃO BERNARDO DO CAMPO', 'SP', 'CENTRO', 'RUA JOSE BENEDETTI, 99/103', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0585-94';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0585-94';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0585-94';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0582-41', 'SP MAUÁ MATRIZ', '', 'MAUÁ', 'SP', 'MATRIZ', 'AVENIDA CAPITÃO JOÃO, 2100', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0582-41';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0582-41';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0582-41';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0749-56', 'SP CAMPO BELO', '', 'SÃO PAULO', 'SP', 'CAMPO BELO', 'R . VIEIRA DE MORAIS, 153', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0749-56';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0749-56';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0749-56';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0702-92', 'SC BLUMENAU CENTRO', 'Prédio', 'BLUMENAU', 'SC', 'CENTRO', 'RUA PAULO ZIMMERMANN, 121', true, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2029', 'LISTA 28', 'Vigente', '2026-07-31', '2029-07-31'
FROM unidades WHERE cnpj = '02.558.157/0702-92';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0702-92';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0702-92';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0242-66', 'RJ LJ ANGR REIS', 'Loja', 'ANGRA DOS REIS', 'RJ', 'CENTRO', 'RUA DO COMERCIO, 127', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0634-07', 'ES COLATINA CEN', 'Prédio', 'COLATINA', 'ES', 'CENTRO', 'RUA SANTA MARIA, 181', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-08-31', '2027-08-31'
FROM unidades WHERE cnpj = '02.558.157/0634-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0634-07';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 27', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0634-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0164-09', 'SP LJ S STA ÚRS', '', 'RIBEIRÃO PRETO', 'SP', 'CENTRO', 'RUA SAO JOSE LOJAS 101 E 102, 933', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0164-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0164-09';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0164-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0158-60', 'SP MOFARREJ TV', '', 'SÃO PAULO', 'SP', 'VILA LEOPOLDINA', 'AV. MOFARREJ, 1270', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0158-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0158-60';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 30', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0158-60';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0615-44', 'GO GOIÂNIA SETO', 'Prédio', 'GOIÂNIA', 'GO', 'SETOR CENTRAL', 'RUA 2, 339', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-07-31', '2027-07-31'
FROM unidades WHERE cnpj = '02.558.157/0615-44';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0615-44';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 25', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0615-44';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0790-87', 'SP VOL  PIRACICABA', 'Prédio', 'PIRACICABA', 'SP', 'CENTRO', 'R VOLUNTARIOS DE PIRACICABA, 655', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 21', 'Vigente', '2025-12-16', '2027-12-16'
FROM unidades WHERE cnpj = '02.558.157/0790-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2026', 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0790-87';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 21', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0790-87';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0608-15', 'RJ SÃO GONÇALO', 'Prédio', 'SÃO GONÇALO', 'RJ', 'CENTRO', 'RUA CORONEL RODRIGUES, 321', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 17', 'Vigente', '2025-06-20', '2027-06-20'
FROM unidades WHERE cnpj = '02.558.157/0608-15';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 22', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0608-15';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 26', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0608-15';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0555-79', 'BA LJ ALAGOINHA', 'Loja', 'ALAGOINHAS', 'BA', 'CENTRO', 'RUA CORONEL ANISIO CARDOSO, S/N', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0555-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0555-79';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 10', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0555-79';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0579-46', 'SP SANTOS MACUC', 'Prédio', 'SANTOS', 'SP', 'MACUCO', 'AV CONSELHEIRO RODRIGUES ALVES, 347', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 15', 'Vigente', '2025-05-14', '2027-05-14'
FROM unidades WHERE cnpj = '02.558.157/0579-46';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', '2025', 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0579-46';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 15', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0579-46';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('02.558.157/0838-66', 'GO_ITUMBIARA', 'Prédio', 'ITUMBIARA', 'GO', 'ST. CENTRAL', 'RUA DOUTOR MÁRIO GUEDES, 59', false, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2027', 'LISTA 19', 'Vigente', '2025-10-31', '2027-10-31'
FROM unidades WHERE cnpj = '02.558.157/0838-66';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', NULL, 'LISTA 23', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0838-66';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', NULL, 'LISTA 8', 'Vigente'
FROM unidades WHERE cnpj = '02.558.157/0838-66';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-62', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'Morro Doce', 'Rua Coronel José Gladiador - 107', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-62';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-01', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'Anhanguera', 'Rua Jurubim (DG) - 391', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-01';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-02', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'JARAGUA', 'RUA  PASTORIL DE ALMENARA - 200', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-02';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-03', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'MORRO GRANDE', 'Av. ELÍSIO TEIXEIRA LEITE - 3512', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-03';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-04', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'PERUS', 'RUA MOGEIRO, - 305', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-04';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-05', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'BRASILANDIA', 'RUA  PARAPUA   - 1135', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-05';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-06', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'FREGUESIA DO Ó', 'FELICIANO DOMINGUES,PE - 373', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-06';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-07', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'JARAGUÁ', 'RUA CUSTODIO SERRAO - 560', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-07';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-08', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'AGUA BRANCA', 'AV  SAO VICENTE,MARQ  - 2353', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-08';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-09', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'PALMEIRAS', 'RUA  GALVAO,BRIG, 291', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-09';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-10', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'BONGIGLIORI', 'AV HEITOR A EIRAS GARCIA,ENG, 1089', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-10';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-11', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'LAPA', 'RUA  ANDRADE NEVES, 429', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-11';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-12', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'MONTE ALEGRE', 'RUA DIOGO GOMES CARNEIRO,106', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-12';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-13', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'JAGUARÉ', 'RUA  JAGUARE, 390', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-13';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-14', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'PARQUE DOS PRINCIPES', 'RUA RUI AMARAL LEMOS, 463', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-14';
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('02.558.157/0001-15', 'Telefonica Brasil S.A', 'DG', 'São Paulo', 'SPO', 'VILA MADALENA', 'RUA CARD CAGLIORI, 421', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '2024', 'Lista 24', 'Venceu', '2024-03-18', '2026-03-17'
FROM unidades WHERE cnpj = '02.558.157/0001-15';
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('14.336.330/0001-67', 'VALE SAUDE ADMINISTRADORA DE CARTOES LTDA', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('35.473.014/0001-07', 'TELEFÔNICA CLOUD E TECNOLOGIA DO BRASIL S.A.', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('57.487.987/0001-38', 'VIVO PAY SOCIEDADE DE CRÉDITO DIRETO S.A.', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('04.819.724/0001-12', 'TELEFÔNICA TRANSPORTES E LOGÍSTICA LTDA - TGLOG', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('32.578.382/0002-02', 'TELEFONICA CLOUD E TECNOLOGIA DO BRASIL S.A. Filial Berrini', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('32.578.382/0001-21', 'TELEFONICA CLOUD E TECNOLOGIA DO BRASIL S.A.', 'TECH', 'RJ', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('16.593.757/0001-76', 'SAMAUMA BRANDS COMERCIO, IMP EXP ELETRO-ELETR LTDA', 'TECH', 'SP', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0119-54';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0774-67';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0084-90';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0607-34';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0250-76';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0019-91';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0005-96';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0452-63';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0006-77';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0498-46';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0309-08';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0592-13';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0399-64';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0637-50';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0733-99';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0703-73';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0400-32';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0159-41';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0591-32';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0357-05';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0651-08';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0578-65';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0739-84';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0012-15';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0580-80';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0610-30';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0764-95';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0172-19';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0548-40';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0834-32';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0617-06';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0541-73';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0481-06';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0090-38';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0747-94';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0639-11';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0474-79';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0221-31';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0100-44';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0543-35';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0516-62';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0010-53';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0206-00';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0726-60';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0032-69';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0492-50';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0464-05';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0248-51';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0597-28';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0081-47';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0099-76';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0589-18';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0435-62';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0424-00';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0613-82';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0425-90';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0750-90';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0086-51';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0612-00';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0175-61';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0155-18';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0725-89';
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '02.558.157/0718-50';
COMMIT;
