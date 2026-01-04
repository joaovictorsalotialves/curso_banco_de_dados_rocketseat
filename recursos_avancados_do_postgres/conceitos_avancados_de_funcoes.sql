CREATE OR REPLACE FUNCTION fn_order_total(o_id INT) 
RETURNS NUMERIC AS $$ 
  DECLARE 
    v_total NUMERIC; 
  BEGIN 
    SELECT SUM(quantity * unit_price) INTO v_total 
    FROM order_items 
    WHERE order_id = o_id; 
    
    RETURN COALESCE(v_total, 0); 
  END; $$ LANGUAGE plpgsql;

SELECT fn_order_total(496) AS total_pedido;

CREATE OR REPLACE FUNCTION fn_order_items(o_id INT) 
RETURNS TABLE(
  product_name VARCHAR, 
  qty INT, 
  subtotal NUMERIC
) AS $$ 
  BEGIN 
    RETURN QUERY SELECT 
      p.product_name, 
      oi.quantity, 
      oi.quantity * oi.unit_price AS subtotal 
    FROM order_items oi 
    JOIN products p 
      ON p.product_id = oi.product_id 
    WHERE oi.order_id = o_id; 
  END; $$ LANGUAGE plpgsql;

SELECT * FROM fn_order_items(496);

CREATE OR REPLACE FUNCTION fn_get_customer_email(c_id INT) 
RETURNS TEXT AS $$ 
  DECLARE 
    v_email TEXT; 
  BEGIN 
    SELECT email INTO v_email 
    FROM customers 
    WHERE customer_id = c_id; 
    
    IF v_email IS NULL THEN 
      RAISE EXCEPTION 'Cliente % nao foi encontrado ou sem e-mail', c_id; 
    END IF; 
    
    RETURN v_email; 
    EXCEPTION 
      WHEN OTHERS THEN 
        RETURN 'no-reply@exemplo.com'; 
  END; $$ LANGUAGE plpgsql SECURITY DEFINER;

SELECT fn_get_customer_email (6) AS email_customer;
