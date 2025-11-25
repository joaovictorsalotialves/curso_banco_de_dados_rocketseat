SELECT 
  cli.customer_id, 
  CONCAT(cli.first_name, ' ', cli. last_name) AS nome_cliente, 
  pd.order_id, 
  TO_CHAR(pd.order_date, 'DD/MM/YYYY') AS data_pedido, 
  pr.product_id, 
  pr.product_name, 
  ip.quantity, 
  ip.unit_price, 
  (ip.quantity * ip.unit_price) AS subtotal 
FROM customers cli 
INNER JOIN orders pd 
  ON cli.customer_id = pd.customer_id 
INNER JOIN order_items ip 
  ON pd.order_id = ip.order_id 
INNER JOIN products pr 
  ON ip.product_id = pr.product_id 
WHERE pd.status = 'DELIVERED' 
  ORDER BY cli.customer_id, pd.order_date; -- Lista os clientes com seus pedidos entregues, incluindo detalhes dos produtos e subtotal de cada item.
