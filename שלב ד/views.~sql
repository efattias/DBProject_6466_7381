CREATE VIEW EventParticipants AS
SELECT e.eventID, e.eventName, e.eventDate, p.participantID, p.firstName, p.lastName
FROM Event e
JOIN MakeOrder mo ON e.eventID = mo.orderID
JOIN Participants p ON mo.participantID = p.participantID;

SELECT firstName, lastName
FROM EventParticipants
WHERE eventID = 1;

SELECT eventName, eventDate
FROM EventParticipants
WHERE participantID = 1;

CREATE VIEW PaymentTaxDetails AS
SELECT p.PAYMENT_ID, p.PAYMENT_AMOUNT, t.TAX_PRICE, t.TAX_CREATE
FROM PAYMENT p
JOIN TAX_ACCOUNT t ON p.TAX_ID = t.TAX_ID;

SELECT PAYMENT_ID, PAYMENT_AMOUNT
FROM PaymentTaxDetails
WHERE PAYMENT_AMOUNT > 1000;

SELECT TAX_PRICE, TAX_CREATE
FROM PaymentTaxDetails
WHERE PAYMENT_ID = 1;
