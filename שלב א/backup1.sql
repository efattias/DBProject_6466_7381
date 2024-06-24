prompt PL/SQL Developer import file
prompt Created on יום שני 24 יוני 2024 by user
set feedback off
set define off
prompt Creating EVENTTYPE...
create table EVENTTYPE
(
  eventtypeid     INTEGER not null,
  eventtype       VARCHAR2(20) not null,
  typedescription VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENTTYPE
  add primary key (EVENTTYPEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LOCATIONS...
create table LOCATIONS
(
  locationid    INTEGER not null,
  locationname  VARCHAR2(20) not null,
  address       VARCHAR2(30) not null,
  capacity      INTEGER not null,
  accessibility VARCHAR2(20) not null,
  contactperson INTEGER not null,
  parking       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOCATIONS
  add primary key (LOCATIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORGANIZER...
create table ORGANIZER
(
  organizerid   INTEGER not null,
  organizername VARCHAR2(20) not null,
  phone         INTEGER not null,
  email         VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORGANIZER
  add primary key (ORGANIZERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EVENT...
create table EVENT
(
  eventid       INTEGER not null,
  eventname     VARCHAR2(30) not null,
  eventdate     DATE not null,
  eventdescribe VARCHAR2(100) not null,
  organizerid   INTEGER not null,
  eventtypeid   INTEGER not null,
  locationid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add primary key (EVENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add foreign key (ORGANIZERID)
  references ORGANIZER (ORGANIZERID);
alter table EVENT
  add foreign key (EVENTTYPEID)
  references EVENTTYPE (EVENTTYPEID);
alter table EVENT
  add foreign key (LOCATIONID)
  references LOCATIONS (LOCATIONID);

prompt Creating ORDERS...
create table ORDERS
(
  orderid      INTEGER not null,
  ticketamount INTEGER not null,
  ticketcost   INTEGER not null,
  orderdate    DATE not null,
  eventid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (EVENTID)
  references EVENT (EVENTID);

prompt Creating PARTICIPANTS...
create table PARTICIPANTS
(
  participantid INTEGER not null,
  firstname     VARCHAR2(20) not null,
  lastname      VARCHAR2(20) not null,
  email         VARCHAR2(30) not null,
  clubmember    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPANTS
  add primary key (PARTICIPANTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MAKEORDER...
create table MAKEORDER
(
  participantid INTEGER not null,
  orderid       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAKEORDER
  add primary key (PARTICIPANTID, ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAKEORDER
  add foreign key (PARTICIPANTID)
  references PARTICIPANTS (PARTICIPANTID);
alter table MAKEORDER
  add foreign key (ORDERID)
  references ORDERS (ORDERID);

prompt Disabling triggers for EVENTTYPE...
alter table EVENTTYPE disable all triggers;
prompt Disabling triggers for LOCATIONS...
alter table LOCATIONS disable all triggers;
prompt Disabling triggers for ORGANIZER...
alter table ORGANIZER disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for PARTICIPANTS...
alter table PARTICIPANTS disable all triggers;
prompt Disabling triggers for MAKEORDER...
alter table MAKEORDER disable all triggers;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C009265;
alter table EVENT disable constraint SYS_C009266;
alter table EVENT disable constraint SYS_C009267;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C009274;
prompt Disabling foreign key constraints for MAKEORDER...
alter table MAKEORDER disable constraint SYS_C009278;
alter table MAKEORDER disable constraint SYS_C009279;
prompt Deleting MAKEORDER...
delete from MAKEORDER;
commit;
prompt Deleting PARTICIPANTS...
delete from PARTICIPANTS;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting ORGANIZER...
delete from ORGANIZER;
commit;
prompt Deleting LOCATIONS...
delete from LOCATIONS;
commit;
prompt Deleting EVENTTYPE...
delete from EVENTTYPE;
commit;
prompt Loading EVENTTYPE...
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (1, 'Sports', 'Various sports events');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (2, 'Community', 'Community gatherings and social events');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (3, 'Culture', 'Cultural events and activities');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (4, 'Independence Day', 'Celebration of national independence');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (5, 'Theatre', 'Theatre performances');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (6, 'Memorial Day', 'Memorial events');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (7, 'Education', 'Educational seminars and workshops');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (8, 'Concert', 'Music concerts');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (9, 'Festival', 'Festivals and celebrations');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (10, 'Cinema', 'Film screenings and movie events');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (11, '88259M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (12, '92298M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (13, '46396M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (14, '28612M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (15, '71095M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (16, '91087M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (17, '55695M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (18, '93391M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (19, '94928M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (20, '19687M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (21, '47482M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (22, '87248M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (23, '9790M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (24, '57721M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (25, '97394M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (26, '13226M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (27, '9438M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (28, '61929M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (29, '42203M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (30, '13852M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (31, '31008M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (32, '72784M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (33, '51486M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (34, '55252M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (35, '25669M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (36, '28052M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (37, '5957M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (38, '79683M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (39, '96332M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (40, '98677M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (41, '7457M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (42, '74242M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (43, '18263M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (44, '18123M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (45, '14263M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (46, '23272M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (47, '59163M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (48, '58097M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (49, '85205M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (50, '33720M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (51, '90039M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (52, '91246M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (53, '67765M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (54, '56481M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (55, '41970M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (56, '37260M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (57, '65138M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (58, '37472M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (59, '36567M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (60, '63500M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (61, '71932M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (62, '69979M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (63, '27720M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (64, '25050M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (65, '63977M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (66, '45504M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (67, '4956M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (68, '29822M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (69, '70444M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (70, '8172M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (71, '51495M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (72, '79126M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (73, '78223M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (74, '66431M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (75, '69810M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (76, '25816M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (77, '39262M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (78, '27566M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (79, '2300M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (80, '27944M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (81, '78330M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (82, '34313M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (83, '13377M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (84, '17508M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (85, '33389M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (86, '42560M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (87, '25059M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (88, '94739M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (89, '59556M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (90, '62920M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (91, '2893M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (92, '21032M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (93, '92319M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (94, '44685M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (95, '37792M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (96, '67424M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (97, '49504M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (98, '87433M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (99, '86103M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (100, '55262M marathon', 'Running a marathon for health');
commit;
prompt 100 records committed...
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (101, '3164M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (102, '7280M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (103, '46990M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (104, '83441M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (105, '72352M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (106, '81592M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (107, '88972M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (108, '26371M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (109, '10488M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (110, '68602M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (111, '73166M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (112, '59541M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (113, '69767M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (114, '58274M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (115, '14591M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (116, '39338M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (117, '96809M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (118, '3369M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (119, '82602M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (120, '43507M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (121, '75509M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (122, '51512M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (123, '52264M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (124, '47385M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (125, '11794M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (126, '61759M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (127, '24282M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (128, '2812M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (129, '49724M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (130, '79947M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (131, '97778M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (132, '27352M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (133, '50156M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (134, '7820M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (135, '71010M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (136, '40213M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (137, '65920M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (138, '91723M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (139, '71870M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (140, '87015M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (141, '4209M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (142, '20343M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (143, '74713M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (144, '46286M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (145, '58634M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (146, '88816M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (147, '46877M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (148, '9336M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (149, '53144M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (150, '90152M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (151, '17940M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (152, '75896M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (153, '22785M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (154, '34803M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (155, '82575M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (156, '15655M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (157, '24965M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (158, '91845M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (159, '75544M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (160, '62605M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (161, '70717M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (162, '41065M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (163, '68202M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (164, '74811M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (165, '1128M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (166, '34965M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (167, '88546M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (168, '59017M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (169, '49924M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (170, '39433M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (171, '65671M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (172, '35212M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (173, '85867M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (174, '98618M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (175, '34194M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (176, '13063M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (177, '8470M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (178, '30262M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (179, '64974M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (180, '84838M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (181, '33193M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (182, '53511M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (183, '7213M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (184, '70222M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (185, '23090M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (186, '14956M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (187, '42765M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (188, '54172M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (189, '18605M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (190, '51447M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (191, '9226M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (192, '15676M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (193, '82981M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (194, '8917M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (195, '27138M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (196, '37089M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (197, '80465M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (198, '10247M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (199, '41382M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (200, '34410M marathon', 'Running a marathon for health');
commit;
prompt 200 records committed...
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (201, '29281M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (202, '35941M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (203, '69591M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (204, '52660M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (205, '13071M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (206, '69109M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (207, '5158M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (208, '17239M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (209, '45237M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (210, '5046M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (211, '25172M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (212, '34908M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (213, '8423M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (214, '35407M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (215, '5354M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (216, '85787M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (217, '14054M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (218, '63744M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (219, '31823M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (220, '51502M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (221, '66664M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (222, '99932M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (223, '65277M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (224, '59388M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (225, '21440M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (226, '41738M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (227, '5900M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (228, '58373M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (229, '56217M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (230, '48558M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (231, '46105M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (232, '41936M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (233, '22834M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (234, '64073M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (235, '34890M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (236, '81290M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (237, '27607M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (238, '39361M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (239, '67450M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (240, '49666M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (241, '61319M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (242, '56711M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (243, '83308M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (244, '32353M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (245, '87973M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (246, '74164M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (247, '43097M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (248, '65875M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (249, '46229M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (250, '25549M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (251, '1784M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (252, '52442M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (253, '34260M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (254, '45522M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (255, '14938M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (256, '27582M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (257, '82440M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (258, '19876M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (259, '37348M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (260, '92582M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (261, '32110M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (262, '62149M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (263, '97093M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (264, '41122M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (265, '63344M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (266, '77267M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (267, '62878M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (268, '21267M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (269, '63430M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (270, '62778M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (271, '30211M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (272, '34678M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (273, '12520M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (274, '50906M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (275, '99762M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (276, '59709M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (277, '23652M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (278, '5460M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (279, '28969M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (280, '35756M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (281, '85089M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (282, '12361M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (283, '54731M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (284, '60026M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (285, '72685M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (286, '38300M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (287, '51753M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (288, '83588M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (289, '30744M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (290, '41788M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (291, '56885M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (292, '2370M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (293, '51542M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (294, '57630M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (295, '66525M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (296, '73481M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (297, '98495M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (298, '98568M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (299, '8907M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (300, '27993M marathon', 'Running a marathon for health');
commit;
prompt 300 records committed...
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (301, '43667M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (302, '39622M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (303, '25881M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (304, '28099M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (305, '17069M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (306, '71393M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (307, '35464M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (308, '8246M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (309, '1946M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (310, '56337M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (311, '46297M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (312, '3684M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (313, '11026M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (314, '7783M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (315, '46789M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (316, '35522M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (317, '25403M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (318, '75209M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (319, '98557M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (320, '27217M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (321, '90543M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (322, '28037M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (323, '1465M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (324, '54128M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (325, '97581M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (326, '36971M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (327, '1373M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (328, '64508M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (329, '89893M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (330, '22631M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (331, '76383M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (332, '17103M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (333, '78619M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (334, '14015M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (335, '15196M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (336, '19231M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (337, '58613M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (338, '24043M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (339, '50891M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (340, '73973M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (341, '50010M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (342, '53194M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (343, '56203M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (344, '59899M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (345, '15360M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (346, '65024M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (347, '83137M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (348, '96433M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (349, '22049M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (350, '99052M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (351, '5484M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (352, '86768M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (353, '54444M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (354, '18300M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (355, '7588M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (356, '26977M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (357, '92969M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (358, '96502M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (359, '24411M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (360, '21683M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (361, '13065M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (362, '11722M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (363, '24751M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (364, '60467M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (365, '69755M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (366, '74941M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (367, '84189M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (368, '29864M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (369, '85225M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (370, '32834M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (371, '11065M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (372, '64628M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (373, '35668M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (374, '15789M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (375, '95608M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (376, '79622M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (377, '6328M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (378, '9902M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (379, '22994M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (380, '21493M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (381, '82431M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (382, '97488M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (383, '44968M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (384, '28021M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (385, '75482M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (386, '72362M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (387, '15301M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (388, '4775M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (389, '98117M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (390, '30911M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (391, '37205M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (392, '34473M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (393, '55464M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (394, '99715M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (395, '60510M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (396, '89187M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (397, '6720M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (398, '59237M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (399, '48189M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (400, '15271M marathon', 'Running a marathon for health');
commit;
prompt 400 records committed...
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (401, '9395M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (402, '43857M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (403, '79558M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (404, '92687M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (405, '63422M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (406, '58242M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (407, '79227M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (408, '20060M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (409, '5092M marathon', 'Running a marathon for health');
insert into EVENTTYPE (eventtypeid, eventtype, typedescription)
values (410, '34848M marathon', 'Running a marathon for health');
commit;
prompt 410 records loaded
prompt Loading LOCATIONS...
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (1, 'Sports Arena', 'Jerusalem', 5000, 'Yes', 1, 200);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (2, 'Community Center', 'Jerusalem', 300, 'Yes', 2, 50);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (3, 'Cultural Hall', 'Jerusalem', 800, 'Yes', 3, 100);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (4, 'Independence Park', '101 Freedom Blvd', 10000, 'Yes', 4, 500);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (5, 'Theatre House', '202 Drama Ln', 1200, 'Yes', 5, 150);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (6, 'Memorial Hall', '303 Remembrance Rd', 600, 'Yes', 6, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (7, 'Education Center', '404 Learning St', 400, 'Yes', 7, 60);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (8, 'Concert Hall', '505 Music Ave', 2000, 'Yes', 8, 300);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (9, 'Festival Grounds', '606 Celebration Blvd', 8000, 'Yes', 9, 400);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (10, 'Cinema Complex', '707 Film St', 1500, 'Yes', 10, 250);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (11, 'Fort Collins', '60 Zrich Street', 77, 'N', -6016970, 78);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (12, 'Houston', '29 Ingram Road', 438, 'N', -900115, 74);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (13, 'Charleston', '98 Pecs Ave', 574, 'Y', -5503345, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (14, 'Oakland', '77 Spacek Road', 84, 'Y', -7835294, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (15, 'Singapore', '33 Sarandon', 157, 'Y', -7544882, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (16, 'Bronx', '32 Christian Street', 947, 'N', -6572697, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (17, 'Miami', '657 Mary Road', 310, 'Y', -8287951, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (18, 'Cerritos', '98 Bethesda Road', 563, 'Y', -8794501, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (19, 'Zurich', '71 Chaka Drive', 337, 'N', -1717708, 89);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (20, 'Friedrichshafe', '324 Bracco Blvd', 681, 'N', -8972467, 17);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (21, 'Sursee', '563 Dearborn Street', 354, 'Y', -7151812, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (22, 'Courbevoie', '26 Mazzello Street', 925, 'N', -1463052, 100);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (23, 'Thalwil', '95 Bosco Drive', 312, 'N', -4619306, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (24, 'Fort worth', '696 Whitmore Blvd', 107, 'Y', -1156982, 38);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (25, 'Kungki', '88 Dorff Road', 605, 'N', -1407377, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (26, 'Kaysville', '176 Gailard Ave', 130, 'Y', -843860, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (27, 'Neustadt', '426 Arnold Drive', 777, 'N', -200615, 41);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (28, 'Milsons Point', '34 Cheadle Road', 711, 'Y', -1204662, 23);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (29, 'Libertyville', '70 English Ave', 781, 'Y', -8191590, 16);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (30, 'Nicosia', '86 Clive Street', 750, 'N', -4824954, 38);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (31, 'Seattle', '21 Rodgers Road', 511, 'N', -1913430, 14);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (32, 'Claymont', '40 O''Sullivan Drive', 407, 'Y', -9232768, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (33, 'Middletown', '70 Nash Drive', 96, 'Y', -2458429, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (34, 'Pompton Plains', '1 Craig Street', 576, 'Y', -8842987, 11);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (35, 'Pecs', '941 Nakai Street', 84, 'Y', -823390, 6);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (36, 'Spring Valley', '74 Patrick Blvd', 853, 'N', -8877087, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (37, 'Niigata', '91st Street', 592, 'N', -9229915, 87);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (38, 'Glendale', '49 Llewelyn Drive', 111, 'N', -459313, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (39, 'Bedfordshire', '818 McBride Street', 933, 'N', -4889173, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (40, 'Paderborn', '257 Daryl', 629, 'Y', -9835450, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (41, 'Cannock', '42 King Street', 475, 'Y', -5648048, 16);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (42, 'Kochi', '226 Esposito Drive', 523, 'Y', -328639, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (43, 'Bloemfontein', '81 Liev', 954, 'Y', -9941201, 39);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (44, 'Duisburg', '97 Mountain View', 779, 'Y', -3488760, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (45, 'Summerside', '100 Patrick Blvd', 197, 'N', -5140298, 23);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (46, 'Tustin', '70 DiFranco Street', 988, 'N', -5990760, 86);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (47, 'Gelsenkirchen', '5 Heston Road', 200, 'Y', -1098538, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (48, 'West Point', '63rd Street', 421, 'Y', -9816016, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (49, 'Juneau', '864 O''fallon Street', 860, 'N', -5891007, 90);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (50, 'Corona', '60 Tyler Drive', 677, 'N', -9007444, 25);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (51, 'Buenos Aires', '82 Potsdam Street', 307, 'N', -198758, 16);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (52, 'Victoria', '83rd Street', 869, 'N', -9412070, 70);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (53, 'Fountain Hills', '5 Crystal Street', 412, 'N', -2752814, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (54, 'Minneapolis', '86 Ringwood Street', 625, 'N', -7163144, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (55, 'Hercules', '90 Davies Street', 422, 'N', -669776, 0);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (56, 'Market Harborough', '70 Osment Street', 661, 'Y', -2406220, 57);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (57, 'Lake Oswego', '24 Cantrell', 150, 'N', -745151, 97);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (58, 'Framingaham', '44 Spencer', 78, 'Y', -5842300, 16);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (59, 'Hayward', '76 Dylan Ave', 839, 'N', -1473795, 75);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (60, 'Raleigh', '15 Randy Road', 189, 'N', -3829254, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (61, 'Los Angeles', '18 Russell Street', 973, 'Y', -4365573, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (62, 'Vilnius', '59 Elwes Ave', 994, 'N', -4275966, 95);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (63, 'Fountain Hills', '77 Stampley Road', 88, 'N', -5780926, 62);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (64, 'Arlington', '259 Teng', 323, 'N', -9135489, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (65, 'Bellerose', '83 Zeta-Jones Street', 272, 'N', -2154433, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (66, 'Westfield', '91 McDonald Road', 905, 'N', -1486225, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (67, 'Lexington', '37 Pompeia Street', 782, 'N', -9141927, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (68, 'Koblenz', '749 Denise Road', 436, 'Y', -3538816, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (69, 'Michendorf', '43 Tony Road', 77, 'N', -7641441, 85);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (70, 'Gersthofen', '714 Illeana Road', 354, 'N', -4999939, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (71, 'Marietta', '19 Joe Road', 830, 'N', -4490936, 85);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (72, 'Mainz-kastel', '48 Keitel Ave', 957, 'Y', -6881885, 30);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (73, 'Conshohocken', '71 Tippe Drive', 137, 'N', -1103955, 40);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (74, 'Macclesfield', '55 England Drive', 583, 'Y', -5123937, 16);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (75, 'Helsinki', '84 Dwight Blvd', 266, 'Y', -38984, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (76, 'Macclesfield', '470 Luongo Drive', 624, 'N', -6885821, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (77, 'Mantova', '52nd Street', 397, 'N', -6450509, 71);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (78, 'Batavia', '87 de Lancie Road', 113, 'Y', -1002007, 46);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (79, 'California', '342 Warden Street', 71, 'Y', -7718976, 17);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (80, 'Salisbury', '37 Fukui Road', 573, 'Y', -8971010, 11);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (81, 'San Mateo', '442 Rio Street', 614, 'Y', -8545227, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (82, 'Jerusalem', '33 Ethan Ave', 338, 'N', -8499124, 50);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (83, 'Nagano', '14 Purley Ave', 534, 'N', -6562460, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (84, 'Rtp', '11st Street', 786, 'Y', -2541332, 86);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (85, 'Yamaguchi', '5 Conley Street', 875, 'N', -1472259, 60);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (86, 'Waldbronn', '582 Debi Blvd', 770, 'N', -4834261, 21);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (87, 'Menlo Park', '73 Carlton Road', 367, 'Y', -8860281, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (88, 'Pomona', '73rd Street', 579, 'Y', -8566620, 14);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (89, 'Manaus', '64 Ricardson Street', 106, 'N', -960549, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (90, 'Carson City', '78 Posey Road', 756, 'Y', -9517531, 46);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (91, 'Curitiba', '98 Orlando Street', 766, 'Y', -311616, 2);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (92, 'Bielefeld', '52 Raul Street', 742, 'Y', -7976016, 40);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (93, 'Springfield', '100 Fehr Road', 153, 'Y', -832269, 11);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (94, 'Shizuoka', '13 Franklin Road', 862, 'N', -2845332, 60);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (95, 'Leipzig', '6 Rosie', 700, 'Y', -8475085, 6);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (96, 'Bloemfontein', '37 Jolie Drive', 533, 'Y', -3964293, 91);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (97, 'Brno', '2 Oldwick', 969, 'Y', -185827, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (98, 'Ellicott City', '61 Donal Drive', 873, 'Y', -4439075, 84);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (99, 'Streamwood', '43 Forrest Street', 109, 'Y', -990786, 8);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (100, 'Cheshire', '68 Roberta Drive', 419, 'N', -6925934, 11);
commit;
prompt 100 records committed...
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (101, 'Lake Bluff', '23 Brock', 386, 'Y', -7900790, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (102, 'Bautzen', '79 Joaquin', 985, 'N', -3495133, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (103, 'Takapuna', '61 Stampley Street', 379, 'Y', -553079, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (104, 'Bruneck', '55 Natal Road', 365, 'N', -4435577, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (105, 'Orleans', '49 Jerry Street', 759, 'Y', -7820610, 0);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (106, 'Pulheim-brauweiler', '73rd Street', 542, 'N', -2779270, 42);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (107, 'Horsham', '42 Salma Road', 403, 'Y', -6345421, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (108, 'Duesseldorf', '703 Hunter Street', 692, 'N', -5230777, 75);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (109, 'Plymouth Meeting', '42nd Street', 562, 'Y', -9865058, 8);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (110, 'Vaduz', '13 Rome Drive', 661, 'Y', -6292039, 57);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (111, 'Chambersburg', '99 Cash Ave', 767, 'Y', -1100943, 100);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (112, 'Pordenone', '72nd Street', 958, 'Y', -1256280, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (113, 'Bruxelles', '89 Judd Street', 490, 'N', -4043336, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (114, 'Research Triangle', '54 St-laurent Drive', 102, 'N', -6651664, 7);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (115, 'Peterborough', '53rd Street', 214, 'Y', -4341198, 20);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (116, 'South Weber', '280 Yaphet Blvd', 819, 'Y', -7915066, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (117, 'Bristol', '55 Davison Street', 204, 'Y', -1219474, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (118, 'Warsaw', '22nd Street', 276, 'Y', -1372390, 12);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (119, 'Monroe', '48 Judy Road', 180, 'Y', -6856129, 59);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (120, 'Odense', '92 Woodard Ave', 694, 'Y', -5000524, 34);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (121, 'Tartu', '46 Salt', 456, 'Y', -9265323, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (122, 'Lisbon', '63 Jean-Luc', 434, 'N', -4124653, 74);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (123, 'Braintree', '12 Kudrow Ave', 390, 'N', -441373, 12);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (124, 'Biel', '53 Collette', 221, 'Y', -4401818, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (125, 'Bernex', '25 Hawn Street', 784, 'Y', -7075339, 8);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (126, 'Manaus', '81 Kylie Ave', 725, 'Y', -4015325, 99);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (127, 'Suwon-city', '95 Watson Road', 727, 'N', -7851915, 59);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (128, 'Schlieren', '100 Madrid Road', 447, 'N', -503710, 83);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (129, 'Leeds', '59 DiBiasio Street', 465, 'Y', -4732488, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (130, 'Kaunas', '38 Santana Road', 920, 'N', -6239195, 23);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (131, 'Edenbridge', '12nd Street', 568, 'N', -556741, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (132, 'Tooele', '53 Chubby Road', 322, 'N', -5080425, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (133, 'Highlands Ranch', '26 Benet Drive', 226, 'Y', -2609248, 91);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (134, 'Treviso', '75 Statham Ave', 818, 'Y', -4978629, 93);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (135, 'Cedar Park', '795 Arkin Blvd', 613, 'Y', -1385379, 100);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (136, 'Longueuil', '70 Popper Ave', 529, 'N', -7020986, 77);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (137, 'Fairbanks', '97 Edgar', 976, 'N', -8434879, 60);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (138, 'Algermissen', '74 Chalee Road', 392, 'N', -5519380, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (139, 'Summerside', '63rd Street', 456, 'N', -6075571, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (140, 'Bellerose', '35 Supernaw Ave', 648, 'Y', -1662001, 19);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (141, 'Coppell', '19 Scheider Ave', 426, 'Y', -1808261, 85);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (142, 'Wilmington', '45 Pigott-Smith Street', 796, 'N', -6122821, 73);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (143, 'Lisbon', '37 Tilly Road', 701, 'N', -7762312, 93);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (144, 'Tilburg', '23 Dublin Ave', 197, 'N', -3169269, 35);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (145, 'Tallahassee', '11st Street', 242, 'Y', -2694680, 35);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (146, 'Encinitas', '474 Gordie Street', 417, 'N', -9732717, 9);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (147, 'Chorzףw', '24 Domingo Drive', 544, 'N', -6866749, 70);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (148, 'New hartford', '86 Natal Drive', 790, 'Y', -1810166, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (149, 'Brussel', '14 Tripplehorn Road', 131, 'Y', -6611800, 64);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (150, 'Obfelden', '87 Burlington Street', 720, 'Y', -4243518, 96);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (151, 'Yavne', '35 Monterey Road', 362, 'Y', -7122777, 96);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (152, 'Utsunomiya', '81 Warren Road', 216, 'Y', -4866941, 91);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (153, 'Bretzfeld-Waldbach', '26 Belushi Road', 440, 'Y', -9397512, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (154, 'Friedrichshafe', '60 Bristol Street', 984, 'Y', -971728, 89);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (155, 'Port Macquarie', '768 Tyler Street', 71, 'Y', -1631308, 94);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (156, 'Bרnes', '18 Mohr', 219, 'Y', -2804065, 42);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (157, 'Lummen', '66 Kelli Road', 84, 'Y', -5288321, 31);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (158, 'Nordhausen', '33 Butner', 951, 'Y', -2974991, 12);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (159, 'Balmoral', '888 English Drive', 393, 'N', -6391679, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (160, 'Chur', '16 Byrd Road', 268, 'N', -1307794, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (161, 'Mountain View', '60 Bergen', 711, 'Y', -1403278, 39);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (162, 'Paחo de Arcos', '51 Sorocaba Ave', 64, 'N', -6240367, 25);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (163, 'Harahan', '97 Emmerich Drive', 470, 'Y', -7974109, 81);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (164, 'Laurel', '865 Newman Street', 815, 'Y', -7447637, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (165, 'Rome', '99 Mohr Street', 443, 'N', -6869880, 10);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (166, 'Hanover', '82 Khan', 499, 'Y', -7923396, 31);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (167, 'Cannock', '716 Desmond Road', 634, 'N', -9512219, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (168, 'Rochester', '3 Lloyd Blvd', 902, 'Y', -8480121, 59);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (169, 'Streamwood', '24 Suberg Street', 114, 'N', -1110197, 59);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (170, 'Alpharetta', '22nd Street', 385, 'Y', -7629044, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (171, 'Chapel hill', '32nd Street', 969, 'N', -3683399, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (172, 'Di Savigliano', '950 Somerset Street', 616, 'N', -9828967, 36);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (173, 'San Antonio', '5 Michendorf Street', 690, 'Y', -456897, 38);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (174, 'Soroe', '83rd Street', 933, 'Y', -7348022, 21);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (175, 'Verdun', '84 Carter Road', 607, 'Y', -1761423, 64);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (176, 'Lincoln', '63rd Street', 168, 'N', -2879186, 39);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (177, 'L''union', '87 Gallant Drive', 130, 'Y', -4951211, 6);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (178, 'Shreveport', '44 Avenged Road', 813, 'Y', -1718961, 93);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (179, 'Smyrna', '19 Spine Road', 275, 'N', -4086418, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (180, 'Kansas City', '39 Cuiabב Blvd', 254, 'Y', -9539291, 17);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (181, 'Fairborn', '10 Kristofferson Street', 456, 'Y', -5034409, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (182, 'Lbeck', '19 Billerica Ave', 683, 'N', -5969801, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (183, 'Oakland', '41 Pony Road', 759, 'N', -8118606, 35);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (184, 'Loveland', '93 Shalhoub Street', 553, 'N', -739734, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (185, 'Hunt Valley', '371 Withers Drive', 430, 'N', -3640072, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (186, 'Oslo', '86 Kצln Ave', 260, 'Y', -8139070, 46);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (187, 'Deerfield', '8 Trey Blvd', 817, 'Y', -4307934, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (188, 'Richmond', '1 Kungens kurva Ave', 968, 'Y', -7407526, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (189, 'Annandale', '53 Leto Road', 810, 'N', -4493919, 57);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (190, 'Tlalpan', '67 Hartmannsdorf Road', 855, 'N', -1013706, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (191, 'Stone Mountain', '74 Collins Street', 666, 'Y', -9529729, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (192, 'Ohtsu', '685 Jackman', 102, 'N', -4541089, 24);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (193, 'Reisterstown', '26 Van Damme Road', 206, 'Y', -6592837, 90);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (194, 'Kagoshima', '21st Street', 685, 'N', -8869178, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (195, 'Regensburg', '48 Mahoney Road', 373, 'N', -5225186, 9);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (196, 'Vantaa', '8 Isaacs Drive', 108, 'N', -8266818, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (197, 'Gauteng', '7 Anchorage Road', 311, 'N', -823190, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (198, 'Dalmine', '25 Fort McMurray Blvd', 229, 'N', -2077173, 26);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (199, 'Hines', '42 Matsuyama Drive', 428, 'Y', -3375706, 58);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (200, 'Crete', '23rd Street', 112, 'Y', -562736, 50);
commit;
prompt 200 records committed...
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (201, 'Rtp', '52 Tokushima Blvd', 620, 'N', -9383840, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (202, 'Meerbusch', '12 Sayer Street', 269, 'N', -7961371, 27);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (203, 'Wageningen', '75 Benicio Ave', 501, 'Y', -4763086, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (204, 'Monroe', '761 Owen Street', 779, 'Y', -685255, 14);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (205, 'Casselberry', '34 Ed Ave', 554, 'N', -5779672, 60);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (206, 'Osaka', '22 Ternitz Road', 877, 'Y', -7808523, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (207, 'Warszawa', '96 Edie', 694, 'Y', -3664945, 34);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (208, 'Chambery', '15 Pirmasens Road', 828, 'N', -2041437, 21);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (209, 'Neuchגtel', '519 Glover Road', 478, 'N', -8965841, 32);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (210, 'Rancho Palos Verdes', '43 Steve Blvd', 823, 'N', -686713, 76);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (211, 'Massagno', '599 Morgan', 563, 'Y', -2568504, 32);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (212, 'New York City', '19 Bello Road', 107, 'Y', -6062174, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (213, 'Maserada sul Piave', '83 Lawrence Road', 143, 'Y', -6250656, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (214, 'Luedenscheid', '51 Ben-Gurion Drive', 888, 'Y', -5356371, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (215, 'Slough', '83 Esposito Street', 696, 'Y', -9610542, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (216, 'Reno', '82 Duschel Blvd', 711, 'N', -2219429, 58);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (217, 'Or-yehuda', '50 Warren Ave', 668, 'Y', -6629334, 49);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (218, 'Biella', '60 Saxon Blvd', 289, 'N', -7481923, 33);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (219, 'Pיtion-ville', '14 Suzi Blvd', 229, 'N', -6350096, 81);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (220, 'Vallauris', '43 Lonsdale Drive', 533, 'Y', -3311297, 9);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (221, 'Luzern', '87 Winter Road', 138, 'Y', -4934191, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (222, 'University', '598 Torino Road', 358, 'Y', -9854021, 85);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (223, 'Algermissen', '34 McClinton Ave', 964, 'N', -2990731, 24);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (224, 'El Masnou', '13 Ty Street', 626, 'Y', -4202490, 2);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (225, 'Johannesburg', '511 Melba Road', 394, 'N', -1851683, 32);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (226, 'Cedar Park', '88 Sarsgaard Drive', 856, 'Y', -2338438, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (227, 'Kongserbg', '92 Lucas Road', 1000, 'Y', -7373901, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (228, 'Fukuoka', '21 Chapman Street', 815, 'Y', -8615269, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (229, 'Brisbane', '45 Agoncillo Road', 201, 'N', -9142977, 87);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (230, 'Berlin', '33 Strong Ave', 170, 'Y', -8666942, 2);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (231, 'Trieste', '96 Ahmad Street', 352, 'N', -1878587, 59);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (232, 'Yamaguchi', '732 Bebe Road', 856, 'N', -1226322, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (233, 'Thessaloniki', '43 Carrie-Anne Ave', 311, 'Y', -4573005, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (234, 'Saint Ouen', '87 Coltrane Road', 82, 'Y', -4235629, 23);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (235, 'Buenos Aires', '82 Dempsey', 273, 'N', -775496, 87);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (236, 'Valencia', '30 Plowright Street', 669, 'N', -7646318, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (237, 'Fukushima', '76 urban Street', 880, 'Y', -8214810, 77);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (238, 'Bkk', '97 Shatner Street', 754, 'Y', -6079164, 2);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (239, 'Eiksmarka', '736 L''union Road', 733, 'N', -590187, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (240, 'Neustadt', '82 Kazem Drive', 869, 'N', -2808490, 96);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (241, 'Yamaguchi', '52nd Street', 76, 'N', -5064915, 89);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (242, 'Guamo', '73 Wopat Road', 973, 'N', -8921298, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (243, 'Santa rita sapucaם', '29 Silverdale Street', 929, 'Y', -103646, 74);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (244, 'Lisboa', '76 Place', 830, 'Y', -4802877, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (245, 'Macclesfield', '31 Chapman Street', 241, 'Y', -5210386, 40);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (246, 'Johannesburg', '42nd Street', 420, 'Y', -2115885, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (247, 'Purley', '304 Ohtsu Ave', 304, 'N', -1702127, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (248, 'Aomori', '83 Laurel Drive', 375, 'N', -302867, 67);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (249, 'Paraju', '23rd Street', 614, 'Y', -7868293, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (250, 'Cambridge', '27 Jerusalem Road', 600, 'Y', -4689513, 77);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (251, 'Ithaca', '52 Sandler Drive', 626, 'Y', -8892916, 71);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (252, 'Genטve', '89 McDowall Road', 106, 'Y', -7989145, 11);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (253, 'Chemnitz', '7 Madonna Drive', 780, 'N', -4595973, 19);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (254, 'Pointe-claire', '30 Hersh Drive', 149, 'N', -8950803, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (255, 'Warszawa', '53rd Street', 234, 'Y', -6774238, 74);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (256, 'Lexington', '68 Englewood Street', 868, 'Y', -7016618, 66);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (257, 'Vienna', '633 Payton Drive', 238, 'Y', -8105385, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (258, 'Summerside', '81st Street', 466, 'N', -2280189, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (259, 'Barksdale afb', '906 Hayes Road', 83, 'N', -3641049, 73);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (260, 'Foster City', '46 Joy Road', 386, 'N', -6799008, 45);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (261, 'East sussex', '49 Potsdam Drive', 504, 'N', -1118093, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (262, 'Shreveport', '977 Fukushima Drive', 912, 'Y', -8401329, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (263, 'Caguas', '124 Maxine Road', 382, 'Y', -8863039, 44);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (264, 'Zafferana Etnea', '59 Gabriel Blvd', 544, 'N', -3904327, 33);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (265, 'Seoul', '626 Mae Street', 395, 'N', -2688451, 55);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (266, 'Meerbusch', '24 Paxton Street', 764, 'N', -2193314, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (267, 'Herdecke', '52 Root Road', 618, 'Y', -3048182, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (268, 'Yucca', '34 Franco', 818, 'N', -8418341, 74);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (269, 'Fairfax', '42 Quatro Road', 988, 'N', -8595954, 75);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (270, 'Londrina', '46 Chrissie Drive', 223, 'Y', -7547851, 40);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (271, 'Juneau', '69 Phoenix Ave', 249, 'N', -8682049, 83);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (272, 'Nagano', '60 Law Road', 970, 'N', -6373579, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (273, 'Redondo beach', '47 Edie Road', 84, 'Y', -2499938, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (274, 'Akron', '65 Sedgwick Blvd', 432, 'Y', -7154702, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (275, 'Bollensen', '83 Dooley Road', 320, 'N', -6465407, 1);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (276, 'Cobham', '19 Koteas Street', 97, 'Y', -9483699, 94);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (277, 'Yavne', '990 Lbeck Drive', 977, 'N', -2554765, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (278, 'Bremen', '48 Tia', 681, 'Y', -9527064, 65);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (279, 'Norderstedt', '86 Elijah Blvd', 527, 'Y', -9251853, 17);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (280, 'Mayfield Village', '53rd Street', 617, 'N', -4520833, 20);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (281, 'Altstהtten', '54 Law Street', 817, 'N', -3515409, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (282, 'Parma', '53rd Street', 331, 'Y', -2289330, 82);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (283, 'Zafferana Etnea', '100 Hamilton Street', 489, 'Y', -6360508, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (284, 'Storrington', '39 Gyllenhaal Street', 757, 'N', -8506289, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (285, 'Los Alamos', '32 Knight Street', 244, 'Y', -3467875, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (286, 'Dietikon', '46 Liu Ave', 371, 'Y', -8144780, 4);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (287, 'Balmoral', '637 Clarkson Drive', 661, 'Y', -292844, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (288, 'London', '53 Bonneville Street', 169, 'N', -7154983, 95);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (289, 'Wilmington', '20 Ribisi Ave', 274, 'Y', -3419336, 11);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (290, 'Salt Lake City', '2 Carrington Road', 182, 'Y', -8683733, 48);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (291, 'Redwood Shores', '70 Suzi Road', 398, 'Y', -6184954, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (292, 'Brugherio', '100 Savage Street', 198, 'N', -4242970, 24);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (293, 'Or-yehuda', '50 Holly Road', 96, 'N', -9169754, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (294, 'Nara', '953 Weiland Street', 787, 'N', -1033729, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (295, 'Brugherio', '29 Radney Road', 876, 'Y', -8391252, 70);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (296, 'Seattle', '73rd Street', 628, 'Y', -2782842, 96);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (297, 'Cape town', '75 Gracie Road', 451, 'N', -9820956, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (298, 'Rio Rancho', '22nd Street', 92, 'N', -9814098, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (299, 'Veenendaal', '439 Gelsenkirchen', 416, 'Y', -4232130, 58);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (300, 'Gdansk', '53 Presley Street', 590, 'Y', -9090494, 72);
commit;
prompt 300 records committed...
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (301, 'Birkenhead', '18 Jesse Drive', 70, 'Y', -7728551, 21);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (302, 'Moscow', '78 Gloria Street', 491, 'Y', -727242, 77);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (303, 'Grapevine', '39 Schlieren Road', 506, 'N', -36976, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (304, 'Lummen', '87 Larter Road', 94, 'N', -9307553, 62);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (305, 'Harahan', '92nd Street', 801, 'Y', -8759545, 70);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (306, 'Horsens', '124 Shatner Road', 562, 'Y', -4747888, 49);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (307, 'Nagasaki', '74 Carol Ave', 265, 'Y', -7265962, 6);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (308, 'Slough', '27 Leto Ave', 134, 'Y', -8326512, 30);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (309, 'Kobe', '90 Posener Drive', 538, 'Y', -5035041, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (310, 'Turku', '141 Ribisi Street', 836, 'N', -9667788, 83);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (311, 'Tualatin', '40 Bonneville', 208, 'N', -8270930, 18);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (312, 'Wetzlar', '9 Ernie Drive', 872, 'Y', -1039919, 84);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (313, 'Curitiba', '12 Li Street', 436, 'Y', -7696741, 62);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (314, 'Darmstadt', '825 Gill Blvd', 578, 'N', -6658813, 42);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (315, 'Roanoke', '41st Street', 967, 'N', -4602104, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (316, 'Yavne', '98 Jacksonville Street', 170, 'N', -9164117, 99);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (317, 'Brugherio', '63 Isaak Road', 355, 'Y', -8563374, 100);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (318, 'Framingaham', '91 Rosas', 99, 'Y', -7580362, 23);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (319, 'Mצnchengladbach', '614 Vanian Road', 613, 'Y', -2095422, 91);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (320, 'Visselhצvede', '77 Paderborn Drive', 82, 'N', -1093156, 77);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (321, 'Istanbul', '92nd Street', 252, 'N', -3862057, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (322, 'Friedrichshafe', '72nd Street', 880, 'Y', -6541541, 30);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (323, 'Laredo', '58 Liquid Road', 883, 'Y', -1395375, 42);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (324, 'Cedar Rapids', '399 Saucedo Ave', 306, 'N', -2330739, 33);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (325, 'Coslada', '65 Rothenburg', 739, 'Y', -475922, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (326, 'Valladolid', '68 Lerner', 97, 'N', -6887047, 98);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (327, 'Arlington', '1 Andy Street', 55, 'N', -7408774, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (328, 'Rosemead', '73 Bridgette Drive', 906, 'N', -8987549, 26);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (329, 'Padova', '61 Changwon-si Blvd', 920, 'N', -5609342, 57);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (330, 'Waite Park', '48 Samuel Drive', 898, 'N', -1854321, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (331, 'Webster Groves', '98 Waterloo Road', 830, 'N', -8963990, 47);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (332, 'Media', '27 O''Hara Road', 987, 'Y', -1707475, 26);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (333, 'Media', '49 Gibbons Road', 831, 'Y', -917562, 97);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (334, 'San Mateo', '314 Collie Ave', 97, 'N', -9923177, 76);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (335, 'Reading', '33 Drogenbos Drive', 52, 'N', -8335403, 69);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (336, 'Paחo de Arcos', '88 Moriarty Drive', 547, 'N', -8493273, 53);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (337, 'Regina', '219 Terri Drive', 508, 'Y', -7908683, 68);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (338, 'North Yorkshire', '38 Daejeon Road', 696, 'N', -578283, 20);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (339, 'Peachtree City', '409 Kilmer', 781, 'Y', -9262357, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (340, 'Hermitage', '184 Vanderbijlpark Street', 211, 'N', -5247795, 41);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (341, 'Saint Paul', '95 Holly', 53, 'N', -6282339, 67);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (342, 'Dortmund', '1 Treat Road', 924, 'Y', -8331268, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (343, 'Issaquah', '750 Roddy Street', 704, 'N', -7653640, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (344, 'Cerritos', '4 Bedford Road', 440, 'Y', -2748562, 27);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (345, 'Ithaca', '61st Street', 975, 'N', -8860731, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (346, 'North Point', '20 Livermore Blvd', 824, 'N', -2998753, 34);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (347, 'Oshawa', '38 Ness', 399, 'N', -951849, 76);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (348, 'Tokyo', '31st Street', 619, 'N', -7737433, 1);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (349, 'Mechanicsburg', '91 Hoskins Road', 106, 'N', -8270511, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (350, 'Sheffield', '575 Elche Drive', 775, 'Y', -198323, 66);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (351, 'Sugar Hill', '77 Aracruz Road', 320, 'Y', -4859532, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (352, 'Firenze', '34 Spears Road', 882, 'N', -1337909, 0);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (353, 'Zwolle', '100 Delta Road', 190, 'N', -6649357, 13);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (354, 'Las Vegas', '95 Twilley Ave', 539, 'N', -2615326, 93);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (355, 'Gainesville', '16 Christie Drive', 319, 'Y', -5417768, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (356, 'Di Savigliano', '23 Williams Drive', 487, 'N', -1726379, 69);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (357, 'Herzlia', '994 Frampton Street', 67, 'Y', -1321475, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (358, 'London', '277 Ferrer Road', 195, 'Y', -9161553, 32);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (359, 'Piacenza', '63 Piven Drive', 447, 'Y', -5180350, 50);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (360, 'Springfield', '94 Summerside Ave', 989, 'N', -8905433, 61);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (361, 'Hunt Valley', '673 Sinise Drive', 979, 'Y', -5458891, 40);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (362, 'Reisterstown', '8 Zaandam Blvd', 855, 'N', -9107889, 43);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (363, 'Johor Bahru', '503 Isaiah Street', 525, 'N', -5862180, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (364, 'Kochi', '100 Ricky Drive', 230, 'N', -3159383, 56);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (365, 'Borger', '52nd Street', 117, 'Y', -6653527, 84);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (366, 'Coldmeece', '90 Miguel Street', 292, 'N', -2873042, 86);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (367, 'Batavia', '33rd Street', 460, 'Y', -5252598, 63);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (368, 'Le chesnay', '83 Ottawa Drive', 874, 'N', -9444535, 0);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (369, 'Radovljica', '35 Lang', 864, 'N', -809794, 58);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (370, 'West Windsor', '34 Carrington Drive', 824, 'Y', -1666853, 14);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (371, 'Aurora', '32nd Street', 68, 'N', -9481152, 10);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (372, 'Algermissen', '60 Jodie Road', 479, 'Y', -3494709, 70);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (373, 'Freiburg', '76 Jovovich Street', 374, 'Y', -4530705, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (374, 'Coventry', '39 Harahan Street', 207, 'Y', -2818435, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (375, 'Gothenburg', '93 Harold Drive', 688, 'Y', -6884030, 72);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (376, 'Coquitlam', '9 Ward', 928, 'Y', -3376480, 88);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (377, 'Gersthofen', '74 Oberwangen', 477, 'Y', -8169747, 80);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (378, 'The Woodlands', '86 Stone Mountain Road', 432, 'Y', -5686234, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (379, 'Biella', '305 Furay', 615, 'Y', -3760078, 45);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (380, 'Bretzfeld-Waldbach', '64 Barbara Road', 958, 'N', -929135, 32);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (381, 'Aurora', '21 Lima Drive', 91, 'N', -7807848, 29);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (382, 'Suwon', '54 urban Street', 890, 'Y', -5432710, 51);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (383, 'Ulsteinvik', '39 Connie Ave', 699, 'Y', -2529039, 92);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (384, 'Ft. Lauderdale', '91st Street', 282, 'N', -5678529, 52);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (385, 'Bolton', '37 First Ave', 359, 'N', -5010958, 38);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (386, 'Agoncillo', '49 Carrington Road', 173, 'Y', -5894677, 24);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (387, 'Akita', '82 Broadbent Street', 862, 'Y', -2151673, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (388, 'Tulsa', '23 Bham Road', 345, 'Y', -4495862, 25);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (389, 'Gdansk', '48 Cash Drive', 575, 'N', -7412161, 37);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (390, 'Neuquen', '66 Sundsvall Road', 916, 'Y', -9771634, 85);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (391, 'Athens', '11st Street', 327, 'Y', -8037228, 42);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (392, 'Fukuoka', '77 Bosco Street', 536, 'Y', -4938647, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (393, 'Denver', '16 Giannini Drive', 902, 'Y', -5928648, 30);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (394, 'S. Bernardo do Campo', '43rd Street', 764, 'Y', -7876303, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (395, 'Frederiksberg', '56 Stiles Blvd', 360, 'N', -7883541, 6);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (396, 'Trento', '49 Tilly Road', 862, 'N', -4841055, 5);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (397, 'Irving', '12nd Street', 973, 'Y', -6203128, 36);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (398, 'Wichita', '31 Quinlan Road', 163, 'N', -2474914, 79);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (399, 'Fredericia', '767 Solido', 550, 'N', -1519721, 93);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (400, 'Bergen', '917 Miles Street', 450, 'N', -2990893, 91);
commit;
prompt 400 records committed...
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (401, 'Stockholm', '33rd Street', 388, 'N', -6481172, 54);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (402, 'Paderborn', '69 Thames Ditton Blvd', 954, 'N', -9077826, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (403, 'Kumamoto', '45 Terrence Road', 377, 'N', -5225438, 3);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (404, 'Massagno', '17 Lancaster Street', 489, 'Y', -9673740, 38);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (405, 'Slough', '87 Warwick Drive', 110, 'N', -533233, 28);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (406, 'Vaduz', '10 Jackie Street', 551, 'N', -1831950, 4);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (407, 'Middletown', '201 St Jean de Soudain Drive', 616, 'N', -2887716, 73);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (408, 'Pensacola', '75 Hawke Road', 981, 'Y', -7481469, 76);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (409, 'Sao jose rio preto', '72 Scorsese Road', 697, 'N', -1035023, 86);
insert into LOCATIONS (locationid, locationname, address, capacity, accessibility, contactperson, parking)
values (410, 'Nagoya', '41 Yamaguchi Street', 730, 'Y', -2935187, 7);
commit;
prompt 410 records loaded
prompt Loading ORGANIZER...
insert into ORGANIZER (organizerid, organizername, phone, email)
values (1, 'John Doe', 1234567890, 'john@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (2, 'Jane Smith', 2345678901, 'jane@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (3, 'Emily Johnson', 3456789012, 'emily@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (4, 'Michael Brown', 4567890123, 'michael@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (5, 'Jessica Davis', 5678901234, 'jessica@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (6, 'David Wilson', 6789012345, 'david@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (7, 'Sarah Miller', 7890123456, 'sarah@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (8, 'Chris Moore', 8901234567, 'chris@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (9, 'Ashley Taylor', 9012345678, 'ashley@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (10, 'Andrew Anderson', 1234509876, 'andrew@example.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (11, 'Humberto Caine', -394174, 'humberto.caine@novartis.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (12, 'Madeleine Perrineau', -2807896, 'madeleine.perrineau@teamstudio');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (13, 'Carl Keeslar', -8967904, 'ckeeslar@evergreenresources.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (14, 'Adam Brosnan', -9062346, 'adam.b@healthscribe.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (15, 'Ceili David', -9099128, 'ceili.david@tigris.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (16, 'Lennie Ball', -7092727, 'lennieb@ogi.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (17, 'Naomi Nicholas', -3831708, 'naomi.n@sprint.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (18, 'Yaphet Farrow', -2596899, 'yaphet.f@bioanalytical.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (19, 'Orlando Cockburn', -3236315, 'orlandoc@newhorizons.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (20, 'Andre Jeter', -5285439, 'andre@perfectorder.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (21, 'Horace Henriksen', -3036250, 'horace.henriksen@shirtfactory.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (22, 'Elvis Latifah', -4801091, 'elvis@astafunding.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (23, 'Howard Gibson', -1061208, 'howard.g@calence.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (24, 'Juliette Whitman', -3555027, 'juliette@ufs.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (25, 'Graham Donovan', -3713742, 'graham.donovan@parksite.cn');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (26, 'Marc Bloch', -4294261, 'marc.bloch@trusecure.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (27, 'Javon Womack', -5921860, 'javonw@mms.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (28, 'Vendetta Sobieski', -2463233, 'vendetta@evinco.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (29, 'Julianna Mollard', -4783618, 'j.mollard@newhorizons.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (30, 'Lance England', -9659704, 'l.england@mcdonalds.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (31, 'Buffy Osmond', -8279307, 'buffy.o@eastmankodak.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (32, 'Ashley Pfeiffer', -1195514, 'ashley@oss.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (33, 'Chrissie Liu', -6092028, 'chrissie@tigris.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (34, 'Nicholas Margulies', -4453512, 'nicholas.margulies@spinnakerex');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (35, 'Regina McBride', -2008800, 'regina.mcbride@tps.pt');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (36, 'Isaiah Karyo', -884306, 'isaiahk@evinco.be');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (37, 'Angelina Fierstein', -7514458, 'angelina.fierstein@cardinalcar');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (38, 'Kylie Horton', -6343696, 'kylie@gbas.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (39, 'Brent Hynde', -1917925, 'brent.hynde@y2marketing.es');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (40, 'Rich Raye', -3105121, 'rich.raye@carboceramics.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (41, 'Kelly Vincent', -8236757, 'kelly.vincent@ris.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (42, 'Natasha Murray', -8625657, 'natasha.m@talx.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (43, 'Andrea Cube', -6643466, 'andreac@accuship.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (44, 'Bridgette Ermey', -6762977, 'bridgette.ermey@worldcom.za');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (45, 'Jimmie Michaels', -9057471, 'jimmie.m@mms.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (46, 'Melba Garofalo', -5710523, 'm.garofalo@its.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (47, 'Franz Keeslar', -8392910, 'franz.keeslar@gapinc.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (48, 'Pat Rudd', -2263404, 'pat@heartlab.es');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (49, 'Will Cherry', -1123803, 'will.cherry@idas.lt');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (50, 'Anna Ojeda', -6227260, 'anna.ojeda@accurateautobody.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (51, 'Meg Bragg', -4733900, 'megb@nsd.hu');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (52, 'Terri Patillo', -9203584, 'terri.patillo@servicesource.at');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (53, 'Hugh Lizzy', -571530, 'hugh.lizzy@horizonorganic.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (54, 'Mint Keen', -9189517, 'mint.keen@daimlerchrysler.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (55, 'Lonnie Judd', -7750499, 'lonnie.judd@nha.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (56, 'Mindy Davidson', -3241317, 'mindyd@gdi.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (57, 'Ruth Maguire', -3226389, 'ruthm@actechnologies.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (58, 'Todd Birch', -3735592, 'todd@manhattanassociates.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (59, 'Caroline Perry', -6858492, 'caroline.p@accessus.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (60, 'Andre Bello', -9290967, 'andre.bello@ivci.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (61, 'Embeth Jovovich', -4493986, 'embeth.jovovich@perfectorder.c');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (62, 'Juliana Travers', -5303353, 'juliana.t@coldstonecreamery.in');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (63, 'Dianne Mason', -883447, 'dianne.mason@directdata.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (64, 'Roberta Morrison', -5169622, 'roberta.morrison@tilsonlandsca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (65, 'Isaiah Quaid', -8092103, 'isaiah.q@kingston.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (66, 'Marisa Masur', -1235330, 'mmasur@stiknowledge.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (67, 'Ali Gleeson', -5558542, 'ali@spas.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (68, 'Armand Cassel', -5859128, 'armand@hudsonriverbancorp.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (69, 'Mena Nunn', -8434164, 'mena.nunn@ssi.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (70, 'Marty Connery', -7581066, 'martyc@accurateautobody.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (71, 'Brian Kinski', -5060772, 'brian.kinski@hfn.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (72, 'Mae Blades', -3999486, 'mae.b@fab.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (73, 'Mekhi Snow', -1947308, 'mekhi@tps.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (74, 'Hilton Peniston', -5404693, 'hilton.peniston@mindiq.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (75, 'Jane Pearce', -2717155, 'janep@servicelink.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (76, 'Ali Cole', -7071232, 'ali.cole@idlabel.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (77, 'Jared Elizondo', -5393335, 'jared@coadvantageresources.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (78, 'Tanya Remar', -2407417, 'tanyar@clorox.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (79, 'Kazem Sepulveda', -9108636, 'ksepulveda@lynksystems.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (80, 'Nile Underwood', -2629836, 'nile.u@lms.at');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (81, 'Bobbi Lightfoot', -225298, 'bobbi.lightfoot@diageo.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (82, 'Jamie Collie', -948373, 'jamiec@kramontrealty.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (83, 'Matthew Quinn', -4233871, 'matthew@viacom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (84, 'Sander Rea', -2682976, 's.rea@spotfireholdings.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (85, 'Night Carlyle', -7529773, 'night.carlyle@processplus.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (86, 'Giovanni Goodall', -2501950, 'giovanni.g@saksinc.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (87, 'Leslie Peet', -952255, 'leslie.peet@bigdoughcom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (88, 'Famke Wilson', -7322805, 'famke@ois.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (89, 'Curt Landau', -6085457, 'curt.l@ubp.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (90, 'Hazel Hagerty', -9959788, 'hazel.hagerty@nissanmotor.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (91, 'Meg Crow', -4788688, 'megc@albertsons.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (92, 'Celia Katt', -4416341, 'celia.katt@hfg.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (93, 'Glenn Mitchell', -5445991, 'glenn.mitchell@evergreenresour');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (94, 'Terence Ronstadt', -6857418, 'terence.ronstadt@aquascapedesi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (95, 'Brian Rifkin', -9137199, 'brian.rifkin@limitedbrands.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (96, 'Jet Thompson', -4479636, 'jet.thompson@fetchlogistics.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (97, 'Mitchell Hauer', -3773765, 'mitchell.h@cendant.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (98, 'Celia Wilson', -2632885, 'celiaw@bioreliance.pt');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (99, 'King Gershon', -4388773, 'k.gershon@globalwireless.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (100, 'Halle Sedgwick', -4850909, 'halle.sedgwick@blueoceansoftwa');
commit;
prompt 100 records committed...
insert into ORGANIZER (organizerid, organizername, phone, email)
values (101, 'Gerald Gaines', -5663649, 'g.gaines@sprint.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (102, 'Dick Vaughn', -1365009, 'dick.v@fab.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (103, 'Night Wong', -9089184, 'nwong@dis.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (104, 'Lois Bates', -2863055, 'lois.bates@bradleypharmaceutic');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (105, 'Gailard Lewin', -2383884, 'glewin@floorgraphics.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (106, 'Juliana Kattan', -1783671, 'jkattan@nuinfosystems.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (107, 'Night Van Damme', -6401660, 'night@at.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (108, 'Gina Def', -9687982, 'gina.def@saralee.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (109, 'Gloria Ball', -141853, 'gball@meridiangold.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (110, 'Jeroen Witt', -7652518, 'jeroen.witt@lfg.pl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (111, 'Terence Garofalo', -8721248, 'terence.g@fsffinancial.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (112, 'Connie Palmieri', -5371948, 'connie.palmieri@priorityexpres');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (113, 'Ron Simpson', -2770779, 'rons@teamstudio.no');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (114, 'Jared Mac', -4431803, 'j.mac@advertisingventures.cz');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (115, 'Hope Dillane', -7842793, 'hope.dillane@privatebancorp.be');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (116, 'Terry Brosnan', -4077654, 'terry.brosnan@multimedialive.c');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (117, 'Norm Sinatra', -4539966, 'norm.sinatra@air.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (118, 'Sean Ramis', -4301782, 'sean.ramis@myricom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (119, 'Natalie Mollard', -4461914, 'nmollard@providenceservice.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (120, 'Claude Rollins', -1591868, 'crollins@fetchlogistics.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (121, 'Holly LaMond', -9328920, 'holly.lamond@nmr.be');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (122, 'Cary Paul', -4662264, 'cary.paul@tama.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (123, 'Lennie Hingle', -1843271, 'lennie@caliber.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (124, 'Madeleine Mahoney', -5746110, 'madeleine.mahoney@sht.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (125, 'Claire Shaw', -2182574, 'claire.shaw@studiobproductions');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (126, 'Ricardo McKellen', -508017, 'ricardo.m@usdairyproducers.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (127, 'Olga Jackson', -4772616, 'olga@news.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (128, 'Corey Giraldo', -7435739, 'corey@tmaresources.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (129, 'Annie Gough', -8405690, 'annie.gough@universalsolutions');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (130, 'Lara Gilley', -257196, 'lara.gilley@adolph.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (131, 'Nora Redgrave', -1637372, 'nora.redgrave@hersheyfoods.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (132, 'Ethan Loeb', -3013453, 'eloeb@sfmai.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (133, 'Stephen Paxton', -6779041, 'stephen.paxton@atlanticcredit.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (134, 'Nina Spears', -5353526, 'nina.spears@safeway.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (135, 'Suzi O''Connor', -8981120, 'suzi@visainternational.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (136, 'Joshua Gleeson', -6558718, 'jgleeson@commworks.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (137, 'Ted Baranski', -3889520, 't.baranski@cooktek.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (138, 'Johnette Perez', -1856975, 'johnette.p@hotmail.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (139, 'Rosanna Stanton', -904065, 'r.stanton@kingston.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (140, 'Clive Parsons', -8739298, 'clivep@coridiantechnologies.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (141, 'Andre Hidalgo', -7029525, 'andre.hidalgo@millersystems.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (142, 'Kirsten Coe', -1236087, 'kirstenc@atlanticcredit.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (143, 'Mena Jolie', -4196565, 'mena.jolie@lydiantrust.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (144, 'Vin Condition', -5070907, 'vin.condition@navigatorsystems');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (145, 'Ice Dushku', -8557781, 'i.dushku@pra.at');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (146, 'Merrill Branch', -8656070, 'merrill.branch@ezecastlesoftwa');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (147, 'Colleen Leachman', -4556432, 'colleen.leachman@scripnet.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (148, 'Remy McClinton', -5158250, 'remy@linacsystems.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (149, 'Sonny Olyphant', -710994, 'sonny.olyphant@employerservice');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (150, 'Merrilee Beck', -4925042, 'merrilee.beck@universalsolutio');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (151, 'Linda Torino', -2552189, 'linda.torino@at.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (152, 'Horace Zappacosta', -4440006, 'hzappacosta@logisticare.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (153, 'Zooey Winwood', -2983101, 'zooey.w@oneidafinancial.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (154, 'Ashton Warwick', -8537362, 'ashton.w@worldcom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (155, 'Walter Spader', -1642835, 'walter.spader@gillani.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (156, 'Lizzy Rucker', -2295480, 'lizzy.rucker@fds.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (157, 'Tilda Van Shelton', -4656358, 'tilda.vanshelton@insurmark.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (158, 'Mandy Armatrading', -5163818, 'mandy.armatrading@mai.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (159, 'Trey Hopper', -9550849, 't.hopper@genextechnologies.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (160, 'Seth Gere', -2470769, 'seth.gere@invisioncom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (161, 'Ethan Supernaw', -809223, 'ethan.supernaw@parker.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (162, 'Carol Witt', -4548574, 'carol.witt@pioneermortgage.fi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (163, 'Bernard Bruce', -8582828, 'b.bruce@trm.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (164, 'Kieran Idol', -4010221, 'k.idol@shot.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (165, 'Art Kinney', -316028, 'art@yumbrands.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (166, 'Maury Warren', -994908, 'maury.w@multimedialive.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (167, 'Renee Stanton', -12471, 'renees@tilia.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (168, 'Embeth Meyer', -4533847, 'embeth.meyer@ghrsystems.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (169, 'Avril Piven', -7666869, 'avril.piven@ipsadvisory.th');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (170, 'Dabney Warburton', -1886741, 'dabney.w@ads.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (171, 'Kiefer Margolyes', -6671763, 'k.margolyes@ams.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (172, 'Thelma Chinlund', -9962100, 'thelma.chinlund@telwares.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (173, 'Jason Conners', -5228670, 'jason@parker.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (174, 'Graham Wakeling', -2157531, 'graham@morganresearch.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (175, 'Samuel Aiken', -658211, 'samuel.a@mcdonalds.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (176, 'Ani Henstridge', -1118869, 'ani.henstridge@intel.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (177, 'Merillee Strong', -803981, 'merillee.s@elite.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (178, 'Kurt Rawls', -4749485, 'kurt.r@sourcegear.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (179, 'Sal Taha', -4564174, 'salt@sis.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (180, 'Tom Meniketti', -3189011, 'tom.m@horizonorganic.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (181, 'Vincent Neville', -7372416, 'vincent.neville@ads.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (182, 'Brittany Atkinson', -4702982, 'brittany@healthscribe.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (183, 'Selma Akins', -1248475, 'selma.a@profitline.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (184, 'Micky Shaw', -3916086, 'micky.shaw@bluffcitysteel.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (185, 'Pamela McClinton', -2920275, 'pamela.mcclinton@captechventur');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (186, 'Embeth Noseworthy', -4461295, 'embeth.noseworthy@fnb.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (187, 'Grace Cornell', -5455022, 'gracec@swi.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (188, 'Angie Sartain', -6025448, 'angie.sartain@yashtechnologies');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (189, 'Wendy Wahlberg', -6091328, 'wendy.w@studiobproductions.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (190, 'Juan LaPaglia', -1057221, 'juan@conquestsystems.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (191, 'Clea Sinise', -7909359, 'clea.s@consultants.at');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (192, 'Miko Vaughn', -9827721, 'miko@mindworks.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (193, 'Rich Tucker', -4417455, 'rtucker@entelligence.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (194, 'Cary Washington', -1852696, 'cary.washington@unica.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (195, 'Judi Rickles', -8397850, 'j.rickles@trusecure.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (196, 'Scott Chinlund', -5655639, 'scott.c@cyberthink.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (197, 'Emilio Nelson', -1939443, 'e.nelson@studiobproductions.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (198, 'Austin McDonald', -6511001, 'austin@ubp.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (199, 'Kathy Mirren', -4899004, 'k.mirren@lindin.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (200, 'Colm Flemyng', -9010456, 'colm.flemyng@globalwireless.co');
commit;
prompt 200 records committed...
insert into ORGANIZER (organizerid, organizername, phone, email)
values (201, 'Sal Haysbert', -3250688, 's.haysbert@ams.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (202, 'Gaby Lynn', -9704500, 'glynn@signalperfection.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (203, 'Joely Kier', -3585640, 'joelyk@dataprise.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (204, 'Mykelti DiBiasio', -4494840, 'mykeltid@myricom.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (205, 'Whoopi Suvari', -3882732, 'whoopi.suvari@authoria.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (206, 'Martha Llewelyn', -3260633, 'marthal@spectrum.hu');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (207, 'Tara Taylor', -6883741, 't.taylor@mindworks.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (208, 'Kyra Moraz', -4563479, 'kyra.m@gsat.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (209, 'Eliza Prowse', -9414054, 'eliza.prowse@waltdisney.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (210, 'Mos Fraser', -8235812, 'm.fraser@ibfh.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (211, 'Christmas Gallagher', -8938949, 'cgallagher@capital.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (212, 'Danny Cumming', -251192, 'danny.c@timevision.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (213, 'Leelee O''Keefe', -9702361, 'leelee.o@meghasystems.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (214, 'Dermot Hunter', -7445811, 'dhunter@veritekinternational.c');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (215, 'Kylie Vannelli', -6250561, 'kylie@fam.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (216, 'Kieran Turturro', -5942810, 'kieran@elitemedical.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (217, 'Shannyn MacDowell', -83738, 'shannyn.macdowell@younginnovat');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (218, 'Nathan Kapanka', -5204632, 'n.kapanka@innovativelighting.a');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (219, 'King McClinton', -2882296, 'king.mcclinton@investorstitle.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (220, 'Leonardo Botti', -6655716, 'l.botti@harrison.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (221, 'Machine Tillis', -6492063, 'machine.tillis@thinktanksystem');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (222, 'Jaime Murphy', -9522593, 'jaime.murphy@kwraf.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (223, 'Derrick Wright', -111797, 'derrick.wright@ibm.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (224, 'Gin Costello', -8081896, 'gin.c@gra.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (225, 'Burt Masur', -9579197, 'b.masur@meridiangold.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (226, 'Charlton Llewelyn', -1865783, 'charlton.llewelyn@veritekinter');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (227, 'Gladys Hayes', -2856877, 'gladys@newmedia.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (228, 'Mika Capshaw', -9588562, 'mika@pinnaclestaffing.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (229, 'Jennifer Lyonne', -1091257, 'jennifer.lyonne@spas.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (230, 'Derek DeLuise', -3929892, 'd.deluise@prosperitybancshares');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (231, 'Rene Blackwell', -3119872, 'rene.blackwell@dsp.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (232, 'Benicio Evanswood', -6245822, 'benicio.e@maverick.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (233, 'Benicio Malone', -9220191, 'bmalone@astute.dk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (234, 'Gavin Fraser', -3282014, 'g.fraser@elite.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (235, 'Mira McCabe', -8521047, 'mira.m@mai.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (236, 'Colm Amos', -1154729, 'colm@y2marketing.be');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (237, 'Famke Lloyd', -6234990, 'f.lloyd@captechventures.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (238, 'Joseph Eder', -3256744, 'jeder@safehomesecurity.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (239, 'Freda Stampley', -7082380, 'f.stampley@fra.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (240, 'Lupe Cale', -6540598, 'lcale@accurateautobody.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (241, 'Lou Hutch', -1510511, 'lou.hutch@ghrsystems.dk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (242, 'Leonardo Delta', -5376537, 'leonardo.delta@oriservices.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (243, 'Todd Quaid', -1162019, 'todd.quaid@nissanmotor.ar');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (244, 'Aida Hatosy', -3068321, 'aida.hatosy@signature.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (245, 'Sissy Idol', -6218034, 's.idol@diversitech.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (246, 'Jesse Fehr', -1197117, 'j.fehr@lfg.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (247, 'Olympia Vai', -4632401, 'olympia.vai@trafficmanagement.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (248, 'Trace Northam', -1801503, 'tracen@columbiabancorp.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (249, 'Maureen Gordon', -6819180, 'maureen@webgroup.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (250, 'Tanya Bonham', -8616096, 'tanya.bonham@fmb.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (251, 'Cole Withers', -3267000, 'cole.w@smartronix.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (252, 'Greg Zellweger', -5213752, 'greg.zellweger@ungertechnologi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (253, 'Gabrielle Shocked', -4626518, 'gabrielle.shocked@nmr.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (254, 'First Savage', -578919, 'f.savage@aoe.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (255, 'Bernard Downey', -7395538, 'bernard@walmartstores.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (256, 'Liv Smurfit', -9838808, 'liv.smurfit@at.es');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (257, 'Clay Pepper', -7090418, 'clay.pepper@ibm.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (258, 'Carrie Weisz', -7057491, 'carrie.w@pscinfogroup.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (259, 'Omar Devine', -178830, 'o.devine@ezecastlesoftware.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (260, 'Andrea Hawthorne', -8833358, 'andrea.hawthorne@scriptsave.si');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (261, 'Harold Lerner', -3226252, 'harold.lerner@generalmotors.za');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (262, 'Juliette Holmes', -9361923, 'juliette.holmes@providenceserv');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (263, 'Leonardo Greenwood', -5457847, 'lgreenwood@mindiq.mx');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (264, 'Gin Ingram', -9569814, 'gin.ingram@mathis.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (265, 'Selma Cube', -521621, 'selma.c@northhighland.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (266, 'Taye Kretschmann', -2576741, 'taye.kretschmann@enterprise.li');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (267, 'Gabriel Ceasar', -208792, 'gabriel.ceasar@insurmark.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (268, 'Annette Clinton', -3632716, 'annette.c@maverick.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (269, 'Julia Ward', -1537092, 'jward@volkswagen.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (270, 'Bradley Dooley', -5689542, 'bradley.dooley@meghasystems.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (271, 'Ted Van Damme', -9730267, 'ted@timberlanewoodcrafters.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (272, 'Lesley Cervine', -2075337, 'lesley.cervine@qssgroup.in');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (273, 'Mint O''Donnell', -3089011, 'mint.odonnell@aventis.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (274, 'Chalee Shatner', -7954446, 'chalee.shatner@bestbuy.fi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (275, 'Tamala Rhys-Davies', -5299440, 'trhysdavies@wlt.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (276, 'Harrison Caldwell', -6343429, 'harrison.caldwell@ssi.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (277, 'Sheryl Mollard', -7283859, 's.mollard@americanpan.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (278, 'Chad Deejay', -4783487, 'chad@cws.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (279, 'Cesar Warburton', -6410866, 'c.warburton@wrgservices.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (280, 'Ali Crowell', -3458614, 'ali.crowell@denaliventures.hu');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (281, 'Garry Jackson', -1213391, 'garry.jackson@mindiq.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (282, 'Jessica Connick', -1574740, 'jessica.connick@scheringplough');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (283, 'Suzy Melvin', -5388876, 'suzy.melvin@bestever.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (284, 'Ali Coburn', -7253087, 'acoburn@outsourcegroup.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (285, 'Sammy Tarantino', -3731389, 'sammy.tarantino@ctg.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (286, 'Emily Cervine', -122269, 'emily.c@accuship.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (287, 'Micky Potter', -7342135, 'm.potter@voicelog.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (288, 'Tori Kahn', -5930601, 'tori.kahn@smi.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (289, 'Kid Bosco', -1882051, 'kid.bosco@ams.dk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (290, 'Nancy DiCaprio', -6854190, 'ndicaprio@capitalautomotive.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (291, 'Tal Derringer', -3552086, 'tald@gci.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (292, 'Wendy Branch', -3448076, 'wendy.branch@unicru.za');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (293, 'Lynette Dafoe', -962769, 'lynette.dafoe@lms.py');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (294, 'Graham Penders', -9765497, 'gpenders@angieslist.fi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (295, 'Alana Bratt', -2371023, 'alana.bratt@topicsentertainmen');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (296, 'Amanda Condition', -9397886, 'amanda.condition@qas.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (297, 'Danni Niven', -8411917, 'danni.niven@abs.in');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (298, 'Jason Rebhorn', -1871276, 'jason.r@dps.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (299, 'Will Marsden', -9624396, 'w.marsden@parksite.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (300, 'Charlton Lang', -2361726, 'charlton.lang@lifelinesystems.');
commit;
prompt 300 records committed...
insert into ORGANIZER (organizerid, organizername, phone, email)
values (301, 'Nancy Calle', -9597341, 'n.calle@outsourcegroup.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (302, 'Sander Fender', -2515813, 'sander.f@meridiangold.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (303, 'Emma Dern', -8438395, 'emma.dern@novartis.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (304, 'Celia Moffat', -1744057, 'celia.moffat@epamsystems.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (305, 'Linda Gandolfini', -3050514, 'linda.gandolfini@aoe.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (306, 'Jena Judd', -7262223, 'jjudd@atg.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (307, 'Naomi Dorff', -9364038, 'naomi@americanexpress.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (308, 'Treat Lloyd', -7845621, 'treatl@verizon.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (309, 'Curt Ratzenberger', -7237708, 'c.ratzenberger@fetchlogistics.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (310, 'Marina D''Onofrio', -5531400, 'marina.donofrio@kramontrealty.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (311, 'Penelope Haynes', -3376755, 'p.haynes@atg.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (312, 'Rene Crystal', -7260580, 'r.crystal@sfmai.hk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (313, 'Daniel McGregor', -7999425, 'daniel.mcgregor@wci.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (314, 'Rebeka Hatfield', -8059130, 'rebeka.hatfield@cardtronics.co');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (315, 'Jerry Clinton', -7889595, 'jclinton@nsd.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (316, 'Pelvic Tillis', -3619922, 'p.tillis@otbd.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (317, 'Stephanie Steiger', -4015667, 's.steiger@virbac.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (318, 'Wesley O''Neal', -4746256, 'wesley.oneal@capitalautomotive');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (319, 'Shirley Lithgow', -8021787, 'shirley.lithgow@ccb.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (320, 'Frances Richardson', -6443791, 'frances@signalperfection.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (321, 'Gaby Stigers', -6590085, 'g.stigers@americanland.fi');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (322, 'Boyd Myers', -2468204, 'b.myers@qas.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (323, 'Mekhi Holbrook', -5717415, 'mekhi.holbrook@conagra.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (324, 'Shannyn Chappelle', -9954168, 'shannyn.chappelle@priorityleas');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (325, 'Frances Pollack', -4552209, 'frances.pollack@granitesystems');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (326, 'Rodney Benoit', -9785854, 'rodney.benoit@wellsfinancial.c');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (327, 'Thin Mulroney', -5586626, 'thin.mulroney@nobrainerblindsc');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (328, 'Phil Gilliam', -9559910, 'phil.gilliam@insurmark.mo');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (329, 'Lindsey Connick', -2140496, 'lindsey.c@ogi.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (330, 'Lee Goldwyn', -6333600, 'lee.goldwyn@bat.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (331, 'Lea Byrd', -671149, 'lea.byrd@universalsolutions.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (332, 'Claire Lachey', -324746, 'claire.lachey@dell.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (333, 'Bridget Bogguss', -1335830, 'bbogguss@sfb.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (334, 'Barbara Perry', -6311308, 'barbara.perry@y2marketing.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (335, 'Colleen Lynn', -7199532, 'colleen@jsa.se');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (336, 'Taylor Bratt', -150016, 'taylor.bratt@fpf.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (337, 'Terrence Bogguss', -9469188, 'terrence.bogguss@deutschetelek');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (338, 'Aidan Ruiz', -8120889, 'aidan.ruiz@visionarysystems.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (339, 'Pat McGovern', -8124548, 'pat@pds.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (340, 'Penelope Child', -9044042, 'penelope.child@cowlitzbancorp.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (341, 'Martha Wells', -7863751, 'martha@coadvantageresources.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (342, 'Milla Reubens', -2704167, 'milla.reubens@seiaarons.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (343, 'Willem Coburn', -7069351, 'willem.coburn@trinityhomecare.');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (344, 'Nickel Orton', -2038403, 'nickel.orton@viacom.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (345, 'Robbie Curtis', -83209, 'robbie.curtis@processplus.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (346, 'Thelma Seagal', -6605828, 'thelma.seagal@spas.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (347, 'Trini Baez', -1087744, 'trini.baez@jma.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (348, 'Betty May', -5955566, 'betty.may@nat.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (349, 'Glen McGill', -301014, 'glen.m@advancedneuromodulation');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (350, 'Roy Conroy', -4761045, 'roy.conroy@dps.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (351, 'Mike Humphrey', -4431481, 'mike.humphrey@mre.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (352, 'Devon Lane', -6438859, 'devon@visainternational.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (353, 'Joey Adkins', -775886, 'joey.adkins@gulfmarkoffshore.c');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (354, 'Kylie Chaykin', -7511503, 'kylie.c@sm.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (355, 'Jason Harry', -1812198, 'jason.harry@boldtechsystems.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (356, 'Lin Callow', -5156603, 'lin.callow@valleyoaksystems.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (357, 'Sal Haslam', -5528014, 'sal.haslam@mms.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (358, 'Sal Hagerty', -3918085, 'sal.hagerty@sunstream.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (359, 'Will McGregor', -9485521, 'will.mcgregor@ibm.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (360, 'Ronnie Thomas', -6281819, 'rthomas@zaiqtechnologies.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (361, 'Denny Goldberg', -2552002, 'denny.goldberg@americanpan.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (362, 'Josh Stamp', -5156563, 'josh.stamp@dps.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (363, 'Rebecca Ledger', -2195869, 'rebecca.l@dbprofessionals.at');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (364, 'Vanessa Charles', -9176626, 'vanessac@hencie.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (365, 'Gilberto Sutherland', -5458853, 'gilberto.sutherland@terrafirma');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (366, 'Joe Tolkan', -8746761, 'joet@sensortechnologies.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (367, 'Orlando Hatchet', -510324, 'orlando@ositissoftware.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (368, 'Charles Hubbard', -3401953, 'charles.hubbard@diageo.it');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (369, 'Lou Ward', -3945000, 'lou.ward@nissanmotor.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (370, 'Illeana Osment', -658516, 'illeanao@techbooks.hk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (371, 'Linda Kahn', -9691601, 'linda.k@curagroup.il');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (372, 'Frankie Hornsby', -385076, 'frankie.hornsby@loreal.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (373, 'Albertina Collie', -4018865, 'albertina.collie@serentec.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (374, 'Phoebe Uggams', -5016671, 'phoebe.uggams@valleyoaksystems');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (375, 'Alfred Lee', -9492907, 'alfred.lee@mosaic.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (376, 'Demi Vannelli', -4430728, 'demi.vannelli@marsinc.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (377, 'Thora Edmunds', -4223961, 'thora@kingland.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (378, 'Elijah Brickell', -7129799, 'elijah.brickell@powerlight.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (379, 'Tea Gaines', -2836861, 'tea@mavericktechnologies.uk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (380, 'Forest Giraldo', -2415104, 'forest.g@printingforlesscom.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (381, 'Neneh Paquin', -5946748, 'npaquin@wendysinternational.ch');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (382, 'Olympia Aaron', -1802138, 'olympia.aaron@linersdirect.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (383, 'Loretta Kinney', -1559396, 'lkinney@hotmail.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (384, 'Rich Ontiveros', -4525255, 'rontiveros@grt.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (385, 'Humberto Kidman', -7502452, 'humberto.kidman@lms.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (386, 'Regina Waits', -320457, 'regina.waits@ams.fr');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (387, 'Curt Prinze', -7657331, 'curt.prinze@acsis.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (388, 'Donal Sawa', -4572858, 'dsawa@signalperfection.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (389, 'Peter Eldard', -3674452, 'peter@monitronicsinternational');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (390, 'Jack Jackman', -326487, 'jjackman@ahl.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (391, 'John Ingram', -6089936, 'john.ingram@tlsservicebureau.d');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (392, 'Thora Tankard', -2395040, 'thora.tankard@ogiointernationa');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (393, 'James Roundtree', -9069328, 'james.r@greene.br');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (394, 'Edie Pigott-Smith', -7176963, 'edie.pigottsmith@clubone.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (395, 'Spencer McNeice', -2789820, 'spencer.mcneice@globalwireless');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (396, 'Celia Pressly', -6394730, 'celiap@gci.pt');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (397, 'Julie Page', -4646438, 'julie.page@ceo.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (398, 'Rik Satriani', -888822, 'r.satriani@hondamotor.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (399, 'Thomas Bassett', -8220576, 'tbassett@abatix.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (400, 'Davy Baker', -3396236, 'davy.baker@yashtechnologies.co');
commit;
prompt 400 records committed...
insert into ORGANIZER (organizerid, organizername, phone, email)
values (401, 'Crystal Turner', -5490900, 'crystal@intel.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (402, 'Eileen Jackson', -5019999, 'eileenj@wellsfinancial.au');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (403, 'Marty Benoit', -847776, 'marty.benoit@sms.nl');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (404, 'Gord Gershon', -4903368, 'gordg@cima.jp');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (405, 'Toshiro Phillips', -2400716, 'toshiro.phillips@wendysinterna');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (406, 'Gord Gooding', -7255419, 'gord@surmodics.de');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (407, 'Ozzy Vinton', -3368803, 'ozzy.vinton@printtech.com');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (408, 'Todd Dupree', -8088198, 'todd.dupree@dell.ca');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (409, 'Davis Hoskins', -4978779, 'davis.hoskins@appriss.dk');
insert into ORGANIZER (organizerid, organizername, phone, email)
values (410, 'Kirk Popper', -6091007, 'kpopper@printcafesoftware.com');
commit;
prompt 410 records loaded
prompt Loading EVENT...
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (1, 'Sports Event', to_date('01-06-2024', 'dd-mm-yyyy'), 'A local sports event.', 1, 1, 1);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (2, 'Community Gathering', to_date('05-06-2024', 'dd-mm-yyyy'), 'A gathering for the community.', 2, 2, 2);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (3, 'Cultural Night', to_date('10-06-2024', 'dd-mm-yyyy'), 'An evening of cultural performances.', 3, 3, 3);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (4, 'Independence Day', to_date('15-06-2024', 'dd-mm-yyyy'), 'Celebration of Independence Day.', 4, 4, 4);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (5, 'Theatre Play', to_date('20-06-2024', 'dd-mm-yyyy'), 'A theatre performance.', 5, 5, 5);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (6, 'Memorial Service', to_date('25-06-2024', 'dd-mm-yyyy'), 'A service to remember fallen heroes.', 6, 6, 6);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (7, 'Educational Workshop', to_date('01-07-2024', 'dd-mm-yyyy'), 'A workshop on educational topics.', 7, 7, 7);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (8, 'Music Concert', to_date('05-07-2024', 'dd-mm-yyyy'), 'A live music concert.', 8, 8, 8);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (9, 'Summer Festival', to_date('10-07-2024', 'dd-mm-yyyy'), 'A summer festival with various activities.', 9, 9, 9);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (10, 'Film Screening', to_date('15-07-2024', 'dd-mm-yyyy'), 'A screening of a popular film.', 10, 10, 10);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (11, 'Aquascape Designs marathon', to_date('22-12-2026 23:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 387, 320, 32);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (12, 'Component Graphics marathon', to_date('21-01-2025 17:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 118, 294, 67);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (13, 'Cima Consulting Group marathon', to_date('15-10-2025 13:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 211, 53, 21);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (14, 'Access Systems marathon', to_date('03-11-2024 13:17:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 83, 312, 287);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (15, 'Alternative Business Systems m', to_date('17-05-2026 03:23:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 95, 107, 56);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (16, 'Bio-Reference Labs marathon', to_date('14-08-2025 10:20:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 388, 82, 165);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (17, 'North Coast Energy marathon', to_date('17-04-2025 02:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 155, 210, 91);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (18, 'Hat World marathon', to_date('11-01-2024 16:36:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 246, 311, 301);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (19, 'Diamond Technologies marathon', to_date('11-11-2025 19:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 264, 320, 260);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (20, 'American Express Co. marathon', to_date('06-01-2025 00:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 154, 126, 270);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (21, 'Axis Consulting marathon', to_date('29-11-2025 07:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 350, 185, 198);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (22, 'Heartland Payment Systems mara', to_date('21-08-2026 21:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 267, 100, 116);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (23, 'Keller Williams Realty Ahwatuk', to_date('02-06-2026 03:05:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 38, 159, 159);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (24, 'Alogent marathon', to_date('22-06-2024 12:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 349, 131, 225);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (25, 'Miracle Software Systems marat', to_date('27-07-2024 16:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 369, 401, 395);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (26, 'SSCI marathon', to_date('20-01-2025 19:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 345, 204, 247);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (27, 'Cardtronics marathon', to_date('22-10-2024 12:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 227, 252, 367);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (28, 'Urstadt Biddle Properties mara', to_date('23-04-2026 00:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 19, 163, 256);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (29, 'Total Entertainment marathon', to_date('05-12-2026 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 375, 234, 83);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (30, 'Atlantic.Net marathon', to_date('24-12-2025 10:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 209, 262, 131);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (31, 'Diamond Pharmacy Services mara', to_date('10-04-2025 08:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 227, 4, 158);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (32, 'Megha Systems marathon', to_date('08-06-2025 01:03:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 329, 61, 274);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (33, 'Dynacq International marathon', to_date('18-08-2024 04:27:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 174, 2, 244);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (34, 'ATA Services marathon', to_date('12-06-2025 15:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 218, 137, 346);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (35, 'State Farm Mutual Automobile I', to_date('03-11-2024 00:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 333, 175, 1);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (36, 'U.S. Government marathon', to_date('30-03-2026 05:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 98, 348, 96);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (37, 'Formatech marathon', to_date('01-07-2025 01:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 81, 169, 373);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (38, 'Miracle Software Systems marat', to_date('19-03-2024 06:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 196, 292, 379);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (39, 'American Pan & Engineering mar', to_date('18-05-2025 18:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 245, 248, 126);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (40, 'Ivory Systems marathon', to_date('05-07-2024 10:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 197, 323, 334);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (41, 'Infinity Software Development ', to_date('27-07-2024 05:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 230, 97, 87);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (42, 'Venoco marathon', to_date('12-08-2026 07:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 54, 53, 178);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (43, 'Socket Internet marathon', to_date('06-01-2025 01:27:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 221, 113, 243);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (44, 'Wyeth marathon', to_date('15-07-2026 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 234, 201, 143);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (45, 'MQ Software marathon', to_date('10-02-2026 22:35:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 351, 404, 340);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (46, 'Extreme Pizza marathon', to_date('21-07-2026 09:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 218, 266, 257);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (47, 'Atlantic.Net marathon', to_date('27-01-2026 21:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 42, 171, 311);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (48, 'Heartland Payment Systems mara', to_date('08-10-2025 04:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 137, 312, 390);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (49, 'Random Walk Computing marathon', to_date('19-12-2026 05:12:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 121, 394, 77);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (50, 'Kitba Consulting Services mara', to_date('12-01-2024 01:27:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 3, 123, 190);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (51, 'Trinity HomeCare marathon', to_date('27-08-2025 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 10, 161, 298);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (52, 'Bedford Bancshares marathon', to_date('04-07-2025 12:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 116, 346, 36);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (53, 'Volkswagen marathon', to_date('11-12-2024 14:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 288, 159, 273);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (54, 'Lloyd Group marathon', to_date('14-06-2026 13:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 333, 221, 318);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (55, 'Meridian Gold marathon', to_date('07-07-2024 00:32:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 142, 16, 250);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (56, 'Kingland Companies marathon', to_date('03-07-2026 23:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 332, 52, 226);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (57, 'Lindin Consulting marathon', to_date('16-01-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 357, 255, 320);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (58, 'L.E.M. Products marathon', to_date('02-10-2025 21:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 143, 190, 132);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (59, 'American Healthways marathon', to_date('07-11-2024 08:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 369, 14, 62);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (60, 'Sammy''s Woodfired Pizza marath', to_date('24-08-2024 20:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 104, 62, 403);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (61, 'SHOT marathon', to_date('14-10-2026 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 209, 142, 149);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (62, 'Meridian Gold marathon', to_date('31-10-2026 14:20:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 36, 276, 12);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (63, 'SupplyCore.com marathon', to_date('27-03-2024 14:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 140, 12, 60);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (64, 'CapTech Ventures marathon', to_date('15-10-2025 16:35:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 260, 378, 323);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (65, 'Advantage Credit International', to_date('07-12-2025 14:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 11, 379, 223);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (66, 'Flow Management Technologies m', to_date('23-12-2026 01:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 272, 362, 397);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (67, 'Pioneer Data Systems marathon', to_date('24-08-2025 01:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 51, 162, 346);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (68, 'Columbia Bancorp marathon', to_date('09-09-2025 14:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 24, 294, 281);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (69, 'Sequoia System International m', to_date('06-04-2026 16:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 263, 143, 280);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (70, 'WorldCom marathon', to_date('30-04-2026 04:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 318, 262, 359);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (71, 'Invision.com marathon', to_date('23-06-2024 00:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 399, 250, 222);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (72, 'WestNet Learning Technologies ', to_date('23-06-2026 19:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 69, 374, 108);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (73, 'York Enterprise Solutions mara', to_date('17-04-2026 01:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 213, 187, 237);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (74, 'Vesta marathon', to_date('31-05-2024 20:14:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 342, 304, 96);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (75, 'Marriott International maratho', to_date('01-12-2026 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 317, 236, 367);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (76, 'Dankoff Solar Products maratho', to_date('03-02-2024 01:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 41, 228, 98);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (77, 'CyberThink marathon', to_date('02-03-2025 09:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 403, 125, 244);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (78, 'WRG Services marathon', to_date('02-06-2024 13:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 215, 106, 101);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (79, 'MasterCard International marat', to_date('12-02-2026 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 387, 175, 260);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (80, 'Street Glow marathon', to_date('04-09-2024 14:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 335, 263, 133);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (81, 'MedSource Consulting marathon', to_date('03-12-2024 14:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 392, 376, 227);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (82, 'Estee Lauder Cos. marathon', to_date('02-09-2025 03:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 295, 86, 88);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (83, 'Data Warehouse marathon', to_date('15-12-2024 10:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 268, 255, 285);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (84, 'Investors Title marathon', to_date('26-11-2025 05:03:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 333, 151, 372);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (85, 'Sony Corp. marathon', to_date('04-01-2026 10:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 79, 326, 195);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (86, 'McKee Wallwork Henderson marat', to_date('10-07-2024 05:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 150, 125, 68);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (87, 'Accredited Home Lenders marath', to_date('17-05-2024 07:23:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 222, 149, 6);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (88, 'S.C. Johnson & Son marathon', to_date('08-08-2025 13:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 208, 335, 374);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (89, 'Midwest Media Group marathon', to_date('13-09-2026 08:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 395, 359, 240);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (90, 'Venoco marathon', to_date('30-07-2026 12:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 143, 135, 290);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (91, 'Meritage Technologies marathon', to_date('04-09-2025 15:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 293, 259, 175);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (92, 'J.C. Malone Associates maratho', to_date('12-03-2025 22:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 368, 336, 237);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (93, 'esoftsolutions marathon', to_date('12-10-2025 15:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 105, 356, 51);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (94, 'Market-Based Solutions maratho', to_date('09-01-2026 20:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 170, 21, 199);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (95, 'Web Group marathon', to_date('05-02-2024 21:27:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 90, 173, 181);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (96, 'Biosite marathon', to_date('06-12-2025 15:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 88, 404, 2);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (97, 'Imaging Business Machines mara', to_date('31-08-2025 08:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 264, 47, 366);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (98, 'Extra Mile Transportation mara', to_date('03-06-2025 19:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 268, 301, 295);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (99, 'MicroTek marathon', to_date('10-08-2025 03:12:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 117, 372, 359);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (100, 'WorldCom marathon', to_date('13-10-2025 04:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 275, 50, 294);
commit;
prompt 100 records committed...
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (101, 'Campbell Soup Co. marathon', to_date('04-11-2024 08:29:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 153, 172, 239);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (102, 'Great Lakes Media Technology m', to_date('01-04-2026 03:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 60, 262, 274);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (103, 'CIW Services marathon', to_date('01-11-2026 09:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 401, 274, 224);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (104, 'WRG Services marathon', to_date('16-07-2025 22:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 238, 220, 245);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (105, 'FSF Financial marathon', to_date('04-04-2025 19:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 148, 213, 117);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (106, 'White Wave marathon', to_date('11-02-2026 06:35:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 315, 56, 15);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (107, 'Denali Ventures marathon', to_date('25-06-2024 21:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 49, 76, 229);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (108, 'Angie''s List marathon', to_date('28-06-2026 04:29:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 170, 390, 368);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (109, 'Hardwood Wholesalers marathon', to_date('22-01-2024 21:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 50, 40, 321);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (110, 'LogistiCare marathon', to_date('01-05-2026 18:32:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 96, 96, 261);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (111, 'Cherokee Information Services ', to_date('27-07-2025 06:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 233, 97, 356);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (112, 'EFC Bancorp marathon', to_date('15-09-2026 01:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 228, 7, 106);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (113, 'Painted Word marathon', to_date('19-10-2025 14:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 338, 221, 189);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (114, 'Pioneer Data Systems marathon', to_date('02-05-2024 09:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 370, 280, 350);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (115, 'U.S. Energy Services marathon', to_date('27-07-2024 02:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 103, 378, 64);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (116, 'ProSys Information Systems mar', to_date('21-10-2026 19:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 344, 269, 358);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (117, 'Jolly Enterprises marathon', to_date('30-01-2025 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 401, 333, 408);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (118, 'Doctor’s Associates marathon', to_date('01-02-2026 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 382, 5, 282);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (119, 'U.S. dairy producers, processo', to_date('29-01-2025 02:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 210, 164, 82);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (120, 'Bigdough.com marathon', to_date('30-09-2026 22:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 57, 303, 102);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (121, 'Clover Technologies Group mara', to_date('19-02-2024 00:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 206, 86, 44);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (122, 'Venoco marathon', to_date('23-07-2024 02:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 312, 27, 191);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (123, 'First American Equipment Finan', to_date('31-08-2025 08:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 276, 263, 108);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (124, 'Commercial Energy of Montana m', to_date('28-12-2025 23:17:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 238, 323, 94);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (125, 'Alogent marathon', to_date('10-11-2024 01:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 47, 321, 35);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (126, 'Valley Oak Systems marathon', to_date('06-10-2025 23:35:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 21, 393, 189);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (127, 'Myricom marathon', to_date('25-01-2025 10:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 374, 287, 93);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (128, 'Flow Management Technologies m', to_date('06-02-2025 05:12:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 63, 301, 78);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (129, 'Sensor Technologies marathon', to_date('05-06-2025 19:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 136, 303, 338);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (130, 'Marlabs marathon', to_date('29-01-2025 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 223, 203, 11);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (131, 'SimStar Internet Solutions mar', to_date('20-10-2024 09:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 328, 147, 180);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (132, 'Intel Corp. marathon', to_date('13-08-2024 23:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 318, 386, 243);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (133, 'Coridian Technologies marathon', to_date('13-04-2025 15:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 214, 60, 247);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (134, 'Omega Insurance Services marat', to_date('09-10-2025 10:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 193, 194, 404);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (135, 'National Heritage Academies ma', to_date('11-12-2025 02:29:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 45, 57, 212);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (136, 'Printcafe Software marathon', to_date('19-10-2026 03:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 44, 405, 128);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (137, 'Fiberlink Communications marat', to_date('28-03-2025 18:14:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 310, 267, 352);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (138, 'White Wave marathon', to_date('06-12-2024 04:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 199, 183, 151);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (139, 'Procter & Gamble Co. marathon', to_date('05-08-2026 19:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 321, 13, 246);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (140, 'Cima Labs marathon', to_date('14-07-2025 02:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 280, 377, 167);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (141, 'Coca-Cola Co. marathon', to_date('25-01-2025 06:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 186, 58, 269);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (142, 'Merit Medical Systems marathon', to_date('28-04-2024 06:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 92, 325, 315);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (143, 'Diamond Technologies marathon', to_date('15-04-2024 22:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 51, 178, 319);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (144, 'S.C. Johnson & Son marathon', to_date('22-06-2024 09:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 40, 3, 106);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (145, 'Boldtech Systems marathon', to_date('04-09-2024 03:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 22, 202, 263);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (146, 'VoiceLog marathon', to_date('28-09-2025 13:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 404, 102, 360);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (147, 'Imaging Business Machines mara', to_date('05-05-2025 13:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 250, 51, 279);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (148, 'CookTek marathon', to_date('23-04-2025 05:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 158, 76, 106);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (149, 'Allegiant Bancorp marathon', to_date('15-10-2026 13:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 69, 349, 258);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (150, 'Genex Technologies marathon', to_date('05-01-2025 18:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 59, 87, 398);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (151, 'Air Methods marathon', to_date('31-12-2024 07:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 376, 139, 189);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (152, 'Parksite marathon', to_date('05-09-2024 17:39:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 323, 284, 182);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (153, 'ELMCO marathon', to_date('22-10-2024 22:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 2, 45, 66);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (154, 'Imports By Four Hands marathon', to_date('26-07-2025 20:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 111, 191, 182);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (155, 'PSC Info Group marathon', to_date('28-09-2024 05:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 9, 77, 269);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (156, 'Cima Labs marathon', to_date('23-01-2026 07:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 223, 266, 318);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (157, 'Valley Oak Systems marathon', to_date('18-02-2026 22:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 404, 204, 277);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (158, 'Investors Title marathon', to_date('18-05-2024 05:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 31, 61, 254);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (159, 'USA Environmental Management m', to_date('28-02-2025 19:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 196, 11, 274);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (160, 'Unilever marathon', to_date('06-10-2025 04:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 182, 213, 402);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (161, 'Alternative Technology maratho', to_date('04-04-2024 03:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 349, 195, 45);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (162, 'Eastman Kodak Co. marathon', to_date('11-08-2025 18:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 266, 44, 188);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (163, 'Synhrgy HR Technologies marath', to_date('08-05-2026 02:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 102, 217, 343);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (164, 'Global Wireless Data marathon', to_date('08-10-2025 04:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 87, 311, 38);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (165, 'Navigator Systems marathon', to_date('23-04-2025 14:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 276, 130, 27);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (166, 'GlaxoSmithKline marathon', to_date('24-04-2024 08:43:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 263, 402, 368);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (167, 'Refinery marathon', to_date('25-07-2026 06:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 285, 218, 145);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (168, 'InsurMark marathon', to_date('07-02-2025 18:29:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 13, 17, 74);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (169, 'Circuit City Stores marathon', to_date('07-12-2025 08:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 237, 41, 366);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (170, 'Berkshire Hathaway marathon', to_date('02-12-2025 00:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 125, 256, 368);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (171, 'Aristotle marathon', to_date('19-09-2025 04:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 228, 384, 201);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (172, 'Gillette Co. marathon', to_date('22-12-2025 06:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 295, 371, 354);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (173, 'EagleOne marathon', to_date('27-08-2025 10:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 46, 401, 127);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (174, 'MRE Consulting marathon', to_date('03-07-2024 20:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 239, 299, 205);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (175, 'Medical Action Industries mara', to_date('05-12-2025 01:20:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 32, 101, 358);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (176, 'Labrada Nutrition marathon', to_date('21-10-2025 16:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 159, 286, 244);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (177, 'Monitronics International mara', to_date('12-01-2026 22:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 208, 396, 164);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (178, 'Lynk Systems marathon', to_date('30-12-2024 14:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 272, 310, 176);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (179, 'Pan-Pacific Retail Properties ', to_date('06-03-2025 20:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 246, 191, 325);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (180, 'Fetch Logistics marathon', to_date('21-12-2026 11:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 252, 57, 349);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (181, 'Nu Info Systems marathon', to_date('14-06-2026 10:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 131, 237, 47);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (182, 'Marriott International maratho', to_date('05-10-2024 19:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 268, 220, 15);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (183, 'Restaurant Partners marathon', to_date('21-10-2024 17:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 103, 206, 331);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (184, 'Denali Ventures marathon', to_date('05-11-2024 09:11:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 178, 384, 264);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (185, 'Granite Systems marathon', to_date('24-02-2024 22:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 81, 31, 257);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (186, 'National Bankcard Systems mara', to_date('11-05-2026 21:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 134, 63, 259);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (187, 'Evergreen Resources marathon', to_date('17-05-2024 09:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 243, 117, 24);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (188, 'Canterbury Park marathon', to_date('29-05-2025 23:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 276, 82, 30);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (189, 'Toyota Motor Corp. marathon', to_date('27-11-2026 08:39:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 301, 79, 62);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (190, 'Hardwood Wholesalers marathon', to_date('14-04-2025 07:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 31, 393, 211);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (191, 'LogistiCare marathon', to_date('07-03-2026 22:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 123, 81, 52);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (192, 'American Vanguard marathon', to_date('19-08-2024 15:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 192, 267, 319);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (193, 'Reckitt Benckiser marathon', to_date('07-08-2024 01:06:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 272, 213, 37);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (194, 'Partnership in Building marath', to_date('16-01-2025 12:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 225, 343, 95);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (195, 'IPS Advisory marathon', to_date('06-06-2024 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 121, 246, 129);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (196, 'American Express Co. marathon', to_date('22-04-2026 04:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 395, 350, 209);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (197, 'Gentra Systems marathon', to_date('27-04-2025 17:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 352, 407, 255);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (198, 'MRE Consulting marathon', to_date('18-11-2024 06:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 232, 32, 358);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (199, 'Team marathon', to_date('06-10-2026 20:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 364, 200, 272);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (200, 'SPS Commerce marathon', to_date('09-01-2026 22:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 214, 382, 93);
commit;
prompt 200 records committed...
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (201, 'E Commerce Group Products mara', to_date('19-12-2025 07:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 371, 50, 26);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (202, 'Acsis marathon', to_date('04-01-2025 19:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 126, 190, 178);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (203, 'MQ Software marathon', to_date('02-11-2024 04:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 331, 250, 66);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (204, 'Asta Funding marathon', to_date('26-07-2024 18:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 401, 227, 154);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (205, 'Hilton Hotels Corp. marathon', to_date('13-06-2024 04:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 76, 377, 270);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (206, 'Dynacq International marathon', to_date('11-02-2026 17:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 374, 173, 237);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (207, 'Kellogg Co. marathon', to_date('12-12-2025 12:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 93, 222, 357);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (208, 'Astute marathon', to_date('13-10-2026 14:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 308, 48, 125);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (209, 'Veri-Tek International maratho', to_date('18-10-2025 09:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 308, 271, 252);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (210, 'Diamond Technologies marathon', to_date('18-07-2024 21:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 370, 160, 120);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (211, 'Federated Department Stores ma', to_date('08-01-2025 00:39:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 69, 231, 398);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (212, 'Network Display marathon', to_date('12-11-2024 18:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 339, 166, 391);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (213, 'Volkswagen marathon', to_date('19-01-2025 01:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 183, 383, 212);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (214, 'Navarro Research and Engineeri', to_date('28-05-2026 02:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 53, 282, 119);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (215, 'Walt Disney Co. marathon', to_date('18-06-2024 22:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 341, 147, 385);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (216, 'MicroTek marathon', to_date('12-06-2025 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 385, 72, 110);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (217, 'J.C. Penney Corp. marathon', to_date('24-06-2025 01:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 4, 259, 194);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (218, 'Abatix marathon', to_date('15-07-2026 20:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 59, 237, 66);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (219, 'Atlantic Credit & Finance mara', to_date('01-08-2024 18:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 323, 345, 153);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (220, 'Iris Software marathon', to_date('08-01-2025 14:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 202, 180, 406);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (221, 'Networking Technologies and Su', to_date('21-08-2025 08:36:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 71, 331, 243);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (222, 'InsurMark marathon', to_date('12-01-2025 14:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 67, 124, 243);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (223, 'Manhattan Associates marathon', to_date('26-09-2024 01:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 37, 268, 73);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (224, 'Digital Motorworks marathon', to_date('24-08-2024 03:35:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 4, 158, 308);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (225, 'CyberThink marathon', to_date('01-05-2026 02:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 384, 237, 282);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (226, 'U.S. Government marathon', to_date('02-10-2025 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 36, 116, 81);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (227, 'WAV marathon', to_date('02-04-2025 00:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 277, 54, 32);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (228, 'ConAgra marathon', to_date('11-10-2025 10:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 63, 88, 270);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (229, 'Marathon Heater marathon', to_date('20-05-2025 23:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 234, 200, 103);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (230, 'Timberlane Woodcrafters marath', to_date('11-02-2025 12:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 68, 313, 313);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (231, 'Commercial Energy of Montana m', to_date('29-11-2026 14:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 275, 328, 308);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (232, 'Accredited Home Lenders marath', to_date('18-11-2024 17:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 262, 140, 309);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (233, 'Mindworks marathon', to_date('17-11-2025 10:23:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 7, 409, 52);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (234, 'Turner Professional Services m', to_date('25-12-2026 12:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 139, 235, 382);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (235, 'Lloyd Group marathon', to_date('30-06-2025 17:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 196, 267, 406);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (236, 'AOL Time Warner marathon', to_date('14-01-2025 06:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 228, 294, 30);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (237, 'School Technology Management m', to_date('30-03-2024 05:20:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 291, 16, 186);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (238, 'SYS-CON Media marathon', to_date('04-07-2024 18:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 132, 337, 264);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (239, 'Interface Software marathon', to_date('06-08-2026 11:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 288, 340, 285);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (240, 'Capella Education marathon', to_date('19-09-2026 01:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 376, 103, 76);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (241, 'CapTech Ventures marathon', to_date('18-04-2026 14:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 22, 326, 308);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (242, 'Arkidata marathon', to_date('13-03-2025 20:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 379, 270, 365);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (243, 'Infinity Contractors marathon', to_date('09-11-2025 07:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 141, 175, 264);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (244, 'GlaxoSmithKline marathon', to_date('08-07-2026 08:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 191, 233, 157);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (245, 'Greenwich Technology Partners ', to_date('26-03-2026 19:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 5, 50, 94);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (246, 'AQuickDelivery marathon', to_date('19-08-2025 07:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 102, 187, 220);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (247, 'York Enterprise Solutions mara', to_date('26-03-2026 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 329, 210, 109);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (248, '3t Systems marathon', to_date('29-05-2026 14:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 27, 234, 407);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (249, 'Capital Corp. marathon', to_date('21-01-2025 11:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 235, 126, 303);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (250, 'Tilson Landscape marathon', to_date('26-07-2025 09:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 288, 7, 125);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (251, 'Reckitt Benckiser marathon', to_date('06-12-2026 15:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 244, 266, 392);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (252, 'Data Warehouse marathon', to_date('14-11-2026 11:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 70, 233, 168);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (253, 'SimStar Internet Solutions mar', to_date('16-12-2024 21:39:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 27, 20, 376);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (254, 'Bigdough.com marathon', to_date('08-04-2025 21:12:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 394, 276, 76);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (255, 'Acsis marathon', to_date('20-03-2024 17:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 367, 193, 242);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (256, 'Studio B Productions marathon', to_date('22-12-2025 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 95, 384, 343);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (257, 'Adolph Coors Co. marathon', to_date('02-10-2026 11:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 223, 359, 165);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (258, 'Target Corp. marathon', to_date('26-06-2025 19:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 153, 150, 349);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (259, 'Pharmacia Corp. marathon', to_date('30-01-2026 03:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 84, 35, 118);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (260, 'Southern Financial Bancorp mar', to_date('19-03-2026 14:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 18, 219, 353);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (261, 'Federated Department Stores ma', to_date('29-03-2025 17:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 309, 161, 105);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (262, 'Veri-Tek International maratho', to_date('01-04-2026 11:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 158, 45, 335);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (263, 'V-Span marathon', to_date('01-09-2026 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 350, 160, 258);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (264, 'Ositis Software marathon', to_date('19-09-2024 01:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 139, 167, 131);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (265, 'Integra Telecom marathon', to_date('19-02-2025 19:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 163, 6, 373);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (266, 'Gateway marathon', to_date('28-06-2024 19:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 7, 165, 196);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (267, 'Homebuilders Financial Network', to_date('15-10-2024 05:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 38, 227, 332);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (268, 'MicroTek marathon', to_date('07-02-2026 03:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 77, 183, 41);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (269, 'Spotfire Holdings marathon', to_date('03-01-2026 06:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 280, 73, 111);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (270, 'McDonald’s Corp. marathon', to_date('14-02-2026 05:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 183, 189, 94);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (271, 'Verizon Communications maratho', to_date('05-12-2024 09:05:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 392, 107, 193);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (272, 'Socket Internet marathon', to_date('23-02-2025 10:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 407, 16, 330);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (273, 'Peerless Manufacturing maratho', to_date('18-04-2024 09:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 159, 41, 346);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (274, 'Nexxtworks marathon', to_date('15-02-2026 07:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 91, 164, 117);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (275, 'AccuCode marathon', to_date('23-09-2025 21:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 95, 189, 80);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (276, 'Bedford Bancshares marathon', to_date('16-12-2026 16:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 47, 378, 196);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (277, 'Albertson’s marathon', to_date('03-05-2024 13:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 384, 251, 398);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (278, 'Aquascape Designs marathon', to_date('26-09-2024 00:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 293, 287, 395);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (279, 'Direct Data marathon', to_date('05-09-2025 05:23:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 57, 292, 371);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (280, 'FirstFed America Bancorp marat', to_date('26-05-2026 12:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 187, 302, 314);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (281, 'Lifeline Systems marathon', to_date('23-01-2024 15:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 92, 267, 226);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (282, 'Call Henry marathon', to_date('06-10-2025 17:36:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 307, 239, 192);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (283, 'Tilson HR marathon', to_date('17-07-2025 00:27:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 236, 163, 253);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (284, 'Advanced Neuromodulation marat', to_date('04-12-2024 12:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 208, 408, 97);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (285, 'Hershey Foods Corp. marathon', to_date('04-09-2025 22:07:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 55, 160, 353);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (286, 'IVCi marathon', to_date('01-10-2026 10:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 249, 57, 215);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (287, 'Coridian Technologies marathon', to_date('26-10-2025 20:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 31, 152, 139);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (288, 'Flow Management Technologies m', to_date('14-01-2026 06:05:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 285, 191, 300);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (289, 'Spenser Communications maratho', to_date('02-08-2026 01:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 22, 64, 128);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (290, 'Dancor marathon', to_date('03-05-2026 10:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 320, 138, 132);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (291, 'Fetch Logistics marathon', to_date('28-03-2024 08:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 320, 330, 20);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (292, 'Flow Management Technologies m', to_date('18-02-2026 10:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 16, 84, 395);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (293, 'Parksite marathon', to_date('21-04-2024 20:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 327, 228, 113);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (294, 'GlaxoSmithKline marathon', to_date('21-02-2024 12:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 74, 110, 274);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (295, 'Cardinal Cartridge marathon', to_date('27-12-2024 15:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 31, 134, 5);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (296, 'MedSource Consulting marathon', to_date('23-04-2024 18:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 190, 296, 311);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (297, 'Softworld marathon', to_date('15-02-2025 17:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 301, 198, 135);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (298, 'Y2Marketing marathon', to_date('09-01-2025 03:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 295, 90, 125);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (299, 'Network Management Resources m', to_date('06-05-2024 15:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 309, 287, 372);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (300, 'Herbeau Creations of America m', to_date('21-06-2024 09:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 103, 410, 250);
commit;
prompt 300 records committed...
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (301, 'Marriott International maratho', to_date('22-11-2025 00:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 20, 385, 211);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (302, 'Dell Computer Corp. marathon', to_date('14-07-2024 23:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 178, 183, 309);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (303, 'Auction Systems Auctioneers & ', to_date('12-10-2024 01:12:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 317, 257, 213);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (304, 'TruSecure marathon', to_date('06-11-2024 11:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 198, 152, 203);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (305, 'SHOT marathon', to_date('18-12-2025 06:10:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 174, 339, 211);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (306, 'Southern Homes and Remodeling ', to_date('11-11-2024 08:03:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 228, 319, 75);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (307, 'Sterling Financial Group of Co', to_date('21-09-2025 04:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 7, 187, 395);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (308, 'E Group marathon', to_date('13-09-2026 09:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 204, 190, 34);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (309, 'Travizon marathon', to_date('07-05-2025 16:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 244, 56, 324);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (310, 'Club One marathon', to_date('11-08-2026 22:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 96, 149, 62);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (311, 'Stone Brewing marathon', to_date('26-08-2026 15:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 264, 346, 273);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (312, 'Maverick Construction marathon', to_date('26-10-2025 02:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 268, 304, 327);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (313, 'OnStaff marathon', to_date('31-07-2025 04:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 204, 94, 42);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (314, 'Security Mortgage Group marath', to_date('25-04-2026 23:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 327, 85, 86);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (315, 'Solipsys marathon', to_date('23-01-2025 10:14:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 357, 272, 252);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (316, 'KSJ & Associates marathon', to_date('12-02-2026 07:26:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 392, 133, 157);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (317, 'Tigris Consulting marathon', to_date('09-10-2026 07:14:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 21, 29, 407);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (318, 'American Land Lease marathon', to_date('08-05-2026 02:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 311, 143, 295);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (319, 'Kelmoore Investment marathon', to_date('18-07-2025 15:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 137, 293, 248);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (320, 'Imaging Business Machines mara', to_date('22-06-2025 20:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 141, 38, 369);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (321, 'Third Millennium Telecommunica', to_date('18-12-2026 13:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 305, 276, 29);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (322, 'Printcafe Software marathon', to_date('08-10-2025 20:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 391, 319, 159);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (323, 'InfoVision Consultants maratho', to_date('25-01-2026 08:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 152, 12, 176);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (324, 'Gillette Co. marathon', to_date('15-07-2026 20:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 280, 132, 132);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (325, 'Network Hardware Resale marath', to_date('27-08-2024 15:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 227, 40, 111);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (326, 'Evergreen Resources marathon', to_date('27-03-2024 02:01:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 212, 194, 141);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (327, 'SYS-CON Media marathon', to_date('15-02-2026 14:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 329, 336, 129);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (328, 'Nike marathon', to_date('06-03-2024 14:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 306, 135, 65);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (329, 'Advertising Ventures marathon', to_date('25-02-2026 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 374, 297, 150);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (330, 'Computer Source marathon', to_date('11-12-2026 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 242, 50, 323);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (331, 'Fiber Network Solutions marath', to_date('08-05-2024 14:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 58, 148, 8);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (332, 'HealthScribe marathon', to_date('24-10-2026 15:59:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 312, 344, 321);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (333, 'Veri-Tek International maratho', to_date('18-03-2024 00:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 289, 286, 171);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (334, 'FNB marathon', to_date('30-05-2024 08:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 388, 192, 217);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (335, 'In Zone marathon', to_date('17-10-2024 14:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 107, 146, 155);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (336, 'Visionary Systems marathon', to_date('31-10-2025 07:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 116, 37, 146);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (337, 'School Technology Management m', to_date('29-11-2025 10:14:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 224, 301, 391);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (338, 'Call Henry marathon', to_date('16-04-2026 06:24:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 390, 119, 381);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (339, 'Campbell Soup Co. marathon', to_date('18-12-2026 13:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 394, 245, 98);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (340, 'ScripNet marathon', to_date('26-09-2025 04:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 197, 364, 233);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (341, 'DrinkMore Water marathon', to_date('10-12-2025 21:43:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 331, 286, 26);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (342, 'Pearl Law Group marathon', to_date('13-10-2025 15:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 222, 190, 31);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (343, 'Digital Visual Display Technol', to_date('24-04-2026 11:24:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 389, 386, 29);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (344, 'Scott Pipitone Design marathon', to_date('16-10-2026 06:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 35, 44, 232);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (345, 'Execuscribe marathon', to_date('22-08-2025 22:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 56, 255, 277);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (346, 'TechRX marathon', to_date('06-04-2026 22:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 51, 268, 90);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (347, 'IBM Corp. marathon', to_date('13-09-2025 23:36:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 80, 375, 275);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (348, 'Lydian Trust marathon', to_date('19-05-2026 00:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 245, 152, 322);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (349, 'Ositis Software marathon', to_date('25-05-2025 21:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 181, 39, 291);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (350, 'Marathon Heater marathon', to_date('15-01-2026 06:51:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 238, 217, 321);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (351, 'Escalade marathon', to_date('06-03-2026 15:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 286, 206, 314);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (352, 'Teamstudio marathon', to_date('01-03-2025 10:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 214, 364, 236);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (353, 'Glacier Bancorp marathon', to_date('16-06-2026 04:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 244, 82, 376);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (354, 'Saks Inc. marathon', to_date('08-08-2025 20:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 327, 245, 191);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (355, 'TruSecure marathon', to_date('26-12-2025 18:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 13, 363, 181);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (356, 'Employer Services marathon', to_date('30-11-2024 22:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 271, 281, 332);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (357, 'Bio-Reference Labs marathon', to_date('18-01-2025 21:53:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 133, 164, 218);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (358, 'EPAM Systems marathon', to_date('07-08-2026 13:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 158, 11, 107);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (359, 'Alden Systems marathon', to_date('22-08-2024 00:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 136, 89, 269);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (360, 'Technica marathon', to_date('26-07-2026 04:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 333, 297, 363);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (361, 'Coca-Cola Co. marathon', to_date('16-06-2024 05:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 12, 31, 38);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (362, 'CyberThink marathon', to_date('27-06-2025 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 222, 17, 180);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (363, 'In Zone marathon', to_date('13-07-2026 05:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 209, 287, 140);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (364, 'First Mariner Bancorp marathon', to_date('25-10-2025 04:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 154, 257, 330);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (365, 'Navigator Systems marathon', to_date('09-06-2025 21:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 207, 241, 15);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (366, 'SYS-CON Media marathon', to_date('12-07-2026 04:39:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 65, 324, 312);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (367, 'Hershey Foods Corp. marathon', to_date('31-05-2024 13:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 354, 213, 317);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (368, 'Diageo marathon', to_date('07-05-2025 11:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 278, 410, 103);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (369, 'Prometheus Laboratories marath', to_date('28-02-2025 19:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 340, 43, 385);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (370, 'STI Knowledge marathon', to_date('31-08-2024 16:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 284, 311, 208);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (371, 'Authoria marathon', to_date('23-08-2024 11:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 164, 187, 108);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (372, 'Kellogg Co. marathon', to_date('15-07-2026 23:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 27, 245, 333);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (373, 'SupplyCore.com marathon', to_date('19-06-2025 12:20:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 351, 230, 204);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (374, 'SupplyCore.com marathon', to_date('13-05-2026 20:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 155, 42, 39);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (375, 'New Media Communications marat', to_date('10-02-2024 11:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 209, 69, 139);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (376, 'Kelmoore Investment marathon', to_date('12-03-2024 18:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 28, 329, 333);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (377, 'VoiceLog marathon', to_date('09-03-2025 21:41:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 35, 174, 255);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (378, 'Mission West Properties marath', to_date('06-07-2024 04:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 317, 212, 135);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (379, 'Sterling Financial Group of Co', to_date('20-03-2026 09:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 349, 210, 390);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (380, 'Arrow Financial Services marat', to_date('16-08-2025 12:16:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 68, 60, 159);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (381, 'Navarro Research and Engineeri', to_date('14-11-2025 10:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 363, 95, 97);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (382, 'Franklin American Mortgage mar', to_date('27-11-2026 18:58:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 313, 199, 251);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (383, 'Aloha NY Systems marathon', to_date('23-04-2025 17:49:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 210, 155, 169);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (384, 'Data Company marathon', to_date('20-03-2026 13:03:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 392, 359, 309);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (385, 'L.E.M. Products marathon', to_date('18-01-2024 23:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 119, 9, 271);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (386, 'Denali Ventures marathon', to_date('05-01-2026 08:04:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 198, 13, 250);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (387, 'Commercial Energy of Montana m', to_date('12-06-2024 09:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 364, 367, 23);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (388, 'L’Oreal marathon', to_date('26-03-2024 19:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 326, 328, 334);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (389, 'Midwest Media Group marathon', to_date('30-11-2026 19:52:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 354, 47, 279);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (390, 'CookTek marathon', to_date('03-12-2025 08:19:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 323, 132, 94);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (391, 'Wal-Mart Stores marathon', to_date('14-05-2026 19:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 321, 4, 354);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (392, 'Cura Group marathon', to_date('19-06-2026 23:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 72, 352, 229);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (393, 'Capella Education marathon', to_date('07-03-2024 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 154, 365, 267);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (394, 'Toyota Motor Corp. marathon', to_date('20-09-2024 23:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 101, 300, 373);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (395, 'Navigator Systems marathon', to_date('04-03-2025 06:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 287, 317, 211);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (396, 'ID Label marathon', to_date('15-02-2024 22:15:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 161, 93, 363);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (397, 'Circuit City Stores marathon', to_date('31-03-2026 02:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 105, 210, 108);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (398, 'Tropical Oasis marathon', to_date('15-10-2024 20:56:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 315, 106, 221);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (399, 'Cowlitz Bancorp marathon', to_date('12-11-2026 15:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 142, 342, 265);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (400, 'Mercantile Bank marathon', to_date('13-11-2026 20:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 139, 346, 332);
commit;
prompt 400 records committed...
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (401, 'WAV marathon', to_date('27-02-2025 00:37:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 25, 302, 336);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (402, 'Pyramid Digital Solutions mara', to_date('04-08-2024 11:09:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 139, 135, 224);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (403, 'First Mariner Bancorp marathon', to_date('21-12-2025 13:33:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 309, 409, 95);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (404, 'U.S. Energy Services marathon', to_date('28-01-2025 16:44:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 164, 286, 88);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (405, 'Laboratory Management Systems ', to_date('04-12-2025 04:28:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 192, 106, 52);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (406, 'Spinnaker Exploration marathon', to_date('05-02-2024 06:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 208, 184, 396);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (407, 'Third Millennium Telecommunica', to_date('13-10-2024 05:38:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 254, 344, 162);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (408, 'G.A. Beck Artistic Services ma', to_date('13-08-2026 09:03:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 335, 105, 223);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (409, 'Sunstream marathon', to_date('30-01-2024 07:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 201, 103, 155);
insert into EVENT (eventid, eventname, eventdate, eventdescribe, organizerid, eventtypeid, locationid)
values (410, 'Main Street Banks marathon', to_date('23-10-2025 04:08:00', 'dd-mm-yyyy hh24:mi:ss'), 'Running a marathon for health', 227, 87, 212);
commit;
prompt 410 records loaded
prompt Loading ORDERS...
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (1, 2, 50, to_date('01-05-2024', 'dd-mm-yyyy'), 1);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (2, 4, 0, to_date('02-05-2024', 'dd-mm-yyyy'), 2);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (3, 3, 20, to_date('03-05-2024', 'dd-mm-yyyy'), 3);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (4, 5, 0, to_date('04-05-2024', 'dd-mm-yyyy'), 4);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (5, 2, 30, to_date('05-05-2024', 'dd-mm-yyyy'), 5);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (6, 4, 0, to_date('06-05-2024', 'dd-mm-yyyy'), 6);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (7, 1, 10, to_date('07-05-2024', 'dd-mm-yyyy'), 7);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (8, 3, 40, to_date('08-05-2024', 'dd-mm-yyyy'), 8);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (9, 6, 25, to_date('09-05-2024', 'dd-mm-yyyy'), 9);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (10, 2, 15, to_date('10-05-2024', 'dd-mm-yyyy'), 10);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (11, 5, 7, to_date('07-05-2026 04:46:00', 'dd-mm-yyyy hh24:mi:ss'), 335);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (12, 4, 15, to_date('08-06-2025 15:16:00', 'dd-mm-yyyy hh24:mi:ss'), 36);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (13, 4, 22, to_date('25-02-2026 16:43:00', 'dd-mm-yyyy hh24:mi:ss'), 182);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (14, 5, 32, to_date('03-03-2025 05:44:00', 'dd-mm-yyyy hh24:mi:ss'), 22);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (15, 3, 14, to_date('21-03-2025 04:07:00', 'dd-mm-yyyy hh24:mi:ss'), 350);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (16, 2, 40, to_date('17-02-2025 19:13:00', 'dd-mm-yyyy hh24:mi:ss'), 118);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (17, 4, 47, to_date('20-06-2025 19:26:00', 'dd-mm-yyyy hh24:mi:ss'), 363);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (18, 2, 8, to_date('21-09-2026 03:40:00', 'dd-mm-yyyy hh24:mi:ss'), 189);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (19, 4, 39, to_date('25-06-2025 20:26:00', 'dd-mm-yyyy hh24:mi:ss'), 369);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (20, 2, 42, to_date('01-09-2026 22:01:00', 'dd-mm-yyyy hh24:mi:ss'), 310);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (21, 2, 39, to_date('16-10-2024 21:44:00', 'dd-mm-yyyy hh24:mi:ss'), 70);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (22, 2, 14, to_date('10-10-2024 19:17:00', 'dd-mm-yyyy hh24:mi:ss'), 331);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (23, 5, 31, to_date('08-11-2026 06:34:00', 'dd-mm-yyyy hh24:mi:ss'), 343);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (24, 3, 7, to_date('07-08-2026 11:01:00', 'dd-mm-yyyy hh24:mi:ss'), 66);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (25, 5, 33, to_date('23-12-2024 20:13:00', 'dd-mm-yyyy hh24:mi:ss'), 165);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (26, 5, 2, to_date('10-02-2026 21:36:00', 'dd-mm-yyyy hh24:mi:ss'), 140);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (27, 4, 4, to_date('20-02-2025 12:43:00', 'dd-mm-yyyy hh24:mi:ss'), 343);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (28, 1, 30, to_date('26-03-2025 11:38:00', 'dd-mm-yyyy hh24:mi:ss'), 181);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (29, 2, 7, to_date('16-10-2024 07:15:00', 'dd-mm-yyyy hh24:mi:ss'), 77);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (30, 2, 11, to_date('03-05-2024 11:04:00', 'dd-mm-yyyy hh24:mi:ss'), 124);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (31, 5, 15, to_date('26-07-2025 17:59:00', 'dd-mm-yyyy hh24:mi:ss'), 329);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (32, 5, 16, to_date('13-09-2025 01:50:00', 'dd-mm-yyyy hh24:mi:ss'), 100);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (33, 5, 31, to_date('15-12-2025 05:21:00', 'dd-mm-yyyy hh24:mi:ss'), 32);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (34, 4, 13, to_date('19-11-2025 05:54:00', 'dd-mm-yyyy hh24:mi:ss'), 148);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (35, 4, 6, to_date('16-11-2026 12:57:00', 'dd-mm-yyyy hh24:mi:ss'), 328);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (36, 5, 28, to_date('14-01-2024 18:46:00', 'dd-mm-yyyy hh24:mi:ss'), 153);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (37, 4, 10, to_date('27-03-2026 05:47:00', 'dd-mm-yyyy hh24:mi:ss'), 6);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (38, 2, 8, to_date('19-02-2025 04:40:00', 'dd-mm-yyyy hh24:mi:ss'), 23);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (39, 2, 6, to_date('15-05-2026 10:10:00', 'dd-mm-yyyy hh24:mi:ss'), 203);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (40, 2, 31, to_date('18-03-2026 01:04:00', 'dd-mm-yyyy hh24:mi:ss'), 89);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (41, 1, 32, to_date('26-06-2024 03:02:00', 'dd-mm-yyyy hh24:mi:ss'), 308);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (42, 1, 25, to_date('10-06-2024 20:47:00', 'dd-mm-yyyy hh24:mi:ss'), 97);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (43, 3, 26, to_date('19-12-2024 06:41:00', 'dd-mm-yyyy hh24:mi:ss'), 245);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (44, 3, 40, to_date('23-03-2026 15:31:00', 'dd-mm-yyyy hh24:mi:ss'), 75);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (45, 5, 16, to_date('13-09-2025 05:14:00', 'dd-mm-yyyy hh24:mi:ss'), 126);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (46, 3, 16, to_date('14-03-2024 21:00:00', 'dd-mm-yyyy hh24:mi:ss'), 198);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (47, 5, 5, to_date('08-04-2026 18:24:00', 'dd-mm-yyyy hh24:mi:ss'), 121);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (48, 1, 16, to_date('24-02-2026 03:28:00', 'dd-mm-yyyy hh24:mi:ss'), 61);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (49, 3, 10, to_date('12-02-2025 20:48:00', 'dd-mm-yyyy hh24:mi:ss'), 163);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (50, 4, 2, to_date('02-12-2024 07:53:00', 'dd-mm-yyyy hh24:mi:ss'), 234);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (51, 4, 9, to_date('22-08-2026 18:48:00', 'dd-mm-yyyy hh24:mi:ss'), 282);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (52, 5, 16, to_date('12-03-2026 07:21:00', 'dd-mm-yyyy hh24:mi:ss'), 363);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (53, 2, 35, to_date('28-03-2025 20:50:00', 'dd-mm-yyyy hh24:mi:ss'), 356);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (54, 5, 22, to_date('12-04-2026 06:21:00', 'dd-mm-yyyy hh24:mi:ss'), 362);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (55, 5, 27, to_date('02-04-2026 21:15:00', 'dd-mm-yyyy hh24:mi:ss'), 93);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (56, 4, 38, to_date('08-10-2026 13:11:00', 'dd-mm-yyyy hh24:mi:ss'), 206);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (57, 4, 32, to_date('28-11-2025 21:38:00', 'dd-mm-yyyy hh24:mi:ss'), 57);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (58, 4, 30, to_date('12-03-2026 02:10:00', 'dd-mm-yyyy hh24:mi:ss'), 354);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (59, 1, 14, to_date('22-02-2025 17:37:00', 'dd-mm-yyyy hh24:mi:ss'), 64);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (60, 4, 12, to_date('24-07-2024 09:06:00', 'dd-mm-yyyy hh24:mi:ss'), 363);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (61, 1, 12, to_date('21-05-2026 23:13:00', 'dd-mm-yyyy hh24:mi:ss'), 261);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (62, 5, 40, to_date('14-11-2025 00:25:00', 'dd-mm-yyyy hh24:mi:ss'), 184);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (63, 3, 48, to_date('18-04-2025 12:41:00', 'dd-mm-yyyy hh24:mi:ss'), 389);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (64, 1, 10, to_date('23-07-2026 19:45:00', 'dd-mm-yyyy hh24:mi:ss'), 54);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (65, 3, 50, to_date('24-05-2024 19:50:00', 'dd-mm-yyyy hh24:mi:ss'), 97);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (66, 4, 22, to_date('15-11-2025 12:02:00', 'dd-mm-yyyy hh24:mi:ss'), 206);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (67, 1, 14, to_date('06-09-2026 10:45:00', 'dd-mm-yyyy hh24:mi:ss'), 304);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (68, 2, 31, to_date('04-03-2025 20:58:00', 'dd-mm-yyyy hh24:mi:ss'), 403);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (69, 2, 32, to_date('06-03-2024 10:24:00', 'dd-mm-yyyy hh24:mi:ss'), 285);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (70, 4, 6, to_date('12-03-2025 16:15:00', 'dd-mm-yyyy hh24:mi:ss'), 107);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (71, 4, 10, to_date('08-05-2026 02:04:00', 'dd-mm-yyyy hh24:mi:ss'), 315);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (72, 3, 1, to_date('29-03-2024 22:05:00', 'dd-mm-yyyy hh24:mi:ss'), 113);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (73, 5, 4, to_date('30-07-2026 09:04:00', 'dd-mm-yyyy hh24:mi:ss'), 37);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (74, 2, 19, to_date('19-04-2026 19:11:00', 'dd-mm-yyyy hh24:mi:ss'), 314);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (75, 1, 43, to_date('16-06-2026 21:18:00', 'dd-mm-yyyy hh24:mi:ss'), 334);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (76, 3, 27, to_date('14-02-2026 04:32:00', 'dd-mm-yyyy hh24:mi:ss'), 151);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (77, 2, 17, to_date('08-02-2025 07:44:00', 'dd-mm-yyyy hh24:mi:ss'), 108);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (78, 3, 37, to_date('18-03-2025 16:17:00', 'dd-mm-yyyy hh24:mi:ss'), 122);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (79, 2, 19, to_date('13-05-2024 14:08:00', 'dd-mm-yyyy hh24:mi:ss'), 258);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (80, 4, 30, to_date('06-10-2024 04:24:00', 'dd-mm-yyyy hh24:mi:ss'), 235);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (81, 2, 25, to_date('20-12-2025 10:26:00', 'dd-mm-yyyy hh24:mi:ss'), 100);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (82, 2, 34, to_date('20-07-2025 02:46:00', 'dd-mm-yyyy hh24:mi:ss'), 336);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (83, 5, 49, to_date('27-08-2026 15:38:00', 'dd-mm-yyyy hh24:mi:ss'), 160);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (84, 1, 6, to_date('25-09-2025 02:46:00', 'dd-mm-yyyy hh24:mi:ss'), 252);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (85, 2, 31, to_date('03-03-2026 19:59:00', 'dd-mm-yyyy hh24:mi:ss'), 288);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (86, 4, 23, to_date('12-08-2025 08:17:00', 'dd-mm-yyyy hh24:mi:ss'), 171);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (87, 4, 41, to_date('04-04-2024 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), 48);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (88, 4, 14, to_date('27-04-2024 08:22:00', 'dd-mm-yyyy hh24:mi:ss'), 19);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (89, 2, 32, to_date('21-07-2024 00:23:00', 'dd-mm-yyyy hh24:mi:ss'), 155);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (90, 5, 7, to_date('06-06-2026 11:15:00', 'dd-mm-yyyy hh24:mi:ss'), 298);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (91, 3, 45, to_date('11-06-2024 23:33:00', 'dd-mm-yyyy hh24:mi:ss'), 51);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (92, 3, 25, to_date('23-07-2025 19:59:00', 'dd-mm-yyyy hh24:mi:ss'), 286);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (93, 4, 20, to_date('06-11-2026 07:18:00', 'dd-mm-yyyy hh24:mi:ss'), 213);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (94, 1, 28, to_date('30-10-2024 21:28:00', 'dd-mm-yyyy hh24:mi:ss'), 155);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (95, 2, 6, to_date('09-12-2025 17:59:00', 'dd-mm-yyyy hh24:mi:ss'), 186);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (96, 1, 22, to_date('01-05-2025 13:01:00', 'dd-mm-yyyy hh24:mi:ss'), 45);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (97, 2, 28, to_date('14-10-2026 06:42:00', 'dd-mm-yyyy hh24:mi:ss'), 130);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (98, 5, 7, to_date('29-06-2024 18:31:00', 'dd-mm-yyyy hh24:mi:ss'), 179);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (99, 4, 5, to_date('19-12-2026 18:12:00', 'dd-mm-yyyy hh24:mi:ss'), 128);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (100, 5, 42, to_date('24-05-2024 21:55:00', 'dd-mm-yyyy hh24:mi:ss'), 399);
commit;
prompt 100 records committed...
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (101, 3, 24, to_date('07-02-2026 05:11:00', 'dd-mm-yyyy hh24:mi:ss'), 145);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (102, 3, 47, to_date('08-01-2026 10:21:00', 'dd-mm-yyyy hh24:mi:ss'), 339);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (103, 2, 10, to_date('25-04-2024 16:08:00', 'dd-mm-yyyy hh24:mi:ss'), 209);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (104, 2, 25, to_date('18-06-2024 06:45:00', 'dd-mm-yyyy hh24:mi:ss'), 233);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (105, 5, 10, to_date('21-08-2024 12:36:00', 'dd-mm-yyyy hh24:mi:ss'), 10);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (106, 2, 25, to_date('03-01-2026 19:47:00', 'dd-mm-yyyy hh24:mi:ss'), 323);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (107, 3, 19, to_date('18-05-2024 12:08:00', 'dd-mm-yyyy hh24:mi:ss'), 366);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (108, 5, 12, to_date('06-04-2024 07:38:00', 'dd-mm-yyyy hh24:mi:ss'), 80);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (109, 1, 19, to_date('18-05-2025 04:30:00', 'dd-mm-yyyy hh24:mi:ss'), 406);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (110, 4, 45, to_date('01-02-2025 22:54:00', 'dd-mm-yyyy hh24:mi:ss'), 121);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (111, 2, 10, to_date('03-04-2024 01:35:00', 'dd-mm-yyyy hh24:mi:ss'), 323);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (112, 4, 43, to_date('07-08-2024 11:18:00', 'dd-mm-yyyy hh24:mi:ss'), 254);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (113, 5, 10, to_date('15-07-2024 04:39:00', 'dd-mm-yyyy hh24:mi:ss'), 248);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (114, 2, 28, to_date('02-01-2024 07:41:00', 'dd-mm-yyyy hh24:mi:ss'), 210);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (115, 3, 38, to_date('12-10-2025 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 180);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (116, 2, 48, to_date('03-06-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 206);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (117, 5, 18, to_date('06-08-2025 23:31:00', 'dd-mm-yyyy hh24:mi:ss'), 146);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (118, 3, 15, to_date('28-08-2025 08:23:00', 'dd-mm-yyyy hh24:mi:ss'), 88);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (119, 1, 28, to_date('14-08-2025 03:56:00', 'dd-mm-yyyy hh24:mi:ss'), 180);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (120, 5, 49, to_date('14-11-2025 09:51:00', 'dd-mm-yyyy hh24:mi:ss'), 348);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (121, 2, 49, to_date('26-05-2026 20:46:00', 'dd-mm-yyyy hh24:mi:ss'), 124);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (122, 5, 10, to_date('17-03-2025 20:11:00', 'dd-mm-yyyy hh24:mi:ss'), 96);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (123, 4, 26, to_date('16-04-2026 04:51:00', 'dd-mm-yyyy hh24:mi:ss'), 70);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (124, 5, 5, to_date('14-05-2024 21:37:00', 'dd-mm-yyyy hh24:mi:ss'), 176);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (125, 5, 25, to_date('09-03-2024 11:51:00', 'dd-mm-yyyy hh24:mi:ss'), 210);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (126, 4, 28, to_date('06-02-2024 09:31:00', 'dd-mm-yyyy hh24:mi:ss'), 368);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (127, 3, 46, to_date('05-04-2026 20:11:00', 'dd-mm-yyyy hh24:mi:ss'), 101);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (128, 4, 13, to_date('22-08-2025 18:55:00', 'dd-mm-yyyy hh24:mi:ss'), 96);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (129, 4, 36, to_date('24-08-2026 06:18:00', 'dd-mm-yyyy hh24:mi:ss'), 206);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (130, 2, 42, to_date('12-02-2026 20:39:00', 'dd-mm-yyyy hh24:mi:ss'), 190);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (131, 2, 12, to_date('30-12-2024 09:35:00', 'dd-mm-yyyy hh24:mi:ss'), 388);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (132, 1, 48, to_date('28-10-2026 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 368);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (133, 2, 31, to_date('13-01-2024 18:31:00', 'dd-mm-yyyy hh24:mi:ss'), 274);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (134, 2, 29, to_date('03-07-2024 18:18:00', 'dd-mm-yyyy hh24:mi:ss'), 228);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (135, 1, 12, to_date('06-01-2025 14:39:00', 'dd-mm-yyyy hh24:mi:ss'), 264);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (136, 1, 11, to_date('04-07-2024 16:23:00', 'dd-mm-yyyy hh24:mi:ss'), 59);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (137, 1, 18, to_date('01-03-2024 05:57:00', 'dd-mm-yyyy hh24:mi:ss'), 300);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (138, 4, 18, to_date('13-12-2024 17:52:00', 'dd-mm-yyyy hh24:mi:ss'), 248);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (139, 3, 38, to_date('21-12-2024 01:29:00', 'dd-mm-yyyy hh24:mi:ss'), 108);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (140, 1, 35, to_date('08-10-2025 02:06:00', 'dd-mm-yyyy hh24:mi:ss'), 91);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (141, 3, 13, to_date('10-07-2024 23:53:00', 'dd-mm-yyyy hh24:mi:ss'), 70);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (142, 1, 37, to_date('17-09-2026 00:10:00', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (143, 3, 37, to_date('11-09-2024 15:05:00', 'dd-mm-yyyy hh24:mi:ss'), 286);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (144, 2, 17, to_date('16-04-2026 13:30:00', 'dd-mm-yyyy hh24:mi:ss'), 139);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (145, 5, 33, to_date('25-04-2026 19:44:00', 'dd-mm-yyyy hh24:mi:ss'), 270);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (146, 2, 9, to_date('26-08-2024 17:54:00', 'dd-mm-yyyy hh24:mi:ss'), 391);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (147, 2, 7, to_date('10-04-2024 21:58:00', 'dd-mm-yyyy hh24:mi:ss'), 108);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (148, 3, 28, to_date('22-05-2024 05:07:00', 'dd-mm-yyyy hh24:mi:ss'), 42);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (149, 1, 42, to_date('12-07-2024 11:43:00', 'dd-mm-yyyy hh24:mi:ss'), 207);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (150, 1, 50, to_date('17-04-2026 13:58:00', 'dd-mm-yyyy hh24:mi:ss'), 32);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (151, 2, 45, to_date('05-02-2026 16:34:00', 'dd-mm-yyyy hh24:mi:ss'), 49);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (152, 5, 3, to_date('24-01-2026 06:58:00', 'dd-mm-yyyy hh24:mi:ss'), 395);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (153, 4, 2, to_date('23-12-2024 03:09:00', 'dd-mm-yyyy hh24:mi:ss'), 36);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (154, 1, 13, to_date('27-11-2026 00:14:00', 'dd-mm-yyyy hh24:mi:ss'), 283);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (155, 5, 39, to_date('12-12-2024 07:49:00', 'dd-mm-yyyy hh24:mi:ss'), 297);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (156, 1, 41, to_date('09-02-2026 15:16:00', 'dd-mm-yyyy hh24:mi:ss'), 262);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (157, 2, 21, to_date('24-05-2025 17:08:00', 'dd-mm-yyyy hh24:mi:ss'), 123);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (158, 4, 39, to_date('19-07-2026 19:51:00', 'dd-mm-yyyy hh24:mi:ss'), 333);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (159, 5, 22, to_date('07-01-2025 05:35:00', 'dd-mm-yyyy hh24:mi:ss'), 106);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (160, 3, 48, to_date('16-02-2025 02:46:00', 'dd-mm-yyyy hh24:mi:ss'), 230);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (161, 2, 41, to_date('24-06-2026 10:58:00', 'dd-mm-yyyy hh24:mi:ss'), 398);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (162, 4, 1, to_date('20-02-2026 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), 366);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (163, 2, 14, to_date('09-01-2024 07:13:00', 'dd-mm-yyyy hh24:mi:ss'), 28);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (164, 5, 37, to_date('11-08-2025 01:18:00', 'dd-mm-yyyy hh24:mi:ss'), 128);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (165, 3, 45, to_date('18-12-2024 06:40:00', 'dd-mm-yyyy hh24:mi:ss'), 132);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (166, 3, 2, to_date('07-07-2026 23:21:00', 'dd-mm-yyyy hh24:mi:ss'), 105);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (167, 1, 20, to_date('21-03-2024 07:59:00', 'dd-mm-yyyy hh24:mi:ss'), 43);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (168, 4, 25, to_date('03-01-2025 16:18:00', 'dd-mm-yyyy hh24:mi:ss'), 25);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (169, 5, 48, to_date('30-08-2024 05:25:00', 'dd-mm-yyyy hh24:mi:ss'), 161);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (170, 3, 23, to_date('04-07-2024 08:45:00', 'dd-mm-yyyy hh24:mi:ss'), 216);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (171, 2, 28, to_date('02-07-2025 11:39:00', 'dd-mm-yyyy hh24:mi:ss'), 146);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (172, 5, 30, to_date('12-10-2026 13:16:00', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (173, 4, 46, to_date('19-07-2026 22:09:00', 'dd-mm-yyyy hh24:mi:ss'), 198);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (174, 4, 15, to_date('19-12-2026 03:25:00', 'dd-mm-yyyy hh24:mi:ss'), 30);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (175, 5, 2, to_date('14-06-2024 16:58:00', 'dd-mm-yyyy hh24:mi:ss'), 119);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (176, 4, 13, to_date('24-06-2024 00:20:00', 'dd-mm-yyyy hh24:mi:ss'), 322);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (177, 2, 12, to_date('30-10-2024 00:02:00', 'dd-mm-yyyy hh24:mi:ss'), 240);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (178, 2, 2, to_date('20-11-2025 04:44:00', 'dd-mm-yyyy hh24:mi:ss'), 183);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (179, 5, 38, to_date('23-05-2025 04:05:00', 'dd-mm-yyyy hh24:mi:ss'), 119);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (180, 4, 35, to_date('07-10-2024 14:39:00', 'dd-mm-yyyy hh24:mi:ss'), 398);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (181, 3, 45, to_date('17-12-2026 12:53:00', 'dd-mm-yyyy hh24:mi:ss'), 341);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (182, 3, 26, to_date('30-05-2024 08:22:00', 'dd-mm-yyyy hh24:mi:ss'), 334);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (183, 2, 47, to_date('17-06-2024 17:09:00', 'dd-mm-yyyy hh24:mi:ss'), 37);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (184, 4, 41, to_date('14-07-2025 13:01:00', 'dd-mm-yyyy hh24:mi:ss'), 183);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (185, 4, 11, to_date('11-10-2025 11:47:00', 'dd-mm-yyyy hh24:mi:ss'), 377);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (186, 1, 40, to_date('28-11-2026 18:46:00', 'dd-mm-yyyy hh24:mi:ss'), 164);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (187, 5, 14, to_date('31-08-2026 06:46:00', 'dd-mm-yyyy hh24:mi:ss'), 88);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (188, 5, 18, to_date('04-12-2026 02:16:00', 'dd-mm-yyyy hh24:mi:ss'), 360);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (189, 4, 50, to_date('29-06-2025 03:29:00', 'dd-mm-yyyy hh24:mi:ss'), 228);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (190, 5, 9, to_date('28-01-2026 11:49:00', 'dd-mm-yyyy hh24:mi:ss'), 378);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (191, 5, 42, to_date('17-12-2026 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 170);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (192, 1, 36, to_date('03-06-2024 01:53:00', 'dd-mm-yyyy hh24:mi:ss'), 59);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (193, 4, 11, to_date('17-10-2025 12:59:00', 'dd-mm-yyyy hh24:mi:ss'), 370);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (194, 1, 9, to_date('08-12-2025 17:11:00', 'dd-mm-yyyy hh24:mi:ss'), 11);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (195, 1, 43, to_date('19-04-2024 09:24:00', 'dd-mm-yyyy hh24:mi:ss'), 45);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (196, 2, 46, to_date('14-11-2025 06:21:00', 'dd-mm-yyyy hh24:mi:ss'), 316);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (197, 4, 9, to_date('26-11-2026 21:57:00', 'dd-mm-yyyy hh24:mi:ss'), 407);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (198, 2, 18, to_date('13-12-2025 08:53:00', 'dd-mm-yyyy hh24:mi:ss'), 299);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (199, 3, 43, to_date('02-09-2026 06:23:00', 'dd-mm-yyyy hh24:mi:ss'), 336);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (200, 4, 27, to_date('06-08-2026 19:48:00', 'dd-mm-yyyy hh24:mi:ss'), 153);
commit;
prompt 200 records committed...
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (201, 4, 15, to_date('23-08-2025 03:18:00', 'dd-mm-yyyy hh24:mi:ss'), 77);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (202, 3, 14, to_date('20-01-2026 11:44:00', 'dd-mm-yyyy hh24:mi:ss'), 349);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (203, 2, 21, to_date('23-03-2026 16:58:00', 'dd-mm-yyyy hh24:mi:ss'), 247);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (204, 4, 35, to_date('07-06-2026 18:27:00', 'dd-mm-yyyy hh24:mi:ss'), 37);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (205, 2, 7, to_date('20-06-2026 03:39:00', 'dd-mm-yyyy hh24:mi:ss'), 249);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (206, 5, 28, to_date('26-09-2025 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), 188);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (207, 5, 15, to_date('11-04-2025 17:31:00', 'dd-mm-yyyy hh24:mi:ss'), 203);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (208, 1, 46, to_date('13-10-2025 09:04:00', 'dd-mm-yyyy hh24:mi:ss'), 7);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (209, 3, 16, to_date('28-07-2025 09:50:00', 'dd-mm-yyyy hh24:mi:ss'), 232);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (210, 2, 32, to_date('02-02-2026 11:32:00', 'dd-mm-yyyy hh24:mi:ss'), 122);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (211, 3, 10, to_date('23-05-2026 01:55:00', 'dd-mm-yyyy hh24:mi:ss'), 391);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (212, 3, 4, to_date('10-09-2024 15:33:00', 'dd-mm-yyyy hh24:mi:ss'), 271);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (213, 5, 19, to_date('02-12-2024 07:23:00', 'dd-mm-yyyy hh24:mi:ss'), 6);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (214, 4, 43, to_date('17-11-2025 22:50:00', 'dd-mm-yyyy hh24:mi:ss'), 93);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (215, 5, 40, to_date('14-06-2025 15:59:00', 'dd-mm-yyyy hh24:mi:ss'), 115);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (216, 4, 23, to_date('28-11-2024 17:19:00', 'dd-mm-yyyy hh24:mi:ss'), 144);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (217, 5, 44, to_date('26-04-2025 15:01:00', 'dd-mm-yyyy hh24:mi:ss'), 398);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (218, 4, 14, to_date('08-08-2026 23:03:00', 'dd-mm-yyyy hh24:mi:ss'), 274);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (219, 5, 33, to_date('17-09-2025 00:01:00', 'dd-mm-yyyy hh24:mi:ss'), 29);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (220, 5, 24, to_date('12-12-2025 07:57:00', 'dd-mm-yyyy hh24:mi:ss'), 288);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (221, 5, 5, to_date('25-06-2025 23:13:00', 'dd-mm-yyyy hh24:mi:ss'), 396);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (222, 2, 40, to_date('23-07-2025 16:44:00', 'dd-mm-yyyy hh24:mi:ss'), 15);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (223, 1, 10, to_date('10-11-2024 15:17:00', 'dd-mm-yyyy hh24:mi:ss'), 266);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (224, 2, 40, to_date('26-02-2024 05:35:00', 'dd-mm-yyyy hh24:mi:ss'), 16);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (225, 5, 16, to_date('07-02-2024 04:40:00', 'dd-mm-yyyy hh24:mi:ss'), 195);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (226, 2, 42, to_date('22-11-2026 02:11:00', 'dd-mm-yyyy hh24:mi:ss'), 70);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (227, 3, 29, to_date('31-01-2026 14:27:00', 'dd-mm-yyyy hh24:mi:ss'), 205);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (228, 3, 11, to_date('28-09-2026 15:23:00', 'dd-mm-yyyy hh24:mi:ss'), 340);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (229, 5, 18, to_date('15-11-2024 20:42:00', 'dd-mm-yyyy hh24:mi:ss'), 147);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (230, 2, 24, to_date('07-09-2025 06:10:00', 'dd-mm-yyyy hh24:mi:ss'), 321);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (231, 1, 34, to_date('21-02-2025 20:14:00', 'dd-mm-yyyy hh24:mi:ss'), 294);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (232, 4, 30, to_date('29-11-2026 16:13:00', 'dd-mm-yyyy hh24:mi:ss'), 56);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (233, 3, 41, to_date('12-08-2026 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), 120);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (234, 5, 17, to_date('26-12-2024 22:10:00', 'dd-mm-yyyy hh24:mi:ss'), 365);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (235, 3, 49, to_date('28-05-2024 15:44:00', 'dd-mm-yyyy hh24:mi:ss'), 176);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (236, 3, 38, to_date('08-11-2026 18:57:00', 'dd-mm-yyyy hh24:mi:ss'), 16);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (237, 1, 44, to_date('14-04-2025 20:42:00', 'dd-mm-yyyy hh24:mi:ss'), 91);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (238, 2, 26, to_date('25-11-2025 21:04:00', 'dd-mm-yyyy hh24:mi:ss'), 103);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (239, 2, 29, to_date('06-12-2025 03:04:00', 'dd-mm-yyyy hh24:mi:ss'), 99);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (240, 3, 25, to_date('06-11-2024 05:03:00', 'dd-mm-yyyy hh24:mi:ss'), 36);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (241, 5, 13, to_date('22-01-2025 17:28:00', 'dd-mm-yyyy hh24:mi:ss'), 319);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (242, 5, 23, to_date('23-08-2026 09:34:00', 'dd-mm-yyyy hh24:mi:ss'), 332);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (243, 5, 5, to_date('15-07-2024 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), 279);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (244, 3, 25, to_date('18-04-2026 09:04:00', 'dd-mm-yyyy hh24:mi:ss'), 297);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (245, 5, 10, to_date('25-05-2025 23:28:00', 'dd-mm-yyyy hh24:mi:ss'), 301);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (246, 2, 0, to_date('06-08-2024 16:45:00', 'dd-mm-yyyy hh24:mi:ss'), 49);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (247, 2, 30, to_date('02-11-2024 23:24:00', 'dd-mm-yyyy hh24:mi:ss'), 254);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (248, 3, 11, to_date('28-10-2024 09:11:00', 'dd-mm-yyyy hh24:mi:ss'), 301);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (249, 2, 16, to_date('06-02-2026 05:09:00', 'dd-mm-yyyy hh24:mi:ss'), 175);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (250, 1, 13, to_date('16-05-2024 08:27:00', 'dd-mm-yyyy hh24:mi:ss'), 328);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (251, 4, 26, to_date('03-05-2025 09:53:00', 'dd-mm-yyyy hh24:mi:ss'), 297);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (252, 5, 46, to_date('22-04-2025 09:37:00', 'dd-mm-yyyy hh24:mi:ss'), 274);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (253, 5, 32, to_date('17-05-2026 08:38:00', 'dd-mm-yyyy hh24:mi:ss'), 85);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (254, 4, 29, to_date('17-11-2024 17:53:00', 'dd-mm-yyyy hh24:mi:ss'), 392);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (255, 5, 34, to_date('17-06-2026 12:11:00', 'dd-mm-yyyy hh24:mi:ss'), 365);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (256, 4, 23, to_date('15-12-2024 03:10:00', 'dd-mm-yyyy hh24:mi:ss'), 122);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (257, 3, 22, to_date('23-11-2026 02:18:00', 'dd-mm-yyyy hh24:mi:ss'), 358);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (258, 2, 22, to_date('24-05-2024 12:07:00', 'dd-mm-yyyy hh24:mi:ss'), 257);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (259, 4, 3, to_date('23-08-2026 20:42:00', 'dd-mm-yyyy hh24:mi:ss'), 275);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (260, 5, 21, to_date('14-05-2024 05:45:00', 'dd-mm-yyyy hh24:mi:ss'), 17);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (261, 4, 14, to_date('13-11-2025 07:13:00', 'dd-mm-yyyy hh24:mi:ss'), 41);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (262, 4, 20, to_date('07-08-2025 22:31:00', 'dd-mm-yyyy hh24:mi:ss'), 90);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (263, 5, 50, to_date('21-05-2024 11:47:00', 'dd-mm-yyyy hh24:mi:ss'), 299);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (264, 3, 45, to_date('01-08-2026 18:52:00', 'dd-mm-yyyy hh24:mi:ss'), 165);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (265, 4, 42, to_date('03-02-2024 11:39:00', 'dd-mm-yyyy hh24:mi:ss'), 366);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (266, 2, 5, to_date('05-09-2025 11:19:00', 'dd-mm-yyyy hh24:mi:ss'), 386);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (267, 1, 40, to_date('16-04-2026 06:15:00', 'dd-mm-yyyy hh24:mi:ss'), 109);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (268, 3, 25, to_date('09-03-2024 16:06:00', 'dd-mm-yyyy hh24:mi:ss'), 167);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (269, 5, 47, to_date('05-01-2024 05:36:00', 'dd-mm-yyyy hh24:mi:ss'), 3);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (270, 1, 7, to_date('08-05-2024 02:06:00', 'dd-mm-yyyy hh24:mi:ss'), 104);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (271, 1, 0, to_date('04-03-2025 07:55:00', 'dd-mm-yyyy hh24:mi:ss'), 188);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (272, 3, 14, to_date('20-04-2025 01:35:00', 'dd-mm-yyyy hh24:mi:ss'), 21);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (273, 4, 22, to_date('18-10-2025 15:14:00', 'dd-mm-yyyy hh24:mi:ss'), 166);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (274, 3, 49, to_date('06-12-2025 18:12:00', 'dd-mm-yyyy hh24:mi:ss'), 118);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (275, 3, 3, to_date('28-01-2026 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), 369);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (276, 1, 34, to_date('17-09-2025 20:35:00', 'dd-mm-yyyy hh24:mi:ss'), 296);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (277, 4, 9, to_date('29-05-2026 17:29:00', 'dd-mm-yyyy hh24:mi:ss'), 274);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (278, 3, 48, to_date('07-06-2026 21:23:00', 'dd-mm-yyyy hh24:mi:ss'), 123);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (279, 4, 23, to_date('18-05-2024 01:41:00', 'dd-mm-yyyy hh24:mi:ss'), 16);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (280, 5, 19, to_date('28-11-2025 01:56:00', 'dd-mm-yyyy hh24:mi:ss'), 265);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (281, 2, 50, to_date('21-08-2024 22:30:00', 'dd-mm-yyyy hh24:mi:ss'), 190);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (282, 1, 10, to_date('03-08-2024 18:13:00', 'dd-mm-yyyy hh24:mi:ss'), 41);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (283, 4, 25, to_date('19-10-2025 10:40:00', 'dd-mm-yyyy hh24:mi:ss'), 248);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (284, 1, 20, to_date('20-02-2024 08:34:00', 'dd-mm-yyyy hh24:mi:ss'), 134);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (285, 1, 22, to_date('06-03-2026 12:04:00', 'dd-mm-yyyy hh24:mi:ss'), 393);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (286, 1, 28, to_date('30-11-2026 22:35:00', 'dd-mm-yyyy hh24:mi:ss'), 201);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (287, 1, 17, to_date('13-07-2024 09:34:00', 'dd-mm-yyyy hh24:mi:ss'), 27);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (288, 5, 46, to_date('19-06-2024 07:57:00', 'dd-mm-yyyy hh24:mi:ss'), 401);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (289, 2, 0, to_date('13-09-2024 22:16:00', 'dd-mm-yyyy hh24:mi:ss'), 111);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (290, 5, 25, to_date('24-10-2025 18:15:00', 'dd-mm-yyyy hh24:mi:ss'), 289);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (291, 3, 47, to_date('27-03-2026 02:26:00', 'dd-mm-yyyy hh24:mi:ss'), 20);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (292, 3, 11, to_date('10-11-2026 02:43:00', 'dd-mm-yyyy hh24:mi:ss'), 394);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (293, 5, 41, to_date('25-11-2024 09:49:00', 'dd-mm-yyyy hh24:mi:ss'), 368);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (294, 1, 7, to_date('01-08-2025 17:16:00', 'dd-mm-yyyy hh24:mi:ss'), 346);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (295, 1, 46, to_date('25-02-2026 15:23:00', 'dd-mm-yyyy hh24:mi:ss'), 322);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (296, 4, 35, to_date('30-03-2026 17:02:00', 'dd-mm-yyyy hh24:mi:ss'), 93);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (297, 4, 37, to_date('25-07-2026 06:43:00', 'dd-mm-yyyy hh24:mi:ss'), 67);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (298, 4, 4, to_date('07-07-2026 22:32:00', 'dd-mm-yyyy hh24:mi:ss'), 129);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (299, 4, 28, to_date('22-02-2026 10:52:00', 'dd-mm-yyyy hh24:mi:ss'), 224);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (300, 5, 34, to_date('18-07-2026 11:10:00', 'dd-mm-yyyy hh24:mi:ss'), 307);
commit;
prompt 300 records committed...
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (301, 3, 9, to_date('22-08-2026 10:37:00', 'dd-mm-yyyy hh24:mi:ss'), 265);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (302, 5, 22, to_date('13-12-2026 14:19:00', 'dd-mm-yyyy hh24:mi:ss'), 110);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (303, 3, 35, to_date('03-10-2024 18:23:00', 'dd-mm-yyyy hh24:mi:ss'), 32);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (304, 2, 25, to_date('10-10-2024 11:58:00', 'dd-mm-yyyy hh24:mi:ss'), 394);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (305, 5, 10, to_date('18-04-2024 19:27:00', 'dd-mm-yyyy hh24:mi:ss'), 255);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (306, 3, 36, to_date('03-05-2025 08:42:00', 'dd-mm-yyyy hh24:mi:ss'), 16);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (307, 4, 37, to_date('12-04-2025 00:51:00', 'dd-mm-yyyy hh24:mi:ss'), 19);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (308, 4, 16, to_date('28-01-2025 03:21:00', 'dd-mm-yyyy hh24:mi:ss'), 84);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (309, 3, 12, to_date('17-12-2025 17:45:00', 'dd-mm-yyyy hh24:mi:ss'), 205);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (310, 5, 36, to_date('13-04-2025 20:04:00', 'dd-mm-yyyy hh24:mi:ss'), 234);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (311, 5, 25, to_date('26-10-2025 09:10:00', 'dd-mm-yyyy hh24:mi:ss'), 190);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (312, 3, 7, to_date('19-10-2025 08:52:00', 'dd-mm-yyyy hh24:mi:ss'), 60);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (313, 5, 11, to_date('07-06-2026 11:22:00', 'dd-mm-yyyy hh24:mi:ss'), 108);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (314, 3, 30, to_date('22-08-2025 23:42:00', 'dd-mm-yyyy hh24:mi:ss'), 358);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (315, 3, 9, to_date('13-05-2024 00:41:00', 'dd-mm-yyyy hh24:mi:ss'), 58);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (316, 5, 35, to_date('26-07-2024 06:06:00', 'dd-mm-yyyy hh24:mi:ss'), 97);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (317, 2, 19, to_date('24-11-2025 13:49:00', 'dd-mm-yyyy hh24:mi:ss'), 370);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (318, 2, 35, to_date('24-07-2025 14:11:00', 'dd-mm-yyyy hh24:mi:ss'), 181);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (319, 4, 17, to_date('25-10-2026 17:42:00', 'dd-mm-yyyy hh24:mi:ss'), 45);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (320, 4, 22, to_date('23-04-2026 09:15:00', 'dd-mm-yyyy hh24:mi:ss'), 55);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (321, 2, 16, to_date('06-01-2026 08:49:00', 'dd-mm-yyyy hh24:mi:ss'), 349);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (322, 1, 26, to_date('17-07-2026 15:56:00', 'dd-mm-yyyy hh24:mi:ss'), 289);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (323, 2, 41, to_date('10-02-2025 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), 27);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (324, 3, 20, to_date('16-05-2024 07:38:00', 'dd-mm-yyyy hh24:mi:ss'), 59);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (325, 2, 42, to_date('22-12-2025 08:49:00', 'dd-mm-yyyy hh24:mi:ss'), 177);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (326, 4, 34, to_date('07-07-2025 21:43:00', 'dd-mm-yyyy hh24:mi:ss'), 189);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (327, 4, 29, to_date('18-03-2026 17:19:00', 'dd-mm-yyyy hh24:mi:ss'), 334);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (328, 5, 12, to_date('11-07-2026 00:03:00', 'dd-mm-yyyy hh24:mi:ss'), 273);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (329, 3, 44, to_date('23-07-2024 17:29:00', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (330, 5, 39, to_date('19-11-2025 03:07:00', 'dd-mm-yyyy hh24:mi:ss'), 128);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (331, 4, 42, to_date('25-03-2024 03:53:00', 'dd-mm-yyyy hh24:mi:ss'), 285);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (332, 4, 2, to_date('31-01-2024 05:31:00', 'dd-mm-yyyy hh24:mi:ss'), 252);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (333, 4, 27, to_date('14-03-2025 16:09:00', 'dd-mm-yyyy hh24:mi:ss'), 333);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (334, 5, 21, to_date('09-08-2024 17:06:00', 'dd-mm-yyyy hh24:mi:ss'), 43);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (335, 2, 40, to_date('09-06-2026 20:47:00', 'dd-mm-yyyy hh24:mi:ss'), 11);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (336, 1, 19, to_date('25-11-2026 01:31:00', 'dd-mm-yyyy hh24:mi:ss'), 359);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (337, 1, 47, to_date('20-01-2026 22:25:00', 'dd-mm-yyyy hh24:mi:ss'), 250);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (338, 1, 6, to_date('28-03-2026 00:23:00', 'dd-mm-yyyy hh24:mi:ss'), 150);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (339, 2, 36, to_date('23-05-2025 20:41:00', 'dd-mm-yyyy hh24:mi:ss'), 222);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (340, 5, 10, to_date('06-07-2026 06:42:00', 'dd-mm-yyyy hh24:mi:ss'), 298);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (341, 4, 10, to_date('24-01-2025 04:34:00', 'dd-mm-yyyy hh24:mi:ss'), 371);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (342, 4, 13, to_date('09-01-2024 20:07:00', 'dd-mm-yyyy hh24:mi:ss'), 302);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (343, 5, 41, to_date('06-12-2024 08:10:00', 'dd-mm-yyyy hh24:mi:ss'), 340);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (344, 5, 38, to_date('16-02-2025 19:18:00', 'dd-mm-yyyy hh24:mi:ss'), 118);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (345, 4, 19, to_date('31-12-2024 12:05:00', 'dd-mm-yyyy hh24:mi:ss'), 2);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (346, 1, 47, to_date('30-11-2025 20:12:00', 'dd-mm-yyyy hh24:mi:ss'), 173);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (347, 3, 10, to_date('12-04-2024 02:15:00', 'dd-mm-yyyy hh24:mi:ss'), 313);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (348, 1, 27, to_date('24-09-2025 03:34:00', 'dd-mm-yyyy hh24:mi:ss'), 389);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (349, 4, 17, to_date('17-07-2026 18:11:00', 'dd-mm-yyyy hh24:mi:ss'), 293);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (350, 2, 50, to_date('08-09-2026 23:57:00', 'dd-mm-yyyy hh24:mi:ss'), 251);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (351, 5, 40, to_date('01-02-2026 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 388);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (352, 3, 12, to_date('16-02-2025 20:24:00', 'dd-mm-yyyy hh24:mi:ss'), 335);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (353, 5, 41, to_date('10-05-2024 02:17:00', 'dd-mm-yyyy hh24:mi:ss'), 325);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (354, 4, 49, to_date('19-12-2024 00:28:00', 'dd-mm-yyyy hh24:mi:ss'), 383);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (355, 3, 14, to_date('12-07-2026 05:41:00', 'dd-mm-yyyy hh24:mi:ss'), 62);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (356, 4, 35, to_date('08-01-2025 21:46:00', 'dd-mm-yyyy hh24:mi:ss'), 59);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (357, 4, 10, to_date('09-02-2024 08:32:00', 'dd-mm-yyyy hh24:mi:ss'), 156);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (358, 2, 49, to_date('12-04-2025 19:10:00', 'dd-mm-yyyy hh24:mi:ss'), 359);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (359, 4, 4, to_date('25-04-2026 03:56:00', 'dd-mm-yyyy hh24:mi:ss'), 306);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (360, 4, 38, to_date('23-01-2025 05:14:00', 'dd-mm-yyyy hh24:mi:ss'), 316);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (361, 4, 32, to_date('27-07-2026 12:13:00', 'dd-mm-yyyy hh24:mi:ss'), 180);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (362, 1, 32, to_date('28-02-2025 20:23:00', 'dd-mm-yyyy hh24:mi:ss'), 98);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (363, 5, 12, to_date('15-10-2026 07:34:00', 'dd-mm-yyyy hh24:mi:ss'), 60);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (364, 1, 15, to_date('30-11-2024 00:26:00', 'dd-mm-yyyy hh24:mi:ss'), 231);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (365, 1, 41, to_date('07-09-2026 02:27:00', 'dd-mm-yyyy hh24:mi:ss'), 78);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (366, 4, 2, to_date('07-03-2026 17:41:00', 'dd-mm-yyyy hh24:mi:ss'), 231);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (367, 3, 19, to_date('26-12-2025 01:25:00', 'dd-mm-yyyy hh24:mi:ss'), 97);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (368, 3, 9, to_date('26-04-2026 07:34:00', 'dd-mm-yyyy hh24:mi:ss'), 346);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (369, 3, 0, to_date('05-08-2024 16:28:00', 'dd-mm-yyyy hh24:mi:ss'), 225);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (370, 5, 38, to_date('10-01-2024 12:35:00', 'dd-mm-yyyy hh24:mi:ss'), 235);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (371, 4, 31, to_date('04-09-2026 23:47:00', 'dd-mm-yyyy hh24:mi:ss'), 337);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (372, 3, 3, to_date('28-02-2026 07:58:00', 'dd-mm-yyyy hh24:mi:ss'), 346);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (373, 4, 48, to_date('21-09-2024 06:14:00', 'dd-mm-yyyy hh24:mi:ss'), 233);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (374, 4, 29, to_date('13-07-2025 04:49:00', 'dd-mm-yyyy hh24:mi:ss'), 247);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (375, 5, 28, to_date('18-06-2026 08:58:00', 'dd-mm-yyyy hh24:mi:ss'), 25);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (376, 4, 24, to_date('12-07-2024 22:33:00', 'dd-mm-yyyy hh24:mi:ss'), 51);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (377, 1, 42, to_date('02-11-2025 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), 355);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (378, 1, 35, to_date('16-10-2026 03:02:00', 'dd-mm-yyyy hh24:mi:ss'), 22);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (379, 2, 9, to_date('20-10-2025 13:39:00', 'dd-mm-yyyy hh24:mi:ss'), 369);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (380, 1, 34, to_date('06-10-2026 02:15:00', 'dd-mm-yyyy hh24:mi:ss'), 9);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (381, 3, 8, to_date('14-02-2026 05:29:00', 'dd-mm-yyyy hh24:mi:ss'), 31);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (382, 5, 23, to_date('11-03-2024 11:14:00', 'dd-mm-yyyy hh24:mi:ss'), 332);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (383, 3, 41, to_date('07-02-2024 11:34:00', 'dd-mm-yyyy hh24:mi:ss'), 209);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (384, 1, 30, to_date('21-07-2024 06:41:00', 'dd-mm-yyyy hh24:mi:ss'), 36);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (385, 1, 41, to_date('20-03-2025 18:59:00', 'dd-mm-yyyy hh24:mi:ss'), 113);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (386, 4, 19, to_date('16-06-2025 15:09:00', 'dd-mm-yyyy hh24:mi:ss'), 285);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (387, 5, 0, to_date('01-10-2024 23:49:00', 'dd-mm-yyyy hh24:mi:ss'), 301);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (388, 4, 42, to_date('13-12-2024 22:29:00', 'dd-mm-yyyy hh24:mi:ss'), 212);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (389, 5, 40, to_date('16-04-2026 13:14:00', 'dd-mm-yyyy hh24:mi:ss'), 174);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (390, 4, 3, to_date('04-10-2024 16:58:00', 'dd-mm-yyyy hh24:mi:ss'), 367);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (391, 1, 29, to_date('22-03-2025 09:32:00', 'dd-mm-yyyy hh24:mi:ss'), 210);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (392, 5, 25, to_date('25-06-2025 21:53:00', 'dd-mm-yyyy hh24:mi:ss'), 247);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (393, 2, 19, to_date('11-02-2026 07:17:00', 'dd-mm-yyyy hh24:mi:ss'), 330);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (394, 5, 9, to_date('24-09-2025 21:37:00', 'dd-mm-yyyy hh24:mi:ss'), 165);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (395, 4, 22, to_date('04-02-2025 20:17:00', 'dd-mm-yyyy hh24:mi:ss'), 134);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (396, 3, 12, to_date('07-03-2025 21:13:00', 'dd-mm-yyyy hh24:mi:ss'), 60);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (397, 3, 46, to_date('08-02-2026 21:51:00', 'dd-mm-yyyy hh24:mi:ss'), 188);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (398, 3, 16, to_date('27-07-2025 23:27:00', 'dd-mm-yyyy hh24:mi:ss'), 186);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (399, 2, 30, to_date('23-02-2025 18:37:00', 'dd-mm-yyyy hh24:mi:ss'), 261);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (400, 4, 7, to_date('26-08-2026 19:24:00', 'dd-mm-yyyy hh24:mi:ss'), 380);
commit;
prompt 400 records committed...
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (401, 3, 39, to_date('30-05-2025 17:54:00', 'dd-mm-yyyy hh24:mi:ss'), 254);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (402, 1, 2, to_date('25-01-2026 16:35:00', 'dd-mm-yyyy hh24:mi:ss'), 396);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (403, 3, 2, to_date('25-05-2026 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), 129);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (404, 1, 33, to_date('25-02-2026 08:27:00', 'dd-mm-yyyy hh24:mi:ss'), 46);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (405, 2, 17, to_date('10-12-2025 03:05:00', 'dd-mm-yyyy hh24:mi:ss'), 67);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (406, 4, 34, to_date('11-09-2026 05:30:00', 'dd-mm-yyyy hh24:mi:ss'), 400);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (407, 4, 41, to_date('06-03-2026 21:54:00', 'dd-mm-yyyy hh24:mi:ss'), 38);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (408, 4, 28, to_date('19-08-2024 07:55:00', 'dd-mm-yyyy hh24:mi:ss'), 291);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (409, 5, 48, to_date('18-06-2025 18:16:00', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into ORDERS (orderid, ticketamount, ticketcost, orderdate, eventid)
values (410, 1, 20, to_date('26-08-2026 15:31:00', 'dd-mm-yyyy hh24:mi:ss'), 29);
commit;
prompt 410 records loaded
prompt Loading PARTICIPANTS...
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (1, 'Alice', 'Green', 'alice@example.com', 1);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (2, 'Bob', 'White', 'bob@example.com', 0);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (3, 'Charlie', 'Black', 'charlie@example.com', 1);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (4, 'Diana', 'Red', 'diana@example.com', 0);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (5, 'Evan', 'Yellow', 'evan@example.com', 1);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (6, 'Fiona', 'Blue', 'fiona@example.com', 0);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (7, 'George', 'Pink', 'george@example.com', 1);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (8, 'Hannah', 'Brown', 'hannah@example.com', 0);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (9, 'Ian', 'Grey', 'ian@example.com', 1);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (10, 'Julia', 'Orange', 'julia@example.com', 0);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (11, 'Lennie', 'Lovitz', 'lennie.lovitz@3tsystems.de', 1000);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (12, 'Aimee', 'Goodall', 'aimee.goodall@bestbuy.com', 1001);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (13, 'Johnette', 'Walken', 'johnette@faef.com', 1002);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (14, 'Julianne', 'Gibbons', 'julianne@adolph.fr', 1003);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (15, 'Holland', 'Bugnon', 'holland.bugnon@contract.com', 1004);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (16, 'Leon', 'Laurie', 'leon.laurie@y2marketing.es', 1005);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (17, 'Lindsay', 'Chilton', 'lindsay.chilton@banfeproducts.', 1006);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (18, 'Simon', 'Hobson', 'shobson@abatix.com', 1007);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (19, 'Geoff', 'Burrows', 'g.burrows@albertsons.de', 1008);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (20, 'Sarah', 'Cummings', 'scummings@evergreenresources.p', 1009);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (21, 'Keanu', 'Evans', 'k.evans@sfgo.se', 1010);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (22, 'Donna', 'Cummings', 'donna@pis.cy', 1011);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (23, 'Jann', 'Van Helden', 'j.vanhelden@ksj.uk', 1012);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (24, 'Claude', 'DeLuise', 'claude.d@trafficmanagement.au', 1013);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (25, 'Busta', 'Pullman', 'busta@directdata.de', 1014);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (26, 'Balthazar', 'Neill', 'b.neill@mms.com', 1015);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (27, 'Clint', 'Cross', 'clint.cross@sfb.es', 1016);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (28, 'Adam', 'Duncan', 'adam.duncan@tastefullysimple.j', 1017);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (29, 'Benicio', 'Holden', 'bholden@qas.jp', 1018);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (30, 'Milla', 'Jamal', 'milla.jamal@wav.com', 1019);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (31, 'Olga', 'Liotta', 'olga.l@mwp.com', 1020);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (32, 'Milla', 'Paquin', 'milla.p@portageenvironmental.a', 1021);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (33, 'Geoffrey', 'Osmond', 'geoffreyo@wlt.com', 1022);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (34, 'Lauren', 'Goldblum', 'lauren.goldblum@firstsouthbanc', 1023);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (35, 'Helen', 'Wincott', 'helen.wincott@doctorsassociate', 1024);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (36, 'Breckin', 'Rooker', 'breckinr@ivci.com', 1025);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (37, 'Eugene', 'Haynes', 'eugene.haynes@mainstreetbanks.', 1026);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (38, 'Allison', 'Maguire', 'amaguire@diamondgroup.de', 1027);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (39, 'Tony', 'Shalhoub', 'tony.shalhoub@zoneperfectnutri', 1028);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (40, 'Peabo', 'Prinze', 'p.prinze@universalsolutions.nz', 1029);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (41, 'Julianne', 'DeVito', 'julianne.devito@visionarysyste', 1030);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (42, 'Joey', 'Fogerty', 'joey.fogerty@tlsservicebureau.', 1031);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (43, 'Lena', 'Ferry', 'l.ferry@spenser.se', 1032);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (44, 'Albert', 'Sinatra', 'albert.sinatra@viacell.com', 1033);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (45, 'Nelly', 'Horizon', 'nelly.h@hencie.com', 1034);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (46, 'Denzel', 'Penn', 'denzel.penn@solipsys.com', 1035);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (47, 'Bonnie', 'Plowright', 'bonnie.plowright@totalentertai', 1036);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (48, 'Andrea', 'Meniketti', 'andrea.meniketti@marketbased.n', 1037);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (49, 'Franco', 'Kudrow', 'franco.kudrow@heartlab.uk', 1038);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (50, 'Ray', 'Lauper', 'ray@maverick.com', 1039);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (51, 'Debra', 'Fisher', 'dfisher@mwp.nl', 1040);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (52, 'Caroline', 'Franks', 'caroline.franks@ceom.com', 1041);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (53, 'Laurence', 'Eldard', 'laurence.e@grs.com', 1042);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (54, 'Whoopi', 'Donovan', 'whoopi.donovan@ufs.com', 1043);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (55, 'Zooey', 'Chilton', 'zchilton@peerlessmanufacturing', 1044);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (56, 'Johnny', 'Keeslar', 'johnny.k@drinkmorewater.nl', 1045);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (57, 'Mandy', 'Holbrook', 'mandy.holbrook@maverick.au', 1046);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (58, 'Rickie', 'England', 'rickie.england@tilsonhr.com', 1047);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (59, 'Steven', 'O''Connor', 'steven.oconnor@infovision.au', 1048);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (60, 'Edwin', 'Idol', 'edwin.idol@tps.ca', 1049);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (61, 'Bo', 'Oakenfold', 'boakenfold@infopros.br', 1050);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (62, 'Tea', 'Fonda', 'tea.fonda@mds.com', 1051);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (63, 'Winona', 'Kretschmann', 'w.kretschmann@sprint.tr', 1052);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (64, 'Gladys', 'Berkley', 'gladys@pinnaclestaffing.com', 1053);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (65, 'Susan', 'Soul', 'susans@generalmotors.ve', 1054);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (66, 'Vienna', 'Rankin', 'vienna.rankin@eagleone.fi', 1055);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (67, 'Johnnie', 'England', 'johnnie.england@aquascapedesig', 1056);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (68, 'Orlando', 'Salt', 'orlando.salt@sfb.it', 1057);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (69, 'Nigel', 'Vannelli', 'nigel.vannelli@coldstonecreame', 1058);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (70, 'Frances', 'Soul', 'frances.soul@qas.dk', 1059);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (71, 'Jon', 'Lerner', 'jon.lerner@avs.de', 1060);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (72, 'Roger', 'Kinney', 'roger@astafunding.be', 1061);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (73, 'Jaime', 'Moore', 'j.moore@slt.com', 1062);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (74, 'Daryl', 'Fierstein', 'daryl.fierstein@ads.com', 1063);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (75, 'Jodie', 'Nash', 'jodien@pioneerdatasystems.de', 1064);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (76, 'Lucy', 'Goldblum', 'lucy.goldblum@tropicaloasis.jp', 1065);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (77, 'Vendetta', 'Milsap', 'vendetta.milsap@novartis.uk', 1066);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (78, 'Eugene', 'Marx', 'eugene.m@wci.com', 1067);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (79, 'Ramsey', 'Platt', 'ramsey@yes.it', 1068);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (80, 'Johnnie', 'Winans', 'j.winans@baesch.com', 1069);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (81, 'Maura', 'Cruise', 'mcruise@kimberlyclark.com', 1070);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (82, 'Kay', 'Patillo', 'kay@sci.com', 1071);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (83, 'Sally', 'Cochran', 'sally@uem.ve', 1072);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (84, 'Jonny', 'Kirkwood', 'jonny.kirkwood@mitsubishimotor', 1073);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (85, 'Nathan', 'Quinones', 'nathan@fmt.com', 1074);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (86, 'Thomas', 'Roy Parnell', 'thomas@lindin.jp', 1075);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (87, 'Cesar', 'Austin', 'cesar@mag.com', 1076);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (88, 'Juliana', 'Fisher', 'juliana.fisher@yashtechnologie', 1077);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (89, 'Edgar', 'Creek', 'edgar.creek@infinity.ch', 1078);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (90, 'Seth', 'Dunn', 'seth@pds.nl', 1079);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (91, 'Timothy', 'Stanton', 'tstanton@ipsadvisory.com', 1080);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (92, 'Taye', 'Bale', 'taye.bale@procter.com', 1081);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (93, 'Chi', 'Carradine', 'chic@privatebancorp.ca', 1082);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (94, 'Freda', 'Affleck', 'faffleck@fam.at', 1083);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (95, 'Nils', 'Wong', 'nilsw@gbas.de', 1084);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (96, 'Judi', 'McIntosh', 'judi.mcintosh@novartis.au', 1085);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (97, 'Emily', 'Berkoff', 'emily.berkoff@ultimus.jp', 1086);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (98, 'Taryn', 'McFerrin', 't.mcferrin@bioreliance.com', 1087);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (99, 'Ann', 'Paige', 'ann.paige@infopros.com', 1088);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (100, 'Shelby', 'Lerner', 'slerner@sfgo.com', 1089);
commit;
prompt 100 records committed...
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (101, 'Annie', 'Hynde', 'annie.hynde@intraspheretechnol', 1090);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (102, 'Shannon', 'McClinton', 'shannon.m@seiaarons.de', 1091);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (103, 'Dar', 'Minogue', 'dar.minogue@hewlettpackard.com', 1092);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (104, 'Jena', 'Tennison', 'jena.tennison@supplycorecom.it', 1093);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (105, 'Hazel', 'Judd', 'hazel.j@montpelierplastics.com', 1094);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (106, 'Bret', 'Heatherly', 'breth@webgroup.com', 1095);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (107, 'Veruca', 'Ellis', 'vellis@horizonorganic.com', 1096);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (108, 'Eddie', 'Satriani', 'e.satriani@ams.com', 1097);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (109, 'Giovanni', 'Lane', 'giovanni.lane@tilsonhr.uk', 1098);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (110, 'Sheryl', 'Torino', 'sheryl.t@simplycertificates.co', 1099);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (111, 'Stellan', 'Heslov', 's.heslov@airmethods.com', 1100);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (112, 'Sander', 'Assante', 'sandera@millersystems.de', 1101);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (113, 'Burt', 'Raye', 'burt.r@formatech.es', 1102);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (114, 'Rade', 'Sedaka', 'rade.sedaka@cima.au', 1103);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (115, 'Dustin', 'Apple', 'dustin@pragmatechsoftware.com', 1104);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (116, 'Lesley', 'Sobieski', 'lesley.sobieski@at.com', 1105);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (117, 'Wes', 'Greene', 'wes.greene@idlabel.uk', 1106);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (118, 'Bret', 'Weisz', 'bret.w@cis.cr', 1107);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (119, 'Timothy', 'Weir', 'timothy@aoe.com', 1108);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (120, 'Glen', 'Guilfoyle', 'glen@mds.uk', 1109);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (121, 'Amanda', 'Melvin', 'amanda@albertsons.com', 1110);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (122, 'Sander', 'Reno', 'sander.reno@ntas.com', 1111);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (123, 'Nelly', 'Lizzy', 'nelly@teamstudio.gr', 1112);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (124, 'Barry', 'Buffalo', 'barry.buffalo@verizon.ca', 1113);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (125, 'Alec', 'McDowell', 'alec.mcdowell@granitesystems.d', 1114);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (126, 'Sander', 'Broadbent', 'sander.broadbent@ogi.com', 1115);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (127, 'Katie', 'Cobbs', 'kcobbs@sfgo.it', 1116);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (128, 'Joaquim', 'Berenger', 'joaquim.berenger@ris.nl', 1117);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (129, 'Arturo', 'Mahood', 'arturo.mahood@universalsolutio', 1118);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (130, 'Raymond', 'Arquette', 'raymond@prosperitybancshares.c', 1119);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (131, 'Winona', 'Madsen', 'winona.madsen@genghisgrill.com', 1120);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (132, 'Christmas', 'Spacek', 'christmas.spacek@pfizer.com', 1121);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (133, 'Oliver', 'Rourke', 'o.rourke@dynacqinternational.b', 1122);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (134, 'Benjamin', 'Guilfoyle', 'benjamin.guilfoyle@onesourcepr', 1123);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (135, 'Linda', 'Mahood', 'linda.mahood@alohanysystems.co', 1124);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (136, 'Josh', 'Langella', 'josh.langella@diamondtechnolog', 1125);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (137, 'Etta', 'Sedgwick', 'etta@mitsubishimotors.br', 1126);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (138, 'Davis', 'Diffie', 'davis.diffie@pharmafab.nl', 1127);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (139, 'Jeremy', 'Tarantino', 'jeremy@kelmooreinvestment.com', 1128);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (140, 'Neve', 'Laws', 'neve.laws@fpf.jp', 1129);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (141, 'Juice', 'Archer', 'juice.archer@abatix.ca', 1130);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (142, 'Sona', 'Kennedy', 'sona.kennedy@sandyspringbancor', 1131);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (143, 'Wade', 'Iglesias', 'w.iglesias@veritekinternationa', 1132);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (144, 'Isabella', 'Tomlin', 'isabella@mathis.com', 1133);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (145, 'Clint', 'Teng', 'clint.t@scjohnson.com', 1134);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (146, 'Carolyn', 'Getty', 'c.getty@idas.nl', 1135);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (147, 'Scott', 'Quinones', 'squinones@morganresearch.ch', 1136);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (148, 'Martha', 'Albright', 'martha.albright@hps.com', 1137);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (149, 'Marianne', 'Alston', 'marianne@bioanalytical.es', 1138);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (150, 'Chris', 'Nicks', 'chris.nicks@sprint.de', 1139);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (151, 'Hope', 'Campbell', 'hope.campbell@peerlessmanufact', 1140);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (152, 'Tzi', 'Iglesias', 'tzi@telecheminternational.uk', 1141);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (153, 'Rowan', 'Kattan', 'rowan.k@americanmegacom.ca', 1142);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (154, 'Bridget', 'Busey', 'bridget.busey@base.fr', 1143);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (155, 'Talvin', 'Hershey', 'talvin.hershey@mission.ar', 1144);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (156, 'Celia', 'Gaynor', 'celia@solipsys.au', 1145);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (157, 'Remy', 'Tripplehorn', 'rtripplehorn@inspirationsoftwa', 1146);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (158, 'Luis', 'Martinez', 'luis.martinez@merck.com', 1147);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (159, 'Ice', 'Remar', 'ice.remar@employerservices.com', 1148);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (160, 'Lonnie', 'Holland', 'lonnie@infinity.ar', 1149);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (161, 'Rade', 'Sartain', 'rsartain@simplycertificates.br', 1150);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (162, 'Trace', 'Nivola', 'tracen@ceo.de', 1151);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (163, 'Selma', 'Westerberg', 'selma.w@ogiointernational.uk', 1152);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (164, 'Chazz', 'Krabbe', 'chazz.krabbe@serentec.uk', 1153);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (165, 'Henry', 'Connelly', 'henry.connelly@newtoninteracti', 1154);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (166, 'Famke', 'Wakeling', 'famke.wakeling@astafunding.ca', 1155);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (167, 'Curt', 'Magnuson', 'curt.magnuson@gtp.it', 1156);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (168, 'Ivan', 'Benson', 'ivan.benson@bps.com', 1157);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (169, 'Kirsten', 'Chandler', 'kirsten@creditorsinterchange.a', 1158);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (170, 'Sharon', 'Elwes', 's.elwes@irissoftware.be', 1159);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (171, 'Andrew', 'Conley', 'andrew.conley@aventis.ar', 1160);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (172, 'Randall', 'Eastwood', 'randall.eastwood@networkdispla', 1161);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (173, 'Rade', 'Eldard', 'r.eldard@tastefullysimple.com', 1162);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (174, 'Terrence', 'Spall', 'terrence.s@investorstitle.pl', 1163);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (175, 'Mika', 'O''Donnell', 'modonnell@timevision.com', 1164);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (176, 'Victoria', 'Vince', 'victoria.v@callhenry.com', 1165);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (177, 'Neil', 'Flanagan', 'neil.flanagan@mercantilebank.d', 1166);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (178, 'Tea', 'Utada', 'tea@virbac.dk', 1167);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (179, 'Bernie', 'Shepherd', 'bernie@gha.com', 1168);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (180, 'Breckin', 'Driver', 'breckin.driver@networkdisplay.', 1169);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (181, 'Rosanna', 'Wakeling', 'rosannaw@cyberthink.com', 1170);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (182, 'Milla', 'O''Neill', 'moneill@career.com', 1171);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (183, 'Franco', 'Robards', 'frobards@fordmotor.com', 1172);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (184, 'Jeanne', 'Colman', 'j.colman@verizon.com', 1173);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (185, 'Antonio', 'Dzundza', 'antonio@fam.com', 1174);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (186, 'Suzy', 'MacDonald', 'suzy.macdonald@mls.it', 1175);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (187, 'Kevin', 'Robbins', 'kevin.robbins@perfectorder.com', 1176);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (188, 'Cledus', 'Moffat', 'c.moffat@yashtechnologies.fi', 1177);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (189, 'Joely', 'Coe', 'joely.coe@jewettcameron.uk', 1178);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (190, 'Pablo', 'Wright', 'pablo.wright@tama.com', 1179);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (191, 'Lesley', 'Nelligan', 'lesleyn@aventis.com', 1180);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (192, 'Ashley', 'Sevenfold', 'ashley.sevenfold@sm.com', 1181);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (193, 'Jon', 'Westerberg', 'jon.westerberg@walmartstores.d', 1182);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (194, 'Rich', 'Thorton', 'rich.thorton@aci.com', 1183);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (195, 'Rupert', 'Rodgers', 'rupertr@worldcom.au', 1184);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (196, 'Lea', 'Warburton', 'l.warburton@fns.com', 1185);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (197, 'Rufus', 'Warwick', 'rufus.w@harrison.uk', 1186);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (198, 'Geraldine', 'Carmen', 'geraldine.carmen@bioanalytical', 1187);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (199, 'Tara', 'Lovitz', 'tara.lovitz@fnb.es', 1188);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (200, 'Rosario', 'Dale', 'rosario.dale@innovateecommerce', 1189);
commit;
prompt 200 records committed...
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (201, 'Irene', 'Cobbs', 'i.cobbs@pepsico.com', 1190);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (202, 'Lea', 'Supernaw', 'lea.supernaw@shirtfactory.br', 1191);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (203, 'Selma', 'McCain', 's.mccain@ghrsystems.com', 1192);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (204, 'Vince', 'Hoffman', 'vince.hoffman@wav.com', 1193);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (205, 'William', 'Garza', 'williamg@comglobalsystems.it', 1194);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (206, 'Jean-Claude', 'Emmett', 'jemmett@entelligence.hu', 1195);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (207, 'Maury', 'Jolie', 'mjolie@medsource.com', 1196);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (208, 'Henry', 'Lillard', 'henry@capitalautomotive.com', 1197);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (209, 'Greg', 'Crystal', 'greg.crystal@electricalsolutio', 1198);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (210, 'Temuera', 'Buckingham', 'temuera.buckingham@supplycorec', 1199);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (211, 'Lara', 'Holeman', 'lara.h@baesch.jp', 1200);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (212, 'Gord', 'Hauer', 'gord@allegiantbancorp.com', 1201);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (213, 'Casey', 'Pullman', 'c.pullman@telepoint.com', 1202);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (214, 'Shannon', 'Noseworthy', 'shannon.noseworthy@gha.com', 1203);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (215, 'Dom', 'Ceasar', 'dom.c@comglobalsystems.dk', 1204);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (216, 'Nicholas', 'Rhames', 'nicholas.rhames@vspan.ch', 1205);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (217, 'Vertical', 'Stone', 'vertical@ghrsystems.il', 1206);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (218, 'Jody', 'Dench', 'jody.dench@curagroup.com', 1207);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (219, 'Christopher', 'Gaines', 'christopher@usainstruments.com', 1208);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (220, 'Lily', 'Dreyfuss', 'lily.d@mqsoftware.es', 1209);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (221, 'Vincent', 'Cochran', 'vincent@abatix.uk', 1210);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (222, 'Sylvester', 'Dempsey', 'sylvester.dempsey@americanheal', 1211);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (223, 'Holland', 'Johnson', 'holland.johnson@palmbeachtan.c', 1212);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (224, 'Joe', 'Orbit', 'joeo@diamondgroup.com', 1213);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (225, 'Kid', 'Krabbe', 'k.krabbe@aoltimewarner.jp', 1214);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (226, 'Ice', 'Dillane', 'ice.dillane@spinnakerexplorati', 1215);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (227, 'Claire', 'Bates', 'claire.bates@atxforms.com', 1216);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (228, 'Nils', 'Speaks', 'nilss@columbiabancorp.com', 1217);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (229, 'Brenda', 'Studi', 'brenda.studi@ubp.de', 1218);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (230, 'Mike', 'Zevon', 'mzevon@studiobproductions.com', 1219);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (231, 'Jude', 'Benson', 'jbenson@balchem.nl', 1220);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (232, 'Chet', 'Nicholas', 'chet@atxforms.it', 1221);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (233, 'Cate', 'Hornsby', 'cate.hornsby@elite.com', 1222);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (234, 'Chely', 'Laurie', 'c.laurie@americanhealthways.it', 1223);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (235, 'Frederic', 'Arthur', 'frederic@mls.de', 1224);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (236, 'Carrie', 'Greene', 'carrie@captechventures.uk', 1225);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (237, 'Michelle', 'Statham', 'michelle.statham@priorityleasi', 1226);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (238, 'Stellan', 'MacLachlan', 's.maclachlan@powerlight.nl', 1227);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (239, 'Robbie', 'Ratzenberger', 'robbie.r@atlanticnet.jp', 1228);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (240, 'Eliza', 'Swayze', 'eliza.s@travizon.com', 1229);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (241, 'Tim', 'Slater', 'tim@telesynthesis.uk', 1230);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (242, 'Stewart', 'Vance', 'stewart.vance@activeservices.d', 1231);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (243, 'Chubby', 'Swinton', 'chubby.swinton@marketbased.ch', 1232);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (244, 'Vondie', 'Borden', 'vondie@volkswagen.se', 1233);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (245, 'Victor', 'Kirshner', 'v.kirshner@topicsentertainment', 1234);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (246, 'Nick', 'Jackson', 'nickj@sms.de', 1235);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (247, 'Winona', 'Piven', 'winonap@atlanticnet.is', 1236);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (248, 'Uma', 'Farrow', 'ufarrow@ctg.com', 1237);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (249, 'Rueben', 'Parish', 'rueben.parish@bps.de', 1238);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (250, 'Samuel', 'Favreau', 'samuel.f@fns.com', 1239);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (251, 'Rosie', 'Pressly', 'rosie@pib.uk', 1240);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (252, 'Jackie', 'Lavigne', 'jackie@adeasolutions.com', 1241);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (253, 'Rutger', 'Eldard', 'rutger@travizon.jp', 1242);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (254, 'Raul', 'Hingle', 'raul.hingle@sis.uk', 1243);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (255, 'Queen', 'Blades', 'queen.blades@bradleypharmaceut', 1244);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (256, 'Judi', 'Hanley', 'judi.hanley@httprint.de', 1245);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (257, 'Karen', 'Voight', 'karen.v@walmartstores.de', 1246);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (258, 'Ellen', 'Rizzo', 'ellen.rizzo@harrison.com', 1247);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (259, 'Nelly', 'Ramirez', 'nellyr@bedfordbancshares.hk', 1248);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (260, 'Bernie', 'Channing', 'bernie.c@eagleone.uk', 1249);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (261, 'Sheena', 'Ball', 'sball@naturescure.de', 1250);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (262, 'Brad', 'Sirtis', 'brad.sirtis@pharmacia.com', 1251);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (263, 'Josh', 'Schneider', 'joshs@jlphor.com', 1252);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (264, 'CeCe', 'Cox', 'cece@viacom.com', 1253);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (265, 'Sharon', 'Field', 'sharonf@arkidata.ca', 1254);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (266, 'Rory', 'Cruz', 'rory.cruz@woronocobancorp.it', 1255);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (267, 'Viggo', 'Almond', 'viggo.a@saltgroup.de', 1256);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (268, 'Larenz', 'LaPaglia', 'larenz@swi.com', 1257);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (269, 'Lance', 'Hynde', 'lance@pds.com', 1258);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (270, 'Liquid', 'Turner', 'liquid.turner@philipmorris.jp', 1259);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (271, 'Raul', 'Assante', 'raul@trusecure.no', 1260);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (272, 'Mickey', 'Sirtis', 'mickey@zoneperfectnutrition.co', 1261);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (273, 'Glen', 'Gilley', 'glen.gilley@morganresearch.de', 1262);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (274, 'Howard', 'DiFranco', 'howard.difranco@qas.de', 1263);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (275, 'Lena', 'Chestnut', 'lenac@toyotamotor.com', 1264);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (276, 'Manu', 'Applegate', 'm.applegate@pis.de', 1265);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (277, 'Rascal', 'Carrere', 'rascalc@hps.uk', 1266);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (278, 'Tracy', 'McGowan', 'tracy.mcgowan@bioreference.com', 1267);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (279, 'Gloria', 'Mueller-Stahl', 'gloria@nlx.hk', 1268);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (280, 'Celia', 'Utada', 'celia@apexsystems.ca', 1269);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (281, 'Ron', 'Marin', 'ron.marin@owm.com', 1270);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (282, 'Glen', 'Serbedzija', 'glen.serbedzija@savela.com', 1271);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (283, 'Rick', 'Barkin', 'rick.barkin@securitycheck.de', 1272);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (284, 'Cornell', 'Duke', 'cornell.duke@fflcbancorp.es', 1273);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (285, 'Cameron', 'Head', 'cameron.head@mcdonalds.com', 1274);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (286, 'Natacha', 'Jeffreys', 'natacha.jeffreys@tigris.com', 1275);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (287, 'Victoria', 'Field', 'victoria.field@conquestsystems', 1276);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (288, 'Judy', 'Akins', 'judy@trekequipment.au', 1277);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (289, 'Sheena', 'McGregor', 'sheena.mcgregor@seiaarons.it', 1278);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (290, 'Alfie', 'Albright', 'alfie.albright@trm.uk', 1279);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (291, 'Connie', 'Sellers', 'connie.sellers@capellaeducatio', 1280);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (292, 'Roscoe', 'Haggard', 'roscoe.haggard@hondamotor.pt', 1281);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (293, 'Chuck', 'Hatchet', 'chuck.hatchet@flavorx.com', 1282);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (294, 'Cameron', 'Mueller-Stahl', 'cameron.muellerstahl@cardinalc', 1283);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (295, 'Wayne', 'Paltrow', 'waynep@surmodics.ca', 1284);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (296, 'Antonio', 'Evanswood', 'antonio.evanswood@ams.de', 1285);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (297, 'Bob', 'Willis', 'bwillis@swp.de', 1286);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (298, 'Hilton', 'Tah', 'hilton.tah@hatworld.com', 1287);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (299, 'Brian', 'Cromwell', 'brianc@kingland.ch', 1288);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (300, 'Famke', 'Oakenfold', 'famke.oakenfold@knightsbridge.', 1289);
commit;
prompt 300 records committed...
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (301, 'Ernest', 'Oates', 'ernest.oates@bristolmyers.ve', 1290);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (302, 'Malcolm', 'Hingle', 'malcolm.hingle@labradanutritio', 1291);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (303, 'Rosanna', 'Sayer', 'rosanna.sayer@aci.es', 1292);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (304, 'Susan', 'Cornell', 'susan@alogent.com', 1293);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (305, 'Tilda', 'Rhymes', 'tilda.rhymes@primussoftware.yu', 1294);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (306, 'Sheryl', 'Rourke', 'sheryl.r@keith.au', 1295);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (307, 'Debra', 'Hauer', 'd.hauer@sbc.de', 1296);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (308, 'Kristin', 'Zeta-Jones', 'kristin@parksite.com', 1297);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (309, 'Rachael', 'Young', 'ryoung@pioneerdatasystems.com', 1298);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (310, 'Geena', 'Ali', 'geena.a@diageo.com', 1299);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (311, 'Delroy', 'Francis', 'd.francis@chipssolutions.nl', 1300);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (312, 'Cloris', 'Ferry', 'cloris.ferry@keith.it', 1301);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (313, 'Wayne', 'Keitel', 'wayne.keitel@advancedneuromodu', 1302);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (314, 'Heather', 'English', 'heather.english@novartis.br', 1303);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (315, 'Noah', 'Postlethwaite', 'noahp@capital.com', 1304);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (316, 'Sara', 'Mewes', 'smewes@gagwear.pl', 1305);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (317, 'Janice', 'Almond', 'janice.almond@air.com', 1306);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (318, 'Lin', 'Sewell', 'lin.s@evergreenresources.com', 1307);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (319, 'Bill', 'Stevenson', 'bill@medsource.com', 1308);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (320, 'Ty', 'Rippy', 'ty.rippy@lfg.jp', 1309);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (321, 'Saul', 'Tippe', 'saul.t@asapstaffing.jp', 1310);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (322, 'Tim', 'Withers', 'tim.withers@carboceramics.de', 1311);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (323, 'Chloe', 'Aaron', 'c.aaron@onstaff.com', 1312);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (324, 'Ashton', 'Logue', 'alogue@terrafirma.com', 1313);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (325, 'Nina', 'Downie', 'ndownie@scheringplough.br', 1314);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (326, 'Vonda', 'Jolie', 'vonda.jolie@sps.it', 1315);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (327, 'Kirk', 'Bacharach', 'kirk.bacharach@acsis.hu', 1316);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (328, 'Chazz', 'Richardson', 'chazz.richardson@dynacqinterna', 1317);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (329, 'Chrissie', 'Pierce', 'chrissie.p@gra.ca', 1318);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (330, 'Kay', 'Finney', 'k.finney@bps.no', 1319);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (331, 'Geraldine', 'Rodriguez', 'geraldine.rodriguez@acsis.de', 1320);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (332, 'Hilton', 'Galecki', 'hilton.galecki@tama.com', 1321);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (333, 'Ice', 'Warwick', 'ice@colgatepalmolive.com', 1322);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (334, 'Sissy', 'Beckinsale', 'sissyb@netnumina.br', 1323);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (335, 'Sheena', 'Cash', 's.cash@sm.in', 1324);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (336, 'Humberto', 'Winter', 'humberto.w@maverick.com', 1325);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (337, 'Jean-Luc', 'Gooding', 'jeanluc.gooding@safeway.it', 1326);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (338, 'Faye', 'Bratt', 'faye.bratt@angieslist.com', 1327);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (339, 'Larenz', 'Gano', 'larenz.gano@smi.de', 1328);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (340, 'Micky', 'Margulies', 'micky.margulies@yes.se', 1329);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (341, 'Lea', 'Cotton', 'lea.cotton@sfb.com', 1330);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (342, 'Eugene', 'Wilder', 'e.wilder@creditorsinterchange.', 1331);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (343, 'Eliza', 'Tierney', 'eliza@interfacesoftware.uk', 1332);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (344, 'Isaac', 'Connelly', 'isaac.c@uem.es', 1333);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (345, 'Lupe', 'Liu', 'lupe.liu@priorityexpress.it', 1334);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (346, 'Charlton', 'Wood', 'charlton.wood@techrx.it', 1335);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (347, 'Candice', 'Place', 'cplace@3tsystems.jp', 1336);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (348, 'Joy', 'Tyson', 'joy.tyson@dillards.uk', 1337);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (349, 'Colm', 'Smith', 'c.smith@qls.br', 1338);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (350, 'Rowan', 'Osment', 'rowan.osment@elitemedical.com', 1339);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (351, 'Penelope', 'Paquin', 'penelope.paquin@marlabs.de', 1340);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (352, 'Buddy', 'Duke', 'buddy@mwp.ca', 1341);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (353, 'Carole', 'Valentin', 'carole.valentin@kingland.it', 1342);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (354, 'King', 'Tucker', 'king.tucker@aoltimewarner.mx', 1343);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (355, 'Isaiah', 'Sandoval', 'isaiah.sandoval@printingforles', 1344);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (356, 'James', 'Iglesias', 'james.iglesias@lfg.ca', 1345);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (357, 'Susan', 'Salonga', 'susans@networkdisplay.com', 1346);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (358, 'Carlos', 'Weaver', 'carlos@nexxtworks.br', 1347);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (359, 'Joanna', 'Milsap', 'j.milsap@pis.com', 1348);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (360, 'Gordon', 'Hiatt', 'gordon.hiatt@coridiantechnolog', 1349);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (361, 'Samantha', 'Gugino', 'samantha@fordmotor.br', 1350);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (362, 'Cyndi', 'Begley', 'cbegley@visainternational.com', 1351);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (363, 'Sam', 'Bacharach', 'samb@ssci.com', 1352);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (364, 'Dom', 'Gibson', 'dom.gibson@qestrel.com', 1353);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (365, 'Rich', 'Sharp', 'rich.sharp@abatix.com', 1354);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (366, 'Lorraine', 'Dourif', 'lorraine@zaiqtechnologies.com', 1355);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (367, 'Yolanda', 'Russo', 'yrusso@safehomesecurity.cz', 1356);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (368, 'Murray', 'Latifah', 'murrayl@uem.jp', 1357);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (369, 'Kyra', 'Lucas', 'kyra.lucas@hcoa.uk', 1358);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (370, 'Leo', 'Kapanka', 'leo.kapanka@qestrel.uk', 1359);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (371, 'Elvis', 'Matheson', 'elvis@swp.com', 1360);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (372, 'Gladys', 'Carmen', 'gladys@denaliventures.com', 1361);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (373, 'Thin', 'Holbrook', 't.holbrook@technica.ca', 1362);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (374, 'Shelby', 'Shatner', 'shelby.shatner@americanmegacom', 1363);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (375, 'Chris', 'Streep', 'chris.s@allstar.no', 1364);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (376, 'Brad', 'Begley', 'brad.begley@campbellsoup.com', 1365);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (377, 'Udo', 'Winslet', 'udo.w@tilsonlandscape.com', 1366);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (378, 'Julianna', 'Cole', 'julianna.cole@bluffcitysteel.c', 1367);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (379, 'Anjelica', 'Franks', 'anjelica.franks@priorityexpres', 1368);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (380, 'Sean', 'Murphy', 's.murphy@ssci.com', 1369);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (381, 'Ronnie', 'Favreau', 'r.favreau@trainersoft.com', 1370);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (382, 'Jodie', 'Theron', 'j.theron@glacierbancorp.com', 1371);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (383, 'Judy', 'Haysbert', 'judy@nhhc.com', 1372);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (384, 'Colleen', 'Beals', 'colleen.beals@monitronicsinter', 1373);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (385, 'Marty', 'Ingram', 'marty@abatix.com', 1374);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (386, 'Mel', 'Lawrence', 'mel.lawrence@limitedbrands.se', 1375);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (387, 'Christine', 'Conners', 'christine.conners@smartronix.c', 1376);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (388, 'Amanda', 'Valentin', 'amanda.valentin@authoria.com', 1377);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (389, 'Trey', 'Harrelson', 'trey.harrelson@authoria.br', 1378);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (390, 'Jane', 'Weber', 'j.weber@operationaltechnologie', 1379);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (391, 'Bryan', 'Idle', 'bryan.idle@ccb.pl', 1380);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (392, 'Bobby', 'Jane', 'bobby@aco.br', 1381);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (393, 'Hugh', 'Torino', 'hugh.torino@jma.se', 1382);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (394, 'Michael', 'Wilson', 'michael@bluffcitysteel.gr', 1383);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (395, 'Rupert', 'Heald', 'ruperth@telesynthesis.ch', 1384);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (396, 'Sheena', 'Pleasence', 'sheena.pleasence@alohanysystem', 1385);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (397, 'Clay', 'Crystal', 'ccrystal@neogen.it', 1386);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (398, 'Jeffery', 'Caldwell', 'jeffery.c@nha.de', 1387);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (399, 'Nelly', 'Farrow', 'nelly.farrow@mindiq.com', 1388);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (400, 'Al', 'McElhone', 'al.mcelhone@hencie.com', 1389);
commit;
prompt 400 records committed...
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (401, 'Neve', 'Lillard', 'neve@wyeth.uk', 1390);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (402, 'Wes', 'Colman', 'wes.colman@avr.jp', 1391);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (403, 'Oded', 'Mueller-Stahl', 'oded.muellerstahl@bigyanksport', 1392);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (404, 'Lorraine', 'LaMond', 'lorrainel@visainternational.se', 1393);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (405, 'Freda', 'Carr', 'fredac@cns.de', 1394);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (406, 'Dionne', 'Harary', 'dionne.harary@ufs.com', 1395);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (407, 'Terrence', 'Midler', 'terrence.midler@tmt.my', 1396);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (408, 'Scarlett', 'O''Donnell', 'scarlett.odonnell@hencie.uk', 1397);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (409, 'Randall', 'Koyana', 'randall.koyana@operationaltech', 1398);
insert into PARTICIPANTS (participantid, firstname, lastname, email, clubmember)
values (410, 'Denis', 'Rock', 'denis.rock@swp.com', 1399);
commit;
prompt 410 records loaded
prompt Loading MAKEORDER...
insert into MAKEORDER (participantid, orderid)
values (1, 1);
insert into MAKEORDER (participantid, orderid)
values (2, 2);
insert into MAKEORDER (participantid, orderid)
values (3, 3);
insert into MAKEORDER (participantid, orderid)
values (4, 4);
insert into MAKEORDER (participantid, orderid)
values (5, 5);
insert into MAKEORDER (participantid, orderid)
values (6, 6);
insert into MAKEORDER (participantid, orderid)
values (7, 7);
insert into MAKEORDER (participantid, orderid)
values (8, 8);
insert into MAKEORDER (participantid, orderid)
values (9, 9);
insert into MAKEORDER (participantid, orderid)
values (10, 10);
insert into MAKEORDER (participantid, orderid)
values (346, 359);
insert into MAKEORDER (participantid, orderid)
values (49, 63);
insert into MAKEORDER (participantid, orderid)
values (48, 350);
insert into MAKEORDER (participantid, orderid)
values (404, 197);
insert into MAKEORDER (participantid, orderid)
values (114, 332);
insert into MAKEORDER (participantid, orderid)
values (38, 198);
insert into MAKEORDER (participantid, orderid)
values (379, 360);
insert into MAKEORDER (participantid, orderid)
values (369, 113);
insert into MAKEORDER (participantid, orderid)
values (243, 110);
insert into MAKEORDER (participantid, orderid)
values (333, 102);
insert into MAKEORDER (participantid, orderid)
values (318, 381);
insert into MAKEORDER (participantid, orderid)
values (331, 149);
insert into MAKEORDER (participantid, orderid)
values (148, 202);
insert into MAKEORDER (participantid, orderid)
values (289, 281);
insert into MAKEORDER (participantid, orderid)
values (97, 387);
insert into MAKEORDER (participantid, orderid)
values (362, 52);
insert into MAKEORDER (participantid, orderid)
values (387, 232);
insert into MAKEORDER (participantid, orderid)
values (191, 263);
insert into MAKEORDER (participantid, orderid)
values (227, 20);
insert into MAKEORDER (participantid, orderid)
values (133, 138);
insert into MAKEORDER (participantid, orderid)
values (86, 359);
insert into MAKEORDER (participantid, orderid)
values (156, 108);
insert into MAKEORDER (participantid, orderid)
values (406, 127);
insert into MAKEORDER (participantid, orderid)
values (31, 348);
insert into MAKEORDER (participantid, orderid)
values (10, 265);
insert into MAKEORDER (participantid, orderid)
values (401, 90);
insert into MAKEORDER (participantid, orderid)
values (3, 221);
insert into MAKEORDER (participantid, orderid)
values (368, 360);
insert into MAKEORDER (participantid, orderid)
values (238, 219);
insert into MAKEORDER (participantid, orderid)
values (406, 205);
insert into MAKEORDER (participantid, orderid)
values (89, 71);
insert into MAKEORDER (participantid, orderid)
values (294, 332);
insert into MAKEORDER (participantid, orderid)
values (216, 111);
insert into MAKEORDER (participantid, orderid)
values (255, 316);
insert into MAKEORDER (participantid, orderid)
values (77, 86);
insert into MAKEORDER (participantid, orderid)
values (129, 246);
insert into MAKEORDER (participantid, orderid)
values (370, 161);
insert into MAKEORDER (participantid, orderid)
values (54, 122);
insert into MAKEORDER (participantid, orderid)
values (15, 80);
insert into MAKEORDER (participantid, orderid)
values (129, 297);
insert into MAKEORDER (participantid, orderid)
values (371, 4);
insert into MAKEORDER (participantid, orderid)
values (302, 174);
insert into MAKEORDER (participantid, orderid)
values (343, 121);
insert into MAKEORDER (participantid, orderid)
values (197, 283);
insert into MAKEORDER (participantid, orderid)
values (186, 269);
insert into MAKEORDER (participantid, orderid)
values (332, 252);
insert into MAKEORDER (participantid, orderid)
values (348, 170);
insert into MAKEORDER (participantid, orderid)
values (138, 44);
insert into MAKEORDER (participantid, orderid)
values (232, 77);
insert into MAKEORDER (participantid, orderid)
values (171, 31);
insert into MAKEORDER (participantid, orderid)
values (229, 159);
insert into MAKEORDER (participantid, orderid)
values (40, 138);
insert into MAKEORDER (participantid, orderid)
values (230, 307);
insert into MAKEORDER (participantid, orderid)
values (55, 371);
insert into MAKEORDER (participantid, orderid)
values (214, 88);
insert into MAKEORDER (participantid, orderid)
values (368, 283);
insert into MAKEORDER (participantid, orderid)
values (21, 332);
insert into MAKEORDER (participantid, orderid)
values (83, 344);
insert into MAKEORDER (participantid, orderid)
values (11, 156);
insert into MAKEORDER (participantid, orderid)
values (147, 75);
insert into MAKEORDER (participantid, orderid)
values (320, 103);
insert into MAKEORDER (participantid, orderid)
values (406, 223);
insert into MAKEORDER (participantid, orderid)
values (235, 95);
insert into MAKEORDER (participantid, orderid)
values (181, 359);
insert into MAKEORDER (participantid, orderid)
values (95, 213);
insert into MAKEORDER (participantid, orderid)
values (312, 195);
insert into MAKEORDER (participantid, orderid)
values (63, 164);
insert into MAKEORDER (participantid, orderid)
values (260, 308);
insert into MAKEORDER (participantid, orderid)
values (36, 345);
insert into MAKEORDER (participantid, orderid)
values (308, 118);
insert into MAKEORDER (participantid, orderid)
values (148, 129);
insert into MAKEORDER (participantid, orderid)
values (179, 70);
insert into MAKEORDER (participantid, orderid)
values (198, 209);
insert into MAKEORDER (participantid, orderid)
values (237, 341);
insert into MAKEORDER (participantid, orderid)
values (120, 307);
insert into MAKEORDER (participantid, orderid)
values (66, 363);
insert into MAKEORDER (participantid, orderid)
values (28, 92);
insert into MAKEORDER (participantid, orderid)
values (385, 283);
insert into MAKEORDER (participantid, orderid)
values (113, 185);
insert into MAKEORDER (participantid, orderid)
values (23, 253);
insert into MAKEORDER (participantid, orderid)
values (365, 200);
insert into MAKEORDER (participantid, orderid)
values (264, 116);
insert into MAKEORDER (participantid, orderid)
values (170, 342);
insert into MAKEORDER (participantid, orderid)
values (297, 78);
insert into MAKEORDER (participantid, orderid)
values (38, 34);
insert into MAKEORDER (participantid, orderid)
values (382, 225);
insert into MAKEORDER (participantid, orderid)
values (378, 291);
insert into MAKEORDER (participantid, orderid)
values (356, 98);
insert into MAKEORDER (participantid, orderid)
values (172, 242);
insert into MAKEORDER (participantid, orderid)
values (57, 67);
commit;
prompt 100 records committed...
insert into MAKEORDER (participantid, orderid)
values (124, 47);
insert into MAKEORDER (participantid, orderid)
values (143, 191);
insert into MAKEORDER (participantid, orderid)
values (215, 409);
insert into MAKEORDER (participantid, orderid)
values (262, 142);
insert into MAKEORDER (participantid, orderid)
values (126, 71);
insert into MAKEORDER (participantid, orderid)
values (218, 193);
insert into MAKEORDER (participantid, orderid)
values (47, 137);
insert into MAKEORDER (participantid, orderid)
values (52, 85);
insert into MAKEORDER (participantid, orderid)
values (301, 14);
insert into MAKEORDER (participantid, orderid)
values (404, 59);
insert into MAKEORDER (participantid, orderid)
values (364, 165);
insert into MAKEORDER (participantid, orderid)
values (81, 277);
insert into MAKEORDER (participantid, orderid)
values (11, 360);
insert into MAKEORDER (participantid, orderid)
values (190, 248);
insert into MAKEORDER (participantid, orderid)
values (116, 225);
insert into MAKEORDER (participantid, orderid)
values (98, 403);
insert into MAKEORDER (participantid, orderid)
values (278, 394);
insert into MAKEORDER (participantid, orderid)
values (84, 299);
insert into MAKEORDER (participantid, orderid)
values (26, 209);
insert into MAKEORDER (participantid, orderid)
values (267, 285);
insert into MAKEORDER (participantid, orderid)
values (189, 310);
insert into MAKEORDER (participantid, orderid)
values (225, 89);
insert into MAKEORDER (participantid, orderid)
values (280, 128);
insert into MAKEORDER (participantid, orderid)
values (147, 138);
insert into MAKEORDER (participantid, orderid)
values (191, 49);
insert into MAKEORDER (participantid, orderid)
values (358, 96);
insert into MAKEORDER (participantid, orderid)
values (198, 102);
insert into MAKEORDER (participantid, orderid)
values (266, 225);
insert into MAKEORDER (participantid, orderid)
values (389, 231);
insert into MAKEORDER (participantid, orderid)
values (334, 252);
insert into MAKEORDER (participantid, orderid)
values (289, 367);
insert into MAKEORDER (participantid, orderid)
values (128, 339);
insert into MAKEORDER (participantid, orderid)
values (407, 220);
insert into MAKEORDER (participantid, orderid)
values (347, 255);
insert into MAKEORDER (participantid, orderid)
values (124, 86);
insert into MAKEORDER (participantid, orderid)
values (48, 334);
insert into MAKEORDER (participantid, orderid)
values (405, 339);
insert into MAKEORDER (participantid, orderid)
values (50, 112);
insert into MAKEORDER (participantid, orderid)
values (234, 282);
insert into MAKEORDER (participantid, orderid)
values (229, 66);
insert into MAKEORDER (participantid, orderid)
values (371, 398);
insert into MAKEORDER (participantid, orderid)
values (271, 96);
insert into MAKEORDER (participantid, orderid)
values (245, 237);
insert into MAKEORDER (participantid, orderid)
values (395, 385);
insert into MAKEORDER (participantid, orderid)
values (169, 317);
insert into MAKEORDER (participantid, orderid)
values (347, 109);
insert into MAKEORDER (participantid, orderid)
values (210, 64);
insert into MAKEORDER (participantid, orderid)
values (357, 259);
insert into MAKEORDER (participantid, orderid)
values (318, 350);
insert into MAKEORDER (participantid, orderid)
values (88, 97);
insert into MAKEORDER (participantid, orderid)
values (228, 29);
insert into MAKEORDER (participantid, orderid)
values (309, 275);
insert into MAKEORDER (participantid, orderid)
values (242, 114);
insert into MAKEORDER (participantid, orderid)
values (238, 289);
insert into MAKEORDER (participantid, orderid)
values (395, 308);
insert into MAKEORDER (participantid, orderid)
values (12, 227);
insert into MAKEORDER (participantid, orderid)
values (126, 95);
insert into MAKEORDER (participantid, orderid)
values (188, 21);
insert into MAKEORDER (participantid, orderid)
values (268, 357);
insert into MAKEORDER (participantid, orderid)
values (164, 207);
insert into MAKEORDER (participantid, orderid)
values (246, 322);
insert into MAKEORDER (participantid, orderid)
values (332, 76);
insert into MAKEORDER (participantid, orderid)
values (304, 358);
insert into MAKEORDER (participantid, orderid)
values (206, 292);
insert into MAKEORDER (participantid, orderid)
values (208, 284);
insert into MAKEORDER (participantid, orderid)
values (34, 329);
insert into MAKEORDER (participantid, orderid)
values (348, 235);
insert into MAKEORDER (participantid, orderid)
values (351, 48);
insert into MAKEORDER (participantid, orderid)
values (175, 110);
insert into MAKEORDER (participantid, orderid)
values (245, 87);
insert into MAKEORDER (participantid, orderid)
values (100, 327);
insert into MAKEORDER (participantid, orderid)
values (60, 321);
insert into MAKEORDER (participantid, orderid)
values (362, 130);
insert into MAKEORDER (participantid, orderid)
values (83, 302);
insert into MAKEORDER (participantid, orderid)
values (317, 48);
insert into MAKEORDER (participantid, orderid)
values (326, 328);
insert into MAKEORDER (participantid, orderid)
values (59, 58);
insert into MAKEORDER (participantid, orderid)
values (115, 265);
insert into MAKEORDER (participantid, orderid)
values (257, 250);
insert into MAKEORDER (participantid, orderid)
values (359, 321);
insert into MAKEORDER (participantid, orderid)
values (255, 246);
insert into MAKEORDER (participantid, orderid)
values (20, 281);
insert into MAKEORDER (participantid, orderid)
values (372, 295);
insert into MAKEORDER (participantid, orderid)
values (124, 371);
insert into MAKEORDER (participantid, orderid)
values (43, 91);
insert into MAKEORDER (participantid, orderid)
values (66, 57);
insert into MAKEORDER (participantid, orderid)
values (410, 60);
insert into MAKEORDER (participantid, orderid)
values (150, 207);
insert into MAKEORDER (participantid, orderid)
values (324, 165);
insert into MAKEORDER (participantid, orderid)
values (267, 197);
insert into MAKEORDER (participantid, orderid)
values (320, 338);
insert into MAKEORDER (participantid, orderid)
values (230, 110);
insert into MAKEORDER (participantid, orderid)
values (54, 265);
insert into MAKEORDER (participantid, orderid)
values (71, 231);
insert into MAKEORDER (participantid, orderid)
values (250, 384);
insert into MAKEORDER (participantid, orderid)
values (301, 389);
insert into MAKEORDER (participantid, orderid)
values (208, 361);
insert into MAKEORDER (participantid, orderid)
values (220, 164);
insert into MAKEORDER (participantid, orderid)
values (63, 10);
insert into MAKEORDER (participantid, orderid)
values (223, 273);
commit;
prompt 200 records committed...
insert into MAKEORDER (participantid, orderid)
values (284, 339);
insert into MAKEORDER (participantid, orderid)
values (243, 191);
insert into MAKEORDER (participantid, orderid)
values (10, 53);
insert into MAKEORDER (participantid, orderid)
values (93, 314);
insert into MAKEORDER (participantid, orderid)
values (58, 176);
insert into MAKEORDER (participantid, orderid)
values (164, 250);
insert into MAKEORDER (participantid, orderid)
values (85, 6);
insert into MAKEORDER (participantid, orderid)
values (283, 98);
insert into MAKEORDER (participantid, orderid)
values (41, 152);
insert into MAKEORDER (participantid, orderid)
values (294, 201);
insert into MAKEORDER (participantid, orderid)
values (136, 182);
insert into MAKEORDER (participantid, orderid)
values (370, 286);
insert into MAKEORDER (participantid, orderid)
values (205, 252);
insert into MAKEORDER (participantid, orderid)
values (330, 244);
insert into MAKEORDER (participantid, orderid)
values (298, 213);
insert into MAKEORDER (participantid, orderid)
values (249, 382);
insert into MAKEORDER (participantid, orderid)
values (287, 15);
insert into MAKEORDER (participantid, orderid)
values (224, 336);
insert into MAKEORDER (participantid, orderid)
values (128, 39);
insert into MAKEORDER (participantid, orderid)
values (138, 3);
insert into MAKEORDER (participantid, orderid)
values (3, 46);
insert into MAKEORDER (participantid, orderid)
values (355, 246);
insert into MAKEORDER (participantid, orderid)
values (118, 95);
insert into MAKEORDER (participantid, orderid)
values (307, 384);
insert into MAKEORDER (participantid, orderid)
values (18, 269);
insert into MAKEORDER (participantid, orderid)
values (197, 254);
insert into MAKEORDER (participantid, orderid)
values (262, 302);
insert into MAKEORDER (participantid, orderid)
values (116, 377);
insert into MAKEORDER (participantid, orderid)
values (368, 264);
insert into MAKEORDER (participantid, orderid)
values (385, 27);
insert into MAKEORDER (participantid, orderid)
values (186, 308);
insert into MAKEORDER (participantid, orderid)
values (44, 50);
insert into MAKEORDER (participantid, orderid)
values (40, 32);
insert into MAKEORDER (participantid, orderid)
values (409, 190);
insert into MAKEORDER (participantid, orderid)
values (24, 165);
insert into MAKEORDER (participantid, orderid)
values (159, 23);
insert into MAKEORDER (participantid, orderid)
values (166, 378);
insert into MAKEORDER (participantid, orderid)
values (123, 26);
insert into MAKEORDER (participantid, orderid)
values (392, 215);
insert into MAKEORDER (participantid, orderid)
values (365, 196);
insert into MAKEORDER (participantid, orderid)
values (168, 42);
insert into MAKEORDER (participantid, orderid)
values (144, 322);
insert into MAKEORDER (participantid, orderid)
values (239, 179);
insert into MAKEORDER (participantid, orderid)
values (351, 362);
insert into MAKEORDER (participantid, orderid)
values (387, 236);
insert into MAKEORDER (participantid, orderid)
values (346, 303);
insert into MAKEORDER (participantid, orderid)
values (360, 320);
insert into MAKEORDER (participantid, orderid)
values (92, 224);
insert into MAKEORDER (participantid, orderid)
values (127, 176);
insert into MAKEORDER (participantid, orderid)
values (104, 124);
insert into MAKEORDER (participantid, orderid)
values (274, 178);
insert into MAKEORDER (participantid, orderid)
values (62, 54);
insert into MAKEORDER (participantid, orderid)
values (126, 40);
insert into MAKEORDER (participantid, orderid)
values (316, 308);
insert into MAKEORDER (participantid, orderid)
values (349, 192);
insert into MAKEORDER (participantid, orderid)
values (343, 354);
insert into MAKEORDER (participantid, orderid)
values (38, 238);
insert into MAKEORDER (participantid, orderid)
values (227, 191);
insert into MAKEORDER (participantid, orderid)
values (169, 74);
insert into MAKEORDER (participantid, orderid)
values (278, 104);
insert into MAKEORDER (participantid, orderid)
values (345, 320);
insert into MAKEORDER (participantid, orderid)
values (109, 285);
insert into MAKEORDER (participantid, orderid)
values (97, 77);
insert into MAKEORDER (participantid, orderid)
values (299, 165);
insert into MAKEORDER (participantid, orderid)
values (86, 348);
insert into MAKEORDER (participantid, orderid)
values (388, 362);
insert into MAKEORDER (participantid, orderid)
values (303, 239);
insert into MAKEORDER (participantid, orderid)
values (193, 347);
insert into MAKEORDER (participantid, orderid)
values (263, 265);
insert into MAKEORDER (participantid, orderid)
values (77, 228);
insert into MAKEORDER (participantid, orderid)
values (129, 59);
insert into MAKEORDER (participantid, orderid)
values (365, 407);
insert into MAKEORDER (participantid, orderid)
values (184, 93);
insert into MAKEORDER (participantid, orderid)
values (260, 317);
insert into MAKEORDER (participantid, orderid)
values (240, 254);
insert into MAKEORDER (participantid, orderid)
values (363, 37);
insert into MAKEORDER (participantid, orderid)
values (303, 163);
insert into MAKEORDER (participantid, orderid)
values (315, 58);
insert into MAKEORDER (participantid, orderid)
values (194, 27);
insert into MAKEORDER (participantid, orderid)
values (395, 320);
insert into MAKEORDER (participantid, orderid)
values (53, 144);
insert into MAKEORDER (participantid, orderid)
values (16, 160);
insert into MAKEORDER (participantid, orderid)
values (35, 107);
insert into MAKEORDER (participantid, orderid)
values (113, 81);
insert into MAKEORDER (participantid, orderid)
values (117, 140);
insert into MAKEORDER (participantid, orderid)
values (116, 211);
insert into MAKEORDER (participantid, orderid)
values (162, 64);
insert into MAKEORDER (participantid, orderid)
values (385, 266);
insert into MAKEORDER (participantid, orderid)
values (115, 179);
insert into MAKEORDER (participantid, orderid)
values (192, 192);
insert into MAKEORDER (participantid, orderid)
values (312, 173);
insert into MAKEORDER (participantid, orderid)
values (284, 344);
insert into MAKEORDER (participantid, orderid)
values (305, 136);
insert into MAKEORDER (participantid, orderid)
values (307, 179);
insert into MAKEORDER (participantid, orderid)
values (98, 10);
insert into MAKEORDER (participantid, orderid)
values (347, 273);
insert into MAKEORDER (participantid, orderid)
values (346, 89);
insert into MAKEORDER (participantid, orderid)
values (337, 268);
insert into MAKEORDER (participantid, orderid)
values (292, 365);
insert into MAKEORDER (participantid, orderid)
values (232, 238);
commit;
prompt 300 records committed...
insert into MAKEORDER (participantid, orderid)
values (30, 293);
insert into MAKEORDER (participantid, orderid)
values (251, 328);
insert into MAKEORDER (participantid, orderid)
values (343, 255);
insert into MAKEORDER (participantid, orderid)
values (180, 209);
insert into MAKEORDER (participantid, orderid)
values (347, 361);
insert into MAKEORDER (participantid, orderid)
values (107, 388);
insert into MAKEORDER (participantid, orderid)
values (327, 111);
insert into MAKEORDER (participantid, orderid)
values (160, 136);
insert into MAKEORDER (participantid, orderid)
values (376, 104);
insert into MAKEORDER (participantid, orderid)
values (177, 30);
insert into MAKEORDER (participantid, orderid)
values (360, 77);
insert into MAKEORDER (participantid, orderid)
values (361, 380);
insert into MAKEORDER (participantid, orderid)
values (244, 410);
insert into MAKEORDER (participantid, orderid)
values (375, 57);
insert into MAKEORDER (participantid, orderid)
values (341, 376);
insert into MAKEORDER (participantid, orderid)
values (173, 318);
insert into MAKEORDER (participantid, orderid)
values (324, 31);
insert into MAKEORDER (participantid, orderid)
values (232, 298);
insert into MAKEORDER (participantid, orderid)
values (38, 71);
insert into MAKEORDER (participantid, orderid)
values (176, 59);
insert into MAKEORDER (participantid, orderid)
values (352, 199);
insert into MAKEORDER (participantid, orderid)
values (224, 101);
insert into MAKEORDER (participantid, orderid)
values (313, 356);
insert into MAKEORDER (participantid, orderid)
values (145, 329);
insert into MAKEORDER (participantid, orderid)
values (110, 246);
insert into MAKEORDER (participantid, orderid)
values (356, 282);
insert into MAKEORDER (participantid, orderid)
values (183, 80);
insert into MAKEORDER (participantid, orderid)
values (57, 134);
insert into MAKEORDER (participantid, orderid)
values (27, 210);
insert into MAKEORDER (participantid, orderid)
values (108, 391);
insert into MAKEORDER (participantid, orderid)
values (355, 325);
insert into MAKEORDER (participantid, orderid)
values (3, 391);
insert into MAKEORDER (participantid, orderid)
values (71, 199);
insert into MAKEORDER (participantid, orderid)
values (148, 309);
insert into MAKEORDER (participantid, orderid)
values (131, 393);
insert into MAKEORDER (participantid, orderid)
values (217, 2);
insert into MAKEORDER (participantid, orderid)
values (198, 186);
insert into MAKEORDER (participantid, orderid)
values (75, 19);
insert into MAKEORDER (participantid, orderid)
values (379, 379);
insert into MAKEORDER (participantid, orderid)
values (11, 354);
insert into MAKEORDER (participantid, orderid)
values (313, 233);
insert into MAKEORDER (participantid, orderid)
values (385, 23);
insert into MAKEORDER (participantid, orderid)
values (287, 83);
insert into MAKEORDER (participantid, orderid)
values (115, 213);
insert into MAKEORDER (participantid, orderid)
values (164, 341);
insert into MAKEORDER (participantid, orderid)
values (58, 348);
insert into MAKEORDER (participantid, orderid)
values (176, 407);
insert into MAKEORDER (participantid, orderid)
values (228, 280);
insert into MAKEORDER (participantid, orderid)
values (376, 321);
insert into MAKEORDER (participantid, orderid)
values (17, 195);
insert into MAKEORDER (participantid, orderid)
values (152, 262);
insert into MAKEORDER (participantid, orderid)
values (381, 183);
insert into MAKEORDER (participantid, orderid)
values (136, 100);
insert into MAKEORDER (participantid, orderid)
values (148, 273);
insert into MAKEORDER (participantid, orderid)
values (309, 70);
insert into MAKEORDER (participantid, orderid)
values (384, 216);
insert into MAKEORDER (participantid, orderid)
values (132, 52);
insert into MAKEORDER (participantid, orderid)
values (144, 39);
insert into MAKEORDER (participantid, orderid)
values (40, 363);
insert into MAKEORDER (participantid, orderid)
values (221, 20);
insert into MAKEORDER (participantid, orderid)
values (78, 126);
insert into MAKEORDER (participantid, orderid)
values (63, 87);
insert into MAKEORDER (participantid, orderid)
values (143, 2);
insert into MAKEORDER (participantid, orderid)
values (159, 374);
insert into MAKEORDER (participantid, orderid)
values (272, 233);
insert into MAKEORDER (participantid, orderid)
values (196, 258);
insert into MAKEORDER (participantid, orderid)
values (333, 164);
insert into MAKEORDER (participantid, orderid)
values (166, 289);
insert into MAKEORDER (participantid, orderid)
values (197, 241);
insert into MAKEORDER (participantid, orderid)
values (245, 26);
insert into MAKEORDER (participantid, orderid)
values (379, 146);
insert into MAKEORDER (participantid, orderid)
values (284, 78);
insert into MAKEORDER (participantid, orderid)
values (333, 3);
insert into MAKEORDER (participantid, orderid)
values (264, 354);
insert into MAKEORDER (participantid, orderid)
values (330, 175);
insert into MAKEORDER (participantid, orderid)
values (298, 143);
insert into MAKEORDER (participantid, orderid)
values (199, 225);
insert into MAKEORDER (participantid, orderid)
values (94, 31);
insert into MAKEORDER (participantid, orderid)
values (264, 137);
insert into MAKEORDER (participantid, orderid)
values (366, 405);
insert into MAKEORDER (participantid, orderid)
values (5, 83);
insert into MAKEORDER (participantid, orderid)
values (153, 37);
insert into MAKEORDER (participantid, orderid)
values (371, 382);
insert into MAKEORDER (participantid, orderid)
values (126, 373);
insert into MAKEORDER (participantid, orderid)
values (185, 195);
insert into MAKEORDER (participantid, orderid)
values (302, 344);
insert into MAKEORDER (participantid, orderid)
values (128, 98);
insert into MAKEORDER (participantid, orderid)
values (398, 264);
insert into MAKEORDER (participantid, orderid)
values (26, 290);
insert into MAKEORDER (participantid, orderid)
values (74, 228);
insert into MAKEORDER (participantid, orderid)
values (280, 219);
insert into MAKEORDER (participantid, orderid)
values (95, 305);
insert into MAKEORDER (participantid, orderid)
values (321, 177);
insert into MAKEORDER (participantid, orderid)
values (258, 44);
insert into MAKEORDER (participantid, orderid)
values (226, 204);
insert into MAKEORDER (participantid, orderid)
values (223, 265);
insert into MAKEORDER (participantid, orderid)
values (211, 335);
insert into MAKEORDER (participantid, orderid)
values (104, 362);
insert into MAKEORDER (participantid, orderid)
values (253, 183);
insert into MAKEORDER (participantid, orderid)
values (231, 34);
commit;
prompt 400 records committed...
insert into MAKEORDER (participantid, orderid)
values (91, 70);
insert into MAKEORDER (participantid, orderid)
values (390, 97);
insert into MAKEORDER (participantid, orderid)
values (410, 246);
insert into MAKEORDER (participantid, orderid)
values (221, 28);
insert into MAKEORDER (participantid, orderid)
values (348, 202);
insert into MAKEORDER (participantid, orderid)
values (62, 211);
insert into MAKEORDER (participantid, orderid)
values (123, 173);
insert into MAKEORDER (participantid, orderid)
values (10, 186);
insert into MAKEORDER (participantid, orderid)
values (16, 41);
insert into MAKEORDER (participantid, orderid)
values (386, 255);
commit;
prompt 410 records loaded
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C009265;
alter table EVENT enable constraint SYS_C009266;
alter table EVENT enable constraint SYS_C009267;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C009274;
prompt Enabling foreign key constraints for MAKEORDER...
alter table MAKEORDER enable constraint SYS_C009278;
alter table MAKEORDER enable constraint SYS_C009279;
prompt Enabling triggers for EVENTTYPE...
alter table EVENTTYPE enable all triggers;
prompt Enabling triggers for LOCATIONS...
alter table LOCATIONS enable all triggers;
prompt Enabling triggers for ORGANIZER...
alter table ORGANIZER enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for PARTICIPANTS...
alter table PARTICIPANTS enable all triggers;
prompt Enabling triggers for MAKEORDER...
alter table MAKEORDER enable all triggers;
set feedback on
set define on
prompt Done.
