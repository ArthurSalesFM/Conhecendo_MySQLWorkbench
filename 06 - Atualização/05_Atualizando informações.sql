-- atualizando dados

-- visualizando os dados
select * from tipos_produtos;
-- atualizando os dados da tabela tipos_produtos, onde o id é igual a 3
update tipos_produtos set tipo = 'bijuterias' where id = 3;

-- visualizando os dados
select * from produtos;
-- atualizando mais de um campo na tabela produtos de uma vez só, com o id sendo igual a 3
update produtos set preco_venda = 65.23, id_tipo = 1, id_fabricante = 2 where id = 3;