SELECT 
  c.customer_id, 
  c.first_name, 
  c.last_name, 
  o.order_id 
FROM orders o 
RIGHT JOIN customers c 
  ON o.customer_id = c.customer_id; -- Lista todos os clientes e os IDs dos pedidos associados, incluindo clientes sem pedidos.
