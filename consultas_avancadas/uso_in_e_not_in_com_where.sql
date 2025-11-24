SELECT order_id, status 
  FROM orders 
WHERE status IN ('PENDING', 'SHIPPED'); -- Seleciona pedidos com status PENDING ou SHIPPED

SELECT product_id, category_id 
  FROM products 
WHERE category_id IN (1, 3, 5); -- Seleciona produtos que pertencem às categorias 1, 3 ou 5

SELECT customer_id, city
  FROM customers 
WHERE city IN ('Manaus', 'Recife', 'Fortaleza'); -- Seleciona clientes que moram em Manaus, Recife ou Fortaleza

SELECT product_id, product_name, category_id 
  FROM products 
WHERE category_id NOT IN (2, 4, 6); -- Seleciona produtos que não pertencem às categorias 2, 4 ou 6

SELECT product_id, product_name , category_id
  FROM products 
WHERE category_id IS NOT NULL 
  AND category_id NOT IN (2, 4, 6); -- Seleciona produtos que possuem categoria e que não pertencem às categorias 2, 4 ou 6
