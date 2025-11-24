SELECT customer_id, first_name, last_name, city
  FROM customers 
WHERE city = 'Sao Paulo'
  AND created_at >= '2024-01-01'; -- Seleciona clientes da cidade de Sao Paulo que foram criados a partir de 1º de janeiro de 2024

SELECT product_id, product_name, price 
  FROM products 
WHERE price < 50 OR price > 400; -- Seleciona produtos com preço menor que 50 ou maior que 400

SELECT order_id, total_amount, status 
  FROM orders 
WHERE (status = 'DELIVERED' OR status = 'SHIPPED') 
  AND total_amount > 300; -- Seleciona pedidos que foram entregues ou enviados e cujo valor total é maior que 300
