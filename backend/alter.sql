ALTER TABLE faturamento_lancamento_unidades ADD COLUMN pgr BOOLEAN DEFAULT false;
ALTER TABLE faturamento_lancamento_unidades ADD COLUMN pgr_valor DECIMAL DEFAULT 0;
ALTER TABLE faturamento_lancamento_unidades ADD COLUMN ltcat BOOLEAN DEFAULT false;
ALTER TABLE faturamento_lancamento_unidades ADD COLUMN ltcat_valor DECIMAL DEFAULT 0;
ALTER TABLE faturamento_lancamento_unidades ADD COLUMN aep_aet BOOLEAN DEFAULT false;
ALTER TABLE faturamento_lancamento_unidades ADD COLUMN aep_aet_valor DECIMAL DEFAULT 0;
