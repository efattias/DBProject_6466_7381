--����� ��� ����� ������ ����� ����� �����

--����� ���� PEOPLE
CREATE TABLE People
(
  peopleId INT NOT NULL,
  firstName VARCHAR2(20) NOT NULL,
  lastName VARCHAR2(20) NOT NULL,
  PRIMARY KEY (peopleId)
);

--insert data from Participants
insert into People p1 
select participantID, firstName, lastName 
from Participants p
where p.participantID not in (select peopleId from People) ;

--see all
select * from People;

--insert data from RESIDENT and do the sequence number start from 410 (because 410line already exist)
insert into People (peopleId, firstName, lastName)
select (RESIDENT_ID + 410), RESIDENT_FNAME, RESIDENT_LNAME 
from RESIDENT r
where (RESIDENT_ID + 410) not in (select peopleId from People);

--see all
select * from People;


--����� ���� �� ������ ������
-- ����� ����� tz
ALTER TABLE Organizer ADD peopleId INT;

-- ����� ���� �� ����� People
ALTER TABLE Organizer 
ADD CONSTRAINT fk_organizers_people 
    FOREIGN KEY (peopleId) REFERENCES People(peopleId);

-- ����� ������ �PEOPLE
UPDATE Organizer o
SET peopleId = (SELECT peopleId FROM People p WHERE p.peopleId = o.organizerid);

--see all
select * from Organizer;

--����� �� ����� ������ organizerId
--SELECT constraint_name FROM user_constraints WHERE table_name = 'ORGANIZER' AND constraint_type = 'R';
--EVENT ����� �� �� ���� ����
--UPDATE Event e SET organizerId = (SELECT peopleId FROM Organizer o WHERE o.organizerId = e.organizerId);
--CREATE UNIQUE INDEX unique_peopleId ON Organizer(peopleId);
--����� ���� �� ���
--ALTER TABLE Event DROP CONSTRAINT SYS_C009449;
--ALTER TABLE Event ADD CONSTRAINT FK_ORGANIZERS_PEOPLE FOREIGN KEY (organizerId) REFERENCES Organizer(peopleId);

-- ����� ������� ��������
ALTER TABLE Organizer DROP COLUMN organizerName;

--see all
select * from Organizer;




--����� ���� �� ������ ������
-- ����� ����� tz
ALTER TABLE Participants ADD peopleId INT;

-- ����� ���� �� ����� People
ALTER TABLE Participants 
ADD CONSTRAINT fk_participants_people 
    FOREIGN KEY (peopleId) REFERENCES People(peopleId);

-- ����� ������ �PEOPLE
UPDATE Participants p
SET peopleId = (SELECT peopleId FROM People p1 WHERE p1.peopleId = p.participantid);

-- ����� ������� ��������
ALTER TABLE Participants DROP COLUMN firstName;
ALTER TABLE Participants DROP COLUMN lastName;

--see all
select * from Participants;







--����� ���� �� ������ �����
-- ����� ����� tz
ALTER TABLE RESIDENT ADD peopleId INT;

-- ����� ���� �� ����� People
ALTER TABLE RESIDENT 
ADD CONSTRAINT fk_RESIDENT_people 
    FOREIGN KEY (peopleId) REFERENCES People(peopleId);

-- ����� ������ �PEOPLE
UPDATE RESIDENT r
SET peopleId = (SELECT peopleId FROM People p1 WHERE (p1.peopleId - 410) = r.resident_id);

-- ����� ������� ��������
ALTER TABLE RESIDENT DROP COLUMN RESIDENT_FNAME;
ALTER TABLE RESIDENT DROP COLUMN RESIDENT_LNAME;

--see all
select * from RESIDENT;



--2
--connect between asset and locations

ALTER TABLE ASSET ADD locationId INT;

UPDATE ASSET
SET locationId = ROWNUM;

ALTER TABLE ASSET ADD CONSTRAINT fk_asset_location FOREIGN KEY (locationId) REFERENCES Locations(locationId);

select * from Asset;
select * from Locations;


--3
--connect between payment to makeorder
ALTER TABLE MakeOrder ADD paymentId INT;
alter table MakeOrder drop column paymentId;


insert into MakeOrder (Paymentid) 
select PAYMENT_ID
from PAYMENT p
where p.payment_id not in (select paymentId from MakeOrder) ;


select * from MakeOrder;
select * from PAYMENT;


INSERT INTO People (peopleId, firstName, lastName) VALUES (1000, 'John', 'Johnny');

select firstName, peopleid
from People p
where p.peopleid not in (select p1.participantid from Participants p1)
 and p.peopleid not in (select o.organizerid from Organizer o) 
 and p.peopleid not in (select r.resident_id from RESIDENT r);




