 -- Select Queries
 --Participants with club membership in Jerusalem for events located in '707 Film St':
SELECT p.participantID, p.firstName, p.lastName, e.eventName, l.locationName
FROM Participants p
JOIN MakeOrder mo ON p.participantID = mo.participantID
JOIN Orders o ON mo.orderID = o.orderID
JOIN Event e ON o.eventID = e.eventID
JOIN Locations l ON e.locationId = l.locationId
WHERE p.clubMember != 1 AND l.address LIKE '707 Film St';

--Events with capacity of at least 100 and with accessibility -גרסה ראשונה לא מורכבת:
SELECT e.eventID, e.eventName, l.locationName, l.capacity, l.accessibility
FROM Event e
JOIN Locations l ON e.locationId = l.locationId
WHERE l.capacity >= 50 AND l.accessibility IS NOT NULL;

-- גרסה שניה מורכבת
SELECT e.eventID, e.eventName, l.locationName, l.capacity, l.accessibility
FROM Event e
JOIN (SELECT locationId, locationName, capacity, accessibility 
     FROM  Locations ) l 
ON 
    e.locationId = l.locationId
WHERE  e.eventID IN 
    (SELECT eventID 
     FROM Event 
     WHERE 
        locationId IN 
        (SELECT locationId 
         FROM Locations 
         WHERE 
            capacity >= 100 
            AND accessibility NOT IN ('N', 'NO')
        )
    )
ORDER BY 
    l.capacity DESC, 
    e.eventName;
    
-- Participants with club membership and ordered more than one ticket
SELECT p.participantID, p.firstName, p.lastName, o.orderID, o.ticketAmount
FROM Participants p
JOIN MakeOrder mo ON p.participantID = mo.participantID
JOIN Orders o ON mo.orderID = o.orderID
WHERE p.clubMember = 1 
  AND o.ticketAmount > 1
ORDER BY p.lastName, o.orderID;

-- Orders made more than two days before the event date
SELECT o.orderID, o.ticketAmount, o.ticketCost, o.orderDate, e.eventDate, e.eventName
FROM Orders o
JOIN Event e ON o.eventID = e.eventID
WHERE (e.eventDate - o.orderDate) > 2
ORDER BY e.eventDate, o.orderDate;

--the final price for clubmember
SELECT mo.orderID, mo.participantID, o.ticketAmount * o.ticketCost * 0.7 AS finalPrice
FROM MakeOrder mo
JOIN Orders o ON mo.orderID = o.orderID
JOIN Participants p ON mo.participantID = p.participantID
WHERE p.clubMember != 0;



--Delete Queries--

--Remove club membership at the end of the year
DELETE FROM Participants
WHERE clubMember != 0
  AND TO_CHAR(SYSDATE, 'YYYY') = '2023';
  
--Delete events of a specific type
DELETE FROM Event
WHERE eventTypeId = (
  SELECT eventTypeId
  FROM EventType
  WHERE eventType = 'Specific Type'
);



--Update Queries:--
--Discount for participants attending Independence Day event
UPDATE Orders
SET ticketCost = ticketCost / 2
WHERE eventID IN (
  SELECT eventID
  FROM Event
  WHERE eventDate = TO_DATE('2024-05-15', 'YYYY-MM-DD')
);
--Special 50% discount for participants with club membership
UPDATE Orders
SET ticketCost = ticketCost / 2
WHERE orderID IN (
  SELECT mo.orderID
  FROM MakeOrder mo
  JOIN Participants p ON mo.participantID = p.participantID
  WHERE p.clubMember = 1
);

