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
    
    --מחזיר את כמות הכרטיסים שנמכרו במיקום הזה
    ticketsSold := get_tickets(location_1);
    --מעדכן את כמות הכרטיסים שמכרנו במיקום מסויים
    update_ticketSold(ticketsSold, location_1);
    
    --הכמות כריסים שנמכרה הכי גבוהה ומעדכן אותו להיות ראשון ברשימה
    IF ticketsSold > max_amount THEN
      max_amount := ticketsSold;
      max_location := location_1;
    END IF;
   END LOOP;
   CLOSE c_location;
   
   organizer_1 := get_organizer(max_location);
   DBMS_OUTPUT.put_line(organizer_1);
end;
