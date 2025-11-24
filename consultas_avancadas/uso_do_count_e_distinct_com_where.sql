SELECT COUNT(*) AS total_pedidos 
  FROM orders; -- Total de pedidos na tabela orders

SELECT COUNT(orders.total_amount) AS total_amount_nao_nulos 
  FROM orders; -- Total de pedidos com valor não nulo na coluna total_amount

SELECT COUNT(customers.last_name) AS total_customers_nao_nulos 
  FROM customers; -- Total de clientes com sobrenome não nulo

SELECT COUNT(DISTINCT customers.last_name) AS total_customers_nao_nulos 
  FROM customers; -- Total de sobrenomes distintos não nulos

SELECT DISTINCT customers.last_name 
  FROM customers; -- Lista de sobrenomes distintos na tabela customers

SELECT COUNT(DISTINCT o.customer_id) AS clientes_unicos 
  FROM orders o; -- Total de clientes únicos que fizeram pedidos 

SELECT COUNT(price) AS produtos_com_preco 
  FROM products;  -- Total de produtos com preço não nulo
