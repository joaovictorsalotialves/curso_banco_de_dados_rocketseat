BEGIN; 
  UPDATE products
  SET price = price * 0.9 
  WHERE category_id = 3;  

  UPDATE orders 
  SET total_amount = total_amount + 50 
  WHERE order_id = 496;    
COMMIT;

BEGIN; 
  INSERT INTO orders(customer_id, order_date, status, total_amount) 
    VALUES (2, CURRENT_DATE, 'PENDING', 200.00); 
  
  SAVEPOINT my_savepoint; 
  
  INSERT INTO orders(customer_id, order_date, status, total_amount) 
    VALUES (3, CURRENT_DATE, 'PENDING', 200.00); 
  
  ROLLBACK TO my_savepoint; 
  
  INSERT INTO orders(customer_id, order_date, status, total_amount) 
    VALUES (4, CURRENT_DATE, 'PENDING', 200.00);   
COMMIT;
