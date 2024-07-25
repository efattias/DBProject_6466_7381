CREATE OR REPLACE FUNCTION get_order(location IN NUMBER)
RETURN SYS_REFCURSOR IS
    orderList SYS_REFCURSOR;
    ORDER_ID orders.orderid%type;
BEGIN
    DBMS_OUTPUT.put_line('location id ' || location);
    OPEN  orderList FOR
        SELECT    orderID
        FROM   ORDERS o join event e ON O.EVENTID = e.eventID
        WHERE e.locationid = location;
    LOOP
      FETCH orderList INTO ORDER_ID;
      exit when orderList%NOTFOUND;
      DBMS_OUTPUT.put_line('order id ' || ORDER_ID);
    END LOOP;
    CLOSE orderList;
        OPEN  orderList FOR
        SELECT    orderID
        FROM   ORDERS o join event e ON O.EVENTID = e.eventID
        WHERE e.locationid = location;
         
    RETURN orderList;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('NO ORDER FOUND');
      WHEN OTHERS THEN
        RAISE;  
        END get_order;
/
