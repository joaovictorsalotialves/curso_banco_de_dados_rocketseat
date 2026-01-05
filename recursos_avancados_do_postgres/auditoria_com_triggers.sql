CREATE TABLE customers_audit(
  audit_id SERIAL PRIMARY KEY, 
  customer_id INT, 
  changed_by TEXT, 
  changed_at TIMESTAMP, 
  action TEXT, 
  field_name TEXT, 
  old_value TEXT, 
  new_value TEXT
);

CREATE OR REPLACE FUNCTION tg_audit_customer_changes() 
RETURNS TRIGGER AS $$ 
  BEGIN 
    IF TG_OP = 'UPDATE' THEN 
      IF OLD.first_name IS DISTINCT FROM NEW. first_name THEN 
        INSERT INTO customers_audit(customer_id, changed_by, changed_at, action, field_name, old_value, new_value) 
        VALUES (OLD.customer_id, current_user, NOW(), TG_OP, 'first_name', OLD.first_name, NEW.first_name); 
      END IF; 
      
      IF OLD.city IS DISTINCT FROM NEW.city THEN 
        INSERT INTO customers_audit(customer_id, changed_by, changed_at, action, field_name, old_value, new_value) 
        VALUES (OLD.customer_id, current_user, NOW(), TG_OP, 'city', OLD.city, NEW.city); 
      END IF; 
    END IF; 
    
    RETURN NEW; 
  END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_customer_audit 
AFTER UPDATE 
ON customers 
FOR EACH ROW 
EXECUTE FUNCTION tg_audit_customer_changes();

UPDATE customers 
SET first_name = 'Felipe' 
WHERE customer_id = 1;

UPDATE customers 
SET first_name = 'Felipe Teste', city = 'Rio de Janeiro' 
WHERE customer_id = 1;
