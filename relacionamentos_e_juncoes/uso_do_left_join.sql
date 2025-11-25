SELECT 
  p.product_id, 
  p.product_name, 
  oi.order_id 
FROM products p 
LEFT JOIN order_items oi
  ON p.product_id = oi.product_id; -- Lista todos os produtos e os IDs dos pedidos associados, incluindo produtos sem vendas.

SELECT 
  p.product_id, 
  p.product_name, 
  oi.order_id, 
  COUNT(oi.order_item_id) AS total_vendas 
FROM products p 
LEFT JOIN order_items oi 
  ON p.product_id = oi.product_id 
  GROUP BY p.product_id, p.product_name, oi.order_id 
ORDER BY total_vendas DESC; -- Lista produtos com o total de vendas, incluindo produtos sem vendas, ordenados pelo total de vendas em ordem decrescente.

SELECT 
  p.product_id, 
  p.product_name, 
  oi.order_id
FROM products p 
LEFT JOIN order_items oi 
  ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL 
ORDER BY p.product_name; -- Lista produtos que não foram vendidos, ordenados pelo nome do produto.
