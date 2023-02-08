# Realizando consultas simples

-- Tipos Produtos
-- selecionando tudo da tabela tipos_produtos
SELECT * FROM tipos_produtos;

-- selecionando os campos id e tipo da tabela tipos_produtos
SELECT id, tipo FROM tipos_produtos;

-- selecionando tipo e id da tabela tipos_produtos
SELECT tipo, id FROM tipos_produtos;

-- selecionando id e tipo da tabela tipos_produtos, e ordenando de forma decrescente pelo tipo
SELECT id, tipo FROM tipos_produtos ORDER BY tipo DESC;

-- selecionando tudo da tabela fabricantes
SELECT * FROM fabricantes;

-- selecionando tudo da tabela medicos
SELECT * FROM medicos;

-- selecionando tudo da tabela clientes
SELECT * FROM clientes;

-- selecionando tudo da tabela compras
SELECT * FROM compras;

-- selecionando tudo da tabela produtos_compra
SELECT * FROM produtos_compra;

-- selecionando tudo da tabela produtos_compra e que tenha a quantidade maior que 1
SELECT * FROM produtos_compra WHERE quantidade > 2;

-- selecionando tudo da tabela receitas_medica
SELECT * FROM receitas_medica;
