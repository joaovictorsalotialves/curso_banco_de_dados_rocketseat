SELECT 
  customer_id, 
  CONCAT(first_name, ' ', last_name) AS nome_concatenado1, 
  first_name || ' ' || last_name AS nome_concatenado2 
FROM customers 
LIMIT 5; -- Mostra os 5 primeiros clientes com nomes concatenados

SELECT 
  customer_id, 
  last_name, 
  CHAR_LENGTH(last_name) AS tamanho_sobrenome 
FROM customers 
LIMIT 5; -- Mostra os 5 primeiros clientes com o tamanho do sobrenome

SELECT 
  customer_id, 
  UPPER(first_name) AS nome_maiusculo, 
  LOWER(last_name) AS sobrenome_minusculo 
FROM customers 
LIMIT 5; -- Mostra os 5 primeiros clientes com nomes em maiúsculas e minúsculas

SELECT 
  ' Carlos ' AS texto_original, 
  TRIM(' Carlos ') AS texto_trim, 
  LTRIM(' Carlos ') AS texto_ltrim, 
  RTRIM('Carlos  ') AS texto_rtrim; -- Mostra o efeito das funções de trim

SELECT 
  product_id, 
  product_name, 
  SUBSTRING(product_name FROM 1 FOR 3) AS primeiros_3_caracteres 
FROM products 
LIMIT 5; -- Mostra os 5 primeiros produtos com os 3 primeiros caracteres do nome

SELECT 
  customer_id, 
  last_name, 
  POSITION('Silva' IN last_name) AS posicao_silva 
FROM customers 
WHERE last_name LIKE '%Silva%'; -- Mostra clientes cujo sobrenome contém 'Silva' e a posição da substring

SELECT 
  customer_id, 
  last_name, 
  REPLACE(last_name, 'Silva', 'S.') AS sobrenome_abreviado 
FROM customers 
WHERE last_name LIKE '%Silva%'; -- Mostra clientes cujo sobrenome contém 'Silva' com 'Silva' substituído por 'S.'
