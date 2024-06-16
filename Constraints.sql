ALTER TABLE Participants
ADD CONSTRAINT chk_phone_length CHECK (LENGTH(phone) = 10);

ALTER TABLE Locations
MODIFY parking DEFAULT 0;

ALTER TABLE EventType
MODIFY typeDescription NOT NULL;
