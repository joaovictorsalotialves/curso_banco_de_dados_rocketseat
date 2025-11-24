SELECT SUM(total_amount) AS faturamento_geral 
  FROM orders; -- Soma do valor total de todos os pedidos

SELECT AVG(total_amount) AS media_pedidos 
  FROM orders; -- Média do valor total dos pedidos

SELECT 
  COUNT(total_amount), 
  SUM(total_amount) AS faturamento_geral, 
  AVG(total_amount) AS media_pedidos 
  FROM orders; -- Contagem, soma e média dos valores totais dos pedidos

SELECT AVG(price) AS media_precos 
  FROM products; -- Média dos preços dos produtos

SELECT 
  MAX(price) AS preco_maximo, 
  MIN(price) AS preco_minimo 
  FROM products; -- Preço máximo e mínimo dos produtos
 
SELECT MIN(created_at) AS primeira_data_cadastro 
  FROM customers; -- Data do primeiro cadastro de cliente

SELECT MAX(created_at) AS ultima_data_cadastro 
  FROM customers; -- Data do último cadastro de cliente
