SELECT 
  p.product_id,
  p.product_name, 
  c.category_id, 
  c.category_name 
FROM products p 
FULL JOIN categories c 
  ON p.category_id = c.category_id 
ORDER BY c.category_id, p.product_id; -- Retorna todos os produtos e categorias, mesmo que não haja correspondência entre eles.

SELECT 
  o.order_id, 
  o.customer_id AS pedido_customer_id, 
  o.order_date, 
  o.status, 
  c.customer_id AS cliente_customer_id, 
  c.first_name || ' ' || c.last_name AS cliente,
  c.city 
FROM orders o 
FULL JOIN customers c 
  ON o.customer_id = c.customer_id 
ORDER BY o.order_date DESC; -- Retorna todos os pedidos e clientes, mesmo que não haja correspondência entre eles.
