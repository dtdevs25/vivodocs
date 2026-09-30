-- Seed script para popular o banco de dados VIVO SST com dados fictícios para visualização no Dashboard

INSERT INTO unidades (cnpj, filial, tipo_predio, status_funcionamento, is_dg, compoe_sesmt, escopo_iso_45001) VALUES
('00.000.000/0001-01', 'Matriz SP', 'Corporativo', 'ATIVA', TRUE, TRUE, TRUE),
('00.000.000/0001-02', 'Filial RJ', 'Loja', 'ATIVA', FALSE, TRUE, FALSE),
('00.000.000/0001-03', 'Filial MG', 'Loja', 'ATIVA', FALSE, FALSE, FALSE),
('00.000.000/0001-04', 'CD SP', 'CD', 'ATIVA', FALSE, TRUE, TRUE),
('00.000.000/0001-05', 'Antiga Filial RS', 'Loja', 'DESMOBILIZADA', FALSE, FALSE, FALSE);

-- Assumindo que os IDs gerados acima foram 1 a 5, caso a tabela estivesse vazia.
-- Inserindo documentos (PGR, LTCAT, AET)
INSERT INTO documentos_sst (unidade_id, tipo_documento, status, ano, data_vencimento) VALUES
-- Matriz (Tudo Vigente)
(1, 'PGR', 'Vigente', '2026', '2026-12-31'),
(1, 'LTCAT', 'Vigente', '2026', '2026-12-31'),
(1, 'AET', 'Vigente', '2026', '2026-12-31'),

-- Filial RJ (PGR e LTCAT vencendo)
(2, 'PGR', 'Vigente', '2025', '2025-06-30'),
(2, 'LTCAT', 'Vigente', '2025', '2025-06-30'),
(2, 'AET', 'Vigente', '2026', '2026-12-31'),

-- Filial MG (Vencidos)
(3, 'PGR', 'Venceu', '2024', '2024-01-01'),
(3, 'LTCAT', 'Venceu', '2024', '2024-01-01'),

-- CD SP
(4, 'PGR', 'Vigente', '2026', '2026-12-31'),
(4, 'LTCAT', 'Vigente', '2026', '2026-12-31'),
(4, 'AET', 'Venceu', '2023', '2023-12-31');
