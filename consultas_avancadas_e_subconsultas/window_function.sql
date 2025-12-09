SELECT 
  o.customer_id, 
  c.first_name, 
  o.order_id, 
  o.order_date, 
  o.total_amount, 
  SUM(o.total_amount) OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.order_date
  ) AS total_acumulado 
FROM orders o 
JOIN customers c 
  ON c.customer_id = o.customer_id 
ORDER BY o.customer_id, o.order_date; -- Exibe o total acumulado de pedidos por cliente ao longo do tempo

SELECT 
  o.customer_id, 
  c.first_name, 
  o.order_id, 
  o.total_amount, 
  ROUND(100.0 * o.total_amount / SUM(o.total_amount) OVER (
    PARTITION BY o.customer_id
  ), 2) AS percentual_sobre_total 
FROM orders o 
JOIN customers c 
  ON c.customer_id = o.customer_id 
ORDER BY o.customer_id, o.order_date; -- Exibe o percentual de cada pedido sobre o total de pedidos do cliente
