-- Schema Final for VIVO SST (Normalized)

CREATE TABLE unidades (
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
    compoe_sesmt BOOLEAN DEFAULT FALSE,
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos_sst (
    id SERIAL PRIMARY KEY,
    unidade_id INTEGER REFERENCES unidades(id) ON DELETE CASCADE,
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
    observacoes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(50) NOT NULL CHECK (nivel_acesso IN ('master', 'admin', 'editor', 'visualizador')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sistema_logs (
    id SERIAL PRIMARY KEY,
    usuario_email VARCHAR(255),
    acao VARCHAR(255),
    detalhes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_unidades_cnpj ON unidades(cnpj);
CREATE INDEX idx_documentos_sst_unidade_id ON documentos_sst(unidade_id);
CREATE INDEX idx_documentos_sst_vencimento ON documentos_sst(data_vencimento);

-- Triggers for updated_at
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_unidades_modtime
BEFORE UPDATE ON unidades
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_documentos_sst_modtime
BEFORE UPDATE ON documentos_sst
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_faturamento_modtime
BEFORE UPDATE ON faturamento_medicoes
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_usuarios_modtime
BEFORE UPDATE ON usuarios
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
