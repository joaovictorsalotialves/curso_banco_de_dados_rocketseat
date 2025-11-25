SELECT oi.product_id, SUM(oi.quantity) AS qtd_total 
  FROM order_items oi 
GROUP BY oi.product_id 
ORDER BY SUM(oi.quantity) DESC 
LIMIT 10; -- Top 10 produtos mais vendidos

SELECT o.customer_id, SUM(o.total_amount) AS faturamento_total 
  FROM orders o 
GROUP BY o.customer_id 
ORDER BY faturamento_total DESC 
LIMIT 5; -- Top 5 clientes com maior faturamento
