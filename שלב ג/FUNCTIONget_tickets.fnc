create or replace function get_tickets(location_1 INT) return INT  is
  ticket_sold INT ;
begin
  select count(o.orderid)
  into ticket_sold
  from Orders o JOIN  event e ON o.eventId = e.eventid
  WHERE e.locationid = location_1;

  return(ticket_sold);
end get_tickets;
/
