SELECT 
  customer_id, 
  order_id, 
  order_date, 
  total_amount, 
  ROW_NUMBER() OVER (
    PARTITION BY customer_id 
    ORDER BY total_amount DESC
  ) AS row_num 
FROM orders; -- Atribui um número sequencial único para cada pedido por cliente, ordenado pelo valor do pedido

SELECT 
  customer_id, 
  order_id, 
  order_date, 
  total_amount, 
  RANK() OVER (
    PARTITION BY customer_id 
    ORDER BY total_amount DESC
  ) AS ranking 
FROM orders; -- Atribui uma classificação para cada pedido por cliente, com empates compartilhando a mesma posição

SELECT 
  customer_id, 
  order_id, 
  order_date, 
  total_amount, 
  DENSE_RANK() OVER (
    PARTITION BY customer_id 
    ORDER BY total_amount DESC
  ) AS posicao 
FROM orders; -- Atribui uma classificação densa para cada pedido por cliente, sem pular posições em caso de empates

SELECT 
  o.customer_id, 
  c.first_name, 
  o.total_amount, 
  ROW_NUMBER() OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.total_amount DESC
  ) AS rn, 
  RANK() OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.total_amount DESC
  ) AS rk, 
  DENSE_RANK() OVER (
    PARTITION BY o.customer_id 
    ORDER BY o.total_amount DESC
  ) AS drk 
FROM orders o 
INNER JOIN customers c 
  ON c.customer_id = o.customer_id 
ORDER BY o.customer_id, rk; -- Compara ROW_NUMBER, RANK e DENSE_RANK para pedidos por cliente ordenados pelo valor do pedido
