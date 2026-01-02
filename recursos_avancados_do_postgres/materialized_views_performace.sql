CREATE MATERIALIZED VIEW mv_resumo_vendas_mensal AS 
  SELECT 
    date_trunc('month', o.order_date) AS mes, 
    COUNT (o.order_id) AS total_pedidos, 
    SUM(o.total_amount) AS valor_total 
  FROM orders o 
  GROUP BY 1;

SELECT * FROM mv_resumo_vendas_mensal;

REFRESH MATERIALIZED VIEW mv_resumo_vendas_mensal;

CREATE INDEX idx_mv_vendas_mes 
  ON mv_resumo_vendas_mensal(mes);

SELECT * FROM mv_resumo_vendas_mensal 
WHERE mes BETWEEN '2024-01-01' AND '2024-06-01';

CREATE MATERIALIZED VIEW mv_top_clientes_2024 AS 
  SELECT 
    c.customer_id, c.first_name || ' ' || c.last_name AS nome_completo, 
    SUM(o.total_amount) AS total_gasto 
  FROM customers c 
  JOIN orders o 
    ON c.customer_id = o.customer_id 
  WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31' 
  GROUP BY c.customer_id, c.first_name, c.last_name 
  HAVING SUM(o.total_amount) > 500;
