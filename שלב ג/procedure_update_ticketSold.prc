create or replace procedure update_ticketSold(ticketSold1 INT, loction_id INT) is

begin
  update locations 
  set ticketsSold = ticketSold1
  where locationId = loction_id;

  DBMS_OUTPUT.put_line(loction_id || '-' || ticketSold1);

end update_ticketSold;
/
