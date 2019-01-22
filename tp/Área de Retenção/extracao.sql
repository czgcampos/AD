INSERT INTO northwind_ar.ar_cliente
	SELECT id, CONCAT(first_name," ",last_name), company, city, state_province FROM northwind.customers;

INSERT INTO northwind_ar.ar_cliente
	VALUES (0,"unknown","unknown","unknown","unknown");

INSERT INTO northwind_ar.ar_expedidor
	SELECT id, company FROM northwind.shippers;
    
INSERT INTO northwind_ar.ar_expedidor
	VALUES (0,"unknown");

INSERT INTO northwind_ar.ar_funcionario
	SELECT id, CONCAT(first_name," ",last_name), job_title, city FROM northwind.employees;

INSERT INTO northwind_ar.ar_funcionario
	VALUES (0,"unknown","unknown","unknown");

INSERT INTO northwind_ar.ar_fornecedor
	SELECT id, company FROM northwind.suppliers;
    
INSERT INTO northwind_ar.ar_fornecedor
	VALUES (0,"unknown");

INSERT INTO northwind_ar.ar_produto
	SELECT id, product_name, quantity_per_unit, category FROM northwind.products;

INSERT INTO northwind_ar.ar_produto
	VALUES (0,"unknown","unknown","unknown");

INSERT INTO northwind_ar.ar_data
	SELECT CAST(CONCAT(YEAR(order_date),0,MONTH(order_date),0,DAY(order_date)) AS UNSIGNED),
	DATE(order_date), WEEKDAY(order_date), DAY(order_date), MONTH(order_date), YEAR(order_date), QUARTER(order_date), FLOOR((QUARTER(order_date)/3)+1)
	FROM northwind.orders WHERE order_date IS NOT NULL
	UNION 
	SELECT CAST(CONCAT(YEAR(shipped_date),0,MONTH(shipped_date),0,DAY(shipped_date)) AS UNSIGNED),
	DATE(shipped_date), WEEKDAY(shipped_date), DAY(shipped_date), MONTH(shipped_date), YEAR(shipped_date), QUARTER(shipped_date), FLOOR((QUARTER(shipped_date)/3)+1)
	FROM northwind.orders WHERE shipped_date IS NOT NULL
	UNION 
	SELECT CAST(CONCAT(YEAR(paid_date),0,MONTH(paid_date),0,DAY(paid_date)) AS UNSIGNED),
	DATE(paid_date), WEEKDAY(paid_date), DAY(paid_date), MONTH(paid_date), YEAR(paid_date), QUARTER(paid_date), FLOOR((QUARTER(paid_date)/3)+1)
	FROM northwind.orders WHERE paid_date IS NOT NULL;

INSERT INTO northwind_ar.ar_data
	VALUES (0,"unknown","unknown","unknown","unknown","unknown","unknown","unknown");

INSERT INTO northwind_ar.ar_encomendas (idEncomenda,produto,fornecedor,expedidor,funcionario,cliente,dataPedido,dataPagamento,dataEnvio,quantidade,precoTotal,precoUnidade,precoEnvio,desconto)
	SELECT o.id,od.product_id, CAST(SUBSTRING_INDEX(p.supplier_ids,';',1) AS UNSIGNED),o.shipper_id, o.employee_id, o.customer_id, 
	CAST(CONCAT(YEAR(o.order_date),0,MONTH(o.order_date),0,DAY(o.order_date)) AS UNSIGNED),
	CAST(CONCAT(YEAR(o.paid_date),0,MONTH(o.paid_date),0,DAY(o.paid_date)) AS UNSIGNED),
	CAST(CONCAT(YEAR(o.shipped_date),0,MONTH(o.shipped_date),0,DAY(o.shipped_date)) AS UNSIGNED),
	od.quantity, (od.unit_price*od.quantity)-(od.unit_price*od.quantity*od.discount), od.unit_price, o.shipping_fee, od.discount 
	FROM northwind.orders AS o, northwind.order_details AS od, northwind.products AS p
		WHERE od.order_id=o.id AND od.product_id=p.id
	UNION
	SELECT o.id,od.product_id, CAST(SUBSTRING_INDEX(p.supplier_ids,';',-1) AS UNSIGNED),o.shipper_id, o.employee_id, o.customer_id, 
	CAST(CONCAT(YEAR(o.order_date),0,MONTH(o.order_date),0,DAY(o.order_date)) AS UNSIGNED),
	CAST(CONCAT(YEAR(o.paid_date),0,MONTH(o.paid_date),0,DAY(o.paid_date)) AS UNSIGNED),
	CAST(CONCAT(YEAR(o.shipped_date),0,MONTH(o.shipped_date),0,DAY(o.shipped_date)) AS UNSIGNED),
	od.quantity, (od.unit_price*od.quantity)-(od.unit_price*od.quantity*od.discount), od.unit_price, o.shipping_fee, od.discount 
	FROM northwind.orders AS o, northwind.order_details AS od, northwind.products AS p
		WHERE od.order_id=o.id AND od.product_id=p.id