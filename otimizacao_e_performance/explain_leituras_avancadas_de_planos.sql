CREATE INDEX idx_price 
  ON products(price); -- Criando um índice na coluna price da tabela products

SET enable_seqscan = off; -- Desabilitando varreduras sequenciais

EXPLAIN ANALYZE 
SELECT * 
FROM products 
WHERE price > 300; -- Consulta que se beneficia do índice criado

SET enable_seqscan = on; -- Reabilitando varreduras sequenciais

EXPLAIN ANALYZE 
SELECT o.order_id, c.first_name, c.last_name 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
WHERE o.status = 'SHIPPED'; -- Consulta com junção entre orders e customers
