WITH vendas_mensais AS (
  SELECT 
    DATE_TRUNC('month', order_date) AS mes, 
    SUM(total_amount) AS total_vendas 
  FROM orders 
  GROUP BY mes
) 
SELECT 
  mes, 
  total_vendas, 
  LAG(total_vendas) OVER (ORDER BY mes) AS vendas_anterior, 
  total_vendas - LAG(total_vendas) OVER (ORDER BY mes) AS diferenca 
FROM vendas_mensais 
ORDER BY mes; -- Esta consulta calcula as vendas mensais e a diferença em relação ao mês anterior usando a função LAG.

WITH vendas_mensais AS (
  SELECT 
    DATE_TRUNC('month', order_date) AS mes, 
    SUM(total_amount) AS total_vendas 
  FROM orders 
  GROUP BY mes
) 
SELECT 
  mes, 
  total_vendas, 
  LEAD(total_vendas) OVER (ORDER BY mes) AS vendas_proximo_mes 
FROM vendas_mensais 
ORDER BY mes; -- Esta consulta calcula as vendas mensais e mostra as vendas do mês seguinte usando a função LEAD.
