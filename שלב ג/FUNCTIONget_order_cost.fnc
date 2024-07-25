CREATE OR REPLACE FUNCTION get_order_cost(p_orderID NUMBER) RETURN  number IS
  v_total_cost NUMBER;
BEGIN
  -- ����� ����� ��� ���� �������� ���� ����� �� ������
  SELECT ticketAmount * ticketCost INTO v_total_cost
  FROM Orders
  WHERE orderID = p_orderID;
  
  RETURN v_total_cost;
END;
/
