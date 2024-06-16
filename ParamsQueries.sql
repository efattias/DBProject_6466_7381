--Events by a given organizer name
SELECT e.eventID, e.eventName, e.eventDate, e.eventDescribe, o.organizerName
FROM Event e
JOIN Organizer o ON e.organizerId = o.organizerId
WHERE o.organizerName = @organizerName
AND e.eventID IN (
  SELECT e2.eventID
  FROM Event e2
  WHERE e2.organizerId = o.organizerId
)
ORDER BY e.eventDate;
--Participants who ordered tickets within a date range
SELECT p.participantID, p.firstName, p.lastName, o.orderID, o.orderDate, o.ticketAmount
FROM Participants p
JOIN MakeOrder mo ON p.participantID = mo.participantID
JOIN Orders o ON mo.orderID = o.orderID
WHERE o.orderDate BETWEEN @startDate AND @endDate--לעדכו
AND o.orderID IN (
  SELECT o2.orderID
  FROM Orders o2
  WHERE o2.orderDate BETWEEN @startDate AND @endDate--לעדכן
)
ORDER BY o.orderDate DESC, p.lastName;
--Events in a specific location with a capacity threshold:
SELECT e.eventID, e.eventName, l.locationName, l.capacity
FROM Event e
JOIN Locations l ON e.locationId = l.locationId
WHERE l.locationName = @locationName --לעדכן
AND l.capacity >= @minCapacity--לעדכן
AND e.locationId IN (
  SELECT l2.locationId
  FROM Locations l2
  WHERE l2.locationName = @locationName --לעדכן
  AND l2.capacity >= @minCapacity--לעדכן
)
ORDER BY l.capacity DESC, e.eventName;
--Participants who ordered a minimum number of tickets:
SELECT p.participantID, p.firstName, p.lastName, SUM(o.ticketAmount) AS totalTickets
FROM Participants p
JOIN MakeOrder mo ON p.participantID = mo.participantID
JOIN Orders o ON mo.orderID = o.orderID
WHERE p.participantID IN (
  SELECT mo2.participantID
  FROM MakeOrder mo2
  JOIN Orders o2 ON mo2.orderID = o2.orderID
  GROUP BY mo2.participantID
  HAVING SUM(o2.ticketAmount) >= @minTickets
)
GROUP BY p.participantID, p.firstName, p.lastName
HAVING SUM(o.ticketAmount) >= @minTickets
ORDER BY totalTickets DESC, p.lastName;
