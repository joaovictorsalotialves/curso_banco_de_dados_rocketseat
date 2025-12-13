EXPLAIN ANALYSE 
SELECT * 
FROM customers 
WHERE customer_id = 101; -- Análise do plano de execução para consulta que filtra por customer_id

EXPLAIN 
SELECT * 
FROM products 
WHERE price > 300; -- Plano de execução para consulta que filtra por preço

EXPLAIN ANALYZE 
SELECT * 
FROM products 
WHERE price > 300; -- Análise detalhada do plano de execução para consulta que filtra por preço
