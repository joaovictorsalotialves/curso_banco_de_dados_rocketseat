CREATE INDEX idx_products_category 
  ON products(category_id); -- Criando um índice na coluna category_id

CREATE UNIQUE INDEX idx_department_name_unq 
  ON departments(department_name); -- Criando um índice único na coluna department_name

CREATE INDEX idx_orders_pending 
  ON orders(order_date) 
  WHERE status = 'PENDING'; -- Criando um índice parcial para pedidos pendentes

CREATE INDEX idx_customers_lower_email
  ON customers (LOWER(email)); -- Criando um índice funcional na coluna email em minúsculas
