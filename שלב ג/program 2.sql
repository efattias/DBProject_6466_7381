declare
location_1 INT;
ticketsSold INT;
max_amount INT ;
max_location INT;
organizer_1 varchar2(100);
cursor c_location is
select locationId from locations;
begin
  max_amount := 0;
  open c_location;
  LOOP
    fetch c_location into location_1;
    exit when c_location%NOTFOUND;
    
    --����� �� ���� �������� ������ ������ ���
    ticketsSold := get_tickets(location_1);
    --����� �� ���� �������� ������ ������ ������
    update_ticketSold(ticketsSold, location_1);
    
    --����� ������ ������ ��� ����� ������ ���� ����� ����� ������
    IF ticketsSold > max_amount THEN
      max_amount := ticketsSold;
      max_location := location_1;
    END IF;
   END LOOP;
   CLOSE c_location;
   
   organizer_1 := get_organizer(max_location);
   DBMS_OUTPUT.put_line(organizer_1);
end;
