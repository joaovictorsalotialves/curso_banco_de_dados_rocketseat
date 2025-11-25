SELECT product_id, COUNT(*) AS total_vendas 
  FROM order_items 
GROUP BY product_id; -- Conta o número de vendas por produto

SELECT product_id, SUM(quantity) AS total_quantidade 
  FROM order_items 
GROUP BY product_id; -- Soma a quantidade total vendida por produto

SELECT status, COUNT(*) AS qtde_pedidos 
  FROM orders 
GROUP BY status; -- Conta o número de pedidos por status

SELECT city, COUNT(*) AS total_clientes 
  FROM customers 
GROUP BY city; -- Conta o número de clientes por cidade
