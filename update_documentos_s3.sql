-- Adicionar colunas para suporte a arquivos no MinIO/S3
ALTER TABLE documentos_sst ADD COLUMN IF NOT EXISTS arquivo_nome VARCHAR(255);
ALTER TABLE documentos_sst ADD COLUMN IF NOT EXISTS arquivo_url VARCHAR(1000);
ALTER TABLE documentos_sst ADD COLUMN IF NOT EXISTS arquivo_tipo VARCHAR(100);
ALTER TABLE documentos_sst ADD COLUMN IF NOT EXISTS arquivo_tamanho INTEGER;
