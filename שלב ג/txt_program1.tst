PL/SQL Developer Test script 3.0
22
DECLARE
  order_id_1 NUMBER;
  TotalP NUMBER;
  loc NUMBER;
  orderCursor SYS_REFCURSOR;
BEGIN
  loc := OrderChecker;
  orderCursor := get_order(loc);
  
  LOOP
    FETCH orderCursor INTO order_id_1; 
    EXIT WHEN orderCursor%NOTFOUND;

    TotalP := get_order_cost(order_id_1);
    
    Discount(order_id_1, TotalP);
  END LOOP;
  CLOSE orderCursor;
  EXCEPTION
    WHEN OTHERS THEN
  DBMS_OUTPUT.put_line ('An error occurred: ' || SQLERRM);
END;
0
0
