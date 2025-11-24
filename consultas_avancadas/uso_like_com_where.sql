SELECT customer_id, first_name 
  FROM customers 
WHERE first_name LIKE 'Ju%'; -- Nomes que começam com "Ju"

SELECT customer_id, first_name, last_name 
  FROM customers 
WHERE last_name LIKE '%Silva'; -- Nomes que terminam com "Silva"

SELECT customer_id, first_name, last_name 
  FROM customers 
WHERE first_name LIKE '%ia%'; -- Nomes que contêm "ia" em qualquer posição

SELECT product_id, product_name 
  FROM products 
WHERE product_name LIKE '_roduto 1%'; -- Nomes que têm qualquer caractere seguido de "roduto 1" no início
