INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (1, 'John Doe', 1234567890, 'john@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (2, 'Jane Smith', 2345678901, 'jane@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (3, 'Emily Johnson', 3456789012, 'emily@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (4, 'Michael Brown', 4567890123, 'michael@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (5, 'Jessica Davis', 5678901234, 'jessica@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (6, 'David Wilson', 6789012345, 'david@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (7, 'Sarah Miller', 7890123456, 'sarah@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (8, 'Chris Moore', 8901234567, 'chris@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (9, 'Ashley Taylor', 9012345678, 'ashley@example.com');
INSERT INTO Organizer (organizerId, organizerName, phone, email) VALUES (10, 'Andrew Anderson', 1234509876, 'andrew@example.com');

INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (1, 'Sports', 'Various sports events');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (2, 'Community', 'Community gatherings and social events');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (3, 'Culture', 'Cultural events and activities');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (4, 'Independence Day', 'Celebration of national independence');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (5, 'Theatre', 'Theatre performances');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (6, 'Memorial Day', 'Memorial events');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (7, 'Education', 'Educational seminars and workshops');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (8, 'Concert', 'Music concerts');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (9, 'Festival', 'Festivals and celebrations');
INSERT INTO EventType (eventTypeId, eventType, typeDescription) VALUES (10, 'Cinema', 'Film screenings and movie events');

INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (1, 'Alice', 'Green', 'alice@example.com', 1);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (2, 'Bob', 'White', 'bob@example.com', 0);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (3, 'Charlie', 'Black', 'charlie@example.com', 1);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (4, 'Diana', 'Red', 'diana@example.com', 0);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (5, 'Evan', 'Yellow', 'evan@example.com', 1);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (6, 'Fiona', 'Blue', 'fiona@example.com', 0);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (7, 'George', 'Pink', 'george@example.com', 1);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (8, 'Hannah', 'Brown', 'hannah@example.com', 0);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (9, 'Ian', 'Grey', 'ian@example.com', 1);
INSERT INTO Participants (participantID, firstName, lastName, email, clubMember) VALUES (10, 'Julia', 'Orange', 'julia@example.com', 0);

INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (1, 'Sports Arena', 'Jerusalem', 5000, 'Yes', 1, 200);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (2, 'Community Center', 'Jerusalem', 300, 'Yes', 2, 50);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (3, 'Cultural Hall', 'Jerusalem', 800, 'Yes', 3, 100);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (4, 'Independence Park', '101 Freedom Blvd', 10000, 'Yes', 4, 500);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (5, 'Theatre House', '202 Drama Ln', 1200, 'Yes', 5, 150);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (6, 'Memorial Hall', '303 Remembrance Rd', 600, 'Yes', 6, 80);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (7, 'Education Center', '404 Learning St', 400, 'Yes', 7, 60);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (8, 'Concert Hall', '505 Music Ave', 2000, 'Yes', 8, 300);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (9, 'Festival Grounds', '606 Celebration Blvd', 8000, 'Yes', 9, 400);
INSERT INTO Locations (locationId, locationName, address, capacity, accessibility, ContactPerson, parking) VALUES (10, 'Cinema Complex', '707 Film St', 1500, 'Yes', 10, 250);

INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (1, 'Sports Event', DATE '2024-06-01', 'A local sports event.', 1, 1, 1);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (2, 'Community Gathering', DATE '2024-06-05', 'A gathering for the community.', 2, 2, 2, );
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (3, 'Cultural Night', DATE '2024-06-10', 'An evening of cultural performances.', 3, 3, 3);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (4, 'Independence Day', DATE '2024-06-15', 'Celebration of Independence Day.', 4, 4, 4);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (5, 'Theatre Play', DATE '2024-06-20', 'A theatre performance.', 5, 5, 5);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (6, 'Memorial Service', DATE '2024-06-25', 'A service to remember fallen heroes.', 6, 6, 6);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (7, 'Educational Workshop', DATE '2024-07-01', 'A workshop on educational topics.', 7, 7, 7);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (8, 'Music Concert', DATE '2024-07-05', 'A live music concert.', 8, 8, 8);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (9, 'Summer Festival', DATE '2024-07-10', 'A summer festival with various activities.', 9, 9, 9);
INSERT INTO Event (eventID, eventName, eventDate, eventDescribe, organizerId, eventTypeId, locationId) VALUES (10, 'Film Screening', DATE '2024-07-15', 'A screening of a popular film.', 10, 10, 10);

INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (1, 2, 50, DATE '2024-05-01', 1);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (2, 4, 0, DATE '2024-05-02', 2);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (3, 3, 20, DATE '2024-05-03', 3);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (4, 5, 0, DATE '2024-05-04', 4);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (5, 2, 30, DATE '2024-05-05', 5);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (6, 4, 0, DATE '2024-05-06', 6);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (7, 1, 10, DATE '2024-05-07', 7);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (8, 3, 40, DATE '2024-05-08', 8);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (9, 6, 25, DATE '2024-05-09', 9);
INSERT INTO Orders (orderID, ticketAmount, ticketCost, orderDate, eventID) VALUES (10, 2, 15, DATE '2024-05-10', 10);

INSERT INTO MakeOrder (participantID, orderID) VALUES (1, 1);
INSERT INTO MakeOrder (participantID, orderID) VALUES (2, 2);
INSERT INTO MakeOrder (participantID, orderID) VALUES (3, 3);
INSERT INTO MakeOrder (participantID, orderID) VALUES (4, 4);
INSERT INTO MakeOrder (participantID, orderID) VALUES (5, 5);
INSERT INTO MakeOrder (participantID, orderID) VALUES (6, 6);
INSERT INTO MakeOrder (participantID, orderID) VALUES (7, 7);
INSERT INTO MakeOrder (participantID, orderID) VALUES (8, 8);
INSERT INTO MakeOrder (participantID, orderID) VALUES (9, 9);
INSERT INTO MakeOrder (participantID, orderID) VALUES (10, 10);
