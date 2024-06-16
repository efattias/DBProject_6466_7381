
[General]
Version=1

[Preferences]
Username=
Password=2620
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=EFATTI
Name=LOCATIONS
Count=400

[Record]
Name=LOCATIONID
Type=NUMBER
Size=
Data=Sequence(11)
Master=

[Record]
Name=LOCATIONNAME
Type=VARCHAR2
Size=20
Data=City
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=CAPACITY
Type=NUMBER
Size=
Data=Random(50, 1000)
Master=

[Record]
Name=ACCESSIBILITY
Type=VARCHAR2
Size=20
Data=List('Y', 'N')
Master=

[Record]
Name=CONTACTPERSON
Type=NUMBER
Size=
Data='0' + List('54', '77', '58', '52', '53') + '-' + [0000000]
Master=

[Record]
Name=PARKING
Type=NUMBER
Size=
Data=Random(0, 100)
Master=

