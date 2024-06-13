CREATE TABLE Organizer
(
  organizerId INT NOT NULL,
  organizerName VARCHAR2(20) NOT NULL,
  phone INT NOT NULL,
  email VARCHAR2(30) NOT NULL,
  PRIMARY KEY (organizerId)
);

CREATE TABLE EventType
(
  eventTypeId INT NOT NULL,
  eventType VARCHAR2(20) NOT NULL,
  typeDescription VARCHAR2(100) NOT NULL,
  PRIMARY KEY (eventTypeId)
);

CREATE TABLE Participants
(
  participantID INT NOT NULL,
  firstName VARCHAR2(20) NOT NULL,
  lastName VARCHAR2(20) NOT NULL,
  email VARCHAR2(30) NOT NULL,
  clubMember INT NOT NULL,
  PRIMARY KEY (participantID)
);

CREATE TABLE Locations
(
  locationId INT NOT NULL,
  locationName VARCHAR2(20) NOT NULL,
  address VARCHAR2(30) NOT NULL,
  capacity INT NOT NULL,
  accessibility VARCHAR2(20) NOT NULL,
  ContactPerson INT NOT NULL,
  parking INT NOT NULL,
  PRIMARY KEY (locationId)
);

CREATE TABLE Event
(
  eventID INT NOT NULL,
  eventName VARCHAR2(30) NOT NULL,
  eventDate DATE NOT NULL,
  eventDescribe VARCHAR2(100) NOT NULL,
  organizerId INT NOT NULL,
  eventTypeId INT NOT NULL,
  locationId INT NOT NULL,
  PRIMARY KEY (eventID),
  FOREIGN KEY (organizerId) REFERENCES Organizer(organizerId),
  FOREIGN KEY (eventTypeId) REFERENCES EventType(eventTypeId),
  FOREIGN KEY (locationId) REFERENCES Locations(locationId)
);

CREATE TABLE Orders
(
  orderID INT NOT NULL,
  ticketAmount INT NOT NULL,
  ticketCost INT NOT NULL,
  orderDate DATE NOT NULL,
  eventID INT NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (eventID) REFERENCES Event(eventID)
);

CREATE TABLE MakeOrder
(
  participantID INT NOT NULL,
  orderID INT NOT NULL,
  PRIMARY KEY (participantID, orderID),
  FOREIGN KEY (participantID) REFERENCES Participants(participantID),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);
