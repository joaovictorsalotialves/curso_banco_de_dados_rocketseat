WITH vendas_por_cidade AS (
  SELECT 
    c.city, 
    SUM(o.total_amount) AS total_vendas 
  FROM customers c 
  JOIN orders o 
    ON c.customer_id = o.customer_id 
  GROUP BY c.city
) 
SELECT * 
FROM vendas_por_cidade 
WHERE total_vendas > 500
ORDER BY total_vendas DESC; -- CTE não recursiva para calcular vendas totais por cidade e filtrar cidades com vendas acima de 500


WITH vendas_produto AS (
  SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_vendido 
  FROM products p 
  JOIN order_items oi 
    ON p.product_id = oi.product_id 
  GROUP BY p.product_name
) 
SELECT * 
FROM vendas_produto 
ORDER BY total_vendido DESC 
LIMIT 10; -- CTE não recursiva para listar os 10 produtos mais vendidos

WITH RECURSIVE numeros AS (
  SELECT 1 AS n 
  UNION ALL 
  SELECT n + 1 
  FROM numeros 
  WHERE n < 10
) 
SELECT * FROM numeros; -- CTE recursiva para gerar uma sequência de números de 1 a 10
