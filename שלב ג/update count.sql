select count(o.orderid),  l.locationid
  from Orders o JOIN  event e ON o.eventId = e.eventid JOIN locations l ON e.locationid = l.locationid
  group by l.locationid
