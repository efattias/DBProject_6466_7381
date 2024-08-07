
--ליצור איש שממנו יורשים מארגן משתתף ותושב

--יצירת טבלת PEOPLE
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
select RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME 
from RESIDENT r
where RESIDENT_ID not in (select peopleId from People);

--see all
select * from People;
select * from RESIDENT;

--הפיכת מארגן ליורש מ אדם

-- יצירת מפתח זר לטבלת People
ALTER TABLE Organizer 
ADD CONSTRAINT fk_organizers_people 
    FOREIGN KEY (organizerId) REFERENCES People(peopleId);
--alter table Organizer drop constraint fk_organizers_people;

--see all
select * from Organizer;


--הפיכת משתתף ליורש מ אדם
-- יצירת מפתח זר לטבלת People
ALTER TABLE Participants 
ADD CONSTRAINT fk_participants_people 
    FOREIGN KEY (participantID) REFERENCES People(peopleId);
--alter table Participants drop constraint fk_participants_people;

--see all
select * from Participants;


--הפיכת תושב ליורש מ אדם

-- יצירת מפתח זר לטבלת People
ALTER TABLE RESIDENT 
ADD CONSTRAINT fk_RESIDENT_people 
    FOREIGN KEY (RESIDENT_ID) REFERENCES People(peopleId);
--alter table RESIDENT drop constraint fk_RESIDENT_people;

--see all
select * from RESIDENT;



--2
--connect between asset and locations

ALTER TABLE ASSET ADD locationId INT;

UPDATE ASSET
SET locationId = ROWNUM;

ALTER TABLE ASSET ADD CONSTRAINT fk_asset_location FOREIGN KEY (locationId) REFERENCES Locations(locationId);

alter table ASSET drop constraint fk_asset_location;

select * from Asset;
select * from Locations;


--3
--connect between payment to makeorder
--ALTER TABLE MakeOrder ADD paymentId INT;
--alter table MakeOrder drop column paymentId;


--insert into MakeOrder (Paymentid) 
--select PAYMENT_ID
--from PAYMENT p
--where p.payment_id not in (select paymentId from MakeOrder) ;


--select * from MakeOrder;
--select * from PAYMENT;

--זה שייך להגנה
--INSERT INTO People (peopleId, firstName, lastName) VALUES (1000, 'John', 'Johnny');

--select firstName, peopleid
--from People p
--where p.peopleid not in (select p1.participantid from Participants p1)
-- and p.peopleid not in (select o.organizerid from Organizer o) 
-- and p.peopleid not in (select r.resident_id from RESIDENT r);




drop table People;
drop table PAYMENT;
drop table DEBT;
drop table OWNERSHIP;
drop table RESIDENT;
drop table ASSET;
drop table TAX_ACCOUNT;

select * from PAYMENT;
select * from DEBT;
select * from OWNERSHIP;
select * from RESIDENT;
select * from ASSET;
select * from TAX_ACCOUNT;

