CREATE INDEX idx_price 
  ON products(price);

SET enable_seqscan = off;

EXPLAIN ANALYZE 
SELECT * 
FROM products 
WHERE price > 300;

SET enable_seqscan = on;

EXPLAIN ANALYZE 
SELECT o.order_id, c.first_name, c.last_name 
FROM orders o 
INNER JOIN customers c 
  ON o.customer_id = c.customer_id 
WHERE o.status = 'SHIPPED';
