CREATE TABLE orders_part (
  order_id INT GENERATED ALWAYS AS IDENTITY, 
  customer_id INT, 
  status VARCHAR (20), 
  order_date DATE, 
  total_amount NUMERIC(12,2)
) PARTITION BY LIST (status); -- Particionamento por lista

CREATE TABLE orders_shipped 
  PARTITION OF orders_part 
  FOR VALUES IN ('SHIPPED'); -- Partição para pedidos enviados

CREATE TABLE orders_delivered 
  PARTITION OF orders_part 
  FOR VALUES IN ('DELIVERED'); -- Partição para pedidos entregues

INSERT INTO orders_part (customer_id, status, order_date, total_amount) 
  VALUES (123, 'SHIPPED', '2024-06-10', 150.00); -- Inserção em partição específica

CREATE TABLE customers_part (
  customer_id INT PRIMARY KEY, 
  name TEXT
) PARTITION BY HASH (customer_id); -- Particionamento por hash

CREATE TABLE customers_part_0 
  PARTITION OF customers_part 
  FOR VALUES WITH (MODULUS 4, REMAINDER 0); -- Partição para hash 0

CREATE TABLE customers_part_1 
  PARTITION OF customers_part 
  FOR VALUES WITH (MODULUS 4, REMAINDER 1); -- Partição para hash 1

CREATE TABLE customers_part_2 
  PARTITION OF customers_part 
  FOR VALUES WITH (MODULUS 4, REMAINDER 2); -- Partição para hash 2

CREATE TABLE customers_part_3 
  PARTITION OF customers_part 
  FOR VALUES WITH (MODULUS 4, REMAINDER 3); -- Partição para hash 3

INSERT INTO customers_part (customer_id, name) 
  VALUES (101, 'Alice'); -- Inserção em partição específica

CREATE TABLE orders_pending 
  PARTITION OF orders_part 
  FOR VALUES IN ('PENDING'); -- Partição para pedidos pendentes

CREATE TABLE orders_failed 
  PARTITION OF orders_part 
  FOR VALUES IN ('FAILED'); -- Partição para pedidos falhados

CREATE TABLE orders_default 
  PARTITION OF orders_part DEFAULT; -- Partição padrão para outros status

INSERT INTO orders_part (status, customer_id) 
  VALUES ('CANCELLED', 321); -- Inserção em partição padrão

SELECT * FROM orders_default; -- Consulta na partição padrão
