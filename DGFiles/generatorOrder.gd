
[General]
Version=1

[Preferences]
Username=
Password=2830
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=ORDERS
Count=400

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=Sequence(11)
Master=

[Record]
Name=TICKETAMOUNT
Type=NUMBER
Size=
Data=Random(1, 5)
Master=

[Record]
Name=TICKETCOST
Type=NUMBER
Size=
Data=Random(0, 50)
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(2024-01-01 00:00, 2026-12-28 23:59)
Master=

[Record]
Name=EVENTID
Type=NUMBER
Size=
Data=List(select eventID from Event)
Master=

