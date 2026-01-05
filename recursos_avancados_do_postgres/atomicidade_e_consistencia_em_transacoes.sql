DO $$ 
  DECLARE 
    v_order_id INTEGER; 
  BEGIN 
    BEGIN 
      INSERT INTO orders(customer_id, order_date, status, total_amount) 
      VALUES (2, CURRENT_DATE, 'PENDING', 200.00) 
      RETURNING order_id INTO v_order_id; 
  
      RAISE NOTICE 'Pedido 1 inserido com ID %', v_order_id; 
  
      INSERT INTO orders(customer_id, order_date, status, total_amount) 
      VALUES (3, CURRENT_DATE, 'PENDING', 200.00); 
  
      INSERT INTO orders(customer_id, order_date, status, total_amount)
      VALUES (4, CURRENT_DATE, 'PENDING', 200.00);
  
      RAISE NOTICE 'Todos os pedidos inseridos com sucesso.'; 
  
      EXCEPTION WHEN OTHERS THEN 
        RAISE WARNING 'Erro ao inserir pedidos: %, revertendo todos os INSERTs', SQLERRM; 
        RETURN; 
    END; 
  END; $$ LANGUAGE plpgsql;
  