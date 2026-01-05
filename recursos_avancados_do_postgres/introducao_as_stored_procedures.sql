CREATE OR REPLACE PROCEDURE sp_update_product_price(p_product_id INT, p_new_price NUMERIC) 
LANGUAGE plpgsql AS $$ 
  BEGIN 
    UPDATE products 
    SET price = p_new_price 
    WHERE product_id = p_product_id; 
  
    IF NOT FOUND THEN 
      RAISE EXCEPTION 'Produto % nao existe', p_product_id; 
    END IF; 
  END; $$;

CALL sp_update_product_price(42, 199.90);

CREATE OR REPLACE PROCEDURE sp_cancel_order(p_order_id INT) 
LANGUAGE plpgsql AS $$ 
  BEGIN 
    DELETE FROM order_items 
    WHERE order_id = p_order_id; 
  
    DELETE FROM orders 
    WHERE order_id = p_order_id; 
  
    IF NOT FOUND THEN 
      RAISE NOTICE 'Pedido % nao encontrado', p_order_id; 
    ELSE 
      RAISE NOTICE 'Pedido % e itens removidos', p_order_id; 
    END IF; 
  END; $$;

CALL sp_cancel_order(499);
