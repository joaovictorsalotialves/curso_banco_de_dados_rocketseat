CREATE TEMPORARY TABLE tmp_pedidos_junho AS 
  SELECT * FROM orders 
  WHERE order_date BETWEEN '2024-06-01' AND '2024-06-30';

CREATE TEMPORARY TABLE tmp_clientes_ativos AS 
  SELECT DISTINCT 
    c.customer_id, 
    c.first_name || ' ' || c.last_name AS nome_completo 
  FROM customers c 
  JOIN orders o 
    ON c.customer_id = o.customer_id 
  WHERE o.order_date BETWEEN '2024-04-01' AND '2024-06-30';

SELECT 
  t.nome_completo, 
  COUNT(o.order_id) AS total_pedidos 
FROM tmp_clientes_ativos t 
JOIN orders o 
  ON t.customer_id = o.customer_id 
GROUP BY t.nome_completo 
ORDER BY total_pedidos DESC;
