WITH pedidos_por_cliente AS (
  SELECT 
    customer_id, 
    COUNT(*) AS total_pedidos, 
    SUM(total_amount) AS valor_total 
  FROM orders 
  GROUP BY customer_id
) 
SELECT 
  c.first_name, 
  c.last_name, 
  p.total_pedidos, 
  ROUND(p.valor_total / p.total_pedidos, 2) AS ticket_medio 
FROM pedidos_por_cliente p 
INNER JOIN customers c 
  ON c.customer_id = p.customer_id 
ORDER BY ticket_medio DESC; 
-- Esta consulta utiliza uma CTE para calcular o número total de pedidos e o valor total gasto por cada cliente,
-- e depois calcula o ticket médio por cliente, retornando os resultados ordenados pelo ticket médio
