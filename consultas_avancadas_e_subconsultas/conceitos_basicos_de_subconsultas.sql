SELECT 
  first_name, 
  last_name 
FROM customers 
WHERE customer_id IN (
  SELECT customer_id 
  FROM orders
); -- Esta consulta seleciona os nomes e sobrenomes dos clientes que têm pedidos registrados na tabela de pedidos.

SELECT 
  product_name, 
  price 
FROM products 
WHERE price > (
  SELECT AVG(price) 
  FROM products
); -- Esta consulta seleciona os produtos cujo preço é maior que a média dos preços de todos os produtos.

SELECT 
  order_id, 
  total_amount 
FROM orders 
WHERE total_amount = (
  SELECT MAX(total_amount) 
  FROM orders
); -- Esta consulta seleciona o pedido com o valor total mais alto.

SELECT 
  product_id, 
  product_name 
FROM products p 
WHERE EXISTS (
  SELECT 1 
  FROM order_items oi 
  WHERE oi.product_id = p.product_id
); -- Esta consulta seleciona os produtos que foram incluídos em pelo menos um item de pedido.

SELECT 
  product_name, 
  price, (
    SELECT AVG(price) 
    FROM products p2 
    WHERE p2.category_id = p1.category_id
  ) AS media_categoria 
FROM products p1; -- Esta consulta seleciona o nome do produto, o preço e a média de preços dos produtos na mesma categoria.
