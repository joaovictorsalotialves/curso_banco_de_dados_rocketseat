CREATE OR REPLACE FUNCTION tg_validate_product_price() 
RETURNS TRIGGER AS $$ 
  BEGIN 
    IF NEW.price < 0 THEN 
      RAISE EXCEPTION 'Preço não pode ser negativo. Valor informado: %', NEW.price; 
    END IF; 
  
    RETURN NEW; 
  END; $$ LANGUAGE plpgsql; 

CREATE TRIGGER trg_validate_price 
BEFORE INSERT OR UPDATE 
ON products 
FOR EACH ROW 
EXECUTE FUNCTION tg_validate_product_price();

INSERT INTO products (product_name, category_id, price) 
VALUES ('Teste Trigger', 9, 20);

SELECT 
  setval(pg_get_serial_sequence('products','product_id'), 
  (SELECT COALESCE(MAX(product_id),0) FROM products) + 1);

CREATE TABLE products_audit (
  product_audit_id SERIAL PRIMARY KEY, 
  product_id INTEGER, 
  action VARCHAR (10), 
  action_time TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_product_change(p_id INT, action TEXT) 
RETURNS VOID AS $$ 
  BEGIN 
    INSERT INTO products_audit(product_id, action, action_time) 
    VALUES (p_id, action, NOW()); 
  END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_notify_change() 
RETURNS VOID AS $$ 
  BEGIN 
    RAISE NOTICE 'Notificação: produto alterado.'; 
  END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION tg_product_chain() 
RETURNS TRIGGER AS $$ 
  BEGIN 
    PERFORM fn_log_product_change(NEW.product_id, TG_OP); 
    PERFORM fn_notify_change(); 
    
    RETURN NEW; 
  END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_product_chain 
AFTER UPDATE 
ON products 
FOR EACH ROW 
EXECUTE FUNCTION tg_product_chain();

UPDATE products 
SET product_name = 'Teste Trigger 123' 
WHERE product_id = 102;
