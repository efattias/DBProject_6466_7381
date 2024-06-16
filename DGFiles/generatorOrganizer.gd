
[General]
Version=1

[Preferences]
Username=
Password=2674
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=ORGANIZER
Count=400

[Record]
Name=ORGANIZERID
Type=NUMBER
Size=
Data=Sequence(11)
Master=

[Record]
Name=ORGANIZERNAME
Type=VARCHAR2
Size=20
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=
Data='0' + List('54', '77', '58', '52', '53') + '-' + [0000000]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=30
Data=Email
Master=

