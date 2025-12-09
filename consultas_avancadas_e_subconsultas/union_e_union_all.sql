SELECT customer_id, first_name, last_name 
FROM customers 
WHERE customer_id IN (
  SELECT customer_id 
  FROM orders
) 
UNION 
SELECT customer_id, first_name, last_name 
FROM customers 
WHERE customer_id NOT IN (
  SELECT customer_id 
  FROM orders
); -- Usando UNION para combinar clientes que fizeram pedidos com aqueles que não fizeram pedidos

SELECT customer_id, first_name, last_name 
FROM customers 
WHERE customer_id IN (
  SELECT DISTINCT customer_id 
  FROM orders
) 
UNION 
SELECT customer_id, first_name, last_name 
FROM customers 
WHERE customer_id NOT IN (
  SELECT customer_id 
  FROM orders
); -- Usando UNION para combinar clientes que fizeram pedidos com aqueles que não fizeram pedidos, excluindo duplicatas se houver

SELECT product_id, product_name 
FROM products 
WHERE product_id IN (
  SELECT product_id 
  FROM order_items
) 
UNION ALL 
SELECT product_id, product_name 
FROM products 
WHERE product_id NOT IN (
  SELECT product_id 
  FROM order_items
); -- Usando UNION ALL para combinar produtos que foram vendidos com aqueles que não foram vendidos, incluindo todas as duplicatas se houver

WITH uniao_teste AS (
  SELECT 'SP' AS origem, email 
  FROM customers 
  WHERE city = 'Sao Paulo' 
  UNION ALL 
  SELECT 'RJ' AS origem, email 
  FROM customers 
  WHERE city = 'Rio de Janeiro'
) 
SELECT 
  email, 
  COUNT(*) AS ocorrencias 
FROM uniao_teste 
GROUP BY email 
HAVING COUNT(*) > 1; -- Usando UNION ALL para combinar emails de clientes de São Paulo e Rio de Janeiro, e contar ocorrências duplicadas
