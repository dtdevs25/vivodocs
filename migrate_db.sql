-- Refactoring do Banco de Dados VIVO SST para Normalização Total

DO $$
BEGIN

-- 1. Criar a nova tabela central de Unidades
CREATE TABLE unidades_nova (
    id SERIAL PRIMARY KEY,
    cnpj VARCHAR(50) UNIQUE NOT NULL,
    filial VARCHAR(255) NOT NULL,
    tipo_predio VARCHAR(100),
    regional VARCHAR(50),
    uf CHAR(2),
    cidade VARCHAR(255),
    bairro VARCHAR(255),
    endereco TEXT,
    escopo_iso_45001 BOOLEAN DEFAULT FALSE,
    nr_20 BOOLEAN DEFAULT FALSE,
    mes_ano_po VARCHAR(50),
    status_funcionamento VARCHAR(50) DEFAULT 'ATIVA', -- ATIVA ou DESMOBILIZADA
    motivo_desmobilizacao TEXT,
    data_desmobilizacao DATE,
    is_dg BOOLEAN DEFAULT FALSE,
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Migrar dados de unidades_ativas
INSERT INTO unidades_nova (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes, created_at, updated_at)
SELECT cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes, created_at, updated_at
FROM unidades_ativas
ON CONFLICT (cnpj) DO NOTHING;

-- 3. Migrar dados de unidades_desmobilizadas (evitando duplicatas na origem)
INSERT INTO unidades_nova (cnpj, filial, regional, uf, cidade, status_funcionamento, motivo_desmobilizacao, data_desmobilizacao, created_at)
SELECT DISTINCT ON (cnpj) cnpj, filial, regional, uf, cidade, 'DESMOBILIZADA', motivo_desmobilizacao, data_desmobilizacao, created_at
FROM unidades_desmobilizadas
ORDER BY cnpj, id DESC
ON CONFLICT (cnpj) DO UPDATE SET 
    status_funcionamento = 'DESMOBILIZADA',
    motivo_desmobilizacao = EXCLUDED.motivo_desmobilizacao,
    data_desmobilizacao = EXCLUDED.data_desmobilizacao;

-- 4. Migrar dados de distribuidores_gerais_dg para unidades_nova (evitando duplicatas na origem)
INSERT INTO unidades_nova (cnpj, filial, tipo_predio, is_dg, created_at, updated_at)
SELECT DISTINCT ON (cnpj_dg) cnpj_dg, COALESCE(nome_empresa, 'NOME NÃO INFORMADO'), 'DG', TRUE, created_at, updated_at
FROM distribuidores_gerais_dg
WHERE cnpj_dg IS NOT NULL AND cnpj_dg <> ''
ORDER BY cnpj_dg, id DESC
ON CONFLICT (cnpj) DO UPDATE SET 
    is_dg = TRUE,
    tipo_predio = COALESCE(unidades_nova.tipo_predio, 'DG');

-- 5. Criar a nova tabela de Documentos atrelada a unidades_nova
CREATE TABLE documentos_sst_nova (
    id SERIAL PRIMARY KEY,
    unidade_id INTEGER REFERENCES unidades_nova(id) ON DELETE CASCADE,
    tipo_documento VARCHAR(50) NOT NULL, -- PGR, LTCAT, AEP, AET, NR01
    status VARCHAR(50),
    ano VARCHAR(20),
    lista_entrega VARCHAR(100),
    data_revisao DATE,
    data_vencimento DATE,
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Migrar documentos da antiga tabela documentos_sst, fazendo o "de/para" pelo CNPJ da antiga unidades_ativas
INSERT INTO documentos_sst_nova (unidade_id, tipo_documento, status, ano, lista_entrega, data_revisao, data_vencimento, observacoes, created_at, updated_at)
SELECT 
    un.id, 
    d.tipo_documento, 
    d.status, 
    d.ano, 
    d.lista_entrega, 
    d.data_revisao, 
    d.data_vencimento, 
    d.observacoes, 
    d.created_at, 
    d.updated_at
FROM documentos_sst d
JOIN unidades_ativas ua ON d.unidade_id = ua.id
JOIN unidades_nova un ON ua.cnpj = un.cnpj;

-- 7. Migrar os status de documentos que estavam embutidos na tabela distribuidores_gerais_dg para a tabela de documentos_sst_nova
-- PGR
INSERT INTO documentos_sst_nova (unidade_id, tipo_documento, status, data_vencimento)
SELECT un.id, 'PGR', dg.status_pgr, dg.vencimento
FROM distribuidores_gerais_dg dg
JOIN unidades_nova un ON dg.cnpj_dg = un.cnpj
WHERE dg.status_pgr IS NOT NULL AND dg.status_pgr <> '';

-- NR01
INSERT INTO documentos_sst_nova (unidade_id, tipo_documento, status)
SELECT un.id, 'NR01', dg.status_nr01
FROM distribuidores_gerais_dg dg
JOIN unidades_nova un ON dg.cnpj_dg = un.cnpj
WHERE dg.status_nr01 IS NOT NULL AND dg.status_nr01 <> '';

-- LTCAT
INSERT INTO documentos_sst_nova (unidade_id, tipo_documento, status)
SELECT un.id, 'LTCAT', dg.status_ltcat
FROM distribuidores_gerais_dg dg
JOIN unidades_nova un ON dg.cnpj_dg = un.cnpj
WHERE dg.status_ltcat IS NOT NULL AND dg.status_ltcat <> '';

-- AET
INSERT INTO documentos_sst_nova (unidade_id, tipo_documento, status)
SELECT un.id, 'AET', dg.status_aet
FROM distribuidores_gerais_dg dg
JOIN unidades_nova un ON dg.cnpj_dg = un.cnpj
WHERE dg.status_aet IS NOT NULL AND dg.status_aet <> '';

-- 8. Dropar tabelas antigas em cascata para remover as foreign keys velhas
DROP TABLE IF EXISTS documentos_sst CASCADE;
DROP TABLE IF EXISTS distribuidores_gerais_dg CASCADE;
DROP TABLE IF EXISTS unidades_desmobilizadas CASCADE;
DROP TABLE IF EXISTS unidades_ativas CASCADE;

-- 9. Renomear as tabelas novas para os nomes finais oficiais
ALTER TABLE unidades_nova RENAME TO unidades;
ALTER TABLE documentos_sst_nova RENAME TO documentos_sst;

-- 10. Recriar os índices de performance nas tabelas novas
CREATE INDEX idx_unidades_cnpj ON unidades(cnpj);
CREATE INDEX idx_documentos_sst_unidade_id ON documentos_sst(unidade_id);
CREATE INDEX idx_documentos_sst_vencimento ON documentos_sst(data_vencimento);

-- 11. Recriar os triggers
CREATE TRIGGER update_unidades_modtime
BEFORE UPDATE ON unidades
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_documentos_sst_modtime
BEFORE UPDATE ON documentos_sst
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

END $$;
