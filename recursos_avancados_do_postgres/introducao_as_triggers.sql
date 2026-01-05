CREATE TABLE orders_audit (
  audit_id SERIAL PRIMARY KEY, 
  order_id INT, 
  action VARCHAR(10), 
  action_time TIMESTAMP
);

CREATE OR REPLACE FUNCTION tg_audit_order() 
RETURNS TRIGGER AS $$ 
  BEGIN 
    INSERT INTO orders_audit(order_id, action, action_time) 
    VALUES (COALESCE(NEW.order_id, OLD.order_id), TG_OP, NOW()); 
    
    RETURN NEW; 
  END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_order_audit 
AFTER INSERT OR UPDATE OR DELETE 
ON orders 
FOR EACH ROW 
EXECUTE FUNCTION tg_audit_order();

UPDATE orders 
SET status = 'SHIPPED' 
WHERE order_id = 5;

SELECT * FROM orders_audit 
WHERE order_id = 5;
