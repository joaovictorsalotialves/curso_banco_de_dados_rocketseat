SELECT product_id, product_name, price
  FROM products
WHERE price > 100; -- Seleciona produtos com preço maior que 100

SELECT customer_id, first_name || ' ' || last_name AS full_name, city 
  FROM customers
WHERE city = 'Sao Paulo'; -- Seleciona clientes que moram em São Paulo

SELECT order_id, status
  FROM orders
WHERE status <> 'DELIVERED'; -- Seleciona pedidos que não foram entregues

SELECT customer_id, created_at
  FROM customers
WHERE created_at < '2024-06-01'; -- Seleciona clientes criados antes de 1º de junho de 2024

SELECT product_id, product_name, price
  FROM products
WHERE price <= 50; -- Seleciona produtos com preço menor ou igual a 50

-- Inserindo um cliente com sobrenome NULL para demonstração
INSERT INTO customers(customer_id, first_name, last_name, email, city, created_at) 
  VALUES (333, 'João', NULL, 'joao.silva1@exemplo.com', 'Sao Paulo', '2024-05-17');

SELECT *
  FROM customers
WHERE last_name IS NULL; -- Seleciona clientes cujo sobrenome é NULL

SELECT *
  FROM customers
WHERE last_name IS NOT NULL; -- Seleciona clientes cujo sobrenome não é NULL
