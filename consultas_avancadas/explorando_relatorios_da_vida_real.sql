SELECT 
  product_id, 
  SUM(quantity) AS total_unidades_vendidas 
FROM order_items 
GROUP BY product_id 
ORDER BY SUM(quantity) DESC 
LIMIT 5; -- Top 5 produtos mais vendidos

SELECT 
  DATE_TRUNC('month', order_date) AS mes_ano, 
  SUM(total_amount) AS receita_total_mes 
FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY DATE_TRUNC('month', order_date) 
ORDER BY DATE_TRUNC('month', order_date); -- Receita mensal para o ano de 2024

SELECT 
  customer_id, 
  COUNT(order_id) AS total_compras 
FROM orders 
GROUP BY customer_id 
HAVING COUNT(order_id) > 0 
ORDER BY COUNT(order_id) DESC; -- Clientes com mais compras
