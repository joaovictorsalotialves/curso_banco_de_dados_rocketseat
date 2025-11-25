SELECT category_id, COUNT(*) AS qtde_produtos 
  FROM products
GROUP BY category_id 
HAVING COUNT(*) > 5; -- Filtra categorias com mais de 5 produtos

SELECT o.customer_id, COUNT(o.order_id) AS total_pedidos_2024 
  FROM orders o 
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY o.customer_id 
HAVING COUNT(o.order_id) > 3; -- Filtra clientes com mais de 3 pedidos em 2024

SELECT oi.product_id, SUM(oi.quantity) AS unidades_vendidas 
  FROM order_items oi 
GROUP BY oi.product_id 
HAVING SUM(oi.quantity) > 2; -- Filtra produtos com mais de 2 unidades vendidas
