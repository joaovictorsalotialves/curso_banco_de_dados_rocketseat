SELECT 
  product_id, 
  SUM(quantity) AS total_unidades_vendidas 
FROM order_items 
GROUP BY product_id 
ORDER BY SUM(quantity) DESC 
LIMIT 5; -- Top 5 produtos mais vendidos

SELECT 
  DATE_TRUNC('month', order_date) AS mes_ano, 
  SUM(total_amount) AS receita_total_mes 
FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY DATE_TRUNC('month', order_date) 
ORDER BY DATE_TRUNC('month', order_date); -- Receita mensal para o ano de 2024

SELECT 
  customer_id, 
  COUNT(order_id) AS total_compras 
FROM orders 
GROUP BY customer_id 
HAVING COUNT(order_id) > 0 
ORDER BY COUNT(order_id) DESC; -- Clientes com mais compras

SELECT 
  product_id, 
  SUM(quantity) AS total_jan_fev 
FROM order_items 
WHERE order_id IN (
    SELECT order_id 
    FROM orders 
    WHERE order_date BETWEEN '2024-01-01' AND '2024-02-29'
  ) 
GROUP BY product_id 
HAVING SUM(quantity) > 1 
ORDER BY SUM(quantity) DESC; -- Produtos com mais de 1 unidade vendida em Jan e Fev de 2024

SELECT 
  order_id, 
  customer_id, 
  order_date, 
  total_amount 
FROM orders 
WHERE status = 'SHIPPED' 
  AND order_date BETWEEN '2024-03-01' AND '2024-03-31' 
ORDER BY total_amount DESC; -- Pedidos enviados em Março de 2024 ordenados pelo valor total

SELECT SUM(quantity) AS unidades_produto_10_fev 
FROM order_items 
WHERE product_id = 10 
  AND order_id IN (
    SELECT order_id 
    FROM orders 
    WHERE order_date BETWEEN '2024-02-01' AND '2024-02-29'
  ); -- Total de unidades vendidas do produto com ID 10 em Fevereiro de 2024

SELECT 
  DATE_TRUNC('quarter', order_date) AS trimestre, 
  SUM(total_amount) AS receita_trimestre 
FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY DATE_TRUNC('quarter', order_date) 
ORDER BY DATE_TRUNC('quarter', order_date); -- Receita por trimestre em 2024

SELECT 
  DATE_TRUNC('month', order_date) AS mes_ano, 
  AVG(total_amount) AS ticket_medio 
FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY DATE_TRUNC('month', order_date) 
ORDER BY DATE_TRUNC('month', order_date); -- Ticket médio mensal em 2024

SELECT 
  order_date, 
  COUNT(order_id) AS total_pedidos, 
  SUM(total_amount) AS receita_diaria 
FROM orders 
WHERE order_date BETWEEN '2024-06-01' AND '2024-06-07' 
GROUP BY order_date 
ORDER BY order_date; -- Análise diária de pedidos e receita na primeira semana de Junho de 2024
