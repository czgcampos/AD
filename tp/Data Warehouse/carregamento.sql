INSERT INTO northwind_dw.dim_cliente
	SELECT * FROM northwind_ar.ar_cliente;

INSERT INTO northwind_dw.dim_expedidor
	SELECT * FROM northwind_ar.ar_expedidor;

INSERT INTO northwind_dw.dim_funcionario
	SELECT * FROM northwind_ar.ar_funcionario;

INSERT INTO northwind_dw.dim_fornecedor
	SELECT * FROM northwind_ar.ar_fornecedor;

INSERT INTO northwind_dw.dim_produto
	SELECT * FROM northwind_ar.ar_produto;

INSERT INTO northwind_dw.dim_data
	SELECT * FROM northwind_ar.ar_data;

INSERT INTO northwind_dw.tf_encomendas (idEncomenda,produto,fornecedor,expedidor,funcionario,cliente,dataPedido,dataPagamento,dataEnvio,quantidade,precoTotal,precoUnidade,precoEnvio,desconto)
	SELECT * FROM northwind_ar.ar_encomendas;