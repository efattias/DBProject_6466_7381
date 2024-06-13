
[General]
Version=1

[Preferences]
Username=
Password=2809
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=EVENTTYPE
Count=400

[Record]
Name=EVENTTYPEID
Type=NUMBER
Size=
Data=Sequence(11)
Master=

[Record]
Name=EVENTTYPE
Type=VARCHAR2
Size=20
Data=Random(1000, 100000) + 'M marathon'
Master=

[Record]
Name=TYPEDESCRIPTION
Type=VARCHAR2
Size=100
Data='Running a marathon for health'
Master=

