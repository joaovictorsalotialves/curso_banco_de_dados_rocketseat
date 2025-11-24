SELECT product_id, price 
  FROM products 
WHERE price BETWEEN 150 AND 300; -- Seleciona produtos com preço entre 150 e 300

SELECT order_id, order_date
  FROM orders
WHERE order_date BETWEEN '2024-05-01' AND '2024-05-31'; -- Seleciona pedidos feitos em maio de 2024

SELECT product_id, product_name 
  FROM products 
WHERE product_name BETWEEN 'Produto 10' AND 'Produto 20'; -- Seleciona produtos com nomes entre 'Produto 10' e 'Produto 20'