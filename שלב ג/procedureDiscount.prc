--���� �� 10 ���� ��� ���� ��� 250 ���
create or replace procedure Discount(order_id_1 number ,totalp number) is
TotalPcont number;
begin
  if totalp>250 then 
   TotalPcont:=totalp*0.9;
   else
     TotalPcont:=totalp;
     end if;
     DBMS_OUTPUT.PUT_LINE('The discounted order cost for order ID ' || order_id_1 || ' is ' ||  TotalPcont );
end Discount;
/
