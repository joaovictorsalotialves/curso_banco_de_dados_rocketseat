SELECT 
  o.order_id, 
  o.order_date, 
  c.first_name || ' ' || c. last_name AS cliente, 
  c.city,
  p.product_name, 
  oi.quantity, 
  oi.unit_price, 
  (oi.quantity * oi.unit_price) AS subtotal 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
INNER JOIN order_items oi 
  ON o.order_id = oi.order_id 
INNER JOIN products p 
  ON oi.product_id = p.product_id 
WHERE o.status = 'DELIVERED'; -- Exibe detalhes dos pedidos entregues, incluindo informações do cliente e dos produtos.

SELECT 
  o.order_id, 
  o.order_date, 
  c.first_name || ' ' || c. last_name AS cliente, 
  c.city, 
  p.product_name, 
  oi.quantity, 
  oi.unit_price, 
  (oi.quantity * oi.unit_price) AS subtotal 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
INNER JOIN order_items oi 
  ON o.order_id = oi.order_id 
INNER JOIN products p 
  ON oi.product_id = p.product_id 
WHERE o.order_date BETWEEN '2024-06-01' AND '2024-08-31' 
ORDER BY o.order_date DESC; -- Lista pedidos feitos entre 1º de junho de 2024 e 31 de agosto de 2024, ordenados por data do pedido em ordem decrescente.
