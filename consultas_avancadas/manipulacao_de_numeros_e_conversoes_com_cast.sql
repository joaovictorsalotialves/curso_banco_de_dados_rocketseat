SELECT 
  product_id, 
  price, 
  ROUND(price, 0) AS price_arredondado_inteiro, 
  ROUND(price, 1) AS price_arredondado_1_casa, 
  ROUND(price, 2) AS price_arredondado_2_casas 
FROM products 
LIMIT 5; -- Exibe os preços arredondados para diferentes precisões

SELECT 
  product_id, 
  price, 
  TRUNC(price, 0) AS price_truncado_inteiro, 
  TRUNC(price, 1) AS price_truncado_1_casa 
FROM products 
LIMIT 5; -- Exibe os preços truncados para diferentes precisões

SELECT 
  product_id, 
  price, 
  CEIL(price) AS price_ceil, 
  FLOOR(price) AS price_floor 
FROM products 
LIMIT 5; -- Exibe o teto e o piso dos preços

SELECT 
  product_id, 
  price, 
  ABS(price * -1) AS valor_absoluto, 
  POWER(price, 2) AS price_ao_quadrado, 
  SQRT(price) AS raiz_quadrada_price 
FROM products 
LIMIT 5; -- Exibe o valor absoluto, o preço ao quadrado e a raiz quadrada do preço

SELECT 
  product_id,
  price, 
  MOD(CAST(price AS INT), 7) AS resto_divisao_por_7 
FROM products 
LIMIT 5; -- Exibe o resto da divisão do preço convertido para inteiro por 7

SELECT 
  product_id, 
  price, 
  CAST(price AS INT) AS price_inteiro 
FROM products 
LIMIT 5; -- Exibe o preço convertido para inteiro

SELECT 
  customer_id, 
  created_at, 
  CAST(created_at AS VARCHAR(20)) AS created_at_text 
FROM customers 
LIMIT 5; -- Exibe a data de criação convertida para texto

SELECT 
  '123' AS texto_original, 
  CAST('123' AS INT) + 10 AS soma_exemplo; -- Exibe a conversão de texto para inteiro e soma 10
