SELECT 
  COALESCE(c.first_name, 'SEM NOME') AS primeiro_nome, 
  COALESCE(c.last_name, 'DESCONHECIDO') AS sobrenome 
FROM customers c; -- Substitui valores NULL por 'SEM NOME' e 'DESCONHECIDO' respectivamente.

SELECT 
  c.customer_id, 
  COALESCE(c.first_name, 'SEM NOME') AS primeiro_nome, 
  COALESCE(c.last_name, 'DESCONHECIDO') AS sobrenome, 
  COALESCE(o.total_amount, 0) AS total_ultimo_pedido 
FROM customers c
LEFT JOIN (
    SELECT 
      customer_id, 
      SUM(total_amount) AS total_amount 
    FROM orders 
    WHERE order_date >= '2024-01-01' 
    GROUP BY customer_id
  ) AS o
ON c.customer_id = o.customer_id; -- Substitui valores NULL por 'SEM NOME', 'DESCONHECIDO' e 0 respectivamente.
