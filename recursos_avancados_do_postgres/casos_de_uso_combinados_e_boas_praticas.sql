CREATE TEMPORARY TABLE tmp_vendas_2024 AS 
  SELECT * FROM orders 
  WHERE order_date >= '2024-01-01';

CREATE VIEW vw_summary_2024 AS 
  SELECT 
    date_trunc('quarter', order_date) AS trimestre, 
    COUNT (*) AS qtd_pedidos, 
    SUM(total_amount) AS total_vendas 
  FROM tmp_vendas_2024 
  GROUP BY 1;

SELECT * FROM vw_summary_2024 
ORDER BY trimestre;
