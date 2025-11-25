SELECT 
  c.customer_id, 
  c.first_name, 
  c.last_name, (
    SELECT COUNT (*) 
    FROM orders o 
    WHERE o.customer_id = c.customer_id
  ) AS total_pedidos 
FROM customers c; -- Subconsulta correlacionada para contar pedidos por cliente

SELECT 
  c.customer_id, 
  c.first_name, 
  COUNT(o.order_id) AS total_pedidos 
FROM customers c 
LEFT JOIN orders o 
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name; -- Junção não correlacionada com agregação
