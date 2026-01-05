CREATE OR REPLACE FUNCTION fn_add_customer(
  p_first VARCHAR, 
  p_last VARCHAR, 
  p_email VARCHAR, 
  p_city VARCHAR
) 
RETURNS INT AS $$ 
  DECLARE 
    v_id INT; 
  BEGIN 
    INSERT INTO customers (first_name, last_name, email, city, created_at) 
    VALUES (p_first, p_last, p_email, p_city, NOW()) 
    RETURNING customer_id INTO v_id; 
  
    RETURN v_id; 
  END; $$ LANGUAGE plpgsql;

SELECT fn_add_customer('Ana', 'Silva', 'ana123@exemplo.com', 'Porto Alegre');

CREATE OR REPLACE FUNCTION fn_update_email(c_id INT, novo_email TEXT) 
RETURNS BOOLEAN AS $$ 
  BEGIN 
    UPDATE customers 
    SET email = novo_email 
    WHERE customer_id = c_id; 
  
    IF FOUND THEN 
      RETURN TRUE; 
    ELSE 
      RETURN FALSE; 
    END IF; 
  END; $$ LANGUAGE plpgsql;

SELECT fn_update_email(202, 'ana123@teste.com') AS result;

CREATE OR REPLACE FUNCTION fn_delete_customer(c_id INT) 
RETURNS TEXT AS $$ 
  BEGIN 
    IF EXISTS (SELECT 1 FROM orders WHERE customer_id = c_id) THEN 
      RETURN 'Erro: cliente possui pedidos.'; 
    ELSE 
      DELETE FROM customers 
      WHERE customer_id = c_id; 
      
      RETURN 'Cliente excluído com sucesso.'; 
    END IF; 
  END; $$ LANGUAGE plpgsql;

SELECT fn_delete_customer(202) AS result;

CREATE OR REPLACE FUNCTION fn_create_order(p_customer_id INT, p_items JSON) 
RETURNS TEXT AS $$ 
  DECLARE 
    v_order_id INT; 
    v_item JSON; 
  BEGIN 
    INSERT INTO orders (customer_id, order_date, status, total_amount) 
    VALUES (p_customer_id, NOW(), 'PENDING', 0) 
    RETURNING order_id INTO v_order_id; 
  
    FOR v_item IN SELECT * FROM json_array_elements(p_items) LOOP 
      INSERT INTO order_items (order_id, product_id, quantity, unit_price) 
      VALUES (
        v_order_id, 
        (v_item->>'product_id')::INT, 
        (v_item->>'quantity')::INT, 
        (v_item->>'unit_price')::NUMERIC
      ); 
    END LOOP; 
  
    RETURN FORMAT('Pedido %s criado com sucesso.', v_order_id); 
    EXCEPTION 
      WHEN OTHERS THEN 
        RAISE NOTICE 'Erro ao criar pedido. Revertendo ... '; 
    RAISE; 
  END; $$ LANGUAGE plpgsql;

SELECT fn_create_order(2, '[
  {"product_id": 97, "quantity": 2, "unit_price": 10.50}, 
  {"product_id": 98, "quantity": 1, "unit_price": 5.00}, 
  {"product_id": 99, "quantity": 4, "unit_price": 2.25}
]'::json) AS resultado;
