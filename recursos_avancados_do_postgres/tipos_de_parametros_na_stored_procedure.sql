CREATE OR REPLACE PROCEDURE sp_order_summary(
  IN p_order_id INT, 
  OUT p_customer_id INT, 
  OUT p_total_amount NUMERIC
) 
LANGUAGE plpgsql AS $$ 
  BEGIN 
    SELECT customer_id, total_amount INTO p_customer_id, p_total_amount 
    FROM orders 
    WHERE order_id = p_order_id; 
  END; $$;

DO $$ 
  DECLARE 
    cust_id INT; 
    tot NUMERIC; 
  BEGIN 
    CALL sp_order_summary(5, cust_id, tot); 
    RAISE NOTICE 'Cliente: %, Total: %', cust_id, tot; 
  END; $$;

CREATE OR REPLACE PROCEDURE sp_increment_counter (INOUT ct INT) 
LANGUAGE plpgsql AS $$ 
  BEGIN 
    ct := ct + 1; 
  END $$;

DO $$ 
  DECLARE 
    C INT := 10; 
  BEGIN 
    CALL sp_increment_counter(c); 
    RAISE NOTICE 'Novo valor: %', c; 
  END; $$;
