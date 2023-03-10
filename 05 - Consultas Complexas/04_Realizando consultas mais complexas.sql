# Consulta complexa

-- compras

-- Passo 1 - Trazer as compras
SELECT * FROM compras;

-- Passo 2 - Colocar o nome dos clientes nas compras
SELECT com.id AS 'ID Compra', cli.nome AS 'Cliente', com.data_compra AS 'Data Compra' 
	FROM compras AS com, clientes AS cli WHERE com.id_cliente = cli.id;
    
-- Passo 3 - Produtos Compra
SELECT * FROM produtos_compra;

-- Passo 4 - Assim como em cima, utilizaremos alias para os campos
-- realizando a soma, e chamando de total
SELECT  com.id AS 'Compra', 
    cli.nome AS 'Cliente',
    SUM(prod.preco_venda * proc.quantidade) AS 'Total',
    com.data_compra AS 'Data da Compra'
    FROM produtos_compra AS proc, produtos AS prod, compras AS com, clientes AS cli
    WHERE com.id = proc.id_compra AND prod.id = proc.id_produto AND cli.id = com.id_cliente
    GROUP BY com.id;
