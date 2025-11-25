SELECT * FROM products p 
LEFT JOIN order_items oi 
  ON p.product_id = oi.product_id 
    AND oi.quantity > 0; -- Aplica o filtro na condição de junção


SELECT * 
FROM (
    SELECT 
      p.product_id, 
      p.product_name, 
      oi.order_id, 
      oi.quantity 
    FROM products p 
    LEFT JOIN order_items oi 
    ON p.product_id = oi.product_id
  ) AS subq 
WHERE subq.quantity > 0 
  OR subq.quantity IS NULL; -- Aplica o filtro após a junção 
