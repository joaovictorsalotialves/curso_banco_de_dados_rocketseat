CREATE INDEX idx_products_price_hash 
  ON products USING HASH(price); -- Criando um índice hash na coluna price

EXPLAIN ANALYZE 
SELECT * 
FROM products 
WHERE price = 249.37; -- Analisando a consulta com índice hash

ALTER TABLE products 
  ADD COLUMN tags TEXT[]; -- Adicionando uma coluna de array de texto

UPDATE products 
  SET tags = ARRAY['promo', 'novo'] 
  WHERE product_id % 5 = 0; -- Atualizando alguns produtos com tags
