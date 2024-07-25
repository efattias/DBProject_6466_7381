create or replace function OrderChecker

  RETURN NUMBER IS
  v_orderID NUMBER;
BEGIN

  SELECT locationId INTO v_orderID
  FROM (SELECT  locationId FROM Locations ORDER BY DBMS_RANDOM.RANDOM)
  WHERE ROWNUM = 1;
  
  RETURN v_orderID;
END;
/
