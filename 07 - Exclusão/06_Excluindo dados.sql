-- Excluindo dados

-- deletando tudo da tabela produtos_compra
SELECT * FROM produtos_compra;

-- deletando tudo da tabela receitas_medica
SELECT * FROM receitas_medica;

-- deletando um dado da tabela receitas_medica que possua o id_produto_compra igual a 3
DELETE FROM receitas_medica WHERE id_produto_compra = 3;

-- deletando um dado da tabela produtos_compra que possua o id igual a 3
DELETE FROM produtos_compra WHERE id = 3;