
[General]
Version=1

[Preferences]
Username=
Password=2015
Database=
DateFormat=yyyy-mm-dd hh:m
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=EVENT
Count=400

[Record]
Name=EVENTID
Type=NUMBER
Size=
Data=Sequence(11)
Master=

[Record]
Name=EVENTNAME
Type=VARCHAR2
Size=30
Data=Company + ' marathon'
Master=

[Record]
Name=EVENTDATE
Type=DATE
Size=
Data=Random(2024-01-01 00:00, 2026-12-28 23:59)
Master=

[Record]
Name=EVENTDESCRIBE
Type=VARCHAR2
Size=100
Data='Running a marathon for health'
Master=

[Record]
Name=ORGANIZERID
Type=NUMBER
Size=
Data=List(select organizerId from Organizer)
Master=

[Record]
Name=EVENTTYPEID
Type=NUMBER
Size=
Data=List(select eventTypeId from EventType)
Master=

[Record]
Name=LOCATIONID
Type=NUMBER
Size=
Data=List(select locationId from Locations)
Master=

