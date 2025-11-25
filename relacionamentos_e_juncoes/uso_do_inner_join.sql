SELECT 
  p.product_id, 
  p.product_name, 
  c.category_id, 
  c.category_name 
FROM products p 
INNER JOIN categories c 
  ON p.category_id = c.category_id 
ORDER BY p.product_id; -- Lista de produtos com suas categorias

SELECT 
  p.product_id AS pid, 
  p.product_name AS nome_produto, 
  c.category_id, 
  c.category_name 
FROM products p 
INNER JOIN categories c 
  ON p.category_id = c.category_id 
WHERE p.price > 100 
ORDER BY pid; -- Produtos com preço maior que 100 e suas categorias
