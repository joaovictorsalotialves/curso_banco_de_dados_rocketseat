SELECT DISTINCT c.city 
FROM customers c 
INNER JOIN orders o 
  ON c.customer_id = o.customer_id; -- Lista cidades distintas dos clientes que fizeram pedidos.

SELECT 
  CONCAT(c.first_name, ' ', c.last_name) AS nome_completo,
  TO_CHAR(o.order_date, 'DD/MM/YYYY') AS data_formatada 
FROM customers c 
INNER JOIN orders o 
  ON c.customer_id = o.customer_id; -- Exibe o nome completo do cliente e a data do pedido em formato DD/MM/YYYY.

SELECT 
  c.customer_id, 
  CONCAT(c.first_name, ' ', c.last_name) AS cliente, 
  COUNT(o.order_id) AS total_pedidos 
FROM customers c 
INNER JOIN orders o 
  ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_pedidos DESC; -- Lista clientes com o total de pedidos feitos, ordenados pelo número de pedidos em ordem decrescente.

SELECT 
  o.order_id, 
  CONCAT(c.first_name, ' ', c.last_name) AS cliente_completo, 
  TO_CHAR(o.order_date, 'DD-Mon-YYYY') AS data_legivel 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
ORDER BY o.order_date DESC; -- Exibe o ID do pedido, nome completo do cliente e a data do pedido em formato legível, ordenados por data do pedido em ordem decrescente.
