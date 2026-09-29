-- Schema for VIVO SST

CREATE TABLE unidades_ativas (
    id SERIAL PRIMARY KEY,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
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
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos_sst (
    id SERIAL PRIMARY KEY,
    unidade_id INTEGER REFERENCES unidades_ativas(id) ON DELETE CASCADE,
    tipo_documento VARCHAR(50) NOT NULL, -- PGR, LTCAT, AEP
    status VARCHAR(50),
    ano VARCHAR(20),
    lista_entrega VARCHAR(100),
    data_revisao DATE,
    data_vencimento DATE,
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE unidades_desmobilizadas (
    id SERIAL PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL,
    filial VARCHAR(255),
    regional VARCHAR(50),
    uf CHAR(2),
    cidade VARCHAR(255),
    motivo_desmobilizacao TEXT,
    data_desmobilizacao DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE distribuidores_gerais_dg (
    id SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(255),
    cnpj_dg VARCHAR(18),
    status_pgr VARCHAR(50),
    data_emissao DATE,
    vencimento DATE,
    status_nr01 VARCHAR(50),
    status_ltcat VARCHAR(50),
    status_aet VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE faturamento_medicoes (
    id SERIAL PRIMARY KEY,
    lote_entrega VARCHAR(100),
    quantidade_pgr INTEGER DEFAULT 0,
    quantidade_ltcat INTEGER DEFAULT 0,
    quantidade_aet INTEGER DEFAULT 0,
    quantidade_periculosidade INTEGER DEFAULT 0,
    quantidade_insalubridade INTEGER DEFAULT 0,
    valor_unitario_pgr DECIMAL(10, 2) DEFAULT 0,
    valor_unitario_ltcat DECIMAL(10, 2) DEFAULT 0,
    valor_unitario_aet DECIMAL(10, 2) DEFAULT 0,
    valor_bruto DECIMAL(12, 2) DEFAULT 0,
    descontos DECIMAL(12, 2) DEFAULT 0,
    data_envio_pagamento DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_unidades_ativas_cnpj ON unidades_ativas(cnpj);
CREATE INDEX idx_documentos_sst_unidade_id ON documentos_sst(unidade_id);
CREATE INDEX idx_documentos_sst_vencimento ON documentos_sst(data_vencimento);

-- Trigger to update updated_at
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_unidades_ativas_modtime
BEFORE UPDATE ON unidades_ativas
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_documentos_sst_modtime
BEFORE UPDATE ON documentos_sst
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_dg_modtime
BEFORE UPDATE ON distribuidores_gerais_dg
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_faturamento_modtime
BEFORE UPDATE ON faturamento_medicoes
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(50) NOT NULL CHECK (nivel_acesso IN ('master', 'admin', 'editor', 'visualizador')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_usuarios_modtime
BEFORE UPDATE ON usuarios
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
