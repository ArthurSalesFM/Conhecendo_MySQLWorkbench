# Inserindo dados de teste - DML

-- Tipos Produtos
INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');

-- Fabricantes
INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive');

-- Medicos
INSERT INTO medicos (nome, crm) VALUES ('Arthur Sales', '123123PB');
INSERT INTO medicos (nome, crm) VALUES ('Joao Silva', '3423423SP');
INSERT INTO medicos (nome, crm) VALUES ('Fábio de Melo', '56546RJ');

-- Clientes
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Felicity Jones','Rua da Paz, 34', '(83) 2345-8899', '34.567-098', 'Campina Grande', '234.789.433-98');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Angelina Jolie','Rua do Ipiranga, 456', '(83) 7544-3234', '56.654-567', 'João Pessoa', '345.678.234-12');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Ricardo Chavez','Rua Certa, 678', '(83) 2678-3984', '12.4569-223', 'Queimadas', '786.123.445-31');
    
-- Produtos
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_fabricante, id_tipo) 
	VALUES ('Dipirona', 'Dores em geral', 'Metilpropileno', '12.44', 1, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_fabricante, id_tipo) 
	VALUES ('Sabonete', 'Limpeza', 'Sei lah', '3.56', 2, 2);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_fabricante, id_tipo) 
	VALUES ('Protetor Solar', 'Protetor Solar', 'Soro de abacate', '98.12', 1, 2);

-- Compras
 INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2019-03-10');
 INSERT INTO compras (id_cliente, data_compra) VALUES (2, '2019-04-15');
 INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2019-05-18');
 
-- Produtos Compra
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 2, 3);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (2, 3, 1);

-- Receitas Medicas
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (3, 2, 'receita2.pdf');


select * from receitas_medica;