CREATE TABLE orders_part (
  order_id INT NOT NULL, 
  customer_id INT, 
  order_date DATE NOT NULL, 
  status VARCHAR(20), 
  total_amount NUMERIC(12, 2), 
  PRIMARY KEY (order_date, order_id)
) PARTITION BY RANGE (order_date); -- Tabela de pedidos particionada por intervalo de datas

CREATE TABLE orders_2024_01 
  PARTITION OF orders_part 
  FOR VALUES FROM ('2024-01-01') TO ('2024-02-01'); -- Partição para pedidos de janeiro de 2024

CREATE TABLE orders_2024_02 
  PARTITION OF orders_part 
  FOR VALUES FROM ('2024-02-01') TO ('2024-03-01'); -- Partição para pedidos de fevereiro de 2024

INSERT INTO orders_part (order_id, customer_id, order_date, status, total_amount) 
  VALUES (250, 123, '2024-01-15', 'SHIPPED', 250.00); -- Inserção na partição de janeiro

INSERT INTO orders_part (order_id, customer_id, order_date, status, total_amount) 
  VALUES (350, 123, '2024-02-15', 'SHIPPED', 250.00); -- Inserção na partição de fevereiro

SELECT * FROM orders_part 
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31'; -- Consulta que acessa apenas a partição de janeiro

SELECT * FROM orders_part 
WHERE order_date BETWEEN '2024-02-01' AND '2024-02-28'; -- Consulta que acessa apenas a partição de fevereiro
