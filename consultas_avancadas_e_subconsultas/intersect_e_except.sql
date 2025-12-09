SELECT email 
FROM customers 
WHERE city = 'Sao Paulo' 
INTERSECT 
SELECT email 
FROM customers 
WHERE city = 'Rio de Janeiro'; -- Usando INTERSECT para encontrar emails de clientes que estão tanto em São Paulo quanto no Rio de Janeiro

SELECT product_id, product_name 
FROM products 
EXCEPT 
SELECT DISTINCT p.product_id, p.product_name 
FROM products p 
JOIN order_items oi 
  ON oi.product_id = p.product_id; -- Usando EXCEPT para encontrar produtos que nunca foram vendidos, excluindo duplicatas se houver
