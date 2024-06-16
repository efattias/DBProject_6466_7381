
[General]
Version=1

[Preferences]
Username=
Password=2413
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=MAKEORDER
Count=400

[Record]
Name=PARTICIPANTID
Type=NUMBER
Size=
Data=List(select participantID from Participants)
Master=

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=List(select orderID from Orders)
Master=

