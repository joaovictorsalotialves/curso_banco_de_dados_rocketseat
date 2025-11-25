SELECT 
  o.order_id, 
  o.customer_id, 
  c.first_name || ' ' || c.last_name AS cliente, 
  o.order_date, 
  o.status, 
  o.total_amount 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
    AND o.order_date >= c.created_at 
ORDER BY o.order_date DESC 
LIMIT 20; -- Lista de pedidos com informações dos clientes, garantindo que a data do pedido seja posterior à criação do cliente
