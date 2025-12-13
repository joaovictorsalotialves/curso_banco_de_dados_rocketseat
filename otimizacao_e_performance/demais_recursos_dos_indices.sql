CREATE INDEX CONCURRENTLY index_name 
  ON table_name using btree (column); -- Cria um índice btree de forma concorrente

CREATE INDEX idx_product_name_price 
  ON products (product_name, price); -- Índice composto para consultas que filtram por nome do produto e preço

SELECT COUNT (*) 
FROM products 
WHERE product_name LIKE '%P%' 
  AND price > 100; -- Consulta que se beneficia do índice composto

REINDEX INDEX idx_products_price; -- Recria o índice idx_products_price para otimização

VACUUM (ANALYZE) products; -- Limpa e atualiza as estatísticas da tabela products para melhorar o desempenho das consultas
