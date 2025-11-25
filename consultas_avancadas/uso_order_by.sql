SELECT product_id, product_name, price 
  FROM products 
ORDER BY price ASC; -- Ordena os produtos pelo preço em ordem crescente

SELECT product_id, product_name, price 
  FROM products 
ORDER BY price DESC; -- Ordena os produtos pelo preço em ordem decrescente

SELECT * FROM customers 
ORDER BY first_name ASC; -- Ordena os clientes pelo primeiro nome em ordem crescente

SELECT * FROM customers 
ORDER BY first_name DESC; -- Ordena os clientes pelo primeiro nome em ordem decrescente

SELECT * FROM customers 
ORDER BY created_at ASC; -- Ordena os clientes pela data de criação em ordem crescente

SELECT * FROM customers 
ORDER BY created_at DESC; -- Ordena os clientes pela data de criação em ordem decrescente

SELECT order_id, status, order_date 
  FROM orders 
ORDER BY status ASC, order_date DESC; -- Ordena os pedidos pelo status em ordem crescente e pela data do pedido em ordem decrescente
