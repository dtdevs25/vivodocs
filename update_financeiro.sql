-- Tabela principal para os lançamentos financeiros
CREATE TABLE IF NOT EXISTS faturamento_lancamentos (
    id SERIAL PRIMARY KEY,
    lista_lote VARCHAR(100) NOT NULL,
    justificativa TEXT,
    
    qtd_pgr INTEGER DEFAULT 0,
    valor_unit_pgr NUMERIC(10,2) DEFAULT 0.00,
    
    qtd_ltcat INTEGER DEFAULT 0,
    valor_unit_ltcat NUMERIC(10,2) DEFAULT 0.00,
    
    qtd_aep INTEGER DEFAULT 0,
    valor_unit_aep NUMERIC(10,2) DEFAULT 0.00,
    
    qtd_aet INTEGER DEFAULT 0,
    valor_unit_aet NUMERIC(10,2) DEFAULT 0.00,
    
    qtd_insalubridade INTEGER DEFAULT 0,
    valor_unit_insalubridade NUMERIC(10,2) DEFAULT 0.00,
    
    qtd_diversos INTEGER DEFAULT 0,
    valor_unit_diversos NUMERIC(10,2) DEFAULT 0.00,
    
    desconto NUMERIC(10,2) DEFAULT 0.00,
    valor_total NUMERIC(10,2) DEFAULT 0.00,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de relacionamento para salvar quais CNPJs foram selecionados no lançamento
CREATE TABLE IF NOT EXISTS faturamento_lancamento_unidades (
    lancamento_id INTEGER REFERENCES faturamento_lancamentos(id) ON DELETE CASCADE,
    unidade_id INTEGER REFERENCES unidades(id) ON DELETE CASCADE,
    PRIMARY KEY (lancamento_id, unidade_id)
);
