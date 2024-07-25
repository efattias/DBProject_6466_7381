DECLARE
  order_id_1 NUMBER;
  TotalP NUMBER;
  loc NUMBER;
  orderCursor SYS_REFCURSOR;
BEGIN
  --בודק את המיקום של ההזמנה
  loc := OrderChecker;
  --מחזיר את כל ההזמנות במיקום הזה
  orderCursor := get_order(loc);

  LOOP
    --עוברת על כל התז של ההזמנות
    FETCH orderCursor INTO order_id_1; 
    EXIT WHEN orderCursor%NOTFOUND;

    -- מחשבת את המחיר הסופי
    TotalP := get_order_cost(order_id_1);
    
    --עושה הנחה ומעדכנת את המחיר הסופי
    Discount(order_id_1, TotalP);
  END LOOP;
  CLOSE orderCursor;
END;
