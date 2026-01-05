DO $$
  DECLARE 
    tentativa INT := 0; 
  BEGIN 
    LOOP 
      BEGIN 
        tentativa := tentativa + 1; 
  
        UPDATE products 
        SET stock = stock - 1 
        WHERE product_id = 1; 
  
        COMMIT;
        EXIT; 
  
      EXCEPTION 
        WHEN serialization_failure OR deadlock_detected THEN 
          RAISE NOTICE 'Tentativa % falhou, tentando novamente ...', tentativa; 
          ROLLBACK;
          PERFORM pg_sleep(0.5); 
  
          IF tentativa > 5 THEN 
            RAISE EXCEPTION 'Limite de tentativas excedido.'; 
          END IF; 
      END; 
    END LOOP; 
  END; $$ LANGUAGE plpgsql;
