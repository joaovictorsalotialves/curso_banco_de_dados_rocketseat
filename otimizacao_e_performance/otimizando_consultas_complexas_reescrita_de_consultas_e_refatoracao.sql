SELECT 
  o.order_id, (
    SELECT COUNT (*) 
    FROM order_items oi 
    WHERE oi.order_id = o.order_id
  ) AS itens 
FROM orders o 
WHERE o.status = 'DELIVERED'; -- Consulta original com subconsulta correlacionada

SELECT 
  o.order_id, 
  COUNT (oi.order_id) AS itens 
FROM orders o 
LEFT JOIN order_items oi 
  ON o.order_id = oi.order_id 
WHERE o.status = 'DELIVERED' 
GROUP BY o.order_id; -- Consulta refatorada utilizando junção e agregação

WITH soma_itens AS (
  SELECT 
    order_id, 
    SUM(quantity * unit_price
  ) AS subtotal 
  FROM order_items 
  GROUP BY order_id
) 
SELECT o.order_id, o.total_amount, si.subtotal 
FROM orders o 
INNER JOIN soma_itens si 
  ON si.order_id = o.order_id 
WHERE o.status = 'DELIVERED'; -- Consulta refatorada utilizando CTE para pré-agregar dados
