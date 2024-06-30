ALTER TABLE Participants
ADD CONSTRAINT chk_phone_length CHECK (LENGTH(phone) = 10);

ALTER TABLE Locations
MODIFY parking DEFAULT 0;

ALTER TABLE Organizer
ADD CONSTRAINT chk_email_format CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

