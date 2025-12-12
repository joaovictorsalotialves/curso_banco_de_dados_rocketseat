EXPLAIN ANALYZE 
SELECT * 
FROM products 
WHERE price BETWEEN 100 AND 200; -- Analisando a consulta

CREATE INDEX idx_products_price ON products(price); -- Criando um índice na coluna price
