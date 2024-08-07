?��prompt PL/SQL Developer Export Tables for user SIVAN@XE
prompt Created by owner on יום שני 01 יולי 2024
set feedback off
set define off

prompt Creating TAX_ACCOUNT...
create table TAX_ACCOUNT
(
  tax_id     NUMBER(15) not null,
  tax_price  NUMBER(15) not null,
  tax_create DATE not null,
  tax_close  DATE
)
;
alter table TAX_ACCOUNT
  add primary key (TAX_ID)
  ;

prompt Creating ASSET...
create table ASSET
(
  asset_id       NUMBER(15) not null,
  asset_address  VARCHAR2(30) not null,
  asset_type     VARCHAR2(20) not null,
  asset_area     NUMBER(20) not null,
  asset_purchase DATE not null,
  asset_change   DATE,
  tax_id         NUMBER(15) not null,
  bonus          NUMBER(20)
)
;
alter table ASSET
  add primary key (ASSET_ID)
  ;
alter table ASSET
  add foreign key (TAX_ID)
  references TAX_ACCOUNT (TAX_ID);

prompt Creating DEBT...
create table DEBT
(
  debt_id        NUMBER(15) not null,
  debt_price     NUMBER(15) not null,
  debt_create    DATE not null,
  debt_last_date DATE not null,
  tax_id         NUMBER(15) not null
)
;
alter table DEBT
  add primary key (DEBT_ID, TAX_ID)
  ;
alter table DEBT
  add foreign key (TAX_ID)
  references TAX_ACCOUNT (TAX_ID);

prompt Creating RESIDENT...
create table RESIDENT
(
  resident_id      NUMBER(9) not null,
  resident_fname   VARCHAR2(16) not null,
  resident_lname   VARCHAR2(16) not null,
  resident_birth   DATE not null,
  resident_address VARCHAR2(30) not null,
  resident_phone   NUMBER(10) not null,
  resident_joining DATE not null
)
;
alter table RESIDENT
  add primary key (RESIDENT_ID)
  ;

prompt Creating DISCOUNT...
create table DISCOUNT
(
  discount_id      NUMBER(15) not null,
  discount_percent NUMBER(10) not null,
  discount_type    VARCHAR2(80) not null,
  discount_start   DATE not null,
  discount_end     DATE not null,
  resident_id      NUMBER(9) not null
)
;
alter table DISCOUNT
  add primary key (DISCOUNT_ID)
  ;
alter table DISCOUNT
  add foreign key (RESIDENT_ID)
  references RESIDENT (RESIDENT_ID);

prompt Creating OWNERSHIP...
create table OWNERSHIP
(
  asset_id    NUMBER(15) not null,
  resident_id NUMBER(9) not null
)
;
alter table OWNERSHIP
  add primary key (ASSET_ID, RESIDENT_ID)
  ;
alter table OWNERSHIP
  add foreign key (ASSET_ID)
  references ASSET (ASSET_ID);
alter table OWNERSHIP
  add foreign key (RESIDENT_ID)
  references RESIDENT (RESIDENT_ID);

prompt Creating PAYMENT...
create table PAYMENT
(
  payment_id      NUMBER(15) not null,
  payment_amount  NUMBER(15) not null,
  payment_type    VARCHAR2(20) not null,
  payment_date    DATE not null,
  payment_receipt DATE not null,
  tax_id          NUMBER(15) not null
)
;
alter table PAYMENT
  add primary key (PAYMENT_ID, TAX_ID)
  ;
alter table PAYMENT
  add foreign key (TAX_ID)
  references TAX_ACCOUNT (TAX_ID);

prompt Disabling triggers for TAX_ACCOUNT...
alter table TAX_ACCOUNT disable all triggers;
prompt Disabling triggers for ASSET...
alter table ASSET disable all triggers;
prompt Disabling triggers for DEBT...
alter table DEBT disable all triggers;
prompt Disabling triggers for RESIDENT...
alter table RESIDENT disable all triggers;
prompt Disabling triggers for DISCOUNT...
alter table DISCOUNT disable all triggers;
prompt Disabling triggers for OWNERSHIP...
alter table OWNERSHIP disable all triggers;
prompt Disabling triggers for PAYMENT...
alter table PAYMENT disable all triggers;
prompt Disabling foreign key constraints for ASSET...
alter table ASSET disable constraint SYS_C007708;
prompt Disabling foreign key constraints for DEBT...
alter table DEBT disable constraint SYS_C007715;
prompt Disabling foreign key constraints for DISCOUNT...
alter table DISCOUNT disable constraint SYS_C007731;
prompt Disabling foreign key constraints for OWNERSHIP...
alter table OWNERSHIP disable constraint SYS_C007735;
alter table OWNERSHIP disable constraint SYS_C007736;
prompt Disabling foreign key constraints for PAYMENT...
alter table PAYMENT disable constraint SYS_C007744;
prompt Deleting PAYMENT...
delete from PAYMENT;
commit;
prompt Deleting OWNERSHIP...
delete from OWNERSHIP;
commit;
prompt Deleting DISCOUNT...
delete from DISCOUNT;
commit;
prompt Deleting RESIDENT...
delete from RESIDENT;
commit;
prompt Deleting DEBT...
delete from DEBT;
commit;
prompt Deleting ASSET...
delete from ASSET;
commit;
prompt Deleting TAX_ACCOUNT...
delete from TAX_ACCOUNT;
commit;
prompt Loading TAX_ACCOUNT...
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9993116215, 50, to_date('02-03-2013', 'dd-mm-yyyy'), to_date('28-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6477259176, 77, to_date('14-04-2014', 'dd-mm-yyyy'), to_date('20-12-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4249544451, 135, to_date('07-02-2011', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4922593656, 194, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('07-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2243472184, 51, to_date('11-10-2012', 'dd-mm-yyyy'), to_date('24-12-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5486167339, 239, to_date('04-11-2016', 'dd-mm-yyyy'), to_date('18-06-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6986364288, 5, to_date('21-04-2013', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5859512998, 145, to_date('03-07-2016', 'dd-mm-yyyy'), to_date('14-08-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1142896819, 239, to_date('15-03-2015', 'dd-mm-yyyy'), to_date('18-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4828447655, 175, to_date('28-01-2014', 'dd-mm-yyyy'), to_date('17-06-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1889314599, 59, to_date('04-07-2011', 'dd-mm-yyyy'), to_date('11-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4191683544, 43, to_date('23-09-2017', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1775137119, 90, to_date('21-07-2013', 'dd-mm-yyyy'), to_date('18-02-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4352222858, 199, to_date('07-01-2017', 'dd-mm-yyyy'), to_date('25-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8387436752, 35, to_date('21-12-2015', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3899829445, 16, to_date('01-04-2016', 'dd-mm-yyyy'), to_date('11-07-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9843343751, 289, to_date('19-02-2012', 'dd-mm-yyyy'), to_date('21-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6427793236, 119, to_date('19-06-2013', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7127372749, 139, to_date('29-03-2017', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2757791555, 189, to_date('30-10-2011', 'dd-mm-yyyy'), to_date('30-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6852951366, 99, to_date('10-03-2015', 'dd-mm-yyyy'), to_date('18-02-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5296343145, 155, to_date('22-03-2012', 'dd-mm-yyyy'), to_date('22-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7324658837, 200, to_date('02-10-2012', 'dd-mm-yyyy'), to_date('24-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8699926337, 56, to_date('12-09-2016', 'dd-mm-yyyy'), to_date('12-06-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3117192153, 129, to_date('27-12-2011', 'dd-mm-yyyy'), to_date('30-04-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3141597276, 319, to_date('01-06-2010', 'dd-mm-yyyy'), to_date('25-11-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7788211143, 289, to_date('19-04-2012', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8374595871, 109, to_date('29-04-2015', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4345355892, 49, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('16-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6317891282, 39, to_date('17-09-2012', 'dd-mm-yyyy'), to_date('08-11-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9123486739, 169, to_date('31-08-2016', 'dd-mm-yyyy'), to_date('14-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6692136628, 179, to_date('23-04-2016', 'dd-mm-yyyy'), to_date('12-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9296943778, 46, to_date('31-07-2015', 'dd-mm-yyyy'), to_date('05-06-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4433298125, 89, to_date('28-04-2017', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7585721399, 44, to_date('08-11-2013', 'dd-mm-yyyy'), to_date('25-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8469385777, 149, to_date('21-03-2016', 'dd-mm-yyyy'), to_date('30-11-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4347482366, 215, to_date('04-02-2015', 'dd-mm-yyyy'), to_date('20-07-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5382196513, 175, to_date('02-09-2013', 'dd-mm-yyyy'), to_date('11-04-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7614183181, 72, to_date('27-03-2015', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5718998928, 115, to_date('26-04-2017', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7429724848, 28, to_date('19-09-2012', 'dd-mm-yyyy'), to_date('25-06-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2954698321, 618, to_date('11-08-2014', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6451963427, 38, to_date('16-01-2012', 'dd-mm-yyyy'), to_date('08-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8932536646, 285, to_date('22-12-2010', 'dd-mm-yyyy'), to_date('01-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6655749611, 113, to_date('25-05-2013', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7276911918, 769, to_date('19-01-2012', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2453342915, 39, to_date('18-07-2014', 'dd-mm-yyyy'), to_date('13-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5753121797, 84, to_date('18-09-2016', 'dd-mm-yyyy'), to_date('21-05-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4238776638, 8, to_date('13-11-2010', 'dd-mm-yyyy'), to_date('03-12-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8518527949, 175, to_date('10-11-2010', 'dd-mm-yyyy'), to_date('17-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3116514217, 55, to_date('15-04-2010', 'dd-mm-yyyy'), to_date('13-04-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4249847684, 109, to_date('25-09-2012', 'dd-mm-yyyy'), to_date('16-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3467579293, 89, to_date('19-12-2017', 'dd-mm-yyyy'), to_date('03-04-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7398738537, 169, to_date('13-12-2017', 'dd-mm-yyyy'), to_date('08-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6178844454, 9, to_date('18-10-2015', 'dd-mm-yyyy'), to_date('28-12-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4891838229, 16, to_date('30-09-2011', 'dd-mm-yyyy'), to_date('07-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3654654692, 58, to_date('22-04-2016', 'dd-mm-yyyy'), to_date('09-01-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2447112216, 241, to_date('25-05-2017', 'dd-mm-yyyy'), to_date('22-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6371867477, 149, to_date('29-01-2014', 'dd-mm-yyyy'), to_date('14-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5327567578, 6, to_date('29-01-2010', 'dd-mm-yyyy'), to_date('23-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8928992424, 499, to_date('20-09-2014', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9346399791, 1, to_date('19-06-2012', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8374369274, 259, to_date('05-05-2012', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7153662356, 369, to_date('15-11-2011', 'dd-mm-yyyy'), to_date('20-08-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4964928271, 35, to_date('27-10-2015', 'dd-mm-yyyy'), to_date('25-08-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1565834716, 289, to_date('06-06-2017', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4364493657, 240, to_date('09-04-2016', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9673912665, 45, to_date('28-03-2012', 'dd-mm-yyyy'), to_date('15-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5168924484, 18, to_date('03-02-2012', 'dd-mm-yyyy'), to_date('24-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3568793363, 245, to_date('20-01-2012', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2999722448, 150, to_date('01-04-2015', 'dd-mm-yyyy'), to_date('09-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2871978594, 105, to_date('12-04-2017', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6915866749, 289, to_date('08-11-2014', 'dd-mm-yyyy'), to_date('09-04-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1858925246, 51, to_date('16-08-2017', 'dd-mm-yyyy'), to_date('24-08-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9837494342, 199, to_date('22-11-2010', 'dd-mm-yyyy'), to_date('10-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1613227394, 289, to_date('02-11-2012', 'dd-mm-yyyy'), to_date('13-04-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8146142557, 43, to_date('19-06-2017', 'dd-mm-yyyy'), to_date('24-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7685767957, 78, to_date('19-05-2015', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6285298595, 35, to_date('25-04-2011', 'dd-mm-yyyy'), to_date('10-11-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3478122384, 219, to_date('04-11-2011', 'dd-mm-yyyy'), to_date('09-12-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9197584155, 219, to_date('13-03-2012', 'dd-mm-yyyy'), to_date('25-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6277365464, 20, to_date('29-03-2014', 'dd-mm-yyyy'), to_date('14-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4185733533, 209, to_date('02-06-2011', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4481431147, 3, to_date('18-02-2016', 'dd-mm-yyyy'), to_date('30-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5651222298, 35, to_date('29-01-2014', 'dd-mm-yyyy'), to_date('30-09-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3785529772, 139, to_date('11-09-2016', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5648443587, 65, to_date('27-08-2013', 'dd-mm-yyyy'), to_date('28-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3764995215, 229, to_date('17-08-2010', 'dd-mm-yyyy'), to_date('20-02-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4584246332, 119, to_date('25-02-2015', 'dd-mm-yyyy'), to_date('07-10-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4649114331, 35, to_date('24-09-2017', 'dd-mm-yyyy'), to_date('30-09-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2658286596, 519, to_date('05-08-2017', 'dd-mm-yyyy'), to_date('30-01-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4163743852, 35, to_date('26-09-2013', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2598693481, 79, to_date('19-06-2010', 'dd-mm-yyyy'), to_date('30-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9615467928, 69, to_date('06-09-2013', 'dd-mm-yyyy'), to_date('18-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8863711117, 55, to_date('18-09-2012', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4333196364, 5, to_date('09-11-2017', 'dd-mm-yyyy'), to_date('03-10-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7415156747, 6, to_date('17-03-2015', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4593717428, 120, to_date('08-11-2015', 'dd-mm-yyyy'), to_date('10-11-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8651255669, 119, to_date('20-09-2010', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4297133476, 79, to_date('10-11-2015', 'dd-mm-yyyy'), to_date('26-05-2022', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6563614192, 55, to_date('10-05-2010', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1281964953, 22, to_date('27-10-2017', 'dd-mm-yyyy'), to_date('23-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9829868553, 229, to_date('03-11-2011', 'dd-mm-yyyy'), to_date('07-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5766697281, 75, to_date('31-05-2015', 'dd-mm-yyyy'), to_date('16-10-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2324346182, 299, to_date('14-03-2012', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2629944151, 189, to_date('09-04-2011', 'dd-mm-yyyy'), to_date('16-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9154498274, 22, to_date('09-06-2017', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1796388858, 69, to_date('17-01-2017', 'dd-mm-yyyy'), to_date('02-09-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6764696344, 10, to_date('13-02-2015', 'dd-mm-yyyy'), to_date('10-01-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5445886759, 35, to_date('30-03-2011', 'dd-mm-yyyy'), to_date('01-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7959151316, 319, to_date('23-04-2011', 'dd-mm-yyyy'), to_date('20-12-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8421341913, 25, to_date('22-10-2013', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7537563939, 295, to_date('01-01-2015', 'dd-mm-yyyy'), to_date('20-04-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2229849136, 269, to_date('04-09-2013', 'dd-mm-yyyy'), to_date('08-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7566335653, 20, to_date('18-01-2010', 'dd-mm-yyyy'), to_date('14-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8981654921, 189, to_date('27-05-2016', 'dd-mm-yyyy'), to_date('03-02-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5681232999, 199, to_date('02-09-2010', 'dd-mm-yyyy'), to_date('29-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3352221815, 245, to_date('05-02-2010', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3985994693, 5, to_date('19-11-2012', 'dd-mm-yyyy'), to_date('22-02-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7973596365, 239, to_date('04-09-2013', 'dd-mm-yyyy'), to_date('08-08-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4561385332, 398, to_date('06-09-2010', 'dd-mm-yyyy'), to_date('07-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4951661462, 24, to_date('22-05-2010', 'dd-mm-yyyy'), to_date('19-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9334379264, 209, to_date('19-04-2011', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5394564919, 179, to_date('01-05-2012', 'dd-mm-yyyy'), to_date('04-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5568856178, 155, to_date('24-11-2010', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4844171756, 109, to_date('29-05-2010', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2117975264, 209, to_date('12-11-2012', 'dd-mm-yyyy'), to_date('10-01-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1726756224, 11, to_date('02-10-2013', 'dd-mm-yyyy'), to_date('10-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5661359651, 6, to_date('07-03-2014', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5313199237, 121, to_date('21-06-2011', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5538114597, 125, to_date('02-09-2011', 'dd-mm-yyyy'), to_date('16-11-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5582234829, 69, to_date('12-10-2011', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5855814678, 209, to_date('03-08-2013', 'dd-mm-yyyy'), to_date('08-02-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3154335321, 89, to_date('04-06-2016', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4368848717, 16, to_date('18-08-2015', 'dd-mm-yyyy'), to_date('22-09-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5498647191, 59, to_date('14-05-2017', 'dd-mm-yyyy'), to_date('17-05-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9142435762, 159, to_date('25-06-2014', 'dd-mm-yyyy'), to_date('09-02-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7332468413, 119, to_date('01-05-2017', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3714195382, 16, to_date('11-03-2011', 'dd-mm-yyyy'), to_date('28-01-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8483159579, 255, to_date('13-12-2013', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7598254851, 99, to_date('05-11-2012', 'dd-mm-yyyy'), to_date('12-07-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4963115294, 109, to_date('02-07-2015', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8117638562, 49, to_date('03-09-2011', 'dd-mm-yyyy'), to_date('04-02-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2551276128, 205, to_date('31-05-2013', 'dd-mm-yyyy'), to_date('11-04-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5448466479, 145, to_date('14-04-2017', 'dd-mm-yyyy'), to_date('04-04-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2384828386, 58, to_date('05-11-2012', 'dd-mm-yyyy'), to_date('14-08-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5792543598, 14, to_date('20-09-2017', 'dd-mm-yyyy'), to_date('05-04-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6644866893, 152, to_date('20-07-2016', 'dd-mm-yyyy'), to_date('11-10-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4786651373, 46, to_date('03-01-2012', 'dd-mm-yyyy'), to_date('07-10-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8679186711, 59, to_date('05-06-2011', 'dd-mm-yyyy'), to_date('05-02-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3995376445, 125, to_date('03-03-2016', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8446263762, 4, to_date('08-11-2011', 'dd-mm-yyyy'), to_date('09-08-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7214938872, 49, to_date('06-03-2016', 'dd-mm-yyyy'), to_date('13-04-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5721949743, 179, to_date('16-12-2011', 'dd-mm-yyyy'), to_date('15-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6175197286, 299, to_date('04-10-2017', 'dd-mm-yyyy'), to_date('09-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8926282748, 145, to_date('14-07-2012', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2512132428, 3, to_date('26-01-2013', 'dd-mm-yyyy'), to_date('02-11-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9128556832, 15, to_date('24-04-2012', 'dd-mm-yyyy'), to_date('01-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7936718619, 20, to_date('06-01-2016', 'dd-mm-yyyy'), to_date('18-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5766963764, 579, to_date('04-09-2013', 'dd-mm-yyyy'), to_date('06-04-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8955888356, 398, to_date('21-04-2012', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8268579277, 89, to_date('10-10-2016', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2886648525, 149, to_date('24-09-2015', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1772653857, 78, to_date('26-04-2017', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2363661557, 35, to_date('17-08-2014', 'dd-mm-yyyy'), to_date('18-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1494366839, 1, to_date('11-12-2012', 'dd-mm-yyyy'), to_date('13-10-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2554219385, 259, to_date('13-05-2017', 'dd-mm-yyyy'), to_date('21-11-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8695394947, 159, to_date('31-05-2011', 'dd-mm-yyyy'), to_date('10-04-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1999296696, 149, to_date('18-07-2010', 'dd-mm-yyyy'), to_date('14-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7734731985, 209, to_date('19-03-2011', 'dd-mm-yyyy'), to_date('03-03-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9317891774, 89, to_date('13-10-2013', 'dd-mm-yyyy'), to_date('26-10-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5746146364, 215, to_date('10-07-2014', 'dd-mm-yyyy'), to_date('27-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2538768487, 229, to_date('04-04-2010', 'dd-mm-yyyy'), to_date('30-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1234567891, 5000, to_date('12-05-2020', 'dd-mm-yyyy'), to_date('15-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1568965874, 6000, to_date('18-09-2018', 'dd-mm-yyyy'), to_date('21-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1542369856, 9000, to_date('18-01-2017', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1523698569, 10000, to_date('20-08-2023', 'dd-mm-yyyy'), to_date('18-05-2016', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9643948722, 375, to_date('25-04-2017', 'dd-mm-yyyy'), to_date('26-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1998974929, 255, to_date('16-09-2010', 'dd-mm-yyyy'), to_date('24-12-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4866413555, 113, to_date('17-01-2017', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7119638695, 45, to_date('04-12-2017', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1472964258, 68, to_date('14-09-2011', 'dd-mm-yyyy'), to_date('22-08-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7534254276, 399, to_date('31-07-2014', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5796492881, 96, to_date('12-07-2016', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3525293153, 117, to_date('07-05-2016', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1584924868, 134, to_date('02-02-2011', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1755565188, 289, to_date('05-09-2010', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9483442283, 41, to_date('22-05-2015', 'dd-mm-yyyy'), to_date('12-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5543721423, 41, to_date('05-07-2017', 'dd-mm-yyyy'), to_date('27-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9211935538, 255, to_date('19-11-2013', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9153846231, 279, to_date('26-11-2017', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3556248286, 175, to_date('07-10-2012', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5169775417, 209, to_date('15-10-2014', 'dd-mm-yyyy'), to_date('07-03-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5647154158, 29, to_date('02-07-2011', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4198888634, 45, to_date('28-12-2013', 'dd-mm-yyyy'), to_date('24-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8864155356, 159, to_date('16-07-2015', 'dd-mm-yyyy'), to_date('06-02-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3531192527, 269, to_date('30-08-2011', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7318887334, 1, to_date('09-08-2015', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1162271649, 5, to_date('26-05-2014', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9223442661, 219, to_date('09-09-2012', 'dd-mm-yyyy'), to_date('07-06-2021', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2848279755, 77, to_date('18-10-2013', 'dd-mm-yyyy'), to_date('07-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9395754226, 39, to_date('06-05-2015', 'dd-mm-yyyy'), to_date('30-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8934816974, 17, to_date('10-09-2011', 'dd-mm-yyyy'), to_date('25-05-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8933643377, 72, to_date('17-05-2011', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3959326721, 399, to_date('02-02-2015', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9957395313, 109, to_date('12-06-2014', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4447758479, 40, to_date('30-10-2010', 'dd-mm-yyyy'), to_date('08-09-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9992577847, 189, to_date('27-06-2013', 'dd-mm-yyyy'), to_date('01-07-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8334941149, 225, to_date('06-01-2010', 'dd-mm-yyyy'), to_date('20-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4427272442, 209, to_date('01-01-2012', 'dd-mm-yyyy'), to_date('24-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2211965788, 109, to_date('10-09-2013', 'dd-mm-yyyy'), to_date('31-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4471966292, 255, to_date('05-09-2013', 'dd-mm-yyyy'), to_date('13-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9877814153, 74, to_date('09-09-2010', 'dd-mm-yyyy'), to_date('18-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3995261136, 205, to_date('20-11-2016', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3337485563, 169, to_date('01-04-2016', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1891219639, 78, to_date('17-08-2013', 'dd-mm-yyyy'), to_date('22-08-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6769459998, 45, to_date('25-12-2016', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2931666897, 849, to_date('29-08-2011', 'dd-mm-yyyy'), to_date('06-12-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4159894618, 25, to_date('21-09-2011', 'dd-mm-yyyy'), to_date('30-11-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6795552533, 99, to_date('01-07-2017', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5458194925, 91, to_date('04-02-2010', 'dd-mm-yyyy'), to_date('20-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2918995427, 72, to_date('10-10-2015', 'dd-mm-yyyy'), to_date('16-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3522788675, 44, to_date('26-02-2011', 'dd-mm-yyyy'), to_date('08-04-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9853322754, 195, to_date('12-06-2015', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2926669992, 149, to_date('08-12-2017', 'dd-mm-yyyy'), to_date('20-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6818789889, 20, to_date('23-01-2016', 'dd-mm-yyyy'), to_date('23-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9349733469, 265, to_date('20-09-2014', 'dd-mm-yyyy'), to_date('13-07-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2994527266, 349, to_date('02-01-2012', 'dd-mm-yyyy'), to_date('18-09-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9641782372, 125, to_date('20-09-2014', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2563441712, 22, to_date('20-04-2014', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7575562786, 75, to_date('18-08-2011', 'dd-mm-yyyy'), to_date('15-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9273343542, 40, to_date('08-09-2017', 'dd-mm-yyyy'), to_date('14-12-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4168397516, 140, to_date('03-02-2012', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5635937656, 319, to_date('05-03-2016', 'dd-mm-yyyy'), to_date('22-01-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2989134417, 85, to_date('25-01-2013', 'dd-mm-yyyy'), to_date('01-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6561357232, 5, to_date('07-02-2012', 'dd-mm-yyyy'), to_date('02-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6441149813, 289, to_date('19-03-2012', 'dd-mm-yyyy'), to_date('22-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3688147648, 8, to_date('25-06-2011', 'dd-mm-yyyy'), to_date('10-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9781174318, 179, to_date('25-07-2013', 'dd-mm-yyyy'), to_date('23-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9358277964, 139, to_date('27-04-2014', 'dd-mm-yyyy'), to_date('21-06-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6794499952, 27, to_date('28-09-2010', 'dd-mm-yyyy'), to_date('04-09-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7314477652, 79, to_date('20-01-2016', 'dd-mm-yyyy'), to_date('27-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6786213942, 105, to_date('27-08-2016', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8368577148, 27, to_date('04-09-2013', 'dd-mm-yyyy'), to_date('24-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5847945678, 129, to_date('18-08-2017', 'dd-mm-yyyy'), to_date('18-03-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4685341693, 356, to_date('27-02-2015', 'dd-mm-yyyy'), to_date('17-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5856245445, 125, to_date('11-09-2012', 'dd-mm-yyyy'), to_date('04-09-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4295446744, 99, to_date('30-06-2017', 'dd-mm-yyyy'), to_date('08-04-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8613172535, 130, to_date('15-05-2010', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5537394477, 48, to_date('10-04-2016', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1982548571, 7, to_date('24-11-2017', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2464419131, 58, to_date('17-08-2017', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6537778743, 169, to_date('01-06-2010', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4146846981, 329, to_date('03-06-2011', 'dd-mm-yyyy'), to_date('29-06-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1326966921, 150, to_date('30-01-2016', 'dd-mm-yyyy'), to_date('12-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1822686733, 289, to_date('29-11-2011', 'dd-mm-yyyy'), to_date('06-11-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5266472322, 149, to_date('12-06-2016', 'dd-mm-yyyy'), to_date('05-04-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2652893613, 99, to_date('12-05-2016', 'dd-mm-yyyy'), to_date('29-12-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7637833876, 138, to_date('10-12-2017', 'dd-mm-yyyy'), to_date('25-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8552459836, 75, to_date('24-12-2016', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1252464813, 265, to_date('14-05-2010', 'dd-mm-yyyy'), to_date('04-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4185413791, 8, to_date('03-02-2016', 'dd-mm-yyyy'), to_date('10-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7589546594, 140, to_date('28-09-2014', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1918613131, 149, to_date('03-10-2010', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3789631937, 115, to_date('22-11-2013', 'dd-mm-yyyy'), to_date('14-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3236776286, 265, to_date('04-12-2015', 'dd-mm-yyyy'), to_date('20-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4687272626, 46, to_date('12-04-2013', 'dd-mm-yyyy'), to_date('25-10-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5222744793, 78, to_date('24-12-2016', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9297327832, 6, to_date('23-08-2015', 'dd-mm-yyyy'), to_date('16-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2298965679, 135, to_date('12-08-2015', 'dd-mm-yyyy'), to_date('28-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8688141884, 299, to_date('10-01-2013', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2194666377, 18, to_date('07-04-2010', 'dd-mm-yyyy'), to_date('03-01-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1891155287, 209, to_date('21-07-2014', 'dd-mm-yyyy'), to_date('17-05-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3311687191, 399, to_date('01-11-2013', 'dd-mm-yyyy'), to_date('13-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7223476559, 48, to_date('30-04-2012', 'dd-mm-yyyy'), to_date('12-07-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3671333763, 95, to_date('16-11-2017', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9574279431, 85, to_date('13-07-2011', 'dd-mm-yyyy'), to_date('23-11-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6263145256, 48, to_date('15-06-2016', 'dd-mm-yyyy'), to_date('29-12-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8312714527, 99, to_date('22-06-2012', 'dd-mm-yyyy'), to_date('15-02-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7856625212, 88, to_date('11-10-2012', 'dd-mm-yyyy'), to_date('29-06-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8666756644, 109, to_date('14-03-2015', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9632833738, 895, to_date('25-11-2015', 'dd-mm-yyyy'), to_date('22-07-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1558671129, 24, to_date('01-08-2014', 'dd-mm-yyyy'), to_date('07-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4947749389, 69, to_date('21-03-2010', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4485634271, 29, to_date('25-08-2017', 'dd-mm-yyyy'), to_date('14-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8814989295, 4, to_date('19-01-2015', 'dd-mm-yyyy'), to_date('15-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4232346788, 589, to_date('28-02-2014', 'dd-mm-yyyy'), to_date('15-02-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4828895987, 1, to_date('08-04-2014', 'dd-mm-yyyy'), to_date('23-10-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8474714847, 99, to_date('29-12-2017', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9586426278, 245, to_date('11-01-2011', 'dd-mm-yyyy'), to_date('23-11-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1574356834, 4, to_date('06-03-2016', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1545919884, 99, to_date('02-09-2014', 'dd-mm-yyyy'), to_date('15-04-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4313216129, 125, to_date('15-09-2013', 'dd-mm-yyyy'), to_date('07-12-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4841422773, 279, to_date('18-03-2016', 'dd-mm-yyyy'), to_date('17-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8491577337, 241, to_date('29-07-2015', 'dd-mm-yyyy'), to_date('18-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9288211241, 59, to_date('25-05-2012', 'dd-mm-yyyy'), to_date('09-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7153189418, 299, to_date('30-06-2017', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3254484582, 66, to_date('30-11-2011', 'dd-mm-yyyy'), to_date('17-05-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2242972333, 35, to_date('13-01-2010', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1557417384, 149, to_date('12-04-2014', 'dd-mm-yyyy'), to_date('19-09-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8595366756, 6, to_date('22-09-2015', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2411452572, 249, to_date('18-01-2012', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7462697486, 209, to_date('17-12-2017', 'dd-mm-yyyy'), to_date('31-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2151622185, 46, to_date('24-01-2011', 'dd-mm-yyyy'), to_date('17-06-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8145984896, 24, to_date('14-02-2010', 'dd-mm-yyyy'), to_date('25-03-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9182836259, 10, to_date('10-03-2016', 'dd-mm-yyyy'), to_date('19-12-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2389291999, 344, to_date('12-06-2012', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8262797734, 38, to_date('21-04-2011', 'dd-mm-yyyy'), to_date('07-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5133611251, 90, to_date('09-10-2014', 'dd-mm-yyyy'), to_date('21-01-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8535345228, 149, to_date('24-05-2017', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9263977762, 259, to_date('12-03-2012', 'dd-mm-yyyy'), to_date('17-02-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2116147667, 69, to_date('12-06-2013', 'dd-mm-yyyy'), to_date('10-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3814719621, 65, to_date('25-02-2010', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6424172964, 59, to_date('15-02-2016', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1215377971, 16, to_date('16-03-2012', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6271724725, 49, to_date('26-06-2016', 'dd-mm-yyyy'), to_date('23-11-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2617574129, 179, to_date('16-03-2010', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4178165241, 45, to_date('23-09-2017', 'dd-mm-yyyy'), to_date('22-05-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5397199644, 579, to_date('19-02-2015', 'dd-mm-yyyy'), to_date('05-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8132641268, 56, to_date('22-07-2011', 'dd-mm-yyyy'), to_date('04-02-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4477446264, 344, to_date('15-03-2016', 'dd-mm-yyyy'), to_date('10-09-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6775977362, 149, to_date('07-10-2016', 'dd-mm-yyyy'), to_date('29-08-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2628998293, 56, to_date('14-03-2010', 'dd-mm-yyyy'), to_date('15-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7658738122, 7, to_date('09-11-2010', 'dd-mm-yyyy'), to_date('19-01-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5877212239, 23, to_date('23-05-2017', 'dd-mm-yyyy'), to_date('25-02-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5799489168, 179, to_date('08-08-2013', 'dd-mm-yyyy'), to_date('10-06-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2795311965, 41, to_date('23-06-2012', 'dd-mm-yyyy'), to_date('23-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4926143159, 5, to_date('08-04-2012', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3361638591, 149, to_date('16-03-2016', 'dd-mm-yyyy'), to_date('24-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5555537348, 349, to_date('22-08-2014', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9848367623, 215, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('05-05-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1472156759, 69, to_date('15-01-2016', 'dd-mm-yyyy'), to_date('14-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7762114179, 5, to_date('17-12-2017', 'dd-mm-yyyy'), to_date('14-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3989192533, 3, to_date('20-07-2017', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5194133875, 135, to_date('14-02-2016', 'dd-mm-yyyy'), to_date('19-06-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3798279879, 24, to_date('25-11-2011', 'dd-mm-yyyy'), to_date('16-05-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7447317627, 109, to_date('29-11-2014', 'dd-mm-yyyy'), to_date('06-10-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9123736588, 130, to_date('24-11-2016', 'dd-mm-yyyy'), to_date('29-11-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5165328338, 10, to_date('05-02-2016', 'dd-mm-yyyy'), to_date('16-08-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4393326281, 65, to_date('12-01-2017', 'dd-mm-yyyy'), to_date('19-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8493468112, 239, to_date('09-07-2012', 'dd-mm-yyyy'), to_date('01-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3631696238, 30, to_date('09-07-2011', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4972377698, 48, to_date('12-01-2012', 'dd-mm-yyyy'), to_date('07-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2255727428, 259, to_date('21-03-2015', 'dd-mm-yyyy'), to_date('27-09-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7534926872, 10, to_date('08-11-2011', 'dd-mm-yyyy'), to_date('11-10-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2166934128, 75, to_date('04-01-2013', 'dd-mm-yyyy'), to_date('04-09-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5662161994, 245, to_date('07-10-2013', 'dd-mm-yyyy'), to_date('03-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7432379598, 295, to_date('11-07-2017', 'dd-mm-yyyy'), to_date('11-06-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5933246817, 375, to_date('27-11-2015', 'dd-mm-yyyy'), to_date('06-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7232214848, 200, to_date('13-10-2016', 'dd-mm-yyyy'), to_date('21-12-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9214671395, 7, to_date('01-08-2014', 'dd-mm-yyyy'), to_date('08-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3358837585, 209, to_date('06-01-2011', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7494443274, 12, to_date('03-11-2017', 'dd-mm-yyyy'), to_date('28-08-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9586323889, 205, to_date('04-12-2010', 'dd-mm-yyyy'), to_date('18-10-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8338351458, 85, to_date('28-11-2013', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1885613693, 145, to_date('05-09-2011', 'dd-mm-yyyy'), to_date('10-01-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5949649787, 22, to_date('26-11-2010', 'dd-mm-yyyy'), to_date('09-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7856264556, 44, to_date('19-05-2012', 'dd-mm-yyyy'), to_date('21-07-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4166236398, 46, to_date('11-06-2011', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6227681244, 245, to_date('23-02-2016', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6917521728, 18, to_date('14-12-2013', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9169652381, 19, to_date('26-09-2017', 'dd-mm-yyyy'), to_date('04-03-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5365876658, 8, to_date('24-07-2015', 'dd-mm-yyyy'), to_date('17-09-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5393842389, 229, to_date('03-06-2016', 'dd-mm-yyyy'), to_date('07-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1882193391, 20, to_date('27-06-2012', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3381517824, 121, to_date('07-01-2014', 'dd-mm-yyyy'), to_date('17-07-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6865451711, 8, to_date('27-11-2014', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6297686815, 398, to_date('29-01-2012', 'dd-mm-yyyy'), to_date('23-04-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4131118948, 105, to_date('31-12-2012', 'dd-mm-yyyy'), to_date('13-06-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5329583566, 27, to_date('14-11-2012', 'dd-mm-yyyy'), to_date('11-07-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6476319398, 24, to_date('01-01-2016', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1942157435, 265, to_date('06-04-2012', 'dd-mm-yyyy'), to_date('20-02-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7314372264, 113, to_date('26-07-2010', 'dd-mm-yyyy'), to_date('30-11-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8542451742, 144, to_date('03-07-2017', 'dd-mm-yyyy'), to_date('11-07-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3576298243, 55, to_date('11-10-2011', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6649259712, 38, to_date('04-12-2013', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6747552976, 1, to_date('14-07-2015', 'dd-mm-yyyy'), to_date('09-03-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5132233416, 48, to_date('02-10-2017', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1799656924, 156, to_date('20-11-2011', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5144434955, 39, to_date('29-07-2016', 'dd-mm-yyyy'), to_date('11-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2936693947, 24, to_date('13-03-2015', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (4249811245, 249, to_date('01-09-2014', 'dd-mm-yyyy'), to_date('31-08-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1196353674, 29, to_date('15-09-2011', 'dd-mm-yyyy'), to_date('27-10-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9695539818, 145, to_date('08-01-2016', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9138129716, 85, to_date('23-04-2012', 'dd-mm-yyyy'), to_date('05-10-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (6837512131, 2, to_date('21-12-2013', 'dd-mm-yyyy'), to_date('09-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8411468431, 48, to_date('04-11-2010', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3694621928, 219, to_date('25-05-2017', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (8617915744, 95, to_date('02-05-2012', 'dd-mm-yyyy'), to_date('04-09-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3897721262, 45, to_date('11-10-2017', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5451354627, 289, to_date('27-01-2010', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1443299343, 255, to_date('06-12-2013', 'dd-mm-yyyy'), to_date('23-04-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (9322173772, 235, to_date('15-04-2017', 'dd-mm-yyyy'), to_date('04-12-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7133283645, 69, to_date('14-12-2013', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2343668464, 31, to_date('30-07-2013', 'dd-mm-yyyy'), to_date('02-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (3921177167, 199, to_date('22-09-2015', 'dd-mm-yyyy'), to_date('19-07-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5475167869, 29, to_date('22-01-2014', 'dd-mm-yyyy'), to_date('23-03-2020', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1553993598, 46, to_date('19-06-2012', 'dd-mm-yyyy'), to_date('24-01-2018', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1294724161, 139, to_date('29-04-2017', 'dd-mm-yyyy'), to_date('07-12-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (1175969255, 49, to_date('12-01-2015', 'dd-mm-yyyy'), to_date('14-12-2021', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2783928517, 8, to_date('07-02-2011', 'dd-mm-yyyy'), to_date('06-10-2021', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (2247813915, 109, to_date('22-02-2012', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (5844314832, 189, to_date('02-07-2014', 'dd-mm-yyyy'), to_date('30-06-2019', 'dd-mm-yyyy'));
insert into TAX_ACCOUNT (tax_id, tax_price, tax_create, tax_close)
values (7342291545, 8, to_date('26-04-2016', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'));
commit;
prompt 404 records loaded
prompt Loading ASSET...
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6374423052, '4 Farmco Way', 'Apartment', 100, to_date('09-09-2021', 'dd-mm-yyyy'), to_date('28-05-2022', 'dd-mm-yyyy'), 4159894618, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3188478074, '9341 Summer Ridge Court', 'land', 500, to_date('06-01-2021', 'dd-mm-yyyy'), to_date('22-02-2022', 'dd-mm-yyyy'), 6795552533, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3104566656, '37267 Victoria Center', 'office', 300, to_date('22-01-2021', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 5458194925, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5200299790, '57407 Oak Valley Center', 'office', 300, to_date('08-02-2021', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 2918995427, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2426274041, '6 Hooker Point', 'office', 300, to_date('24-10-2020', 'dd-mm-yyyy'), to_date('30-07-2022', 'dd-mm-yyyy'), 3522788675, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7967055973, '02257 Vahlen Court', 'Apartment', 100, to_date('21-12-2020', 'dd-mm-yyyy'), to_date('16-11-2022', 'dd-mm-yyyy'), 9853322754, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2216083609, '77598 Dexter Pass', 'Hotel', 800, to_date('12-05-2021', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 2926669992, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7190912917, '37 Bowman Center', 'Apartment', 100, to_date('22-07-2021', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 6818789889, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1065675650, '37 Sundown Place', 'office', 300, to_date('12-08-2021', 'dd-mm-yyyy'), to_date('05-11-2022', 'dd-mm-yyyy'), 9349733469, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6301440603, '80 Badeau Parkway', 'land', 500, to_date('11-10-2020', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 2994527266, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6594069555, '9245 Mayfield Place', 'Hotel', 800, to_date('18-04-2021', 'dd-mm-yyyy'), to_date('15-09-2022', 'dd-mm-yyyy'), 9641782372, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5845530936, '44634 Huxley Trail', 'land', 500, to_date('14-02-2021', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 2563441712, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2699034849, '96 Butterfield Hill', 'office', 300, to_date('21-12-2020', 'dd-mm-yyyy'), to_date('27-01-2022', 'dd-mm-yyyy'), 9993116215, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1088668426, '68 Gulseth Drive', 'land', 500, to_date('01-11-2020', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 6477259176, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3956266377, '0 Pennsylvania Pass', 'Hotel', 800, to_date('27-03-2021', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 4249544451, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7188701690, '46454 Northview Crossing', 'Apartment', 100, to_date('27-01-2021', 'dd-mm-yyyy'), to_date('04-01-2023', 'dd-mm-yyyy'), 4922593656, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8707698896, '76257 Carioca Avenue', 'land', 500, to_date('14-11-2020', 'dd-mm-yyyy'), to_date('10-07-2022', 'dd-mm-yyyy'), 2243472184, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3321977282, '2373 Dovetail Hill', 'land', 500, to_date('19-10-2020', 'dd-mm-yyyy'), to_date('24-11-2021', 'dd-mm-yyyy'), 5486167339, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3136202924, '13 Nelson Trail', 'Hotel', 800, to_date('28-10-2020', 'dd-mm-yyyy'), to_date('08-07-2022', 'dd-mm-yyyy'), 6986364288, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2507346293, '410 Surrey Pass', 'land', 500, to_date('29-01-2021', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'), 5859512998, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4984502981, '9 Parkside Terrace', 'Hotel', 800, to_date('14-09-2021', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 1142896819, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8533096373, '72511 Farmco Center', 'land', 500, to_date('11-01-2021', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'), 4828447655, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3700940541, '3596 Elgar Pass', 'Hotel', 800, to_date('31-08-2021', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), 1889314599, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5753047730, '60 Sherman Crossing', 'Apartment', 100, to_date('08-05-2021', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 4191683544, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3669129449, '25 Kropf Junction', 'office', 300, to_date('21-01-2021', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), 1775137119, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2175095720, '69173 Independence Terrace', 'Hotel', 800, to_date('06-11-2020', 'dd-mm-yyyy'), to_date('19-04-2022', 'dd-mm-yyyy'), 4352222858, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6922765964, '2 2nd Street', 'Hotel', 800, to_date('16-10-2020', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), 8387436752, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7809168634, '2 Summer Ridge Road', 'land', 500, to_date('26-06-2021', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), 3899829445, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6691266089, '604 Redwing Avenue', 'Hotel', 800, to_date('04-07-2021', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 9843343751, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4767766186, '5 Valley Edge Parkway', 'Apartment', 100, to_date('02-02-2021', 'dd-mm-yyyy'), to_date('07-06-2022', 'dd-mm-yyyy'), 6427793236, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8625661719, '45 Thompson Street', 'Apartment', 100, to_date('09-12-2020', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 7127372749, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6254312832, '81 Eggendart Road', 'Apartment', 100, to_date('21-03-2021', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 2757791555, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2666049179, '19 Elka Drive', 'Apartment', 100, to_date('09-11-2020', 'dd-mm-yyyy'), to_date('02-02-2022', 'dd-mm-yyyy'), 6852951366, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1582633064, '0440 Shelley Trail', 'office', 300, to_date('03-08-2021', 'dd-mm-yyyy'), to_date('19-05-2022', 'dd-mm-yyyy'), 5296343145, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2602003953, '4 Stoughton Drive', 'office', 300, to_date('08-03-2021', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 7324658837, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9868052411, '8 West Street', 'Apartment', 100, to_date('17-01-2021', 'dd-mm-yyyy'), to_date('23-05-2022', 'dd-mm-yyyy'), 8699926337, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3416927784, '475 Sycamore Crossing', 'office', 300, to_date('01-12-2020', 'dd-mm-yyyy'), to_date('08-10-2022', 'dd-mm-yyyy'), 3117192153, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9891142097, '7581 Forest Place', 'office', 300, to_date('18-01-2021', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), 3141597276, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8553252169, '11903 Vernon Park', 'Apartment', 100, to_date('02-06-2021', 'dd-mm-yyyy'), to_date('15-12-2021', 'dd-mm-yyyy'), 7788211143, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3002720469, '55 Bellgrove Alley', 'office', 300, to_date('29-03-2021', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), 8374595871, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9517888555, '8970 Burrows Trail', 'land', 500, to_date('09-11-2020', 'dd-mm-yyyy'), to_date('10-05-2023', 'dd-mm-yyyy'), 4345355892, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4179819584, '0406 Buell Plaza', 'Hotel', 800, to_date('03-04-2021', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), 6317891282, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1167083578, '93 Arrowood Parkway', 'land', 500, to_date('17-12-2020', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 9123486739, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3841455343, '4 Glacier Hill Circle', 'Hotel', 800, to_date('29-10-2020', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), 6692136628, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6687478049, '84518 Scoville Alley', 'office', 300, to_date('06-12-2020', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 9296943778, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6680312546, '758 Menomonie Parkway', 'land', 500, to_date('25-10-2020', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 4433298125, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2435356802, '587 Grayhawk Center', 'Hotel', 800, to_date('30-04-2021', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 7585721399, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1132798801, '8940 South Pass', 'Apartment', 100, to_date('04-08-2021', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'), 8469385777, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1962338137, '7 Doe Crossing Hill', 'Hotel', 800, to_date('12-09-2021', 'dd-mm-yyyy'), to_date('17-08-2022', 'dd-mm-yyyy'), 4347482366, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8749809604, '085 Schmedeman Court', 'office', 300, to_date('26-07-2021', 'dd-mm-yyyy'), to_date('16-06-2022', 'dd-mm-yyyy'), 5382196513, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4513516412, '69515 Southridge Plaza', 'Hotel', 800, to_date('07-08-2021', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'), 7614183181, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6676325946, '232 Park Meadow Parkway', 'Hotel', 800, to_date('23-08-2021', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'), 5718998928, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3012372031, '325 Algoma Junction', 'Hotel', 800, to_date('19-07-2021', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 7429724848, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7460620467, '3 Burrows Drive', 'Hotel', 800, to_date('31-05-2021', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 2954698321, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4299378176, '8092 Columbus Circle', 'land', 500, to_date('02-03-2021', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 6451963427, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7839915144, '8685 Monument Pass', 'office', 300, to_date('11-05-2021', 'dd-mm-yyyy'), to_date('23-03-2022', 'dd-mm-yyyy'), 8932536646, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3366623569, '87 Quincy Hill', 'land', 500, to_date('08-08-2021', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), 6655749611, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6773237570, '7 Shelley Way', 'land', 500, to_date('31-07-2021', 'dd-mm-yyyy'), to_date('21-06-2023', 'dd-mm-yyyy'), 7276911918, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6508239771, '2636 Marcy Parkway', 'office', 300, to_date('05-12-2020', 'dd-mm-yyyy'), to_date('21-11-2022', 'dd-mm-yyyy'), 2453342915, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8241838751, '53005 Sachs Park', 'Hotel', 800, to_date('28-02-2021', 'dd-mm-yyyy'), to_date('02-01-2022', 'dd-mm-yyyy'), 5753121797, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8635476476, '213 Mallory Center', 'land', 500, to_date('24-08-2021', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'), 4238776638, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5092207913, '5670 Starling Terrace', 'Apartment', 100, to_date('26-01-2021', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 8518527949, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4840174009, '9 Chinook Pass', 'land', 500, to_date('01-07-2021', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), 3116514217, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1979175101, '96488 Westridge Point', 'Hotel', 800, to_date('27-12-2020', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 4249847684, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6525326634, '29 Algoma Plaza', 'Apartment', 100, to_date('05-06-2021', 'dd-mm-yyyy'), to_date('03-04-2022', 'dd-mm-yyyy'), 3467579293, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8452053063, '06444 Clemons Place', 'Hotel', 800, to_date('16-09-2021', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), 7398738537, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3660262339, '1762 Independence Parkway', 'office', 300, to_date('01-07-2021', 'dd-mm-yyyy'), to_date('25-12-2021', 'dd-mm-yyyy'), 6178844454, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9378690004, '34 Welch Center', 'Hotel', 800, to_date('01-06-2021', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), 4891838229, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2918436992, '18231 Oakridge Parkway', 'Hotel', 800, to_date('01-02-2021', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 1568965874, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3977916915, '15275 Sachtjen Lane', 'office', 300, to_date('20-04-2021', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'), 1542369856, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4208510125, '3 Merrick Alley', 'office', 300, to_date('28-09-2021', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 1523698569, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4674107237, '9951 2nd Point', 'Hotel', 800, to_date('07-04-2021', 'dd-mm-yyyy'), to_date('01-03-2022', 'dd-mm-yyyy'), 9643948722, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3815957283, '9878 Goodland Place', 'office', 300, to_date('23-06-2021', 'dd-mm-yyyy'), to_date('15-03-2022', 'dd-mm-yyyy'), 1998974929, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2542080761, '5981 Derek Center', 'Apartment', 100, to_date('21-04-2021', 'dd-mm-yyyy'), to_date('07-11-2023', 'dd-mm-yyyy'), 4866413555, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4789866775, '76143 Helena Alley', 'Apartment', 100, to_date('11-09-2021', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), 7119638695, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1910110789, '34 Manley Center', 'land', 500, to_date('20-03-2021', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'), 1472964258, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7554320950, '599 Moulton Junction', 'Apartment', 100, to_date('18-03-2021', 'dd-mm-yyyy'), to_date('25-11-2021', 'dd-mm-yyyy'), 7534254276, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3788893408, '68 Golf Terrace', 'Apartment', 100, to_date('20-02-2021', 'dd-mm-yyyy'), to_date('20-12-2021', 'dd-mm-yyyy'), 5796492881, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5620650605, '28 Thompson Drive', 'land', 500, to_date('20-09-2021', 'dd-mm-yyyy'), to_date('23-12-2021', 'dd-mm-yyyy'), 3525293153, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6084677955, '0630 Kinsman Court', 'Hotel', 800, to_date('12-11-2020', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'), 1584924868, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5272420503, '87 Riverside Point', 'Hotel', 800, to_date('27-06-2021', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 1755565188, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1086450646, '12 Derek Center', 'Apartment', 100, to_date('02-02-2021', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 9483442283, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7348891327, '89013 Longview Point', 'land', 500, to_date('06-11-2020', 'dd-mm-yyyy'), to_date('07-02-2022', 'dd-mm-yyyy'), 5543721423, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4042873340, '1 Riverside Pass', 'office', 300, to_date('28-02-2021', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 9211935538, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6980913746, '04119 Sommers Plaza', 'Apartment', 100, to_date('06-09-2021', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'), 9153846231, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7404012563, '189 Redwing Court', 'office', 300, to_date('18-08-2021', 'dd-mm-yyyy'), to_date('04-03-2023', 'dd-mm-yyyy'), 3556248286, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2978977780, '98803 American Center', 'office', 300, to_date('21-12-2020', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 5169775417, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8482947192, '897 Fremont Avenue', 'land', 500, to_date('01-01-2021', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 5647154158, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3218254766, '980 Anderson Point', 'land', 500, to_date('13-10-2020', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'), 4198888634, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4685116997, '42571 Golden Leaf Way', 'Apartment', 100, to_date('17-07-2021', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'), 8864155356, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5112294938, '2257 Anthes Hill', 'land', 500, to_date('04-05-2021', 'dd-mm-yyyy'), to_date('10-03-2022', 'dd-mm-yyyy'), 3531192527, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4546928934, '6089 Pleasure Junction', 'Hotel', 800, to_date('03-12-2020', 'dd-mm-yyyy'), to_date('30-12-2021', 'dd-mm-yyyy'), 7318887334, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8104910914, '0302 Moland Parkway', 'office', 300, to_date('16-07-2021', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), 1162271649, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2947450154, '7822 Heffernan Pass', 'land', 500, to_date('22-06-2021', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), 9223442661, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3182399457, '7 Kennedy Alley', 'land', 500, to_date('16-03-2021', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'), 2848279755, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4640353073, '888 Carberry Way', 'Hotel', 800, to_date('30-09-2021', 'dd-mm-yyyy'), to_date('30-09-2022', 'dd-mm-yyyy'), 9395754226, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9182444264, '944 Butternut Hill', 'land', 500, to_date('09-02-2021', 'dd-mm-yyyy'), to_date('01-02-2022', 'dd-mm-yyyy'), 8934816974, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1906548352, '4207 Anhalt Parkway', 'Hotel', 800, to_date('15-03-2021', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 8933643377, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7073335064, '392 Hooker Junction', 'land', 500, to_date('29-04-2021', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'), 3959326721, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2926330958, '63168 Dixon Circle', 'office', 300, to_date('27-12-2020', 'dd-mm-yyyy'), to_date('18-11-2021', 'dd-mm-yyyy'), 9957395313, 30);
commit;
prompt 100 records committed...
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2520783788, '0724 Beilfuss Point', 'office', 300, to_date('06-03-2021', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), 4447758479, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8736421640, '98 Gerald Parkway', 'land', 500, to_date('12-10-2020', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 9992577847, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4259231067, '052 Maple Pass', 'land', 500, to_date('19-12-2020', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 8334941149, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1947849837, '62632 Thierer Drive', 'Hotel', 800, to_date('12-09-2021', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 4427272442, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1751609106, '3 Dixon Way', 'Apartment', 100, to_date('09-03-2021', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 2211965788, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9886682835, '384 Novick Park', 'land', 500, to_date('21-08-2021', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), 4471966292, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3133585528, '221 Tennessee Avenue', 'land', 500, to_date('25-02-2021', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 9877814153, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5362014774, '9 Bartillon Drive', 'office', 300, to_date('15-01-2021', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'), 3995261136, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4866365960, '51 Jana Circle', 'land', 500, to_date('29-04-2021', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 3337485563, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7785162935, '456 Clemons Avenue', 'land', 500, to_date('11-01-2021', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'), 1891219639, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6902701474, '54 Lakeland Hill', 'Hotel', 800, to_date('08-01-2021', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), 6769459998, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4210340623, '242 Twin Pines Pass', 'Hotel', 800, to_date('14-02-2021', 'dd-mm-yyyy'), to_date('30-01-2022', 'dd-mm-yyyy'), 2931666897, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3787366075, '1312 Milwaukee Place', 'Hotel', 800, to_date('12-03-2021', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'), 1999296696, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5462792083, '84 Eagle Crest Plaza', 'Hotel', 800, to_date('19-10-2020', 'dd-mm-yyyy'), to_date('19-05-2022', 'dd-mm-yyyy'), 7734731985, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7160654259, '44 Jay Place', 'land', 500, to_date('05-08-2021', 'dd-mm-yyyy'), to_date('17-08-2022', 'dd-mm-yyyy'), 9317891774, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3899914270, '0 Dayton Drive', 'office', 300, to_date('05-11-2020', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 5746146364, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7629344189, '1123 Rieder Junction', 'office', 300, to_date('07-09-2021', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 2538768487, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4969661459, '15 Algoma Pass', 'land', 500, to_date('17-11-2020', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 7575562786, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9268249802, '40 Sage Pass', 'Apartment', 100, to_date('11-05-2021', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 9273343542, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1086702539, '976 Cambridge Street', 'Hotel', 800, to_date('23-06-2021', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 4168397516, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2795720441, '8 Mesta Drive', 'Apartment', 100, to_date('28-05-2021', 'dd-mm-yyyy'), to_date('14-11-2022', 'dd-mm-yyyy'), 5635937656, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6707463501, '778 Beilfuss Terrace', 'Hotel', 800, to_date('09-08-2021', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 2989134417, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4770713625, '943 Loomis Lane', 'land', 500, to_date('21-11-2020', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'), 6561357232, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9923510736, '2 Norway Maple Center', 'office', 300, to_date('30-05-2021', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 6441149813, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9339003003, '7 Claremont Terrace', 'land', 500, to_date('08-08-2021', 'dd-mm-yyyy'), to_date('16-12-2022', 'dd-mm-yyyy'), 3688147648, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5478063659, '4764 Eagle Crest Plaza', 'land', 500, to_date('23-09-2021', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), 9781174318, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2955320312, '5 Fordem Junction', 'Hotel', 800, to_date('15-12-2020', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), 9358277964, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6067340267, '3 North Lane', 'Apartment', 100, to_date('14-12-2020', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'), 6794499952, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3450511606, '57636 Troy Road', 'Apartment', 100, to_date('11-08-2021', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'), 7314477652, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3994808567, '4 Maple Wood Point', 'Apartment', 100, to_date('08-10-2020', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), 6786213942, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9789146077, '3358 Golf View Alley', 'land', 500, to_date('20-07-2021', 'dd-mm-yyyy'), to_date('11-07-2022', 'dd-mm-yyyy'), 8368577148, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9722741632, '94200 Westridge Terrace', 'Apartment', 100, to_date('21-05-2021', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), 5847945678, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7963805027, '776 Cardinal Avenue', 'land', 500, to_date('09-01-2021', 'dd-mm-yyyy'), to_date('06-10-2022', 'dd-mm-yyyy'), 4685341693, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5149033567, '32 Grim Pass', 'Hotel', 800, to_date('24-11-2020', 'dd-mm-yyyy'), to_date('12-10-2022', 'dd-mm-yyyy'), 5856245445, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4569723803, '78 Vermont Way', 'Apartment', 100, to_date('23-01-2021', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 4295446744, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1286867153, '91984 Gateway Parkway', 'land', 500, to_date('15-10-2020', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 8613172535, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4443034975, '5263 Old Gate Point', 'office', 300, to_date('23-05-2021', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'), 5537394477, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4384527540, '29 Vermont Court', 'Apartment', 100, to_date('14-02-2021', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), 1982548571, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8494198796, '65630 Waxwing Alley', 'Hotel', 800, to_date('06-06-2021', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 2464419131, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9259080036, '9244 Dorton Center', 'Hotel', 800, to_date('22-10-2020', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), 6537778743, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2230417070, '2350 Mallory Pass', 'office', 300, to_date('03-03-2021', 'dd-mm-yyyy'), to_date('22-03-2022', 'dd-mm-yyyy'), 4146846981, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7963878211, '42017 Randy Drive', 'land', 500, to_date('15-09-2021', 'dd-mm-yyyy'), to_date('28-01-2022', 'dd-mm-yyyy'), 1326966921, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4220905402, '6177 South Court', 'Hotel', 800, to_date('20-04-2021', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 1822686733, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4109310732, '071 Bultman Pass', 'Apartment', 100, to_date('06-03-2021', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'), 5266472322, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4475790594, '844 Onsgard Plaza', 'Apartment', 100, to_date('08-07-2021', 'dd-mm-yyyy'), to_date('08-11-2022', 'dd-mm-yyyy'), 2652893613, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1989535044, '03 Northland Junction', 'office', 300, to_date('13-01-2021', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), 7637833876, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3295205865, '83 Portage Terrace', 'Hotel', 800, to_date('31-12-2020', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'), 8552459836, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5434641757, '1 Dahle Circle', 'land', 500, to_date('06-04-2021', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), 1252464813, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1820939272, '0458 Shoshone Park', 'Hotel', 800, to_date('28-06-2021', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), 4185413791, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2241491734, '5 Stuart Point', 'Hotel', 800, to_date('03-08-2021', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), 7589546594, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4990465096, '385 Delaware Circle', 'land', 500, to_date('17-05-2021', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 1918613131, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1515627603, '0 Badeau Lane', 'Hotel', 800, to_date('19-03-2021', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3789631937, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7345147047, '058 Sheridan Trail', 'land', 500, to_date('23-04-2021', 'dd-mm-yyyy'), to_date('29-06-2023', 'dd-mm-yyyy'), 3236776286, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3159215543, '99 Summer Ridge Lane', 'Apartment', 100, to_date('29-12-2020', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 4687272626, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1619479853, '34680 Arizona Circle', 'Hotel', 800, to_date('01-05-2021', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), 5222744793, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5124777926, '75 Dexter Place', 'office', 300, to_date('20-10-2020', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 9297327832, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4275411609, '93 Blue Bill Park Drive', 'office', 300, to_date('29-10-2020', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 2298965679, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6766432421, '260 Northwestern Trail', 'office', 300, to_date('13-09-2021', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 8688141884, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8345664350, '48 Randy Junction', 'land', 500, to_date('08-03-2021', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'), 2194666377, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3033704671, '90082 Farmco Park', 'office', 300, to_date('19-10-2020', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1891155287, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8404356381, '9057 Arrowood Road', 'land', 500, to_date('22-04-2021', 'dd-mm-yyyy'), to_date('23-04-2022', 'dd-mm-yyyy'), 3311687191, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8401699025, '00 Barnett Terrace', 'office', 300, to_date('13-01-2021', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 7223476559, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1633843733, '763 Oak Plaza', 'Hotel', 800, to_date('15-10-2020', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 3671333763, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1554000359, '42660 Daystar Hill', 'Apartment', 100, to_date('26-05-2021', 'dd-mm-yyyy'), to_date('02-02-2023', 'dd-mm-yyyy'), 9574279431, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7562163114, '75 Daystar Crossing', 'land', 500, to_date('16-07-2021', 'dd-mm-yyyy'), to_date('10-01-2022', 'dd-mm-yyyy'), 6263145256, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2023892596, '229 Sachs Junction', 'Apartment', 100, to_date('19-03-2021', 'dd-mm-yyyy'), to_date('28-08-2022', 'dd-mm-yyyy'), 8312714527, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8361127351, '3 Farmco Lane', 'land', 500, to_date('01-01-2021', 'dd-mm-yyyy'), to_date('25-11-2022', 'dd-mm-yyyy'), 7856625212, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7016775755, '23976 David Crossing', 'Apartment', 100, to_date('17-02-2021', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'), 8666756644, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4794469699, '5121 Weeping Birch Circle', 'office', 300, to_date('20-11-2020', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 9632833738, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9247514972, '9 Kipling Avenue', 'Hotel', 800, to_date('29-12-2020', 'dd-mm-yyyy'), to_date('27-11-2022', 'dd-mm-yyyy'), 1558671129, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7084055632, '5794 Mitchell Plaza', 'Apartment', 100, to_date('03-03-2021', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'), 4947749389, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9935438032, '4095 Bobwhite Plaza', 'Hotel', 800, to_date('08-02-2021', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 4485634271, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9456435150, '46312 Shopko Trail', 'Apartment', 100, to_date('23-10-2020', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), 8814989295, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2990732937, '950 Talmadge Junction', 'Apartment', 100, to_date('01-07-2021', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 4232346788, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7426200379, '095 Memorial Hill', 'Apartment', 100, to_date('03-11-2020', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'), 4828895987, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6613956007, '6 Ruskin Park', 'Hotel', 800, to_date('26-03-2021', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 8474714847, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2047556736, '31 Nelson Point', 'Apartment', 100, to_date('08-01-2021', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), 9586426278, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9812199767, '0343 Lawn Crossing', 'office', 300, to_date('04-10-2020', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), 1574356834, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7527827606, '38 5th Street', 'Apartment', 100, to_date('12-12-2020', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 1545919884, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2574461897, '6 Monica Crossing', 'Hotel', 800, to_date('27-05-2021', 'dd-mm-yyyy'), to_date('07-05-2022', 'dd-mm-yyyy'), 4313216129, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5791941422, '93424 Homewood Junction', 'office', 300, to_date('24-05-2021', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 4841422773, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8123358794, '2 Mcguire Court', 'land', 500, to_date('28-06-2021', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 8491577337, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6517395497, '99 Glendale Terrace', 'office', 300, to_date('05-09-2021', 'dd-mm-yyyy'), to_date('04-03-2023', 'dd-mm-yyyy'), 9288211241, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6570867231, '5 Cambridge Place', 'Apartment', 100, to_date('16-12-2020', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), 7153189418, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9578895163, '8179 Darwin Trail', 'Hotel', 800, to_date('24-04-2021', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 3254484582, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1391563333, '3 Harbort Point', 'office', 300, to_date('06-11-2020', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 2242972333, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3533484242, '03 Sloan Trail', 'Hotel', 800, to_date('09-03-2021', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 1557417384, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3352915106, '18 Esch Trail', 'office', 300, to_date('20-09-2021', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 8595366756, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3294095242, '6 Dawn Parkway', 'land', 500, to_date('29-08-2021', 'dd-mm-yyyy'), to_date('28-03-2022', 'dd-mm-yyyy'), 2411452572, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5253120199, '8207 Saint Paul Point', 'office', 300, to_date('16-07-2021', 'dd-mm-yyyy'), to_date('17-05-2022', 'dd-mm-yyyy'), 7462697486, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3211788090, '01662 Commercial Way', 'Apartment', 100, to_date('23-01-2021', 'dd-mm-yyyy'), to_date('07-08-2022', 'dd-mm-yyyy'), 2151622185, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5896502484, '700 Tennessee Parkway', 'land', 500, to_date('06-11-2020', 'dd-mm-yyyy'), to_date('14-08-2022', 'dd-mm-yyyy'), 8145984896, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7721504388, '27774 Pond Drive', 'Apartment', 100, to_date('17-10-2020', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 9182836259, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9648727523, '25 Cordelia Way', 'Hotel', 800, to_date('08-08-2021', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), 2389291999, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3877984032, '2470 Orin Parkway', 'Apartment', 100, to_date('25-06-2021', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), 8262797734, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6355309307, '2675 Dwight Park', 'land', 500, to_date('12-02-2021', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), 5133611251, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7093366225, '9 Schmedeman Road', 'office', 300, to_date('04-04-2021', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 8535345228, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6435057959, '310 Alpine Lane', 'land', 500, to_date('01-09-2021', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'), 9263977762, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6720610078, '85358 Hallows Parkway', 'Hotel', 800, to_date('14-09-2021', 'dd-mm-yyyy'), to_date('29-06-2023', 'dd-mm-yyyy'), 2116147667, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7806058341, '865 Arkansas Parkway', 'Hotel', 800, to_date('14-03-2021', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 3814719621, 25);
commit;
prompt 200 records committed...
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9554106426, '55 Talmadge Pass', 'Hotel', 800, to_date('31-01-2021', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 6424172964, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7209393362, '384 Crownhardt Place', 'office', 300, to_date('09-01-2021', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 1215377971, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7230450915, '5588 Hanson Place', 'Hotel', 800, to_date('16-08-2021', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), 6271724725, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1636001265, '06674 Talmadge Avenue', 'Hotel', 800, to_date('26-05-2021', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 2617574129, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3642902100, '51702 Main Road', 'Apartment', 100, to_date('17-11-2020', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 4178165241, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6964951056, '0799 Westport Drive', 'land', 500, to_date('01-12-2020', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 5397199644, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9664461214, '071 Myrtle Terrace', 'office', 300, to_date('23-12-2020', 'dd-mm-yyyy'), to_date('16-05-2022', 'dd-mm-yyyy'), 8132641268, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9602361589, '2 Bowman Trail', 'Apartment', 100, to_date('29-11-2020', 'dd-mm-yyyy'), to_date('10-06-2022', 'dd-mm-yyyy'), 4477446264, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1041011537, '38 Forest Plaza', 'office', 300, to_date('14-09-2021', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), 6775977362, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2736109200, '51682 Milwaukee Plaza', 'Hotel', 800, to_date('05-08-2021', 'dd-mm-yyyy'), to_date('07-04-2022', 'dd-mm-yyyy'), 2628998293, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7927911150, '94 Hoepker Court', 'Hotel', 800, to_date('11-04-2021', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), 7658738122, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4900602999, '97098 Kennedy Center', 'land', 500, to_date('01-09-2021', 'dd-mm-yyyy'), to_date('06-04-2022', 'dd-mm-yyyy'), 5877212239, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7067823222, '331 North Road', 'land', 500, to_date('24-06-2021', 'dd-mm-yyyy'), to_date('19-12-2021', 'dd-mm-yyyy'), 5799489168, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3103050114, '40 Prentice Road', 'office', 300, to_date('06-05-2021', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), 2795311965, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5513005926, '46 Golf View Terrace', 'land', 500, to_date('22-06-2021', 'dd-mm-yyyy'), to_date('14-07-2022', 'dd-mm-yyyy'), 4926143159, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9130032427, '380 Summit Point', 'land', 500, to_date('29-08-2021', 'dd-mm-yyyy'), to_date('31-07-2022', 'dd-mm-yyyy'), 3361638591, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7595464912, '5 Farragut Park', 'Hotel', 800, to_date('23-04-2021', 'dd-mm-yyyy'), to_date('19-07-2022', 'dd-mm-yyyy'), 5555537348, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3561588201, '8148 Westerfield Drive', 'Apartment', 100, to_date('31-05-2021', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'), 9848367623, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1248443820, '4 Old Shore Place', 'Hotel', 800, to_date('09-01-2021', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), 1472156759, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9540595214, '2983 Loeprich Lane', 'Apartment', 100, to_date('22-05-2021', 'dd-mm-yyyy'), to_date('20-11-2021', 'dd-mm-yyyy'), 7762114179, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3253266610, '6799 Dennis Crossing', 'land', 500, to_date('10-10-2020', 'dd-mm-yyyy'), to_date('05-01-2022', 'dd-mm-yyyy'), 3989192533, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4491485684, '04 Mcguire Terrace', 'Hotel', 800, to_date('08-01-2021', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 5194133875, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8312407490, '7155 Vahlen Place', 'office', 300, to_date('16-09-2021', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 3798279879, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7656473968, '51 Corry Road', 'office', 300, to_date('05-01-2021', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), 7447317627, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2017067629, '7587 Monument Alley', 'Apartment', 100, to_date('25-04-2021', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 3654654692, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7505177774, '3 Hallows Drive', 'office', 300, to_date('18-10-2020', 'dd-mm-yyyy'), to_date('18-09-2022', 'dd-mm-yyyy'), 2447112216, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6131063922, '8 Riverside Plaza', 'office', 300, to_date('20-11-2020', 'dd-mm-yyyy'), to_date('18-02-2022', 'dd-mm-yyyy'), 6371867477, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6821447958, '3 Thompson Park', 'Hotel', 800, to_date('13-01-2021', 'dd-mm-yyyy'), to_date('12-11-2021', 'dd-mm-yyyy'), 5327567578, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2650296849, '01 Lindbergh Circle', 'Hotel', 800, to_date('16-07-2021', 'dd-mm-yyyy'), to_date('04-12-2023', 'dd-mm-yyyy'), 8928992424, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6684889558, '4 Messerschmidt Alley', 'land', 500, to_date('21-02-2021', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), 9346399791, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2134724416, '52050 Northport Park', 'office', 300, to_date('19-02-2021', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 8374369274, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6122328113, '64082 Elka Pass', 'Apartment', 100, to_date('13-01-2021', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 7153662356, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9858075079, '1 Monterey Point', 'office', 300, to_date('02-05-2021', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 4964928271, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2850579592, '00922 Twin Pines Road', 'land', 500, to_date('07-08-2021', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 1565834716, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9759268384, '1224 Claremont Junction', 'land', 500, to_date('28-07-2021', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'), 4364493657, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4800177951, '26402 Longview Point', 'land', 500, to_date('28-09-2021', 'dd-mm-yyyy'), to_date('07-11-2023', 'dd-mm-yyyy'), 9673912665, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4489169750, '9 Mcbride Crossing', 'land', 500, to_date('02-08-2021', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 5168924484, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1046105790, '32437 Fremont Trail', 'Apartment', 100, to_date('11-11-2020', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'), 3568793363, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9186244715, '63 Daystar Center', 'land', 500, to_date('25-05-2021', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 2999722448, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3817575126, '82 Cherokee Way', 'Hotel', 800, to_date('14-01-2021', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), 2871978594, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9295921836, '68 Grayhawk Terrace', 'land', 500, to_date('24-10-2020', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'), 6915866749, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9578288739, '69 Hallows Drive', 'office', 300, to_date('30-12-2020', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 1858925246, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2486925077, '189 Grover Street', 'Hotel', 800, to_date('29-12-2020', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'), 9837494342, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6218752361, '5168 Vermont Crossing', 'Hotel', 800, to_date('29-01-2021', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 1613227394, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4902410515, '0 Monument Park', 'office', 300, to_date('06-06-2021', 'dd-mm-yyyy'), to_date('07-01-2022', 'dd-mm-yyyy'), 8146142557, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6519214320, '94 Westport Way', 'Apartment', 100, to_date('21-03-2021', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 7685767957, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8351193229, '8509 Dwight Alley', 'Apartment', 100, to_date('23-10-2020', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 6285298595, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1745220989, '12 Maple Wood Drive', 'office', 300, to_date('26-01-2021', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), 3478122384, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1462345852, '34598 Lawn Parkway', 'Hotel', 800, to_date('18-02-2021', 'dd-mm-yyyy'), to_date('31-05-2022', 'dd-mm-yyyy'), 9197584155, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2405324808, '86892 Mccormick Junction', 'land', 500, to_date('21-11-2020', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'), 6277365464, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7577019523, '6180 Eggendart Trail', 'office', 300, to_date('01-02-2021', 'dd-mm-yyyy'), to_date('17-04-2022', 'dd-mm-yyyy'), 4185733533, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7609678396, '3 Moulton Pass', 'office', 300, to_date('01-07-2021', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 4481431147, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2084006950, '972 Lighthouse Bay Terrace', 'Hotel', 800, to_date('26-10-2020', 'dd-mm-yyyy'), to_date('19-10-2022', 'dd-mm-yyyy'), 5651222298, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8005880142, '118 Darwin Alley', 'office', 300, to_date('02-05-2021', 'dd-mm-yyyy'), to_date('10-10-2023', 'dd-mm-yyyy'), 3785529772, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8769844530, '493 Ilene Pass', 'Apartment', 100, to_date('22-05-2021', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 5648443587, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9280166969, '66 Hazelcrest Drive', 'Apartment', 100, to_date('21-06-2021', 'dd-mm-yyyy'), to_date('20-11-2022', 'dd-mm-yyyy'), 3764995215, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8166995362, '13 Vermont Street', 'Apartment', 100, to_date('19-07-2021', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 4584246332, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3214807443, '3945 American Ash Court', 'office', 300, to_date('08-06-2021', 'dd-mm-yyyy'), to_date('26-07-2022', 'dd-mm-yyyy'), 4649114331, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8413545029, '64456 Carberry Drive', 'Apartment', 100, to_date('28-11-2020', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), 2658286596, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3556856508, '72 Reinke Plaza', 'Apartment', 100, to_date('22-05-2021', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 4163743852, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5292158812, '229 Dahle Lane', 'office', 300, to_date('13-09-2021', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 2598693481, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6664452390, '76 Old Shore Lane', 'Hotel', 800, to_date('24-02-2021', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), 9615467928, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1244412704, '34 Southridge Center', 'land', 500, to_date('18-08-2021', 'dd-mm-yyyy'), to_date('13-04-2022', 'dd-mm-yyyy'), 8863711117, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6624726310, '591 Marquette Crossing', 'Hotel', 800, to_date('15-01-2021', 'dd-mm-yyyy'), to_date('26-11-2021', 'dd-mm-yyyy'), 4333196364, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7052430295, '8754 Sycamore Terrace', 'Apartment', 100, to_date('03-04-2021', 'dd-mm-yyyy'), to_date('31-08-2022', 'dd-mm-yyyy'), 7415156747, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3769288391, '69 Hanson Crossing', 'office', 300, to_date('13-11-2020', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'), 4593717428, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1400268855, '341 Gateway Lane', 'office', 300, to_date('17-01-2021', 'dd-mm-yyyy'), to_date('19-01-2023', 'dd-mm-yyyy'), 8651255669, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4775596738, '5737 Roth Terrace', 'Apartment', 100, to_date('27-04-2021', 'dd-mm-yyyy'), to_date('02-05-2022', 'dd-mm-yyyy'), 4297133476, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7456854517, '14 Colorado Avenue', 'land', 500, to_date('27-09-2021', 'dd-mm-yyyy'), to_date('03-01-2022', 'dd-mm-yyyy'), 6563614192, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1216847634, '93129 Daystar Circle', 'Hotel', 800, to_date('28-07-2021', 'dd-mm-yyyy'), to_date('14-06-2022', 'dd-mm-yyyy'), 1281964953, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5584047219, '93 Mayfield Parkway', 'office', 300, to_date('26-05-2021', 'dd-mm-yyyy'), to_date('07-03-2022', 'dd-mm-yyyy'), 9829868553, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1691185515, '20 Doe Crossing Avenue', 'land', 500, to_date('17-08-2021', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 5766697281, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2535415078, '539 Barnett Terrace', 'office', 300, to_date('01-11-2020', 'dd-mm-yyyy'), to_date('08-07-2022', 'dd-mm-yyyy'), 2324346182, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5039888048, '23780 Blaine Trail', 'Hotel', 800, to_date('14-11-2020', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), 2629944151, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5105465284, '129 Boyd Avenue', 'land', 500, to_date('19-11-2020', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), 9154498274, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2885291270, '97210 Warner Junction', 'office', 300, to_date('02-09-2021', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 1796388858, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4056887109, '88027 Corben Court', 'Apartment', 100, to_date('27-03-2021', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), 6764696344, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4696237378, '95763 Shasta Lane', 'Apartment', 100, to_date('20-12-2020', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 5445886759, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1641255013, '9584 Swallow Plaza', 'Hotel', 800, to_date('30-03-2021', 'dd-mm-yyyy'), to_date('30-08-2022', 'dd-mm-yyyy'), 7959151316, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5311153123, '34306 Utah Junction', 'land', 500, to_date('20-11-2020', 'dd-mm-yyyy'), to_date('28-05-2022', 'dd-mm-yyyy'), 8421341913, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5737967291, '68103 Laurel Terrace', 'office', 300, to_date('06-08-2021', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'), 7537563939, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7994468695, '8 Londonderry Lane', 'Apartment', 100, to_date('10-06-2021', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), 2229849136, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5661209883, '5 Center Center', 'land', 500, to_date('24-02-2021', 'dd-mm-yyyy'), to_date('06-11-2021', 'dd-mm-yyyy'), 7566335653, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9043304204, '991 Larry Way', 'Hotel', 800, to_date('19-07-2021', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 8981654921, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9469660734, '4182 Transport Point', 'Apartment', 100, to_date('02-02-2021', 'dd-mm-yyyy'), to_date('27-02-2022', 'dd-mm-yyyy'), 5681232999, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2569653887, '2843 Riverside Hill', 'Hotel', 800, to_date('30-05-2021', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 3352221815, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7364782150, '7109 Grayhawk Center', 'Hotel', 800, to_date('11-07-2021', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), 3985994693, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7399429664, '7 Sullivan Plaza', 'Apartment', 100, to_date('02-04-2021', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 7973596365, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9638313312, '3 Glendale Hill', 'Apartment', 100, to_date('02-12-2020', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 4561385332, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8931445919, '467 Clarendon Center', 'Hotel', 800, to_date('30-07-2021', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 4951661462, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6278177294, '2 Stuart Crossing', 'Apartment', 100, to_date('09-02-2021', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 9334379264, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3079205689, '5 Corscot Parkway', 'office', 300, to_date('03-07-2021', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 5394564919, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5146439610, '3429 Delladonna Point', 'Hotel', 800, to_date('27-05-2021', 'dd-mm-yyyy'), to_date('12-10-2022', 'dd-mm-yyyy'), 5568856178, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9338252812, '69141 Manley Junction', 'office', 300, to_date('02-06-2021', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), 4844171756, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2312620260, '7 Dryden Terrace', 'Hotel', 800, to_date('23-10-2020', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 2117975264, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5240519012, '93969 Hermina Parkway', 'office', 300, to_date('26-07-2021', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1726756224, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8671175088, '4 Onsgard Parkway', 'land', 500, to_date('19-09-2021', 'dd-mm-yyyy'), to_date('07-09-2022', 'dd-mm-yyyy'), 5661359651, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6988263092, '30 Mesta Point', 'Hotel', 800, to_date('04-04-2021', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 5313199237, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5795473406, '96807 Steensland Court', 'Hotel', 800, to_date('17-11-2020', 'dd-mm-yyyy'), to_date('11-02-2022', 'dd-mm-yyyy'), 5538114597, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3396896996, '1 Shasta Crossing', 'office', 300, to_date('02-10-2021', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'), 5582234829, 30);
commit;
prompt 300 records committed...
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8164753030, '75 Arrowood Circle', 'Apartment', 100, to_date('11-09-2021', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), 5855814678, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2717637233, '022 Mandrake Park', 'office', 300, to_date('22-10-2020', 'dd-mm-yyyy'), to_date('17-04-2022', 'dd-mm-yyyy'), 3154335321, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7725831750, '0 Beilfuss Drive', 'Hotel', 800, to_date('31-01-2021', 'dd-mm-yyyy'), to_date('27-09-2022', 'dd-mm-yyyy'), 4368848717, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1573637633, '725 American Center', 'Hotel', 800, to_date('11-02-2021', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 5498647191, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9099696492, '2879 Comanche Court', 'Apartment', 100, to_date('07-01-2021', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), 9142435762, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1760892314, '86 Hallows Avenue', 'office', 300, to_date('30-09-2021', 'dd-mm-yyyy'), to_date('15-12-2021', 'dd-mm-yyyy'), 7332468413, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8384245951, '1 Sunnyside Parkway', 'Apartment', 100, to_date('16-03-2021', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 3714195382, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5456897652, '27 East Hill', 'office', 300, to_date('14-02-2021', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 8483159579, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7636190637, '2751 Namekagon Pass', 'land', 500, to_date('11-11-2020', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 7598254851, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8429461726, '449 Beilfuss Center', 'land', 500, to_date('09-11-2020', 'dd-mm-yyyy'), to_date('12-01-2022', 'dd-mm-yyyy'), 4963115294, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3435489165, '045 Lunder Terrace', 'Hotel', 800, to_date('05-12-2020', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), 8117638562, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5101539127, '483 Main Point', 'office', 300, to_date('19-08-2021', 'dd-mm-yyyy'), to_date('01-04-2022', 'dd-mm-yyyy'), 2551276128, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9738617984, '6510 Northfield Alley', 'Hotel', 800, to_date('22-07-2021', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'), 5448466479, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4644462001, '994 Corben Court', 'land', 500, to_date('29-06-2021', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 2384828386, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4914950164, '0 Hoard Hill', 'land', 500, to_date('18-08-2021', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 5792543598, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1992531343, '51614 Ilene Place', 'Hotel', 800, to_date('09-04-2021', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 6644866893, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9691187776, '75 Walton Point', 'Hotel', 800, to_date('24-02-2021', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'), 4786651373, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7907310280, '80 Delladonna Lane', 'Apartment', 100, to_date('05-07-2021', 'dd-mm-yyyy'), to_date('21-12-2021', 'dd-mm-yyyy'), 8679186711, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4463515070, '56863 Colorado Center', 'Hotel', 800, to_date('05-04-2021', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 3995376445, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2819312058, '3 Vahlen Center', 'office', 300, to_date('05-05-2021', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'), 8446263762, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1967564278, '78703 Raven Point', 'Hotel', 800, to_date('25-08-2021', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), 7214938872, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6081880622, '45067 Carberry Hill', 'office', 300, to_date('27-04-2021', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), 5721949743, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2189282469, '1889 Clyde Gallagher Park', 'land', 500, to_date('30-05-2021', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 6175197286, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2449849865, '4660 Maywood Hill', 'land', 500, to_date('14-08-2021', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), 8926282748, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4699154469, '63288 Lake View Park', 'land', 500, to_date('01-11-2020', 'dd-mm-yyyy'), to_date('13-09-2022', 'dd-mm-yyyy'), 2512132428, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8869303099, '10 Carberry Point', 'office', 300, to_date('14-03-2021', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 9128556832, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4332441703, '050 Fordem Alley', 'office', 300, to_date('11-08-2021', 'dd-mm-yyyy'), to_date('22-05-2022', 'dd-mm-yyyy'), 7936718619, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2313590688, '977 Reindahl Place', 'land', 500, to_date('01-09-2021', 'dd-mm-yyyy'), to_date('02-04-2022', 'dd-mm-yyyy'), 5766963764, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1098679396, '97 Loftsgordon Road', 'Hotel', 800, to_date('08-02-2021', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), 8955888356, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5417037007, '776 Riverside Lane', 'Hotel', 800, to_date('12-01-2021', 'dd-mm-yyyy'), to_date('09-09-2022', 'dd-mm-yyyy'), 8268579277, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8424183860, '109 Elka Pass', 'Apartment', 100, to_date('18-09-2021', 'dd-mm-yyyy'), to_date('23-10-2022', 'dd-mm-yyyy'), 2886648525, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5208354280, '06306 Susan Park', 'office', 300, to_date('23-05-2021', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'), 1772653857, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7625239188, '91501 Armistice Way', 'office', 300, to_date('08-09-2021', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 2363661557, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8872444449, '2 Nevada Way', 'Apartment', 100, to_date('11-03-2021', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 1494366839, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9654295425, '53 Texas Street', 'Apartment', 100, to_date('17-11-2020', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 2554219385, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9290263895, '5 Longview Center', 'Hotel', 800, to_date('29-08-2021', 'dd-mm-yyyy'), to_date('20-08-2022', 'dd-mm-yyyy'), 8695394947, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6881810211, '44 Moulton Place', 'Hotel', 800, to_date('04-01-2021', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 9123736588, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5561269008, '540 Fuller Street', 'land', 500, to_date('17-08-2021', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), 5165328338, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8199889246, '98594 David Point', 'Hotel', 800, to_date('04-07-2021', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'), 4393326281, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6822832032, '35988 Arizona Center', 'office', 300, to_date('23-04-2021', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 8493468112, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2638543687, '9139 Pearson Park', 'Apartment', 100, to_date('20-12-2020', 'dd-mm-yyyy'), to_date('11-05-2022', 'dd-mm-yyyy'), 3631696238, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5779254416, '79251 Pond Way', 'Apartment', 100, to_date('14-08-2021', 'dd-mm-yyyy'), to_date('18-04-2022', 'dd-mm-yyyy'), 4972377698, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1374296008, '57340 Chive Drive', 'Hotel', 800, to_date('08-10-2020', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 2255727428, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3847266698, '520 Roxbury Lane', 'Apartment', 100, to_date('15-11-2020', 'dd-mm-yyyy'), to_date('19-04-2022', 'dd-mm-yyyy'), 7534926872, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5164936028, '89208 Golf Course Park', 'office', 300, to_date('06-12-2020', 'dd-mm-yyyy'), to_date('12-05-2022', 'dd-mm-yyyy'), 2166934128, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3777455169, '94 6th Court', 'office', 300, to_date('14-11-2020', 'dd-mm-yyyy'), to_date('23-06-2022', 'dd-mm-yyyy'), 5662161994, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9343519676, '297 Lakewood Court', 'office', 300, to_date('25-02-2021', 'dd-mm-yyyy'), to_date('11-01-2022', 'dd-mm-yyyy'), 7432379598, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6442508808, '51193 Corry Place', 'land', 500, to_date('15-10-2020', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'), 5933246817, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8186306822, '177 Northwestern Trail', 'Apartment', 100, to_date('06-11-2020', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 7232214848, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9162989180, '9691 Hanover Court', 'office', 300, to_date('25-02-2021', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 9214671395, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7436499969, '19 Coleman Drive', 'land', 500, to_date('09-03-2021', 'dd-mm-yyyy'), to_date('31-12-2022', 'dd-mm-yyyy'), 3358837585, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3087270475, '80 Hauk Alley', 'Hotel', 800, to_date('01-06-2021', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), 7494443274, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5234310037, '9 Burrows Crossing', 'land', 500, to_date('12-06-2021', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), 9586323889, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7828499192, '4 Lotheville Circle', 'Apartment', 100, to_date('01-02-2021', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 8338351458, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3863993136, '73250 Northview Center', 'Apartment', 100, to_date('08-06-2021', 'dd-mm-yyyy'), to_date('28-09-2022', 'dd-mm-yyyy'), 1885613693, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2894369998, '178 Truax Lane', 'Apartment', 100, to_date('05-01-2021', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 5949649787, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9452957378, '9829 Hudson Junction', 'Apartment', 100, to_date('27-07-2021', 'dd-mm-yyyy'), to_date('30-11-2021', 'dd-mm-yyyy'), 7856264556, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2158667137, '60 Becker Street', 'land', 500, to_date('04-10-2020', 'dd-mm-yyyy'), to_date('19-11-2022', 'dd-mm-yyyy'), 4166236398, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1736993118, '72190 North Plaza', 'land', 500, to_date('02-02-2021', 'dd-mm-yyyy'), to_date('08-06-2022', 'dd-mm-yyyy'), 6227681244, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9261301886, '79 Division Junction', 'land', 500, to_date('09-12-2020', 'dd-mm-yyyy'), to_date('27-12-2022', 'dd-mm-yyyy'), 6917521728, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4020816376, '402 Fairfield Trail', 'Apartment', 100, to_date('20-04-2021', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 9169652381, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7314556454, '823 Marquette Center', 'office', 300, to_date('22-06-2021', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'), 5365876658, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7496485111, '32310 Logan Center', 'office', 300, to_date('14-02-2021', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'), 5393842389, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9915918596, '4 Maple Road', 'land', 500, to_date('02-09-2021', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), 1882193391, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1783981364, '8948 Vahlen Lane', 'office', 300, to_date('30-05-2021', 'dd-mm-yyyy'), to_date('19-03-2022', 'dd-mm-yyyy'), 3381517824, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2471212356, '756 Mcbride Lane', 'Apartment', 100, to_date('12-02-2021', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 6865451711, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3961040557, '6317 Vera Terrace', 'Hotel', 800, to_date('21-11-2020', 'dd-mm-yyyy'), to_date('12-03-2022', 'dd-mm-yyyy'), 6297686815, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3469972007, '6469 Michigan Way', 'land', 500, to_date('04-01-2021', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'), 4131118948, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4633957508, '64964 Schmedeman Place', 'office', 300, to_date('15-04-2021', 'dd-mm-yyyy'), to_date('27-05-2022', 'dd-mm-yyyy'), 5329583566, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7890353517, '2457 Weeping Birch Terrace', 'office', 300, to_date('07-06-2021', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 6476319398, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4831583292, '274 Ramsey Parkway', 'office', 300, to_date('20-12-2020', 'dd-mm-yyyy'), to_date('13-11-2022', 'dd-mm-yyyy'), 1942157435, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3121484229, '65620 Marquette Road', 'Apartment', 100, to_date('21-03-2021', 'dd-mm-yyyy'), to_date('05-02-2022', 'dd-mm-yyyy'), 7314372264, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3983338473, '0 Eagan Crossing', 'Apartment', 100, to_date('11-03-2021', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 8542451742, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5147891134, '00060 Stoughton Junction', 'Apartment', 100, to_date('08-05-2021', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), 3576298243, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4391166061, '25 Sachtjen Point', 'Apartment', 100, to_date('01-06-2021', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 6649259712, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3718694677, '689 Kennedy Point', 'office', 300, to_date('15-11-2020', 'dd-mm-yyyy'), to_date('29-07-2022', 'dd-mm-yyyy'), 6747552976, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2409943909, '1179 Harbort Terrace', 'office', 300, to_date('02-07-2021', 'dd-mm-yyyy'), to_date('31-05-2022', 'dd-mm-yyyy'), 5132233416, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5445824857, '26 Monica Alley', 'land', 500, to_date('14-03-2021', 'dd-mm-yyyy'), to_date('15-03-2023', 'dd-mm-yyyy'), 1799656924, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5020588366, '11 Weeping Birch Way', 'Hotel', 800, to_date('02-10-2021', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), 5144434955, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8446932427, '775 Loftsgordon Plaza', 'office', 300, to_date('21-01-2021', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'), 2936693947, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7535524459, '57 Bonner Alley', 'Apartment', 100, to_date('01-02-2021', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 4249811245, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4853389268, '0 Haas Lane', 'Hotel', 800, to_date('27-04-2021', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 1196353674, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6089333170, '692 Magdeline Plaza', 'Apartment', 100, to_date('18-08-2021', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 9695539818, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (6732207586, '5 Nancy Parkway', 'Hotel', 800, to_date('01-04-2021', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 9138129716, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9354706968, '3 Lotheville Hill', 'Apartment', 100, to_date('26-08-2021', 'dd-mm-yyyy'), to_date('13-03-2022', 'dd-mm-yyyy'), 6837512131, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7683360563, '7 Carey Trail', 'Apartment', 100, to_date('08-10-2020', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 8411468431, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8629643062, '0 Laurel Point', 'Hotel', 800, to_date('11-08-2021', 'dd-mm-yyyy'), to_date('29-04-2022', 'dd-mm-yyyy'), 3694621928, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (8693128990, '1 Armistice Center', 'office', 300, to_date('18-05-2021', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), 8617915744, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2576960456, '857 Shopko Park', 'office', 300, to_date('11-11-2020', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), 3897721262, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (9524729092, '4345 Gerald Circle', 'Hotel', 800, to_date('10-08-2021', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 5451354627, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (7307441345, '3 Stephen Circle', 'Hotel', 800, to_date('24-07-2021', 'dd-mm-yyyy'), to_date('20-01-2022', 'dd-mm-yyyy'), 1443299343, 25);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1675548380, '7748 Milwaukee Crossing', 'Apartment', 100, to_date('09-09-2021', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 9322173772, 20);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3464051905, '30456 Roth Place', 'land', 500, to_date('08-01-2021', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), 7133283645, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2547381931, '7234 Canary Plaza', 'land', 500, to_date('19-04-2021', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 2343668464, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (2369227718, '3160 Green Ridge Place', 'office', 300, to_date('29-04-2021', 'dd-mm-yyyy'), to_date('06-12-2021', 'dd-mm-yyyy'), 3921177167, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3514674840, '2991 Lerdahl Drive', 'office', 300, to_date('03-01-2021', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 5475167869, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3962404287, '5 Pierstorff Terrace', 'land', 500, to_date('09-02-2021', 'dd-mm-yyyy'), to_date('31-05-2022', 'dd-mm-yyyy'), 1553993598, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3088353260, '8 Lakewood Way', 'office', 300, to_date('27-03-2021', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 1294724161, 30);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4579341065, '021 Porter Hill', 'land', 500, to_date('14-12-2020', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'), 1175969255, 15);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (4033013637, '82962 Toban Pass', 'office', 300, to_date('30-03-2021', 'dd-mm-yyyy'), to_date('14-09-2022', 'dd-mm-yyyy'), 2783928517, 5);
commit;
prompt 400 records committed...
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (1258965826, ' Katmon Jerusalem', 'Apartment', 100, to_date('12-01-2014', 'dd-mm-yyyy'), to_date('01-08-2020', 'dd-mm-yyyy'), 2247813915, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (5894565826, ' Allenby Tel Aviv', 'Hotel', 800, to_date('11-02-2015', 'dd-mm-yyyy'), to_date('02-08-2024', 'dd-mm-yyyy'), 5844314832, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3258969786, ' Moshe Dayan Pisgat Ze''ev', 'office', 300, to_date('03-05-2017', 'dd-mm-yyyy'), to_date('01-09-2019', 'dd-mm-yyyy'), 7342291545, 5);
insert into ASSET (asset_id, asset_address, asset_type, asset_area, asset_purchase, asset_change, tax_id, bonus)
values (3256666986, ' Beit Hadfus ', 'office', 300, to_date('03-05-2015', 'dd-mm-yyyy'), to_date('01-09-2019', 'dd-mm-yyyy'), 1234567891, 5);
commit;
prompt 404 records loaded
prompt Loading DEBT...
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3186373268, 399, to_date('17-06-2018', 'dd-mm-yyyy'), to_date('27-12-2021', 'dd-mm-yyyy'), 4828895987);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8753273135, 5, to_date('28-12-2018', 'dd-mm-yyyy'), to_date('05-09-2016', 'dd-mm-yyyy'), 8312714527);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7664636334, 179, to_date('01-02-2017', 'dd-mm-yyyy'), to_date('10-09-2022', 'dd-mm-yyyy'), 9992577847);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5323643365, 99, to_date('30-10-2017', 'dd-mm-yyyy'), to_date('22-05-2012', 'dd-mm-yyyy'), 1175969255);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8274549457, 578, to_date('21-03-2017', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), 7734731985);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9191657577, 34, to_date('21-10-2019', 'dd-mm-yyyy'), to_date('12-08-2019', 'dd-mm-yyyy'), 2255727428);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3954383747, 172, to_date('22-07-2018', 'dd-mm-yyyy'), to_date('11-12-2020', 'dd-mm-yyyy'), 2194666377);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9258498279, 179, to_date('20-09-2017', 'dd-mm-yyyy'), to_date('06-05-2011', 'dd-mm-yyyy'), 6818789889);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1798217392, 15, to_date('05-04-2017', 'dd-mm-yyyy'), to_date('10-10-2020', 'dd-mm-yyyy'), 4786651373);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4982851516, 149, to_date('04-01-2019', 'dd-mm-yyyy'), to_date('20-12-2017', 'dd-mm-yyyy'), 6297686815);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9361914967, 269, to_date('13-06-2019', 'dd-mm-yyyy'), to_date('18-09-2010', 'dd-mm-yyyy'), 6915866749);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7881892399, 238, to_date('13-11-2018', 'dd-mm-yyyy'), to_date('01-03-2016', 'dd-mm-yyyy'), 4926143159);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2917282153, 229, to_date('24-04-2019', 'dd-mm-yyyy'), to_date('18-07-2012', 'dd-mm-yyyy'), 6285298595);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4787913838, 20, to_date('14-07-2017', 'dd-mm-yyyy'), to_date('09-06-2021', 'dd-mm-yyyy'), 1142896819);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5849413292, 4, to_date('10-05-2019', 'dd-mm-yyyy'), to_date('09-01-2013', 'dd-mm-yyyy'), 5313199237);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6684342227, 58, to_date('04-08-2018', 'dd-mm-yyyy'), to_date('12-11-2017', 'dd-mm-yyyy'), 6649259712);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4999455757, 152, to_date('20-11-2017', 'dd-mm-yyyy'), to_date('29-07-2018', 'dd-mm-yyyy'), 6764696344);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4938481438, 159, to_date('20-04-2019', 'dd-mm-yyyy'), to_date('19-09-2016', 'dd-mm-yyyy'), 9273343542);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2775929984, 109, to_date('28-05-2017', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), 8334941149);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4811633135, 27, to_date('14-04-2019', 'dd-mm-yyyy'), to_date('22-11-2018', 'dd-mm-yyyy'), 5222744793);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1943614255, 65, to_date('27-03-2018', 'dd-mm-yyyy'), to_date('28-05-2019', 'dd-mm-yyyy'), 2757791555);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1126692866, 179, to_date('26-01-2018', 'dd-mm-yyyy'), to_date('29-08-2018', 'dd-mm-yyyy'), 5746146364);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3331734767, 56, to_date('08-11-2017', 'dd-mm-yyyy'), to_date('24-12-2015', 'dd-mm-yyyy'), 7415156747);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5917858182, 119, to_date('29-01-2019', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 6476319398);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6693539832, 105, to_date('31-12-2019', 'dd-mm-yyyy'), to_date('02-07-2014', 'dd-mm-yyyy'), 6747552976);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5879756754, 49, to_date('11-11-2017', 'dd-mm-yyyy'), to_date('22-05-2018', 'dd-mm-yyyy'), 2757791555);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1961439741, 105, to_date('20-04-2018', 'dd-mm-yyyy'), to_date('22-12-2015', 'dd-mm-yyyy'), 5847945678);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9866778841, 239, to_date('16-12-2017', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), 8421341913);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4562136641, 109, to_date('16-09-2019', 'dd-mm-yyyy'), to_date('07-10-2020', 'dd-mm-yyyy'), 1822686733);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3866826351, 28, to_date('21-03-2019', 'dd-mm-yyyy'), to_date('02-04-2017', 'dd-mm-yyyy'), 7318887334);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7156247253, 45, to_date('02-07-2018', 'dd-mm-yyyy'), to_date('11-08-2020', 'dd-mm-yyyy'), 2411452572);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5286169853, 199, to_date('06-09-2019', 'dd-mm-yyyy'), to_date('02-06-2016', 'dd-mm-yyyy'), 9154498274);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6337584384, 35, to_date('13-07-2017', 'dd-mm-yyyy'), to_date('02-04-2021', 'dd-mm-yyyy'), 7214938872);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3853253619, 42, to_date('05-03-2017', 'dd-mm-yyyy'), to_date('05-01-2014', 'dd-mm-yyyy'), 1999296696);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4779236376, 125, to_date('04-12-2018', 'dd-mm-yyyy'), to_date('25-01-2016', 'dd-mm-yyyy'), 5133611251);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8412696856, 265, to_date('08-03-2018', 'dd-mm-yyyy'), to_date('04-08-2013', 'dd-mm-yyyy'), 9837494342);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1539425976, 48, to_date('14-05-2019', 'dd-mm-yyyy'), to_date('13-07-2020', 'dd-mm-yyyy'), 8421341913);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2584496789, 12, to_date('06-09-2018', 'dd-mm-yyyy'), to_date('14-04-2014', 'dd-mm-yyyy'), 5799489168);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4597521875, 76, to_date('29-09-2017', 'dd-mm-yyyy'), to_date('22-11-2016', 'dd-mm-yyyy'), 3568793363);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5779363912, 579, to_date('21-08-2017', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), 4477446264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4151663218, 245, to_date('06-02-2018', 'dd-mm-yyyy'), to_date('15-07-2013', 'dd-mm-yyyy'), 5475167869);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2281998531, 245, to_date('02-09-2017', 'dd-mm-yyyy'), to_date('23-12-2021', 'dd-mm-yyyy'), 2247813915);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3267539794, 39, to_date('05-06-2018', 'dd-mm-yyyy'), to_date('23-02-2011', 'dd-mm-yyyy'), 2166934128);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5971953452, 90, to_date('10-06-2018', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), 7598254851);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4997641175, 1, to_date('19-02-2018', 'dd-mm-yyyy'), to_date('08-12-2019', 'dd-mm-yyyy'), 6263145256);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4468138721, 89, to_date('09-03-2019', 'dd-mm-yyyy'), to_date('14-10-2018', 'dd-mm-yyyy'), 2871978594);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6596731176, 25, to_date('31-07-2019', 'dd-mm-yyyy'), to_date('04-08-2015', 'dd-mm-yyyy'), 8421341913);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3693284652, 82, to_date('05-07-2018', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 4313216129);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4917888887, 45, to_date('12-06-2019', 'dd-mm-yyyy'), to_date('07-08-2010', 'dd-mm-yyyy'), 5393842389);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7838887723, 265, to_date('11-12-2019', 'dd-mm-yyyy'), to_date('19-04-2020', 'dd-mm-yyyy'), 9483442283);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9995182532, 319, to_date('27-10-2018', 'dd-mm-yyyy'), to_date('26-05-2012', 'dd-mm-yyyy'), 9853322754);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4478363225, 155, to_date('19-12-2017', 'dd-mm-yyyy'), to_date('30-08-2012', 'dd-mm-yyyy'), 1523698569);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1542979267, 215, to_date('16-11-2018', 'dd-mm-yyyy'), to_date('02-07-2022', 'dd-mm-yyyy'), 1252464813);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2657914742, 169, to_date('19-09-2019', 'dd-mm-yyyy'), to_date('10-11-2014', 'dd-mm-yyyy'), 6561357232);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8458572583, 375, to_date('17-02-2017', 'dd-mm-yyyy'), to_date('15-09-2010', 'dd-mm-yyyy'), 1557417384);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3282614583, 129, to_date('11-02-2017', 'dd-mm-yyyy'), to_date('04-02-2011', 'dd-mm-yyyy'), 5169775417);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6582429755, 69, to_date('03-01-2018', 'dd-mm-yyyy'), to_date('06-12-2021', 'dd-mm-yyyy'), 1175969255);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3552922793, 125, to_date('03-12-2019', 'dd-mm-yyyy'), to_date('07-11-2020', 'dd-mm-yyyy'), 2954698321);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2946579376, 229, to_date('15-09-2019', 'dd-mm-yyyy'), to_date('30-04-2011', 'dd-mm-yyyy'), 6175197286);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9669157767, 94, to_date('14-09-2019', 'dd-mm-yyyy'), to_date('11-11-2021', 'dd-mm-yyyy'), 5877212239);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9872667487, 75, to_date('30-04-2019', 'dd-mm-yyyy'), to_date('20-06-2016', 'dd-mm-yyyy'), 1545919884);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2556273383, 229, to_date('30-12-2019', 'dd-mm-yyyy'), to_date('04-10-2021', 'dd-mm-yyyy'), 5681232999);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7514331345, 849, to_date('21-06-2017', 'dd-mm-yyyy'), to_date('08-09-2013', 'dd-mm-yyyy'), 1557417384);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1326583843, 49, to_date('21-08-2017', 'dd-mm-yyyy'), to_date('27-07-2018', 'dd-mm-yyyy'), 9214671395);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2489488314, 179, to_date('03-04-2018', 'dd-mm-yyyy'), to_date('12-02-2010', 'dd-mm-yyyy'), 6277365464);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8498823256, 25, to_date('14-07-2019', 'dd-mm-yyyy'), to_date('21-01-2015', 'dd-mm-yyyy'), 2629944151);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1659955299, 44, to_date('17-12-2019', 'dd-mm-yyyy'), to_date('01-07-2014', 'dd-mm-yyyy'), 3478122384);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3954364214, 145, to_date('14-05-2019', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 9322173772);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3467785556, 48, to_date('30-06-2018', 'dd-mm-yyyy'), to_date('05-06-2010', 'dd-mm-yyyy'), 3478122384);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1147351847, 179, to_date('16-12-2017', 'dd-mm-yyyy'), to_date('21-10-2018', 'dd-mm-yyyy'), 6317891282);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5538793428, 175, to_date('16-10-2019', 'dd-mm-yyyy'), to_date('08-03-2022', 'dd-mm-yyyy'), 1234567891);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4131744329, 235, to_date('02-12-2018', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 4922593656);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9233978888, 149, to_date('20-03-2018', 'dd-mm-yyyy'), to_date('19-11-2012', 'dd-mm-yyyy'), 1885613693);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9991116922, 198, to_date('05-03-2018', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), 5796492881);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9225597573, 10, to_date('01-10-2018', 'dd-mm-yyyy'), to_date('16-02-2022', 'dd-mm-yyyy'), 2255727428);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6284315953, 235, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-03-2013', 'dd-mm-yyyy'), 1982548571);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2825939284, 169, to_date('07-09-2017', 'dd-mm-yyyy'), to_date('10-05-2014', 'dd-mm-yyyy'), 3798279879);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4423124376, 135, to_date('19-07-2019', 'dd-mm-yyyy'), to_date('26-10-2010', 'dd-mm-yyyy'), 4168397516);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4498464763, 241, to_date('04-03-2019', 'dd-mm-yyyy'), to_date('26-02-2020', 'dd-mm-yyyy'), 2324346182);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5398696299, 2, to_date('22-09-2017', 'dd-mm-yyyy'), to_date('25-05-2018', 'dd-mm-yyyy'), 4297133476);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9367917864, 125, to_date('19-10-2019', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'), 6263145256);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9265291382, 579, to_date('13-11-2019', 'dd-mm-yyyy'), to_date('23-02-2022', 'dd-mm-yyyy'), 8864155356);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1119889262, 69, to_date('05-11-2019', 'dd-mm-yyyy'), to_date('04-03-2013', 'dd-mm-yyyy'), 5796492881);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4894428397, 94, to_date('16-01-2017', 'dd-mm-yyyy'), to_date('24-04-2015', 'dd-mm-yyyy'), 7959151316);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6911142185, 159, to_date('25-06-2017', 'dd-mm-yyyy'), to_date('27-08-2021', 'dd-mm-yyyy'), 5746146364);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5171754626, 269, to_date('11-08-2017', 'dd-mm-yyyy'), to_date('18-05-2013', 'dd-mm-yyyy'), 2757791555);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2757788148, 58, to_date('12-01-2019', 'dd-mm-yyyy'), to_date('01-10-2019', 'dd-mm-yyyy'), 4477446264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8237615844, 499, to_date('14-09-2018', 'dd-mm-yyyy'), to_date('25-01-2013', 'dd-mm-yyyy'), 2918995427);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3519726985, 89, to_date('30-05-2018', 'dd-mm-yyyy'), to_date('03-04-2010', 'dd-mm-yyyy'), 3254484582);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9941456532, 255, to_date('21-01-2017', 'dd-mm-yyyy'), to_date('29-05-2014', 'dd-mm-yyyy'), 6263145256);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1592914596, 10, to_date('14-12-2018', 'dd-mm-yyyy'), to_date('04-01-2021', 'dd-mm-yyyy'), 4313216129);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7418133583, 45, to_date('08-01-2019', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'), 9848367623);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5347659168, 285, to_date('07-08-2019', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), 1215377971);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9168691658, 27, to_date('06-07-2019', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'), 6986364288);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3145273493, 75, to_date('09-11-2018', 'dd-mm-yyyy'), to_date('26-12-2020', 'dd-mm-yyyy'), 9483442283);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5359324945, 140, to_date('24-02-2019', 'dd-mm-yyyy'), to_date('13-08-2012', 'dd-mm-yyyy'), 3921177167);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2687774252, 55, to_date('24-11-2018', 'dd-mm-yyyy'), to_date('01-09-2016', 'dd-mm-yyyy'), 1553993598);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6195575539, 129, to_date('30-08-2017', 'dd-mm-yyyy'), to_date('26-08-2021', 'dd-mm-yyyy'), 8666756644);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4681845173, 13, to_date('15-06-2017', 'dd-mm-yyyy'), to_date('04-12-2016', 'dd-mm-yyyy'), 8334941149);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6933378727, 38, to_date('25-03-2017', 'dd-mm-yyyy'), to_date('06-10-2012', 'dd-mm-yyyy'), 5329583566);
commit;
prompt 100 records committed...
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5799496758, 45, to_date('25-02-2017', 'dd-mm-yyyy'), to_date('22-11-2014', 'dd-mm-yyyy'), 2628998293);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6128444669, 39, to_date('06-11-2017', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'), 9142435762);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3328628495, 245, to_date('18-05-2017', 'dd-mm-yyyy'), to_date('24-01-2019', 'dd-mm-yyyy'), 7314477652);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5781827969, 115, to_date('12-10-2018', 'dd-mm-yyyy'), to_date('10-09-2016', 'dd-mm-yyyy'), 7585721399);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6594167545, 225, to_date('17-03-2017', 'dd-mm-yyyy'), to_date('03-12-2010', 'dd-mm-yyyy'), 2918995427);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1973648682, 139, to_date('10-02-2018', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'), 1175969255);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2938656288, 49, to_date('19-06-2018', 'dd-mm-yyyy'), to_date('13-07-2016', 'dd-mm-yyyy'), 6769459998);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2719444396, 145, to_date('11-08-2017', 'dd-mm-yyyy'), to_date('01-07-2017', 'dd-mm-yyyy'), 8446263762);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9471255536, 39, to_date('21-11-2019', 'dd-mm-yyyy'), to_date('15-11-2013', 'dd-mm-yyyy'), 1772653857);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4758375191, 159, to_date('27-09-2019', 'dd-mm-yyyy'), to_date('19-10-2010', 'dd-mm-yyyy'), 7537563939);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2736598283, 199, to_date('07-04-2018', 'dd-mm-yyyy'), to_date('19-09-2015', 'dd-mm-yyyy'), 4185413791);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3862594855, 73, to_date('31-07-2019', 'dd-mm-yyyy'), to_date('14-02-2017', 'dd-mm-yyyy'), 4584246332);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7498545278, 769, to_date('08-01-2018', 'dd-mm-yyyy'), to_date('30-10-2014', 'dd-mm-yyyy'), 8955888356);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3366655418, 16, to_date('10-01-2019', 'dd-mm-yyyy'), to_date('23-02-2017', 'dd-mm-yyyy'), 3921177167);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7828999491, 44, to_date('22-08-2018', 'dd-mm-yyyy'), to_date('30-08-2012', 'dd-mm-yyyy'), 5662161994);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4215931446, 156, to_date('10-06-2019', 'dd-mm-yyyy'), to_date('18-03-2018', 'dd-mm-yyyy'), 2629944151);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7399661984, 5, to_date('13-11-2018', 'dd-mm-yyyy'), to_date('14-10-2020', 'dd-mm-yyyy'), 9317891774);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8478818613, 618, to_date('18-09-2018', 'dd-mm-yyyy'), to_date('31-05-2021', 'dd-mm-yyyy'), 6451963427);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9683126151, 85, to_date('29-07-2017', 'dd-mm-yyyy'), to_date('10-10-2011', 'dd-mm-yyyy'), 9574279431);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2569949922, 45, to_date('15-05-2018', 'dd-mm-yyyy'), to_date('23-04-2013', 'dd-mm-yyyy'), 8483159579);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6787365518, 2, to_date('13-10-2018', 'dd-mm-yyyy'), to_date('27-02-2023', 'dd-mm-yyyy'), 7762114179);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5116543239, 10, to_date('18-02-2017', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'), 8368577148);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9727745733, 16, to_date('01-03-2019', 'dd-mm-yyyy'), to_date('01-12-2020', 'dd-mm-yyyy'), 2464419131);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4632635825, 329, to_date('13-03-2019', 'dd-mm-yyyy'), to_date('27-05-2013', 'dd-mm-yyyy'), 7232214848);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3279548329, 125, to_date('20-01-2017', 'dd-mm-yyyy'), to_date('11-07-2012', 'dd-mm-yyyy'), 7936718619);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3959797282, 199, to_date('03-01-2017', 'dd-mm-yyyy'), to_date('20-10-2021', 'dd-mm-yyyy'), 8814989295);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6756475854, 215, to_date('17-10-2019', 'dd-mm-yyyy'), to_date('23-12-2022', 'dd-mm-yyyy'), 1772653857);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5743194723, 259, to_date('30-04-2017', 'dd-mm-yyyy'), to_date('01-12-2017', 'dd-mm-yyyy'), 3154335321);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1154536897, 79, to_date('18-12-2017', 'dd-mm-yyyy'), to_date('05-06-2013', 'dd-mm-yyyy'), 3531192527);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6616159741, 385, to_date('04-07-2018', 'dd-mm-yyyy'), to_date('06-08-2021', 'dd-mm-yyyy'), 7318887334);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9639469573, 179, to_date('27-04-2017', 'dd-mm-yyyy'), to_date('20-01-2010', 'dd-mm-yyyy'), 5382196513);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6433512675, 159, to_date('05-10-2017', 'dd-mm-yyyy'), to_date('09-08-2015', 'dd-mm-yyyy'), 5393842389);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6967739347, 229, to_date('24-09-2019', 'dd-mm-yyyy'), to_date('25-07-2019', 'dd-mm-yyyy'), 6794499952);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4823915145, 49, to_date('19-07-2018', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 5582234829);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4562698772, 46, to_date('14-03-2018', 'dd-mm-yyyy'), to_date('09-05-2019', 'dd-mm-yyyy'), 4963115294);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1345148967, 168, to_date('12-07-2019', 'dd-mm-yyyy'), to_date('13-09-2018', 'dd-mm-yyyy'), 8117638562);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5475753422, 46, to_date('07-01-2018', 'dd-mm-yyyy'), to_date('17-01-2021', 'dd-mm-yyyy'), 7415156747);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7627553192, 69, to_date('24-05-2019', 'dd-mm-yyyy'), to_date('22-02-2022', 'dd-mm-yyyy'), 4249544451);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1966214535, 299, to_date('02-07-2017', 'dd-mm-yyyy'), to_date('26-03-2013', 'dd-mm-yyyy'), 5365876658);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7483173871, 29, to_date('03-08-2019', 'dd-mm-yyyy'), to_date('02-06-2017', 'dd-mm-yyyy'), 2363661557);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6814499197, 29, to_date('03-03-2019', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 5796492881);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4783155767, 39, to_date('08-09-2019', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), 8863711117);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9418328764, 90, to_date('05-08-2019', 'dd-mm-yyyy'), to_date('25-01-2018', 'dd-mm-yyyy'), 3897721262);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1134575135, 10, to_date('24-09-2017', 'dd-mm-yyyy'), to_date('26-01-2016', 'dd-mm-yyyy'), 2389291999);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6283458691, 245, to_date('12-05-2017', 'dd-mm-yyyy'), to_date('08-02-2021', 'dd-mm-yyyy'), 8446263762);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9917847415, 92, to_date('04-01-2019', 'dd-mm-yyyy'), to_date('29-10-2011', 'dd-mm-yyyy'), 4972377698);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9136266423, 369, to_date('20-04-2017', 'dd-mm-yyyy'), to_date('23-01-2012', 'dd-mm-yyyy'), 9641782372);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8273757269, 30, to_date('07-07-2019', 'dd-mm-yyyy'), to_date('08-11-2010', 'dd-mm-yyyy'), 6175197286);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7591738477, 369, to_date('07-06-2018', 'dd-mm-yyyy'), to_date('08-10-2011', 'dd-mm-yyyy'), 5327567578);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8353471417, 299, to_date('25-04-2019', 'dd-mm-yyyy'), to_date('02-02-2011', 'dd-mm-yyyy'), 3764995215);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7313662931, 125, to_date('19-09-2019', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 2247813915);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7747688176, 229, to_date('14-08-2017', 'dd-mm-yyyy'), to_date('02-06-2016', 'dd-mm-yyyy'), 9169652381);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5971997195, 14, to_date('20-08-2019', 'dd-mm-yyyy'), to_date('19-11-2015', 'dd-mm-yyyy'), 9632833738);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9177496195, 47, to_date('17-12-2017', 'dd-mm-yyyy'), to_date('04-09-2017', 'dd-mm-yyyy'), 3478122384);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7581779767, 30, to_date('16-11-2019', 'dd-mm-yyyy'), to_date('14-11-2013', 'dd-mm-yyyy'), 3654654692);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6345313614, 16, to_date('07-03-2017', 'dd-mm-yyyy'), to_date('01-07-2017', 'dd-mm-yyyy'), 4345355892);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2896124364, 95, to_date('08-08-2019', 'dd-mm-yyyy'), to_date('29-12-2016', 'dd-mm-yyyy'), 5647154158);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9538564694, 179, to_date('12-06-2018', 'dd-mm-yyyy'), to_date('29-01-2017', 'dd-mm-yyyy'), 9843343751);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7424356525, 145, to_date('11-07-2018', 'dd-mm-yyyy'), to_date('01-05-2015', 'dd-mm-yyyy'), 8268579277);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3689352168, 72, to_date('04-03-2018', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'), 9211935538);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8871794961, 239, to_date('01-10-2019', 'dd-mm-yyyy'), to_date('30-07-2010', 'dd-mm-yyyy'), 9197584155);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8831994934, 175, to_date('04-01-2018', 'dd-mm-yyyy'), to_date('27-02-2023', 'dd-mm-yyyy'), 4178165241);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9383897644, 198, to_date('25-12-2017', 'dd-mm-yyyy'), to_date('15-04-2018', 'dd-mm-yyyy'), 8542451742);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4317283411, 255, to_date('22-06-2019', 'dd-mm-yyyy'), to_date('15-06-2012', 'dd-mm-yyyy'), 3381517824);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6354744951, 19, to_date('16-01-2019', 'dd-mm-yyyy'), to_date('02-05-2020', 'dd-mm-yyyy'), 3959326721);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6797393165, 79, to_date('04-10-2017', 'dd-mm-yyyy'), to_date('13-04-2015', 'dd-mm-yyyy'), 4345355892);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5432446176, 119, to_date('26-02-2018', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 9957395313);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8142684193, 27, to_date('18-02-2019', 'dd-mm-yyyy'), to_date('22-03-2011', 'dd-mm-yyyy'), 3531192527);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9647649344, 39, to_date('03-07-2018', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 1885613693);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6512565635, 135, to_date('11-08-2019', 'dd-mm-yyyy'), to_date('02-06-2018', 'dd-mm-yyyy'), 3785529772);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6499144825, 194, to_date('09-08-2019', 'dd-mm-yyyy'), to_date('15-03-2011', 'dd-mm-yyyy'), 4828447655);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8577538622, 88, to_date('13-01-2017', 'dd-mm-yyyy'), to_date('09-03-2016', 'dd-mm-yyyy'), 1252464813);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8937928522, 135, to_date('02-02-2018', 'dd-mm-yyyy'), to_date('09-03-2018', 'dd-mm-yyyy'), 2871978594);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9729676698, 74, to_date('01-12-2017', 'dd-mm-yyyy'), to_date('23-09-2019', 'dd-mm-yyyy'), 8666756644);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7226632662, 30, to_date('11-08-2019', 'dd-mm-yyyy'), to_date('24-12-2010', 'dd-mm-yyyy'), 4185733533);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4311986995, 99, to_date('11-02-2018', 'dd-mm-yyyy'), to_date('03-06-2021', 'dd-mm-yyyy'), 5718998928);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9257755435, 59, to_date('21-09-2017', 'dd-mm-yyyy'), to_date('23-03-2017', 'dd-mm-yyyy'), 5661359651);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9745151314, 239, to_date('16-10-2018', 'dd-mm-yyyy'), to_date('29-07-2017', 'dd-mm-yyyy'), 3525293153);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7238114134, 25, to_date('29-08-2019', 'dd-mm-yyyy'), to_date('16-11-2011', 'dd-mm-yyyy'), 7153189418);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6385239681, 35, to_date('07-11-2018', 'dd-mm-yyyy'), to_date('22-08-2017', 'dd-mm-yyyy'), 6317891282);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6781537462, 399, to_date('27-09-2018', 'dd-mm-yyyy'), to_date('25-08-2014', 'dd-mm-yyyy'), 7429724848);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8138317192, 99, to_date('14-04-2018', 'dd-mm-yyyy'), to_date('25-05-2013', 'dd-mm-yyyy'), 8932536646);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3838198146, 115, to_date('30-09-2019', 'dd-mm-yyyy'), to_date('03-01-2015', 'dd-mm-yyyy'), 2151622185);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6426469546, 27, to_date('18-04-2019', 'dd-mm-yyyy'), to_date('28-08-2016', 'dd-mm-yyyy'), 5394564919);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8383569713, 59, to_date('26-09-2019', 'dd-mm-yyyy'), to_date('07-12-2017', 'dd-mm-yyyy'), 6263145256);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4735544864, 35, to_date('25-12-2019', 'dd-mm-yyyy'), to_date('01-02-2021', 'dd-mm-yyyy'), 7415156747);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7333279565, 200, to_date('27-11-2017', 'dd-mm-yyyy'), to_date('14-06-2013', 'dd-mm-yyyy'), 2617574129);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5395781322, 95, to_date('19-02-2018', 'dd-mm-yyyy'), to_date('13-07-2011', 'dd-mm-yyyy'), 9641782372);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9571237382, 7, to_date('23-08-2018', 'dd-mm-yyyy'), to_date('02-10-2013', 'dd-mm-yyyy'), 1882193391);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2277638714, 59, to_date('29-04-2018', 'dd-mm-yyyy'), to_date('08-02-2022', 'dd-mm-yyyy'), 4295446744);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4169989722, 175, to_date('30-07-2017', 'dd-mm-yyyy'), to_date('11-02-2017', 'dd-mm-yyyy'), 7762114179);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9999324767, 1, to_date('27-03-2019', 'dd-mm-yyyy'), to_date('31-03-2018', 'dd-mm-yyyy'), 4685341693);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3892417395, 139, to_date('12-12-2018', 'dd-mm-yyyy'), to_date('09-09-2012', 'dd-mm-yyyy'), 4159894618);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2859837624, 159, to_date('24-08-2018', 'dd-mm-yyyy'), to_date('01-06-2021', 'dd-mm-yyyy'), 5543721423);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2921999191, 10, to_date('25-03-2018', 'dd-mm-yyyy'), to_date('17-01-2022', 'dd-mm-yyyy'), 6655749611);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1291295846, 125, to_date('13-06-2019', 'dd-mm-yyyy'), to_date('08-01-2015', 'dd-mm-yyyy'), 9288211241);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4938941643, 299, to_date('09-01-2018', 'dd-mm-yyyy'), to_date('31-03-2010', 'dd-mm-yyyy'), 3361638591);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3863296586, 175, to_date('06-12-2019', 'dd-mm-yyyy'), to_date('03-08-2019', 'dd-mm-yyyy'), 6865451711);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6451633372, 24, to_date('25-01-2017', 'dd-mm-yyyy'), to_date('04-06-2013', 'dd-mm-yyyy'), 2629944151);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3524527673, 16, to_date('20-08-2018', 'dd-mm-yyyy'), to_date('03-06-2020', 'dd-mm-yyyy'), 8981654921);
commit;
prompt 200 records committed...
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8498491368, 156, to_date('01-08-2018', 'dd-mm-yyyy'), to_date('21-11-2015', 'dd-mm-yyyy'), 5718998928);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7182868172, 159, to_date('19-10-2017', 'dd-mm-yyyy'), to_date('09-01-2017', 'dd-mm-yyyy'), 1772653857);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1395559438, 3, to_date('27-01-2018', 'dd-mm-yyyy'), to_date('14-01-2020', 'dd-mm-yyyy'), 3254484582);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6591196129, 125, to_date('02-03-2017', 'dd-mm-yyyy'), to_date('28-03-2016', 'dd-mm-yyyy'), 7936718619);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7367132593, 75, to_date('13-11-2018', 'dd-mm-yyyy'), to_date('03-04-2021', 'dd-mm-yyyy'), 8334941149);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4464984714, 68, to_date('20-10-2019', 'dd-mm-yyyy'), to_date('23-03-2011', 'dd-mm-yyyy'), 5296343145);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1244189938, 6, to_date('22-01-2017', 'dd-mm-yyyy'), to_date('13-02-2017', 'dd-mm-yyyy'), 9992577847);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3443773847, 22, to_date('23-02-2017', 'dd-mm-yyyy'), to_date('12-09-2011', 'dd-mm-yyyy'), 2363661557);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2398897665, 289, to_date('10-09-2019', 'dd-mm-yyyy'), to_date('12-07-2013', 'dd-mm-yyyy'), 7276911918);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5798957318, 265, to_date('16-06-2019', 'dd-mm-yyyy'), to_date('09-04-2019', 'dd-mm-yyyy'), 3671333763);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8848486471, 175, to_date('19-09-2019', 'dd-mm-yyyy'), to_date('23-09-2015', 'dd-mm-yyyy'), 5844314832);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9347151514, 78, to_date('03-03-2018', 'dd-mm-yyyy'), to_date('25-07-2014', 'dd-mm-yyyy'), 8338351458);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5781381628, 71, to_date('17-02-2017', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'), 8518527949);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9287591731, 145, to_date('22-05-2017', 'dd-mm-yyyy'), to_date('13-03-2019', 'dd-mm-yyyy'), 4828895987);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5863539628, 68, to_date('30-06-2018', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'), 4891838229);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5348449311, 159, to_date('03-09-2019', 'dd-mm-yyyy'), to_date('17-12-2016', 'dd-mm-yyyy'), 2117975264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8493727421, 69, to_date('11-01-2018', 'dd-mm-yyyy'), to_date('12-06-2010', 'dd-mm-yyyy'), 8117638562);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4738866395, 16, to_date('06-01-2017', 'dd-mm-yyyy'), to_date('04-08-2016', 'dd-mm-yyyy'), 3764995215);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6522655785, 189, to_date('21-01-2017', 'dd-mm-yyyy'), to_date('17-06-2011', 'dd-mm-yyyy'), 7276911918);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6849475885, 299, to_date('21-07-2019', 'dd-mm-yyyy'), to_date('26-01-2016', 'dd-mm-yyyy'), 6692136628);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6987375837, 35, to_date('10-08-2019', 'dd-mm-yyyy'), to_date('13-06-2010', 'dd-mm-yyyy'), 8146142557);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2215669578, 35, to_date('23-10-2018', 'dd-mm-yyyy'), to_date('19-03-2015', 'dd-mm-yyyy'), 4866413555);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2431977793, 68, to_date('28-10-2017', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), 1942157435);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2938568953, 95, to_date('27-01-2018', 'dd-mm-yyyy'), to_date('18-06-2018', 'dd-mm-yyyy'), 8814989295);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4643221365, 113, to_date('22-12-2018', 'dd-mm-yyyy'), to_date('04-08-2015', 'dd-mm-yyyy'), 9848367623);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6884761422, 149, to_date('25-08-2017', 'dd-mm-yyyy'), to_date('16-03-2020', 'dd-mm-yyyy'), 1234567891);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7254555249, 129, to_date('17-12-2017', 'dd-mm-yyyy'), to_date('18-06-2014', 'dd-mm-yyyy'), 8981654921);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5982874668, 219, to_date('14-10-2018', 'dd-mm-yyyy'), to_date('25-04-2021', 'dd-mm-yyyy'), 9837494342);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2142115599, 16, to_date('26-04-2017', 'dd-mm-yyyy'), to_date('09-08-2012', 'dd-mm-yyyy'), 4168397516);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9383424429, 310, to_date('02-06-2017', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 1142896819);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3129575229, 90, to_date('03-10-2019', 'dd-mm-yyyy'), to_date('22-08-2011', 'dd-mm-yyyy'), 3959326721);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3438946521, 69, to_date('03-07-2018', 'dd-mm-yyyy'), to_date('17-09-2015', 'dd-mm-yyyy'), 4238776638);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4948531466, 849, to_date('09-10-2018', 'dd-mm-yyyy'), to_date('24-11-2020', 'dd-mm-yyyy'), 8864155356);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2282686575, 235, to_date('22-07-2018', 'dd-mm-yyyy'), to_date('10-01-2014', 'dd-mm-yyyy'), 9574279431);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9675937819, 359, to_date('26-09-2017', 'dd-mm-yyyy'), to_date('23-09-2020', 'dd-mm-yyyy'), 8613172535);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3252864837, 165, to_date('24-08-2018', 'dd-mm-yyyy'), to_date('26-02-2017', 'dd-mm-yyyy'), 8595366756);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8429561436, 409, to_date('15-08-2018', 'dd-mm-yyyy'), to_date('09-06-2015', 'dd-mm-yyyy'), 5537394477);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7724274688, 121, to_date('02-12-2019', 'dd-mm-yyyy'), to_date('05-02-2014', 'dd-mm-yyyy'), 7398738537);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4846319197, 25, to_date('30-04-2018', 'dd-mm-yyyy'), to_date('13-02-2011', 'dd-mm-yyyy'), 1999296696);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7229521683, 20, to_date('07-06-2017', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), 9586323889);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9632628911, 45, to_date('21-03-2018', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'), 5877212239);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8153653575, 77, to_date('30-10-2017', 'dd-mm-yyyy'), to_date('28-11-2015', 'dd-mm-yyyy'), 2783928517);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2289729874, 169, to_date('13-05-2017', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'), 8262797734);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2453972949, 8, to_date('23-03-2017', 'dd-mm-yyyy'), to_date('27-01-2017', 'dd-mm-yyyy'), 1234567891);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9692957284, 13, to_date('01-08-2017', 'dd-mm-yyyy'), to_date('09-03-2017', 'dd-mm-yyyy'), 3236776286);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6874866835, 135, to_date('31-03-2017', 'dd-mm-yyyy'), to_date('25-05-2018', 'dd-mm-yyyy'), 2194666377);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8323233285, 115, to_date('12-04-2018', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'), 7534254276);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2927122858, 3, to_date('07-02-2017', 'dd-mm-yyyy'), to_date('18-03-2018', 'dd-mm-yyyy'), 3789631937);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4544948696, 35, to_date('14-03-2019', 'dd-mm-yyyy'), to_date('28-04-2013', 'dd-mm-yyyy'), 4166236398);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6721849383, 299, to_date('23-12-2018', 'dd-mm-yyyy'), to_date('27-04-2015', 'dd-mm-yyyy'), 9263977762);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6639828719, 115, to_date('02-06-2018', 'dd-mm-yyyy'), to_date('19-12-2014', 'dd-mm-yyyy'), 3714195382);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7139167288, 149, to_date('06-05-2017', 'dd-mm-yyyy'), to_date('25-06-2017', 'dd-mm-yyyy'), 4963115294);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1517165924, 159, to_date('04-06-2018', 'dd-mm-yyyy'), to_date('15-01-2013', 'dd-mm-yyyy'), 5133611251);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5652869492, 95, to_date('31-07-2019', 'dd-mm-yyyy'), to_date('10-11-2015', 'dd-mm-yyyy'), 4352222858);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3351269288, 1, to_date('11-04-2018', 'dd-mm-yyyy'), to_date('01-02-2011', 'dd-mm-yyyy'), 7314372264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3857217221, 209, to_date('02-10-2018', 'dd-mm-yyyy'), to_date('02-07-2011', 'dd-mm-yyyy'), 1558671129);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1885549765, 99, to_date('16-11-2018', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), 5132233416);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6776668145, 439, to_date('19-06-2017', 'dd-mm-yyyy'), to_date('13-08-2016', 'dd-mm-yyyy'), 4584246332);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8936263222, 139, to_date('07-09-2017', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 4198888634);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1454548869, 289, to_date('12-11-2019', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 9182836259);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1968679319, 24, to_date('03-11-2017', 'dd-mm-yyyy'), to_date('08-09-2022', 'dd-mm-yyyy'), 4433298125);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3555334683, 389, to_date('05-06-2019', 'dd-mm-yyyy'), to_date('22-03-2010', 'dd-mm-yyyy'), 9128556832);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4398734336, 125, to_date('16-01-2018', 'dd-mm-yyyy'), to_date('04-11-2013', 'dd-mm-yyyy'), 6441149813);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7877951756, 45, to_date('20-08-2018', 'dd-mm-yyyy'), to_date('27-10-2016', 'dd-mm-yyyy'), 1142896819);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4824571761, 30, to_date('14-09-2019', 'dd-mm-yyyy'), to_date('23-11-2015', 'dd-mm-yyyy'), 8679186711);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9161119817, 125, to_date('18-06-2019', 'dd-mm-yyyy'), to_date('29-07-2021', 'dd-mm-yyyy'), 1755565188);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9277236882, 22, to_date('11-11-2017', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), 4561385332);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9392817599, 10, to_date('23-05-2017', 'dd-mm-yyyy'), to_date('26-10-2013', 'dd-mm-yyyy'), 6764696344);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5823463876, 105, to_date('25-02-2019', 'dd-mm-yyyy'), to_date('18-03-2011', 'dd-mm-yyyy'), 5498647191);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3111386278, 6, to_date('19-09-2019', 'dd-mm-yyyy'), to_date('29-03-2020', 'dd-mm-yyyy'), 4963115294);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2793452263, 55, to_date('30-08-2018', 'dd-mm-yyyy'), to_date('07-09-2018', 'dd-mm-yyyy'), 4249847684);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6283769298, 18, to_date('28-01-2017', 'dd-mm-yyyy'), to_date('20-11-2020', 'dd-mm-yyyy'), 9615467928);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8523861398, 117, to_date('18-07-2017', 'dd-mm-yyyy'), to_date('06-05-2016', 'dd-mm-yyyy'), 4593717428);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5683126541, 199, to_date('16-06-2017', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), 8679186711);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5656896645, 26, to_date('20-03-2019', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), 4333196364);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2594282235, 35, to_date('27-01-2017', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), 5721949743);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4171865442, 245, to_date('22-04-2017', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'), 9334379264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3962795836, 130, to_date('01-09-2019', 'dd-mm-yyyy'), to_date('24-06-2018', 'dd-mm-yyyy'), 5647154158);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4372132961, 200, to_date('28-09-2018', 'dd-mm-yyyy'), to_date('29-03-2012', 'dd-mm-yyyy'), 9643948722);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3417385647, 5, to_date('20-08-2019', 'dd-mm-yyyy'), to_date('15-09-2015', 'dd-mm-yyyy'), 5365876658);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6115717685, 344, to_date('21-07-2018', 'dd-mm-yyyy'), to_date('02-06-2017', 'dd-mm-yyyy'), 3525293153);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7917638126, 229, to_date('26-04-2019', 'dd-mm-yyyy'), to_date('29-06-2013', 'dd-mm-yyyy'), 1882193391);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4166738594, 239, to_date('10-10-2018', 'dd-mm-yyyy'), to_date('07-06-2021', 'dd-mm-yyyy'), 1215377971);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7515868414, 138, to_date('09-10-2019', 'dd-mm-yyyy'), to_date('13-08-2013', 'dd-mm-yyyy'), 6271724725);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8713969828, 279, to_date('24-10-2017', 'dd-mm-yyyy'), to_date('22-01-2018', 'dd-mm-yyyy'), 7415156747);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8288898448, 89, to_date('25-07-2018', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 4481431147);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2913319698, 5, to_date('07-07-2017', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'), 2617574129);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7173585899, 74, to_date('01-07-2019', 'dd-mm-yyyy'), to_date('22-11-2020', 'dd-mm-yyyy'), 1889314599);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6425947424, 225, to_date('08-05-2018', 'dd-mm-yyyy'), to_date('26-11-2013', 'dd-mm-yyyy'), 1196353674);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5828937271, 2, to_date('02-11-2018', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), 9349733469);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3638284862, 132, to_date('27-11-2017', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'), 7342291545);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1128533288, 169, to_date('14-06-2019', 'dd-mm-yyyy'), to_date('16-05-2019', 'dd-mm-yyyy'), 6915866749);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2646341447, 79, to_date('18-04-2018', 'dd-mm-yyyy'), to_date('15-06-2011', 'dd-mm-yyyy'), 2255727428);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9661486677, 29, to_date('04-09-2017', 'dd-mm-yyyy'), to_date('09-07-2017', 'dd-mm-yyyy'), 9214671395);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4795627123, 18, to_date('31-03-2017', 'dd-mm-yyyy'), to_date('26-07-2015', 'dd-mm-yyyy'), 6317891282);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6444133371, 889, to_date('16-10-2018', 'dd-mm-yyyy'), to_date('08-10-2018', 'dd-mm-yyyy'), 3568793363);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8267438759, 5, to_date('04-07-2019', 'dd-mm-yyyy'), to_date('25-04-2015', 'dd-mm-yyyy'), 3116514217);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9253924949, 45, to_date('10-09-2019', 'dd-mm-yyyy'), to_date('28-03-2016', 'dd-mm-yyyy'), 5933246817);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2376445444, 35, to_date('28-12-2017', 'dd-mm-yyyy'), to_date('28-11-2011', 'dd-mm-yyyy'), 1775137119);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6568744926, 46, to_date('04-12-2019', 'dd-mm-yyyy'), to_date('29-05-2013', 'dd-mm-yyyy'), 6285298595);
commit;
prompt 300 records committed...
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7243521127, 179, to_date('03-11-2018', 'dd-mm-yyyy'), to_date('27-04-2010', 'dd-mm-yyyy'), 1142896819);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6372237596, 55, to_date('14-09-2018', 'dd-mm-yyyy'), to_date('17-04-2019', 'dd-mm-yyyy'), 5949649787);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1759226332, 48, to_date('31-10-2017', 'dd-mm-yyyy'), to_date('15-08-2022', 'dd-mm-yyyy'), 9395754226);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3974259521, 69, to_date('10-01-2017', 'dd-mm-yyyy'), to_date('28-05-2011', 'dd-mm-yyyy'), 8469385777);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8619478183, 7, to_date('03-08-2017', 'dd-mm-yyyy'), to_date('25-04-2012', 'dd-mm-yyyy'), 6764696344);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5992247972, 20, to_date('20-04-2018', 'dd-mm-yyyy'), to_date('23-05-2017', 'dd-mm-yyyy'), 7119638695);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6334388913, 399, to_date('17-01-2017', 'dd-mm-yyyy'), to_date('29-07-2011', 'dd-mm-yyyy'), 6655749611);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6768317829, 14, to_date('07-12-2017', 'dd-mm-yyyy'), to_date('10-02-2010', 'dd-mm-yyyy'), 9673912665);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7528389478, 327, to_date('07-08-2018', 'dd-mm-yyyy'), to_date('19-01-2019', 'dd-mm-yyyy'), 2783928517);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2889615787, 78, to_date('09-11-2019', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 6561357232);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4815688772, 219, to_date('30-05-2019', 'dd-mm-yyyy'), to_date('10-01-2019', 'dd-mm-yyyy'), 2453342915);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1383645927, 115, to_date('11-03-2019', 'dd-mm-yyyy'), to_date('23-10-2016', 'dd-mm-yyyy'), 6644866893);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9418487482, 9, to_date('17-11-2018', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), 7314477652);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7859453226, 16, to_date('21-05-2018', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 4963115294);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4751121586, 46, to_date('30-12-2018', 'dd-mm-yyyy'), to_date('14-08-2019', 'dd-mm-yyyy'), 2999722448);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1643137732, 78, to_date('18-01-2019', 'dd-mm-yyyy'), to_date('13-09-2015', 'dd-mm-yyyy'), 9574279431);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3289455623, 239, to_date('27-03-2017', 'dd-mm-yyyy'), to_date('27-07-2014', 'dd-mm-yyyy'), 3117192153);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1958345616, 125, to_date('19-04-2017', 'dd-mm-yyyy'), to_date('23-08-2022', 'dd-mm-yyyy'), 3688147648);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6434777779, 209, to_date('19-10-2017', 'dd-mm-yyyy'), to_date('09-06-2021', 'dd-mm-yyyy'), 4471966292);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7291586484, 152, to_date('02-09-2019', 'dd-mm-yyyy'), to_date('09-07-2020', 'dd-mm-yyyy'), 6441149813);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3312519534, 7, to_date('01-07-2019', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), 5537394477);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4334538938, 1, to_date('09-01-2019', 'dd-mm-yyyy'), to_date('15-02-2015', 'dd-mm-yyyy'), 5859512998);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1162438356, 59, to_date('02-12-2019', 'dd-mm-yyyy'), to_date('10-02-2016', 'dd-mm-yyyy'), 7658738122);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2776167682, 179, to_date('30-03-2019', 'dd-mm-yyyy'), to_date('05-08-2017', 'dd-mm-yyyy'), 5133611251);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8545835924, 8, to_date('03-01-2018', 'dd-mm-yyyy'), to_date('08-01-2015', 'dd-mm-yyyy'), 4685341693);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2823298853, 209, to_date('24-10-2018', 'dd-mm-yyyy'), to_date('27-06-2015', 'dd-mm-yyyy'), 3798279879);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8642492258, 0, to_date('23-09-2019', 'dd-mm-yyyy'), to_date('10-10-2016', 'dd-mm-yyyy'), 9993116215);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3538795735, 179, to_date('25-07-2017', 'dd-mm-yyyy'), to_date('26-09-2018', 'dd-mm-yyyy'), 1281964953);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7334959829, 179, to_date('27-04-2017', 'dd-mm-yyyy'), to_date('06-08-2014', 'dd-mm-yyyy'), 8268579277);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5351282847, 219, to_date('26-02-2019', 'dd-mm-yyyy'), to_date('22-05-2022', 'dd-mm-yyyy'), 1294724161);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4215772996, 267, to_date('11-12-2019', 'dd-mm-yyyy'), to_date('05-09-2015', 'dd-mm-yyyy'), 5365876658);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5156124886, 48, to_date('13-02-2017', 'dd-mm-yyyy'), to_date('30-07-2016', 'dd-mm-yyyy'), 2389291999);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4527444188, 30, to_date('11-11-2019', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'), 8368577148);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6218864635, 15, to_date('09-08-2019', 'dd-mm-yyyy'), to_date('16-12-2013', 'dd-mm-yyyy'), 3337485563);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1371653168, 69, to_date('02-01-2017', 'dd-mm-yyyy'), to_date('23-08-2018', 'dd-mm-yyyy'), 3899829445);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3956596861, 72, to_date('17-10-2018', 'dd-mm-yyyy'), to_date('10-06-2019', 'dd-mm-yyyy'), 1882193391);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8298828469, 169, to_date('21-10-2019', 'dd-mm-yyyy'), to_date('01-08-2022', 'dd-mm-yyyy'), 4481431147);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3157599721, 45, to_date('07-11-2019', 'dd-mm-yyyy'), to_date('15-10-2016', 'dd-mm-yyyy'), 6271724725);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3745833661, 215, to_date('11-07-2019', 'dd-mm-yyyy'), to_date('24-10-2022', 'dd-mm-yyyy'), 9853322754);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1425648933, 189, to_date('23-03-2018', 'dd-mm-yyyy'), to_date('22-08-2010', 'dd-mm-yyyy'), 6317891282);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1258641139, 73, to_date('11-04-2019', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 6917521728);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7492615697, 74, to_date('18-12-2018', 'dd-mm-yyyy'), to_date('13-06-2012', 'dd-mm-yyyy'), 9317891774);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4354738142, 70, to_date('07-10-2019', 'dd-mm-yyyy'), to_date('11-01-2012', 'dd-mm-yyyy'), 2298965679);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2893839416, 119, to_date('21-05-2018', 'dd-mm-yyyy'), to_date('29-12-2015', 'dd-mm-yyyy'), 4584246332);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3237319414, 155, to_date('19-06-2017', 'dd-mm-yyyy'), to_date('18-02-2017', 'dd-mm-yyyy'), 5844314832);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8822164936, 236, to_date('06-03-2019', 'dd-mm-yyyy'), to_date('28-06-2011', 'dd-mm-yyyy'), 3352221815);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5873548258, 285, to_date('15-09-2017', 'dd-mm-yyyy'), to_date('28-06-2014', 'dd-mm-yyyy'), 7127372749);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8836642794, 1, to_date('05-11-2018', 'dd-mm-yyyy'), to_date('20-02-2021', 'dd-mm-yyyy'), 9574279431);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6357891134, 87, to_date('03-12-2017', 'dd-mm-yyyy'), to_date('15-04-2015', 'dd-mm-yyyy'), 2166934128);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7135531585, 118, to_date('02-02-2017', 'dd-mm-yyyy'), to_date('05-08-2016', 'dd-mm-yyyy'), 5537394477);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8419527411, 28, to_date('19-01-2019', 'dd-mm-yyyy'), to_date('08-08-2014', 'dd-mm-yyyy'), 1196353674);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7325892919, 135, to_date('10-06-2019', 'dd-mm-yyyy'), to_date('04-06-2015', 'dd-mm-yyyy'), 7314372264);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (7393566732, 365, to_date('14-10-2018', 'dd-mm-yyyy'), to_date('04-07-2020', 'dd-mm-yyyy'), 4828895987);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2427219416, 58, to_date('13-03-2019', 'dd-mm-yyyy'), to_date('14-05-2012', 'dd-mm-yyyy'), 5648443587);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9895479769, 239, to_date('27-05-2017', 'dd-mm-yyyy'), to_date('13-09-2022', 'dd-mm-yyyy'), 4433298125);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3595182725, 149, to_date('14-12-2018', 'dd-mm-yyyy'), to_date('10-05-2015', 'dd-mm-yyyy'), 5753121797);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5193773943, 99, to_date('06-02-2018', 'dd-mm-yyyy'), to_date('20-10-2020', 'dd-mm-yyyy'), 9211935538);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3823659566, 159, to_date('01-12-2018', 'dd-mm-yyyy'), to_date('10-04-2021', 'dd-mm-yyyy'), 5448466479);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1332632776, 39, to_date('09-03-2019', 'dd-mm-yyyy'), to_date('28-03-2016', 'dd-mm-yyyy'), 3358837585);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (4597916758, 150, to_date('25-06-2017', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), 8474714847);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (5528373683, 409, to_date('16-02-2018', 'dd-mm-yyyy'), to_date('26-04-2015', 'dd-mm-yyyy'), 2242972333);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (3132657968, 269, to_date('15-02-2017', 'dd-mm-yyyy'), to_date('02-05-2018', 'dd-mm-yyyy'), 4198888634);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6281537613, 140, to_date('02-03-2018', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 3789631937);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9726522697, 30, to_date('21-10-2018', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), 4447758479);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (6673319469, 69, to_date('17-10-2019', 'dd-mm-yyyy'), to_date('07-09-2016', 'dd-mm-yyyy'), 2343668464);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9772449562, 319, to_date('23-07-2017', 'dd-mm-yyyy'), to_date('17-07-2013', 'dd-mm-yyyy'), 2538768487);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (9198818437, 49, to_date('18-06-2018', 'dd-mm-yyyy'), to_date('05-11-2019', 'dd-mm-yyyy'), 9346399791);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (2631232154, 118, to_date('03-09-2019', 'dd-mm-yyyy'), to_date('12-06-2020', 'dd-mm-yyyy'), 8666756644);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1775712714, 769, to_date('27-06-2018', 'dd-mm-yyyy'), to_date('02-04-2014', 'dd-mm-yyyy'), 6786213942);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (8866184258, 17, to_date('02-01-2018', 'dd-mm-yyyy'), to_date('11-05-2019', 'dd-mm-yyyy'), 4649114331);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000000, 144, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 9993116215);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000001, 14, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 5458194925);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000002, 10, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 7232214848);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000003, 265, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 1326966921);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000004, 10, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 7589546594);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000005, 140, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 7589546594);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000006, 159, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 4593717428);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000007, 329, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-07-2025', 'dd-mm-yyyy'), 5796492881);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000008, 285, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-07-2025', 'dd-mm-yyyy'), 9877814153);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000009, 239, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-07-2025', 'dd-mm-yyyy'), 2999722448);
insert into DEBT (debt_id, debt_price, debt_create, debt_last_date, tax_id)
values (1000000010, 44, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-07-2025', 'dd-mm-yyyy'), 8542451742);
commit;
prompt 381 records loaded
prompt Loading RESIDENT...
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (948653731, 'Marianne', 'Faithfull', to_date('28-05-1999', 'dd-mm-yyyy'), '61 Mathis', 548185172, to_date('21-01-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (958839685, 'Bruce', 'Eldard', to_date('10-07-1990', 'dd-mm-yyyy'), '596 Payton Street', 549192735, to_date('27-03-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (248636811, 'Neneh', 'Klein', to_date('02-11-1980', 'dd-mm-yyyy'), '65 Candy Road', 524132436, to_date('09-11-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (846747472, 'Tzi', 'Danger', to_date('11-05-1980', 'dd-mm-yyyy'), '37 Santa Cruz Drive', 529258383, to_date('18-02-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (762496866, 'Casey', 'Metcalf', to_date('30-12-1993', 'dd-mm-yyyy'), '9 Klein Street', 528369733, to_date('02-09-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (683777489, 'Rosanna', 'Torino', to_date('07-12-1992', 'dd-mm-yyyy'), '115 Avril', 529013975, to_date('31-05-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (674886982, 'Fats', 'Crimson', to_date('21-05-1986', 'dd-mm-yyyy'), '88 Portland Road', 522078058, to_date('15-07-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (144273597, 'Gates', 'Kinnear', to_date('07-01-1996', 'dd-mm-yyyy'), '85 Indianapolis Blvd', 549866502, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (962843178, 'Vienna', 'Richards', to_date('28-10-1982', 'dd-mm-yyyy'), '58 Fort Saskatchewan Drive', 505339623, to_date('13-03-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (574133492, 'Judd', 'Stiers', to_date('16-01-1997', 'dd-mm-yyyy'), '72 Berkshire Road', 528934905, to_date('07-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (878648646, 'Richard', 'Lawrence', to_date('01-08-1982', 'dd-mm-yyyy'), '67 University Drive', 506031047, to_date('04-01-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (546747511, 'Nik', 'Washington', to_date('30-01-1988', 'dd-mm-yyyy'), '95 Dushku Ave', 520137304, to_date('21-12-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (189527387, 'Frederic', 'Matarazzo', to_date('22-05-1995', 'dd-mm-yyyy'), '53rd Street', 540607455, to_date('23-10-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (951818691, 'Lenny', 'Underwood', to_date('25-09-1987', 'dd-mm-yyyy'), '580 Gibson', 548587935, to_date('22-06-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (692885158, 'Ruth', 'Hunter', to_date('17-01-1989', 'dd-mm-yyyy'), '628 Rudd Drive', 500350794, to_date('16-09-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (377243113, 'Tcheky', 'Thornton', to_date('17-06-1982', 'dd-mm-yyyy'), '28 Pordenone Street', 501231719, to_date('19-10-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (172196718, 'Eileen', 'Chandler', to_date('11-09-1982', 'dd-mm-yyyy'), '275 Venice Road', 549828139, to_date('13-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (385559488, 'Adrien', 'Nielsen', to_date('04-01-1998', 'dd-mm-yyyy'), '460 Choice Road', 540831674, to_date('26-11-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (577492217, 'Junior', 'McNeice', to_date('31-05-1986', 'dd-mm-yyyy'), '32 Braintree Blvd', 525800304, to_date('10-09-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (913474355, 'Adam', 'Oates', to_date('17-03-1999', 'dd-mm-yyyy'), '81 Cary Street', 529135905, to_date('01-02-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (759997767, 'Winona', 'Gleeson', to_date('28-06-1991', 'dd-mm-yyyy'), '44 Fort worth Street', 501298272, to_date('13-11-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (749566745, 'Karen', 'Guilfoyle', to_date('03-07-1995', 'dd-mm-yyyy'), '80 Plimpton Blvd', 524093625, to_date('01-05-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (278495136, 'Marianne', 'Donelly', to_date('25-01-1993', 'dd-mm-yyyy'), '72nd Street', 522100814, to_date('01-03-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (275782165, 'Freddie', 'Buffalo', to_date('11-02-1994', 'dd-mm-yyyy'), '82 Malone Drive', 544645203, to_date('06-11-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (831131253, 'Rich', 'Tolkan', to_date('21-06-1983', 'dd-mm-yyyy'), '41st Street', 549007903, to_date('04-07-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (143878386, 'Anthony', 'Ranger', to_date('12-09-1985', 'dd-mm-yyyy'), '51 League city Street', 504466356, to_date('25-04-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (615154167, 'Graham', 'Gugino', to_date('05-03-1996', 'dd-mm-yyyy'), '73rd Street', 543071736, to_date('16-09-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (586499533, 'Rhett', 'Fiorentino', to_date('04-02-1985', 'dd-mm-yyyy'), '7 Ewan Street', 523547985, to_date('18-12-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (814459614, 'Ice', 'Perlman', to_date('25-02-1986', 'dd-mm-yyyy'), '13 Everett Road', 521396646, to_date('25-12-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (545118169, 'Kirsten', 'Dalton', to_date('09-08-1985', 'dd-mm-yyyy'), '16 Darren Road', 524581125, to_date('02-05-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (349583951, 'Malcolm', 'Norton', to_date('21-01-1985', 'dd-mm-yyyy'), '61 Loveless Blvd', 545402149, to_date('21-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (994969989, 'Benicio', 'Tucci', to_date('02-02-1983', 'dd-mm-yyyy'), '59 Polley Road', 501060564, to_date('18-09-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (938358622, 'Anna', 'Buscemi', to_date('12-12-1982', 'dd-mm-yyyy'), '358 Coventry Blvd', 507693662, to_date('21-08-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (281183263, 'Jet', 'Quinlan', to_date('01-06-1996', 'dd-mm-yyyy'), '307 Dick', 524044643, to_date('24-07-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (399523162, 'Joy', 'Franks', to_date('12-06-1997', 'dd-mm-yyyy'), '97 DiBiasio', 542265058, to_date('08-06-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (927419867, 'Kylie', 'Cobbs', to_date('11-10-1996', 'dd-mm-yyyy'), '71 Sampson Road', 549247143, to_date('13-09-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (489596624, 'Delroy', 'Street', to_date('08-02-1991', 'dd-mm-yyyy'), '173 West Launceston Street', 520959140, to_date('17-09-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (247824318, 'Tilda', 'Diddley', to_date('21-08-1980', 'dd-mm-yyyy'), '630 Brugherio Road', 549978678, to_date('12-08-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (389367138, 'Gin', 'McGill', to_date('19-10-1982', 'dd-mm-yyyy'), '18 Conlee Street', 504432103, to_date('22-03-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (871277285, 'Rosanne', 'Dolenz', to_date('03-10-1998', 'dd-mm-yyyy'), '75 Mitchell Street', 545683714, to_date('14-01-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (498595597, 'Tea', 'O''Connor', to_date('25-11-1992', 'dd-mm-yyyy'), '55 Imbruglia Drive', 506537416, to_date('25-07-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (248773226, 'Katrin', 'Tsettos', to_date('23-05-1994', 'dd-mm-yyyy'), '811 San Antonio Street', 507094763, to_date('01-01-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (358578439, 'Maggie', 'Leoni', to_date('17-01-1985', 'dd-mm-yyyy'), '26 Lofgren Street', 545424334, to_date('14-02-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (999258925, 'Lizzy', 'Street', to_date('06-06-1986', 'dd-mm-yyyy'), '22nd Street', 504122850, to_date('20-07-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (698881133, 'Sam', 'Amos', to_date('11-08-1994', 'dd-mm-yyyy'), '63 Wong Road', 548214525, to_date('03-08-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (578778765, 'Jean', 'Fraser', to_date('06-03-1990', 'dd-mm-yyyy'), '89 Javon Street', 522312600, to_date('23-06-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (524453385, 'James', 'Foley', to_date('15-01-1996', 'dd-mm-yyyy'), '66 Alec Drive', 506069335, to_date('16-09-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (531315627, 'Fairuza', 'Calle', to_date('18-03-1992', 'dd-mm-yyyy'), '150 Brickell Street', 526259999, to_date('26-09-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (439966173, 'Liv', 'England', to_date('24-05-1997', 'dd-mm-yyyy'), '87 David Blvd', 549603850, to_date('01-07-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (326159627, 'Kristin', 'Chung', to_date('03-03-1987', 'dd-mm-yyyy'), '2 Rubinek Drive', 526038430, to_date('15-12-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (329699315, 'Carlene', 'Purefoy', to_date('13-04-1996', 'dd-mm-yyyy'), '92 Shannon Ave', 541579625, to_date('22-04-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (159531378, 'Bernard', 'Cazale', to_date('25-10-1984', 'dd-mm-yyyy'), '27 Frampton Street', 526092626, to_date('05-02-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (795857146, 'Juliana', 'Midler', to_date('27-02-1992', 'dd-mm-yyyy'), '90 Zellweger Road', 547463088, to_date('21-12-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (691872967, 'Fairuza', 'Palin', to_date('19-06-1980', 'dd-mm-yyyy'), '49 Stavanger Street', 522623352, to_date('28-10-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (146634974, 'Bill', 'Secada', to_date('08-02-1991', 'dd-mm-yyyy'), '725 Bern Street', 547025733, to_date('02-08-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (151816168, 'Chaka', 'Crewson', to_date('08-05-1991', 'dd-mm-yyyy'), '18 Choice Street', 507939769, to_date('30-04-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (379629386, 'Deborah', 'McDowall', to_date('15-01-1992', 'dd-mm-yyyy'), '94 France Drive', 528854369, to_date('22-02-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (839293878, 'Holly', 'Hubbard', to_date('22-05-1984', 'dd-mm-yyyy'), '785 Vaughn Street', 545574115, to_date('10-11-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (851562463, 'Hex', 'Perry', to_date('19-01-1998', 'dd-mm-yyyy'), '251 Danger', 522901238, to_date('22-05-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (733984539, 'Bebe', 'Farina', to_date('25-07-1986', 'dd-mm-yyyy'), '89 Colman Ave', 525127189, to_date('18-07-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (871125241, 'Carrie-Anne', 'Cockburn', to_date('30-10-1991', 'dd-mm-yyyy'), '28 Loveless', 524003523, to_date('16-01-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (535325336, 'Tea', 'McCracken', to_date('17-06-1996', 'dd-mm-yyyy'), '513 Vin Ave', 525689494, to_date('20-05-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (634864169, 'Aida', 'Curfman', to_date('13-04-1983', 'dd-mm-yyyy'), '21 Silverdale Road', 521878423, to_date('10-05-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (118187742, 'Chloe', 'Morton', to_date('20-01-1992', 'dd-mm-yyyy'), '13rd Street', 522453410, to_date('01-04-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (464473768, 'Jeff', 'Collins', to_date('21-08-1986', 'dd-mm-yyyy'), '61st Street', 509605944, to_date('11-06-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (177374393, 'Betty', 'Strong', to_date('18-10-1994', 'dd-mm-yyyy'), '65 Smyrna', 545007838, to_date('11-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (116145276, 'Liv', 'Stamp', to_date('11-01-1994', 'dd-mm-yyyy'), '62 Linney Road', 507526600, to_date('30-07-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (393455922, 'Queen', 'Supernaw', to_date('27-09-1986', 'dd-mm-yyyy'), '59 Peebles Drive', 549447922, to_date('05-11-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (212754324, 'Diamond', 'Armstrong', to_date('28-11-1989', 'dd-mm-yyyy'), '66 Reston Blvd', 507276208, to_date('10-07-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (375453865, 'Elizabeth', 'Stamp', to_date('12-05-1987', 'dd-mm-yyyy'), '32nd Street', 547621336, to_date('19-04-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (291532951, 'Lydia', 'Sylvian', to_date('07-04-1992', 'dd-mm-yyyy'), '32nd Street', 506156954, to_date('07-03-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (528277229, 'Cathy', 'Soul', to_date('12-03-1990', 'dd-mm-yyyy'), '664 Lattimore Street', 540403347, to_date('08-03-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (462266383, 'Rascal', 'Saucedo', to_date('24-07-1987', 'dd-mm-yyyy'), '47 Caroline Street', 522464705, to_date('22-10-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (998282368, 'Judy', 'Sarsgaard', to_date('05-10-1981', 'dd-mm-yyyy'), '83 Lithgow Road', 541571927, to_date('11-10-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (436819126, 'Ernie', 'Cale', to_date('01-03-1997', 'dd-mm-yyyy'), '950 Singh Drive', 501144031, to_date('31-07-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (273217942, 'Samuel', 'Carlton', to_date('31-10-1997', 'dd-mm-yyyy'), '83 Sainte-Marie Road', 508638818, to_date('13-05-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (296873554, 'Cathy', 'Keaton', to_date('24-06-1990', 'dd-mm-yyyy'), '91st Street', 527039967, to_date('15-07-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (444249235, 'Shelby', 'Penders', to_date('15-06-1982', 'dd-mm-yyyy'), '54 Winter Ave', 521149255, to_date('24-04-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (719786493, 'Regina', 'Diggs', to_date('03-07-1984', 'dd-mm-yyyy'), '90 Sandoval Drive', 522291163, to_date('17-10-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (423965681, 'Joan', 'Cozier', to_date('22-06-1995', 'dd-mm-yyyy'), '94 Lake Bluff Drive', 500768094, to_date('13-11-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (783476834, 'Lea', 'Michaels', to_date('19-03-1997', 'dd-mm-yyyy'), '65 Cervine Street', 542559635, to_date('19-05-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (136362534, 'Queen', 'Nelligan', to_date('05-01-1993', 'dd-mm-yyyy'), '60 Rome Road', 501608248, to_date('10-06-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (871976242, 'Tramaine', 'McDonnell', to_date('10-10-1991', 'dd-mm-yyyy'), '43rd Street', 505913756, to_date('15-09-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (135187299, 'Wade', 'Benson', to_date('29-01-1987', 'dd-mm-yyyy'), '73 Peabo Street', 527936974, to_date('06-12-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (385397199, 'Suzanne', 'Williamson', to_date('01-04-1995', 'dd-mm-yyyy'), '90 Maguire Road', 523976316, to_date('27-02-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (326161891, 'Rosario', 'Coleman', to_date('30-03-1985', 'dd-mm-yyyy'), '53 L''union Street', 542856552, to_date('14-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (568989933, 'Glenn', 'Mars', to_date('03-12-1997', 'dd-mm-yyyy'), '96 Nash Road', 525214949, to_date('12-04-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (345486348, 'Bette', 'Hingle', to_date('10-03-1986', 'dd-mm-yyyy'), '10 Taye Road', 546573910, to_date('08-02-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (183686392, 'Dianne', 'Raybon', to_date('27-02-1998', 'dd-mm-yyyy'), '62nd Street', 547106410, to_date('28-07-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (865947552, 'Isaiah', 'Madonna', to_date('24-06-1998', 'dd-mm-yyyy'), '44 Curtis Drive', 527490443, to_date('22-01-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (322323561, 'Juliana', 'Price', to_date('03-01-1982', 'dd-mm-yyyy'), '819 Woodward Road', 544833717, to_date('28-08-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (772493912, 'Joaquin', 'Bentley', to_date('06-03-1983', 'dd-mm-yyyy'), '45 Blaine Road', 540469757, to_date('27-06-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (781714948, 'Mary-Louise', 'Morton', to_date('26-04-1988', 'dd-mm-yyyy'), '97 Steenburgen Road', 543464780, to_date('13-08-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (857622635, 'Jeffery', 'Rush', to_date('16-09-1986', 'dd-mm-yyyy'), '23 Fukuoka Drive', 508247708, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (613976282, 'Rhona', 'Theron', to_date('20-07-1981', 'dd-mm-yyyy'), '42 Burns Street', 543218468, to_date('07-10-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (272113621, 'Linda', 'Kinski', to_date('01-02-1990', 'dd-mm-yyyy'), '94 Keitel Street', 523869020, to_date('10-11-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (987532457, 'Lindsay', 'Crowell', to_date('25-12-1981', 'dd-mm-yyyy'), '627 Slidel Street', 504408031, to_date('10-09-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (133628771, 'Kevn', 'Biehn', to_date('09-05-1983', 'dd-mm-yyyy'), '88 Laura Street', 521329574, to_date('11-07-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (839279521, 'Rawlins', 'Curry', to_date('06-04-1991', 'dd-mm-yyyy'), '69 Bartlett Drive', 541028520, to_date('29-12-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (596462392, 'Bette', 'Mohr', to_date('14-04-1995', 'dd-mm-yyyy'), '10 Ted Drive', 521516687, to_date('23-10-2008', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (588954191, 'Delroy', 'Gleeson', to_date('18-01-1989', 'dd-mm-yyyy'), '68 Squier Drive', 540253820, to_date('01-07-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (814759218, 'Night', 'LaMond', to_date('13-03-1981', 'dd-mm-yyyy'), '12 Sarandon Street', 548079907, to_date('09-12-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (296978266, 'Al', 'Schiff', to_date('21-06-1994', 'dd-mm-yyyy'), '62 Ricci Street', 505124008, to_date('05-10-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (211629287, 'Dave', 'Holmes', to_date('18-07-1992', 'dd-mm-yyyy'), '84 El-Saher Road', 504597238, to_date('23-04-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (845327929, 'Rachid', 'Thomson', to_date('02-08-1995', 'dd-mm-yyyy'), '92 Nicosia Street', 503782779, to_date('08-12-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (454651229, 'Stewart', 'Flack', to_date('02-11-1987', 'dd-mm-yyyy'), '58 Hartford Road', 507470539, to_date('07-03-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (389682785, 'Edward', 'McCoy', to_date('15-05-1982', 'dd-mm-yyyy'), '154 Robert Ave', 540277490, to_date('18-01-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (175694676, 'Madeleine', 'Bonneville', to_date('26-02-1991', 'dd-mm-yyyy'), '33rd Street', 522940485, to_date('29-08-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (279221286, 'Vonda', 'Sandoval', to_date('25-10-1990', 'dd-mm-yyyy'), '16 Chirignago Road', 521309934, to_date('03-04-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (258439593, 'Jean', 'Quaid', to_date('21-11-1999', 'dd-mm-yyyy'), '100 Treviso Drive', 500885930, to_date('22-11-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (996692122, 'Bob', 'Cassel', to_date('30-03-1987', 'dd-mm-yyyy'), '73 John Road', 527806578, to_date('15-01-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (749383727, 'Toshiro', 'de Lancie', to_date('15-08-1986', 'dd-mm-yyyy'), '18 Mclean Road', 527215841, to_date('27-12-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (616653695, 'Lesley', 'Caldwell', to_date('14-08-1982', 'dd-mm-yyyy'), '61st Street', 504678589, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (492886366, 'Tobey', 'Flack', to_date('25-08-1993', 'dd-mm-yyyy'), '72 Lyon Drive', 527033794, to_date('05-10-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (792139189, 'Jamie', 'O''Keefe', to_date('01-07-1981', 'dd-mm-yyyy'), '66 Caan Street', 503873255, to_date('08-12-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (777566944, 'Angela', 'Irons', to_date('08-12-1989', 'dd-mm-yyyy'), '46 West Windsor Blvd', 524133998, to_date('27-05-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (515423239, 'Olga', 'Love', to_date('06-03-1986', 'dd-mm-yyyy'), '70 Kristin Street', 543206312, to_date('09-03-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (419857592, 'LeVar', 'Turner', to_date('14-11-1996', 'dd-mm-yyyy'), '81st Street', 524207779, to_date('10-12-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (457297875, 'Laura', 'Manning', to_date('12-03-1986', 'dd-mm-yyyy'), '3 Patillo', 506336617, to_date('03-07-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (469658897, 'Avenged', 'Ojeda', to_date('13-11-1997', 'dd-mm-yyyy'), '24 Beals', 501258626, to_date('10-01-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (552836342, 'Rene', 'O''Neill', to_date('17-04-1987', 'dd-mm-yyyy'), '100 Sharp Ave', 508606422, to_date('12-10-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (452723368, 'Kieran', 'Swayze', to_date('04-03-1998', 'dd-mm-yyyy'), '501 Heubach Blvd', 522258513, to_date('11-10-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (587947759, 'Amy', 'Irons', to_date('14-03-1993', 'dd-mm-yyyy'), '64 McGinley Street', 543155637, to_date('23-09-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (237748624, 'Ceili', 'Wariner', to_date('17-02-1995', 'dd-mm-yyyy'), '28 Tucker Drive', 520457693, to_date('03-09-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (139239877, 'Giovanni', 'Peebles', to_date('26-04-1996', 'dd-mm-yyyy'), '1 Sewell Road', 525714692, to_date('17-12-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (992942225, 'Juice', 'Pollack', to_date('10-10-1982', 'dd-mm-yyyy'), '27 Carmen Ave', 507288564, to_date('10-08-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (843885691, 'Harriet', 'Tisdale', to_date('10-12-1995', 'dd-mm-yyyy'), '47 Longview Road', 504251584, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (667846472, 'Kathy', 'Crimson', to_date('13-03-1994', 'dd-mm-yyyy'), '32nd Street', 547443316, to_date('09-10-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (914199663, 'Nancy', 'Flemyng', to_date('16-03-1980', 'dd-mm-yyyy'), '57 France Street', 546180253, to_date('25-11-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (627146635, 'Joely', 'Van Shelton', to_date('06-06-1986', 'dd-mm-yyyy'), '79 Sulzbach Blvd', 508880035, to_date('27-12-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (932133821, 'Harvey', 'Hannah', to_date('23-09-1996', 'dd-mm-yyyy'), '340 Durban Drive', 501606706, to_date('23-06-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (851783674, 'Buffy', 'Coward', to_date('01-06-1983', 'dd-mm-yyyy'), '86 Weir Street', 501690686, to_date('21-09-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (637992576, 'Rik', 'Hawn', to_date('24-02-1984', 'dd-mm-yyyy'), '37 Kilmer Ave', 509457210, to_date('04-07-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (827735713, 'Vanessa', 'Dupree', to_date('29-04-1983', 'dd-mm-yyyy'), '63 Ed Street', 502512718, to_date('19-02-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (412764773, 'Leon', 'Caldwell', to_date('13-10-1995', 'dd-mm-yyyy'), '20 Lane Road', 525787807, to_date('14-09-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (797751364, 'Salma', 'Murray', to_date('08-04-1997', 'dd-mm-yyyy'), '54 Vai Street', 505046153, to_date('23-03-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (572311562, 'Tommy', 'Hackman', to_date('02-02-1998', 'dd-mm-yyyy'), '18 Lisbon Ave', 507988923, to_date('01-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (598366132, 'Viggo', 'Easton', to_date('09-02-1992', 'dd-mm-yyyy'), '42 Hartnett Street', 505274305, to_date('02-08-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (218978761, 'Maureen', 'Taha', to_date('29-10-1998', 'dd-mm-yyyy'), '77 Jodie Ave', 501376482, to_date('11-07-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (745141472, 'Candice', 'Wakeling', to_date('03-01-1984', 'dd-mm-yyyy'), '61 Potsdam Road', 509043076, to_date('04-08-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (635462995, 'Avenged', 'Gilley', to_date('28-08-1990', 'dd-mm-yyyy'), '3 Wood Street', 524010899, to_date('22-04-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (788869614, 'Mary', 'Weisberg', to_date('31-01-1988', 'dd-mm-yyyy'), '922 Carter Road', 543859211, to_date('06-01-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (979746888, 'William', 'Houston', to_date('01-08-1980', 'dd-mm-yyyy'), '26 Salma Ave', 543494292, to_date('26-09-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (747962567, 'Maria', 'Travers', to_date('31-12-1999', 'dd-mm-yyyy'), '21 Lauren Street', 527057590, to_date('14-06-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (147959435, 'Daryle', 'Caviezel', to_date('29-03-1980', 'dd-mm-yyyy'), '103 Claire Street', 547421565, to_date('02-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (719688759, 'Stephen', 'Quaid', to_date('30-05-1989', 'dd-mm-yyyy'), '52 Percy Road', 542964232, to_date('25-12-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (352164395, 'Sarah', 'Karyo', to_date('09-09-1991', 'dd-mm-yyyy'), '85 Cheryl Ave', 540229106, to_date('05-09-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (251468686, 'Wayman', 'Spacek', to_date('27-03-1997', 'dd-mm-yyyy'), '294 Rodgers Drive', 545225647, to_date('06-06-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (243125164, 'Queen', 'Duke', to_date('03-02-1983', 'dd-mm-yyyy'), '59 Steenburgen Road', 500592364, to_date('04-04-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (791492594, 'Juliana', 'Piven', to_date('31-05-1986', 'dd-mm-yyyy'), '58 Nicholas', 500691960, to_date('10-08-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (488322515, 'Bruce', 'Vanian', to_date('20-07-1982', 'dd-mm-yyyy'), '5 Redondo beach Road', 504748830, to_date('25-10-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (935491328, 'Derek', 'Coolidge', to_date('14-10-1993', 'dd-mm-yyyy'), '41 Westerberg Drive', 527608417, to_date('16-06-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (816748933, 'Cloris', 'Giraldo', to_date('11-02-1996', 'dd-mm-yyyy'), '838 Mars Drive', 503264399, to_date('16-01-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (672227465, 'Natalie', 'Callow', to_date('16-12-1990', 'dd-mm-yyyy'), '53 Dawson', 545593217, to_date('23-01-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (385473659, 'Franz', 'Keen', to_date('07-03-1984', 'dd-mm-yyyy'), '78 Firenze', 526473233, to_date('07-03-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (661697766, 'Larnelle', 'Schreiber', to_date('01-09-1984', 'dd-mm-yyyy'), '3 Dawson Street', 543881700, to_date('19-10-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (529232332, 'Hugh', 'Savage', to_date('16-05-1996', 'dd-mm-yyyy'), '639 Gummersbach', 542560107, to_date('26-01-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (183845483, 'Gwyneth', 'Peebles', to_date('29-11-1984', 'dd-mm-yyyy'), '68 Walter Drive', 506820674, to_date('13-12-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (134725436, 'Herbie', 'Moody', to_date('27-03-1980', 'dd-mm-yyyy'), '748 Gray Drive', 547487083, to_date('16-05-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (963512184, 'Lila', 'Snow', to_date('20-02-1996', 'dd-mm-yyyy'), '92nd Street', 508964676, to_date('28-08-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (819944515, 'Lorraine', 'Todd', to_date('07-12-1992', 'dd-mm-yyyy'), '392 Vaughn Road', 544117456, to_date('06-10-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (145443376, 'Horace', 'Shalhoub', to_date('09-11-1991', 'dd-mm-yyyy'), '51 Ljubljana Drive', 507520455, to_date('28-08-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (878276742, 'Rascal', 'Weber', to_date('16-08-1995', 'dd-mm-yyyy'), '240 Mazzello', 505528801, to_date('19-05-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (687386167, 'Geoffrey', 'Perez', to_date('28-03-1984', 'dd-mm-yyyy'), '5 Molina Street', 500578819, to_date('06-01-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (664934526, 'Dylan', 'Scheider', to_date('20-12-1988', 'dd-mm-yyyy'), '59 Trey Ave', 508581111, to_date('23-11-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (862421559, 'Vanessa', 'Steenburgen', to_date('12-03-1996', 'dd-mm-yyyy'), '871 Turner Street', 525577533, to_date('29-04-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (524858663, 'Rhys', 'McLachlan', to_date('06-03-1982', 'dd-mm-yyyy'), '78 Mitra Road', 528231450, to_date('30-08-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (249934851, 'Kazem', 'Spine', to_date('10-08-1998', 'dd-mm-yyyy'), '136 Mint Blvd', 527118401, to_date('18-01-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (537569649, 'Marie', 'Mitra', to_date('25-06-1990', 'dd-mm-yyyy'), '56 Parker Street', 548984798, to_date('22-03-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (156569945, 'Nicholas', 'Marsden', to_date('24-12-1981', 'dd-mm-yyyy'), '22nd Street', 528692198, to_date('26-12-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (246141748, 'April', 'Conners', to_date('03-12-1989', 'dd-mm-yyyy'), '15 Rankin Drive', 501804849, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (159536136, 'Jon', 'Strathairn', to_date('30-01-1999', 'dd-mm-yyyy'), '74 Devine Blvd', 525970263, to_date('23-05-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (511824734, 'Edgar', 'Blackwell', to_date('04-04-1996', 'dd-mm-yyyy'), '43 Bancroft Drive', 526982977, to_date('02-02-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (259428855, 'Patti', 'Melvin', to_date('07-12-1997', 'dd-mm-yyyy'), '13rd Street', 549387318, to_date('14-08-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (589619935, 'Saul', 'Wincott', to_date('18-12-1986', 'dd-mm-yyyy'), '10 Kylie Street', 500081275, to_date('13-09-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (776252852, 'Andy', 'Winger', to_date('03-10-1986', 'dd-mm-yyyy'), '98 Sigourney Ave', 507625833, to_date('30-04-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (461139558, 'Jerry', 'Jamal', to_date('27-08-1983', 'dd-mm-yyyy'), '73 Rundgren Street', 523763236, to_date('20-02-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (195283793, 'Devon', 'Byrne', to_date('03-07-1982', 'dd-mm-yyyy'), '2 Cale Drive', 501861617, to_date('13-11-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (935358341, 'Madeleine', 'Koyana', to_date('16-08-1994', 'dd-mm-yyyy'), '57 Dorn Road', 500245496, to_date('29-01-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (492957321, 'Nora', 'Lavigne', to_date('02-11-1994', 'dd-mm-yyyy'), '64 Kiefer Ave', 546031746, to_date('08-12-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (887589681, 'Gene', 'Ponce', to_date('01-07-1987', 'dd-mm-yyyy'), '13 Santana Street', 506733543, to_date('18-09-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (146126967, 'Hugo', 'Keith', to_date('24-12-1996', 'dd-mm-yyyy'), '49 Angie Street', 502369788, to_date('08-05-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (225231663, 'Cloris', 'Scaggs', to_date('25-09-1992', 'dd-mm-yyyy'), '82nd Street', 521095142, to_date('10-04-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (275982699, 'Mindy', 'Rydell', to_date('27-06-1982', 'dd-mm-yyyy'), '663 Sheena Drive', 526920071, to_date('09-08-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (394998526, 'Ty', 'Saxon', to_date('14-08-1992', 'dd-mm-yyyy'), '20 Fairfax Street', 520944258, to_date('25-06-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (985575896, 'Lynn', 'Hingle', to_date('24-01-1985', 'dd-mm-yyyy'), '42 Toyama Ave', 546362436, to_date('04-10-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (265557194, 'Juan', 'Garner', to_date('03-02-1983', 'dd-mm-yyyy'), '55 Stafford', 525592250, to_date('08-01-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (818382624, 'Dean', 'Stuart', to_date('11-07-1983', 'dd-mm-yyyy'), '3 Tal Ave', 548940337, to_date('13-05-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (523194253, 'Marlon', 'Barkin', to_date('30-06-1980', 'dd-mm-yyyy'), '94 Vejle Drive', 502897204, to_date('09-01-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (818626721, 'Ethan', 'Harnes', to_date('03-12-1987', 'dd-mm-yyyy'), '37 Farris', 506334550, to_date('19-08-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (898152989, 'Hal', 'Thorton', to_date('24-09-1981', 'dd-mm-yyyy'), '38 San Jose Road', 541669670, to_date('09-07-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (125349632, 'Janice', 'McDonald', to_date('30-06-1992', 'dd-mm-yyyy'), '45 McElhone Street', 526839970, to_date('26-05-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (765393268, 'Madeline', 'Perlman', to_date('01-04-1987', 'dd-mm-yyyy'), '51st Street', 505196800, to_date('02-02-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (877281945, 'Davy', 'Singh', to_date('10-04-1990', 'dd-mm-yyyy'), '39 Ohita Street', 524576301, to_date('03-12-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (544898831, 'Deborah', 'Lindo', to_date('11-09-1987', 'dd-mm-yyyy'), '38 Carnes Street', 525630084, to_date('18-05-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (137513264, 'Derek', 'Conway', to_date('30-10-1984', 'dd-mm-yyyy'), '97 Peniston Blvd', 541603715, to_date('30-03-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (865429285, 'Robin', 'Ruiz', to_date('12-08-1999', 'dd-mm-yyyy'), '9 Hurley Street', 541913891, to_date('30-09-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (426289694, 'Kurtwood', 'Griggs', to_date('29-10-1997', 'dd-mm-yyyy'), '53rd Street', 503068272, to_date('11-05-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (219374421, 'Wallace', 'Jonze', to_date('28-05-1981', 'dd-mm-yyyy'), '15 Cumming Drive', 529098258, to_date('20-11-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (643423966, 'Brenda', 'Theron', to_date('03-05-1999', 'dd-mm-yyyy'), '114 Lizzy Street', 504087255, to_date('12-03-2019', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (434221241, 'Cesar', 'Tilly', to_date('22-07-1982', 'dd-mm-yyyy'), '406 Shannon Street', 503786102, to_date('17-10-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (245536542, 'Ali', 'Biehn', to_date('16-11-1994', 'dd-mm-yyyy'), '54 Jim Ave', 542907982, to_date('26-02-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (726721537, 'Bobbi', 'Tsettos', to_date('27-03-1982', 'dd-mm-yyyy'), '4 Curtis', 542044163, to_date('07-04-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (691737316, 'Mary Beth', 'Phoenix', to_date('03-01-1983', 'dd-mm-yyyy'), '93 Johansen Blvd', 521833413, to_date('11-12-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (864724389, 'Julio', 'Levert', to_date('14-03-1996', 'dd-mm-yyyy'), '30 Tomlin Ave', 529659226, to_date('15-09-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (482269464, 'Rascal', 'Delta', to_date('11-02-1995', 'dd-mm-yyyy'), '12 Monk Drive', 523836826, to_date('12-05-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (656752466, 'Collective', 'Gibbons', to_date('18-05-1990', 'dd-mm-yyyy'), '72nd Street', 544240229, to_date('14-08-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (517354461, 'Robert', 'Kingsley', to_date('17-06-1985', 'dd-mm-yyyy'), '36 Pigott-Smith Drive', 527684491, to_date('05-11-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (692233694, 'Shawn', 'Close', to_date('28-03-1996', 'dd-mm-yyyy'), '93 Rain', 507785259, to_date('13-01-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (214286441, 'Davy', 'Diehl', to_date('18-05-1996', 'dd-mm-yyyy'), '75 Mitchell Road', 500327869, to_date('06-02-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (445214224, 'Bo', 'Mollard', to_date('10-04-1980', 'dd-mm-yyyy'), '102 Carter Drive', 528420226, to_date('15-08-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (846221927, 'Rade', 'Jenkins', to_date('13-07-1986', 'dd-mm-yyyy'), '84 Neve Drive', 544839791, to_date('06-05-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (695717971, 'Tilda', 'Winter', to_date('30-04-1986', 'dd-mm-yyyy'), '61st Street', 500429082, to_date('08-12-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (523942719, 'Wade', 'Loggins', to_date('28-02-1983', 'dd-mm-yyyy'), '814 McCann Drive', 507338695, to_date('11-12-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (232362661, 'Lila', 'Street', to_date('06-09-1998', 'dd-mm-yyyy'), '94 Adkins Drive', 508085700, to_date('10-04-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (372978927, 'Nicolas', 'Arnold', to_date('09-08-1996', 'dd-mm-yyyy'), '1 Tim Road', 521554074, to_date('29-01-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (283847892, 'Casey', 'Vaughan', to_date('03-01-1981', 'dd-mm-yyyy'), '40 Jet Blvd', 527514970, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (127968517, 'Helen', 'Gellar', to_date('07-09-1996', 'dd-mm-yyyy'), '462 Everett Road', 541748681, to_date('01-08-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (717223769, 'Lucy', 'Westerberg', to_date('07-04-1996', 'dd-mm-yyyy'), '62 Crete Drive', 501224478, to_date('28-11-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (288236313, 'Nicolas', 'Cox', to_date('26-04-1980', 'dd-mm-yyyy'), '422 Joinville Drive', 509165422, to_date('18-03-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (658667536, 'Mindy', 'Costner', to_date('09-07-1980', 'dd-mm-yyyy'), '58 Fender', 505510019, to_date('07-07-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (929247419, 'Mykelti', 'Bruce', to_date('20-09-1989', 'dd-mm-yyyy'), '74 Santa Rosa Street', 523549942, to_date('08-04-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (614763397, 'Domingo', 'Sayer', to_date('08-02-1996', 'dd-mm-yyyy'), '101 Addy Blvd', 507899007, to_date('15-09-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (511192572, 'Laurence', 'McGriff', to_date('19-07-1981', 'dd-mm-yyyy'), '28 Finney Road', 524425693, to_date('21-11-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (946694629, 'Dionne', 'Morales', to_date('07-06-1981', 'dd-mm-yyyy'), '16 Brno Ave', 509753660, to_date('20-11-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (893866938, 'Brent', 'Furay', to_date('21-06-1990', 'dd-mm-yyyy'), '63rd Street', 506621830, to_date('08-11-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (422522771, 'Cherry', 'Cumming', to_date('26-09-1981', 'dd-mm-yyyy'), '59 Northbrook', 523181092, to_date('02-11-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (665241182, 'Rob', 'Zeta-Jones', to_date('12-04-1980', 'dd-mm-yyyy'), '91 Mito Street', 543333934, to_date('27-12-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (959212511, 'Dianne', 'Broadbent', to_date('14-05-1988', 'dd-mm-yyyy'), '42 Northbrook', 502684693, to_date('09-08-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (686989579, 'Gavin', 'Vai', to_date('15-07-1984', 'dd-mm-yyyy'), '73 Lange Drive', 520987735, to_date('29-05-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (112672359, 'Deborah', 'Cusack', to_date('10-04-1987', 'dd-mm-yyyy'), '57 Bryan Road', 540876300, to_date('21-05-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (776589943, 'Chrissie', 'Goodall', to_date('26-03-1985', 'dd-mm-yyyy'), '58 Coolidge Drive', 542298035, to_date('21-06-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (113345784, 'Andrae', 'Clark', to_date('05-06-1991', 'dd-mm-yyyy'), '31 Kimberly Drive', 542585647, to_date('18-12-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (633241913, 'Manu', 'Tucker', to_date('02-02-1991', 'dd-mm-yyyy'), '88 Stowe Ave', 540541373, to_date('09-11-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (936757698, 'Katie', 'Elizondo', to_date('06-02-1998', 'dd-mm-yyyy'), '67 Fairview Heights Blvd', 527919874, to_date('11-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (921525641, 'Chubby', 'D''Onofrio', to_date('07-04-1995', 'dd-mm-yyyy'), '2 Savage Drive', 524199595, to_date('16-08-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (546765217, 'Brendan', 'Hedaya', to_date('04-11-1995', 'dd-mm-yyyy'), '62nd Street', 547163001, to_date('28-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (625395847, 'Christian', 'Hersh', to_date('05-06-1986', 'dd-mm-yyyy'), '63 Overland park Blvd', 525919095, to_date('19-04-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (833269959, 'Micky', 'Davidtz', to_date('08-02-1996', 'dd-mm-yyyy'), '76 Daniel Drive', 528819560, to_date('26-02-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (246439595, 'Kieran', 'Solido', to_date('14-12-1989', 'dd-mm-yyyy'), '13 Northampton', 508388113, to_date('30-05-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (966253816, 'Earl', 'Estevez', to_date('18-02-1984', 'dd-mm-yyyy'), '22 Sao caetano do sul Drive', 543650349, to_date('08-05-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (414253853, 'Lindsey', 'Steiger', to_date('13-01-1993', 'dd-mm-yyyy'), '42nd Street', 520632732, to_date('17-01-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (861373978, 'Malcolm', 'Stevenson', to_date('31-03-1991', 'dd-mm-yyyy'), '87 Beverley Ave', 503872530, to_date('28-08-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (989919591, 'Goran', 'Rapaport', to_date('19-04-1999', 'dd-mm-yyyy'), '18 Child Blvd', 541342494, to_date('24-04-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (877489359, 'Larry', 'Speaks', to_date('26-02-1981', 'dd-mm-yyyy'), '16 Burwood East Drive', 549349637, to_date('07-05-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (588692828, 'Sheryl', 'Drive', to_date('16-03-1998', 'dd-mm-yyyy'), '3 O''Hara Street', 501274618, to_date('17-09-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (793675167, 'Reese', 'McPherson', to_date('15-12-1982', 'dd-mm-yyyy'), '99 Indianapolis Drive', 543552143, to_date('19-03-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (553885863, 'Ricky', 'Imperioli', to_date('09-03-1990', 'dd-mm-yyyy'), '75 Cash Blvd', 507001635, to_date('29-09-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (827848646, 'Bill', 'Bosco', to_date('09-05-1988', 'dd-mm-yyyy'), '60 Buckingham Drive', 540970076, to_date('17-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (336514439, 'Cornell', 'Popper', to_date('24-11-1982', 'dd-mm-yyyy'), '50 Nepean Road', 542678494, to_date('20-07-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (924826472, 'Davy', 'Cochran', to_date('10-06-1982', 'dd-mm-yyyy'), '61st Street', 509523785, to_date('11-06-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (389145339, 'Rebecca', 'Sutherland', to_date('01-08-1993', 'dd-mm-yyyy'), '10 Karachi Blvd', 541329206, to_date('01-02-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (988272792, 'Scarlett', 'Voight', to_date('04-08-1981', 'dd-mm-yyyy'), '23rd Street', 547186845, to_date('07-09-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (216441838, 'Liam', 'Ingram', to_date('15-01-1989', 'dd-mm-yyyy'), '82nd Street', 500650702, to_date('27-04-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (188273144, 'Mili', 'Hewitt', to_date('30-10-1989', 'dd-mm-yyyy'), '1 Allen Drive', 503527445, to_date('15-09-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (994266671, 'Taryn', 'Dafoe', to_date('10-09-1993', 'dd-mm-yyyy'), '94 Jimmy Road', 528762648, to_date('26-09-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (683795957, 'Caroline', 'Branagh', to_date('24-08-1981', 'dd-mm-yyyy'), '4 Salzburg Drive', 503560774, to_date('28-03-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (592611699, 'Whoopi', 'Thewlis', to_date('28-09-1997', 'dd-mm-yyyy'), '36 Loren Road', 528877218, to_date('25-08-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (213497876, 'Roy', 'Stanley', to_date('14-10-1983', 'dd-mm-yyyy'), '306 Field Street', 521424386, to_date('16-09-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (484174443, 'Freddie', 'Steagall', to_date('16-11-1991', 'dd-mm-yyyy'), '824 Neuwirth Blvd', 548002801, to_date('20-09-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (133845483, 'Christian', 'Arkin', to_date('23-02-1991', 'dd-mm-yyyy'), '45 Fukui Street', 509892167, to_date('24-06-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (687312756, 'Rachael', 'Lewin', to_date('09-05-1981', 'dd-mm-yyyy'), '56 Lyonne Road', 522029392, to_date('25-05-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (791228183, 'Max', 'Moody', to_date('03-02-1989', 'dd-mm-yyyy'), '718 Kinnear Drive', 520915710, to_date('01-05-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (618842857, 'Sharon', 'Dorn', to_date('12-10-1983', 'dd-mm-yyyy'), '91st Street', 540130800, to_date('23-06-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (464734176, 'Salma', 'Ali', to_date('12-09-1990', 'dd-mm-yyyy'), '99 Wen Road', 523900888, to_date('29-12-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (133183683, 'Nicky', 'Phillips', to_date('02-06-1992', 'dd-mm-yyyy'), '584 Dom Drive', 501848589, to_date('29-01-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (891864598, 'Rufus', 'Aiken', to_date('29-01-1987', 'dd-mm-yyyy'), '54 Santa Rosa Street', 540763213, to_date('16-03-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (212466261, 'Powers', 'Stone', to_date('21-12-1980', 'dd-mm-yyyy'), '64 Holly Road', 549058851, to_date('09-06-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (783311218, 'Julianna', 'Mueller-Stahl', to_date('04-02-1995', 'dd-mm-yyyy'), '63 Marina Street', 506853683, to_date('18-08-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (914342673, 'Rose', 'Daniels', to_date('15-05-1994', 'dd-mm-yyyy'), '6 Carlingford Ave', 500878452, to_date('09-03-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (665368626, 'Beverley', 'Cotton', to_date('23-10-1986', 'dd-mm-yyyy'), '86 Mickey Drive', 545787236, to_date('21-03-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (498558242, 'Lloyd', 'Gary', to_date('06-08-1991', 'dd-mm-yyyy'), '23 Fichtner Road', 526450977, to_date('05-04-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (196478439, 'Mel', 'Sherman', to_date('08-06-1998', 'dd-mm-yyyy'), '52nd Street', 541867886, to_date('12-12-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (612262453, 'Collective', 'Englund', to_date('14-03-1998', 'dd-mm-yyyy'), '63 Jill Street', 542190015, to_date('08-03-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (142424449, 'Lee', 'Dillane', to_date('24-08-1984', 'dd-mm-yyyy'), '37 Cruz Drive', 524093183, to_date('01-08-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (747336372, 'Lindsey', 'Chaykin', to_date('15-06-1998', 'dd-mm-yyyy'), '84 Palminteri Blvd', 500582386, to_date('16-08-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (796488261, 'Mira', 'Weaving', to_date('06-01-1985', 'dd-mm-yyyy'), '83rd Street', 544848535, to_date('03-06-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (233213812, 'Liam', 'Sorvino', to_date('11-08-1984', 'dd-mm-yyyy'), '783 Herzogenrath Road', 545083035, to_date('14-12-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (783581687, 'Karon', 'Crudup', to_date('27-02-1988', 'dd-mm-yyyy'), '80 Gersthofen Road', 522772441, to_date('05-05-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (195985798, 'Merrill', 'Coe', to_date('13-07-1999', 'dd-mm-yyyy'), '40 Bonn', 503642780, to_date('10-02-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (687439599, 'Bobbi', 'Caine', to_date('16-05-1997', 'dd-mm-yyyy'), '86 Mantegna Street', 546175179, to_date('25-01-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (427316471, 'Vin', 'Zane', to_date('08-08-1999', 'dd-mm-yyyy'), '181 Duchovny Street', 544320293, to_date('01-12-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (268459128, 'Hikaru', 'Ontiveros', to_date('01-12-1985', 'dd-mm-yyyy'), '25 Alannah Street', 507699509, to_date('08-11-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (246853156, 'Tilda', 'Zellweger', to_date('24-10-1996', 'dd-mm-yyyy'), '571 Jeter Street', 509481662, to_date('10-08-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (934135551, 'Pat', 'Pitney', to_date('17-02-1999', 'dd-mm-yyyy'), '15 Sevigny', 529796449, to_date('05-01-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (963921632, 'Stewart', 'Nolte', to_date('31-01-1985', 'dd-mm-yyyy'), '21 Scott Road', 505225258, to_date('13-12-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (838194879, 'Nik', 'Reid', to_date('23-07-1989', 'dd-mm-yyyy'), '76 Rochester Drive', 543295770, to_date('26-04-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (694557382, 'Mike', 'Studi', to_date('04-10-1980', 'dd-mm-yyyy'), '73 Arjona Drive', 501866774, to_date('29-08-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (476485619, 'Lindsay', 'Duschel', to_date('08-06-1980', 'dd-mm-yyyy'), '571 Choice Drive', 524115573, to_date('15-10-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (675131781, 'Gena', 'Bullock', to_date('23-07-1999', 'dd-mm-yyyy'), '47 Latin', 520129089, to_date('18-07-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (588855746, 'Embeth', 'Sinise', to_date('16-05-1999', 'dd-mm-yyyy'), '94 Coolidge Blvd', 509077947, to_date('19-06-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (295459114, 'Chrissie', 'Fierstein', to_date('28-09-1991', 'dd-mm-yyyy'), '36 Dolenz Street', 503428586, to_date('03-09-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (839743986, 'Danny', 'Connery', to_date('09-08-1985', 'dd-mm-yyyy'), '92 Cuenca Blvd', 545174380, to_date('12-04-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (683168743, 'Tom', 'Hart', to_date('01-07-1998', 'dd-mm-yyyy'), '690 Buenos Aires Street', 505148086, to_date('30-07-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (983332176, 'Christopher', 'Firth', to_date('22-05-1994', 'dd-mm-yyyy'), '69 Spader Street', 545084415, to_date('09-03-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (697658135, 'Raul', 'Schwarzenegger', to_date('15-02-1999', 'dd-mm-yyyy'), '57 Sundsvall Ave', 528073601, to_date('30-06-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (718118922, 'Jackie', 'Braugher', to_date('13-07-1995', 'dd-mm-yyyy'), '19 Dzundza Street', 524150474, to_date('11-02-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (779255373, 'Roddy', 'Baker', to_date('20-04-1984', 'dd-mm-yyyy'), '44 Geneve Street', 521898204, to_date('23-12-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (627241567, 'Hazel', 'Drive', to_date('09-03-1995', 'dd-mm-yyyy'), '38 Folds Ave', 506277741, to_date('06-04-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (945839263, 'Rory', 'Clarkson', to_date('19-07-1996', 'dd-mm-yyyy'), '32 Hatfield Street', 526782101, to_date('21-11-2014', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (264286847, 'Cherry', 'Sellers', to_date('30-12-1995', 'dd-mm-yyyy'), '30 Dern Blvd', 522988655, to_date('13-12-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (128461244, 'Rip', 'Tucci', to_date('29-08-1994', 'dd-mm-yyyy'), '36 Munich Road', 502969205, to_date('20-10-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (613385368, 'Maura', 'Feliciano', to_date('16-04-1989', 'dd-mm-yyyy'), '61 San Francisco Drive', 548025313, to_date('14-01-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (513496241, 'Maura', 'Nash', to_date('27-03-1991', 'dd-mm-yyyy'), '6 Sarandon Ave', 527651596, to_date('28-09-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (625773541, 'Sissy', 'Danes', to_date('21-04-1995', 'dd-mm-yyyy'), '29 Lea Road', 506823458, to_date('11-07-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (889171657, 'Bridget', 'Bush', to_date('18-10-1990', 'dd-mm-yyyy'), '46 Neville Street', 503208676, to_date('28-11-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (865891844, 'Helen', 'Keen', to_date('09-04-1993', 'dd-mm-yyyy'), '34 Douglas', 505247244, to_date('19-01-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (274435187, 'Maury', 'Baranski', to_date('26-03-1998', 'dd-mm-yyyy'), '76 Richter Blvd', 505073373, to_date('22-07-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (363851854, 'Olga', 'Scorsese', to_date('25-12-1986', 'dd-mm-yyyy'), '848 Ryder Street', 546223272, to_date('01-11-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (555935128, 'Gena', 'Perry', to_date('12-12-1989', 'dd-mm-yyyy'), '42 Tadley Blvd', 505178145, to_date('10-11-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (295425129, 'Harold', 'Chandler', to_date('14-09-1984', 'dd-mm-yyyy'), '90 Kyra Street', 505504658, to_date('18-06-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (768124319, 'Aimee', 'Travolta', to_date('01-06-1988', 'dd-mm-yyyy'), '65 Huntsville Drive', 546433261, to_date('27-07-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (174663896, 'Kazem', 'Iglesias', to_date('16-04-1987', 'dd-mm-yyyy'), '430 Kochi Street', 505003635, to_date('10-11-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (526917216, 'Isaiah', 'Lewis', to_date('04-03-1981', 'dd-mm-yyyy'), '45 Wong Road', 503305424, to_date('22-08-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (627763311, 'Kate', 'Morton', to_date('12-03-1991', 'dd-mm-yyyy'), '31st Street', 542867332, to_date('02-05-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (456295863, 'Cesar', 'Spacey', to_date('11-06-1992', 'dd-mm-yyyy'), '49 Santa Fe Road', 501013249, to_date('03-11-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (152283235, 'Millie', 'Daniels', to_date('02-06-1998', 'dd-mm-yyyy'), '12 Winwood Drive', 549899969, to_date('18-05-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (865477728, 'Lindsay', 'Rankin', to_date('21-11-1985', 'dd-mm-yyyy'), '85 Nanci Street', 509989278, to_date('24-10-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (435997313, 'Kelly', 'De Niro', to_date('13-08-1989', 'dd-mm-yyyy'), '428 Cummings Street', 547958674, to_date('06-09-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (335831479, 'Cheech', 'Swayze', to_date('10-04-1992', 'dd-mm-yyyy'), '56 Wesley Ave', 542328981, to_date('29-10-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (649328127, 'Aidan', 'Brickell', to_date('05-06-1996', 'dd-mm-yyyy'), '92 Liev Road', 523269127, to_date('02-02-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (779616214, 'Gordie', 'Rossellini', to_date('04-11-1986', 'dd-mm-yyyy'), '73rd Street', 548800467, to_date('28-02-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (249417168, 'Oded', 'Condition', to_date('15-05-1998', 'dd-mm-yyyy'), '79 Overland park Ave', 541694010, to_date('09-08-2000', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (159456556, 'Gene', 'Warwick', to_date('25-07-1996', 'dd-mm-yyyy'), '64 Douglas Drive', 501796689, to_date('11-01-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (116688813, 'Dar', 'Cruz', to_date('16-11-1989', 'dd-mm-yyyy'), '16 Alicia Drive', 501414693, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (947516768, 'Taye', 'Venora', to_date('18-04-1991', 'dd-mm-yyyy'), '52nd Street', 502399701, to_date('27-05-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (431447543, 'Kasey', 'Cronin', to_date('14-03-1995', 'dd-mm-yyyy'), '19 Magnuson Street', 546317907, to_date('13-02-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (464846577, 'Allan', 'Gambon', to_date('12-01-1999', 'dd-mm-yyyy'), '73 Nicks Street', 543288608, to_date('08-09-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (675556678, 'Helen', 'MacIsaac', to_date('24-09-1997', 'dd-mm-yyyy'), '1 Elwes Road', 542207715, to_date('19-09-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (183457173, 'Richard', 'Chinlund', to_date('09-11-1990', 'dd-mm-yyyy'), '72 East Providence Drive', 502706679, to_date('10-12-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (457536569, 'Chalee', 'Sylvian', to_date('20-06-1988', 'dd-mm-yyyy'), '86 Swank Street', 527091236, to_date('28-04-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (571814751, 'Sandra', 'Watson', to_date('20-11-1985', 'dd-mm-yyyy'), '54 Charlottesville Ave', 543614605, to_date('09-12-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (959631963, 'Kirk', 'Blossoms', to_date('03-08-1988', 'dd-mm-yyyy'), '8 Keith Ave', 508240164, to_date('29-06-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (938336827, 'Jean', 'Coltrane', to_date('13-11-1987', 'dd-mm-yyyy'), '185 Balin', 545161629, to_date('21-02-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (144229452, 'Sophie', 'Belles', to_date('18-08-1994', 'dd-mm-yyyy'), '83rd Street', 504819950, to_date('09-09-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (446783813, 'Lara', 'Coe', to_date('14-10-1995', 'dd-mm-yyyy'), '20 Idol Street', 525549170, to_date('25-08-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (417183526, 'Donald', 'Hartnett', to_date('28-02-1987', 'dd-mm-yyyy'), '62 Fogerty Street', 548259291, to_date('03-09-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (986428617, 'Leelee', 'Chestnut', to_date('09-12-1982', 'dd-mm-yyyy'), '961 Stephen Street', 500308302, to_date('22-02-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (368912915, 'Patty', 'Shawn', to_date('07-04-1982', 'dd-mm-yyyy'), '62 Piven Street', 540477779, to_date('29-08-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (882788466, 'Howie', 'Metcalf', to_date('08-06-1995', 'dd-mm-yyyy'), '93 Starr Street', 543682907, to_date('13-02-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (698826441, 'Percy', 'Ratzenberger', to_date('27-06-1987', 'dd-mm-yyyy'), '47 West Drayton Street', 543665265, to_date('12-03-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (249277281, 'Nastassja', 'Conley', to_date('28-07-1989', 'dd-mm-yyyy'), '82 Kravitz', 507895774, to_date('30-07-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (874933198, 'Irene', 'Rhodes', to_date('20-12-1992', 'dd-mm-yyyy'), '226 Paula Street', 505377690, to_date('15-02-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (456235494, 'Mint', 'Waits', to_date('18-04-1985', 'dd-mm-yyyy'), '10 Scorsese Street', 504188843, to_date('01-12-2013', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (143514188, 'Dan', 'Lattimore', to_date('28-07-1999', 'dd-mm-yyyy'), '928 Rudd Street', 540785300, to_date('27-01-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (247769836, 'Kathy', 'Moss', to_date('23-04-1990', 'dd-mm-yyyy'), '60 Gloria Road', 546920590, to_date('15-05-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (539536672, 'Lindsay', 'Downie', to_date('15-06-1992', 'dd-mm-yyyy'), '31 DiFranco Street', 501090761, to_date('25-06-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (673259866, 'Carla', 'Connick', to_date('23-04-1985', 'dd-mm-yyyy'), '27 Shepherd Ave', 509227839, to_date('25-06-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (881511811, 'Gord', 'Cockburn', to_date('23-10-1983', 'dd-mm-yyyy'), '98 Chan', 523595042, to_date('29-05-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (831345862, 'Mark', 'Jay', to_date('21-08-1993', 'dd-mm-yyyy'), '48 Queen Drive', 526130525, to_date('29-06-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (585538532, 'Rolando', 'Roy Parnell', to_date('24-09-1994', 'dd-mm-yyyy'), '631 Crystal', 504490653, to_date('24-05-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (971755198, 'Dave', 'Farris', to_date('27-06-1981', 'dd-mm-yyyy'), '1 Pete Street', 500421983, to_date('16-11-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (119289287, 'Jackie', 'Harrelson', to_date('12-06-1981', 'dd-mm-yyyy'), '14 Latifah Road', 508005799, to_date('29-07-2010', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (657444127, 'Cherry', 'Glover', to_date('25-09-1989', 'dd-mm-yyyy'), '44 Keen', 507256462, to_date('04-03-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (849377551, 'Chad', 'Winstone', to_date('31-07-1999', 'dd-mm-yyyy'), '3 Jane Street', 502490631, to_date('23-07-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (664285891, 'Neneh', 'Payne', to_date('22-05-1997', 'dd-mm-yyyy'), '5 Madeline Drive', 522806170, to_date('29-07-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (958481673, 'Azucar', 'Nivola', to_date('26-09-1994', 'dd-mm-yyyy'), '54 Winterthur', 547049683, to_date('07-02-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (173889484, 'Thin', 'Farrell', to_date('09-09-1990', 'dd-mm-yyyy'), '23 Espoo Drive', 549336223, to_date('21-02-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (338583256, 'Clive', 'Loring', to_date('11-01-1991', 'dd-mm-yyyy'), '19 Walker', 540571972, to_date('28-08-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (114983181, 'Thora', 'Carlyle', to_date('14-05-1981', 'dd-mm-yyyy'), '64 Numan Road', 509260328, to_date('14-05-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (741654353, 'Marley', 'Alexander', to_date('16-11-1987', 'dd-mm-yyyy'), '68 Addy', 506888761, to_date('06-06-2018', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (896461191, 'Loren', 'Ontiveros', to_date('06-09-1985', 'dd-mm-yyyy'), '679 Jenkins Street', 523454794, to_date('07-06-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (746686122, 'Viggo', 'Rhys-Davies', to_date('22-05-1991', 'dd-mm-yyyy'), '54 Kitty Drive', 504666815, to_date('25-03-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (461317518, 'Janeane', 'Cummings', to_date('31-01-1989', 'dd-mm-yyyy'), '10 Gary Drive', 540098790, to_date('26-08-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (582315646, 'Louise', 'DiFranco', to_date('18-05-1996', 'dd-mm-yyyy'), '203 Bartlett Street', 544709299, to_date('30-05-2006', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (784898128, 'Julianna', 'Rippy', to_date('19-12-1999', 'dd-mm-yyyy'), '72nd Street', 526930539, to_date('22-06-2017', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (136626676, 'Maggie', 'Brickell', to_date('05-12-1991', 'dd-mm-yyyy'), '12 Turturro Street', 505135362, to_date('09-08-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (998147894, 'Tom', 'Shelton', to_date('17-06-1997', 'dd-mm-yyyy'), '70 Tamala Street', 540798372, to_date('29-05-2008', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (141511782, 'Lionel', 'Newton', to_date('13-09-1984', 'dd-mm-yyyy'), '68 Rizzo Drive', 502466841, to_date('28-09-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (824694479, 'Mark', 'Hopper', to_date('23-12-1996', 'dd-mm-yyyy'), '54 Aglukark Street', 508287497, to_date('27-06-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (747312363, 'Todd', 'Lavigne', to_date('24-07-1980', 'dd-mm-yyyy'), '52 Zevon Ave', 504584521, to_date('10-03-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (297367375, 'Rachid', 'Glover', to_date('10-12-1996', 'dd-mm-yyyy'), '27 Rascal Drive', 521030507, to_date('18-12-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (335877875, 'Gina', 'Biggs', to_date('12-11-1999', 'dd-mm-yyyy'), '22 Matheson Street', 526175889, to_date('01-10-2016', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (787816584, 'Caroline', 'Lopez', to_date('19-03-1984', 'dd-mm-yyyy'), '609 Fishburne Road', 541978386, to_date('14-11-2019', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (211278519, 'Colm', 'Osbourne', to_date('15-10-1999', 'dd-mm-yyyy'), '21 Wiedlin Drive', 529087976, to_date('27-07-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (564113272, 'Ray', 'Affleck', to_date('02-10-1984', 'dd-mm-yyyy'), '44 Hanks Street', 529435879, to_date('09-09-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (941236614, 'Gord', 'Washington', to_date('23-11-1991', 'dd-mm-yyyy'), '668 Craven Ave', 544737214, to_date('11-06-2007', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (348553139, 'Nicole', 'Steenburgen', to_date('02-07-1999', 'dd-mm-yyyy'), '34 Jackson Blvd', 521709284, to_date('06-01-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (381585881, 'Davy', 'Manning', to_date('13-01-1995', 'dd-mm-yyyy'), '5 Hutch Street', 540785490, to_date('23-08-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (924533695, 'Raymond', 'Heron', to_date('26-08-1995', 'dd-mm-yyyy'), '32 Graham Ave', 544383058, to_date('29-03-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (842582727, 'Lynette', 'Glover', to_date('27-05-1989', 'dd-mm-yyyy'), '97 Palmieri', 526992624, to_date('08-11-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (599664992, 'Ramsey', 'Quinn', to_date('25-12-1982', 'dd-mm-yyyy'), '24 Holmes', 540904816, to_date('28-08-2012', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (657135795, 'Jared', 'Silverman', to_date('06-02-1982', 'dd-mm-yyyy'), '62 Dianne Street', 547049626, to_date('29-07-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (858212438, 'Orlando', 'Wariner', to_date('08-05-1986', 'dd-mm-yyyy'), '73 Coolidge Road', 520267668, to_date('29-03-2009', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (946717935, 'Rose', 'Liu', to_date('07-06-1985', 'dd-mm-yyyy'), '70 Marburg Road', 542164622, to_date('19-03-2015', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (574546683, 'Max', 'Moffat', to_date('08-07-1987', 'dd-mm-yyyy'), '91 Gray Drive', 529092351, to_date('22-06-2001', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (356216337, 'Talvin', 'Gilley', to_date('30-04-1996', 'dd-mm-yyyy'), '19 Carradine Street', 542712010, to_date('30-04-2005', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (521943786, 'Cliff', 'Abraham', to_date('06-04-1983', 'dd-mm-yyyy'), '83rd Street', 528604844, to_date('16-08-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (116453857, 'Terry', 'Ford', to_date('25-02-1983', 'dd-mm-yyyy'), '87 Devon Drive', 503111916, to_date('12-11-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (878976731, 'Tori', 'Suchet', to_date('28-03-1996', 'dd-mm-yyyy'), '95 Simpson Road', 524381603, to_date('06-01-2020', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (813198268, 'Goldie', 'Lane', to_date('10-01-1980', 'dd-mm-yyyy'), '63 Brent Street', 505775821, to_date('16-01-2003', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (432443852, 'Kid', 'Roundtree', to_date('09-06-1994', 'dd-mm-yyyy'), '42 Brenda Street', 521485706, to_date('21-12-2014', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (693771112, 'Blair', 'Crosby', to_date('01-09-1995', 'dd-mm-yyyy'), '831 Jay Road', 542609705, to_date('02-03-2002', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (783554776, 'Linda', 'Duke', to_date('11-03-1988', 'dd-mm-yyyy'), '46 Richardson Blvd', 540121893, to_date('01-04-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (959979886, 'Caroline', 'Palin', to_date('13-01-1995', 'dd-mm-yyyy'), '45 Saint Paul Road', 544321534, to_date('08-06-2022', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (237259246, 'Edward', 'Greene', to_date('03-06-1997', 'dd-mm-yyyy'), '44 Sartain Street', 509553754, to_date('16-03-2021', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (215176938, 'Carole', 'Law', to_date('27-11-1987', 'dd-mm-yyyy'), '94 Eddie Blvd', 501988648, to_date('07-06-2011', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (623829428, 'Kurt', 'Renfro', to_date('21-09-1996', 'dd-mm-yyyy'), '52 Bonnie Ave', 503469797, to_date('28-10-2004', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (873642955, 'Vincent', 'Hackman', to_date('01-08-1981', 'dd-mm-yyyy'), '82 Marc Ave', 545116925, to_date('29-09-2023', 'dd-mm-yyyy'));
insert into RESIDENT (resident_id, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
values (335683492, 'Kiefer', 'Damon', to_date('22-11-1990', 'dd-mm-yyyy'), '62 Yamagata Blvd', 523483912, to_date('17-06-2017', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading DISCOUNT...
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (85765, 42, 'disability', to_date('19-02-2015', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 526917216);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41235, 96, 'disability', to_date('24-11-2016', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'), 211278519);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12626, 56, 'MilitaryService', to_date('19-11-2015', 'dd-mm-yyyy'), to_date('08-07-2026', 'dd-mm-yyyy'), 874933198);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57146, 65, 'lowIncome', to_date('27-10-2015', 'dd-mm-yyyy'), to_date('01-07-2025', 'dd-mm-yyyy'), 989919591);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28891, 11, 'NationalService', to_date('18-10-2016', 'dd-mm-yyyy'), to_date('14-02-2027', 'dd-mm-yyyy'), 275982699);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (39394, 52, 'widow/er', to_date('06-05-2017', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 464846577);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28336, 29, 'NationalService', to_date('08-09-2012', 'dd-mm-yyyy'), to_date('17-10-2027', 'dd-mm-yyyy'), 529232332);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49627, 17, 'widow/er', to_date('05-01-2012', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'), 555935128);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (27726, 53, 'MilitaryService', to_date('22-08-2014', 'dd-mm-yyyy'), to_date('17-08-2026', 'dd-mm-yyyy'), 114983181);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59926, 68, 'NationalService', to_date('30-09-2017', 'dd-mm-yyyy'), to_date('30-11-2027', 'dd-mm-yyyy'), 326161891);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93524, 98, 'lowIncome', to_date('29-09-2015', 'dd-mm-yyyy'), to_date('17-11-2024', 'dd-mm-yyyy'), 272113621);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14443, 24, 'lowIncome', to_date('22-03-2014', 'dd-mm-yyyy'), to_date('24-09-2026', 'dd-mm-yyyy'), 877281945);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96599, 52, 'widow/er', to_date('25-04-2016', 'dd-mm-yyyy'), to_date('09-10-2026', 'dd-mm-yyyy'), 133845483);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (39891, 48, 'lowIncome', to_date('06-07-2013', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 446783813);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (72195, 22, 'NationalService', to_date('24-03-2016', 'dd-mm-yyyy'), to_date('16-12-2027', 'dd-mm-yyyy'), 275982699);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (79162, 18, 'widow/er', to_date('03-04-2016', 'dd-mm-yyyy'), to_date('03-01-2025', 'dd-mm-yyyy'), 717223769);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (29637, 29, 'singleParent', to_date('27-11-2017', 'dd-mm-yyyy'), to_date('02-08-2026', 'dd-mm-yyyy'), 719688759);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57671, 44, 'NationalService', to_date('26-07-2012', 'dd-mm-yyyy'), to_date('24-08-2025', 'dd-mm-yyyy'), 243125164);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (79321, 93, 'disability', to_date('12-09-2012', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), 414253853);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81569, 74, 'NationalService', to_date('15-06-2013', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), 865947552);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51651, 83, 'singleParent', to_date('29-03-2014', 'dd-mm-yyyy'), to_date('28-09-2026', 'dd-mm-yyyy'), 882788466);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (92915, 79, 'widow/er', to_date('13-06-2013', 'dd-mm-yyyy'), to_date('06-07-2025', 'dd-mm-yyyy'), 588855746);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (26965, 81, 'lowIncome', to_date('04-02-2014', 'dd-mm-yyyy'), to_date('30-10-2025', 'dd-mm-yyyy'), 445214224);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22619, 45, 'NationalService', to_date('20-02-2015', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 464846577);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53623, 31, 'NationalService', to_date('30-11-2012', 'dd-mm-yyyy'), to_date('04-03-2027', 'dd-mm-yyyy'), 363851854);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59442, 19, 'lowIncome', to_date('14-10-2016', 'dd-mm-yyyy'), to_date('20-04-2023', 'dd-mm-yyyy'), 717223769);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (94524, 55, 'widow/er', to_date('27-11-2015', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 861373978);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91682, 23, 'disability', to_date('20-06-2013', 'dd-mm-yyyy'), to_date('10-11-2024', 'dd-mm-yyyy'), 544898831);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81414, 12, 'lowIncome', to_date('03-03-2013', 'dd-mm-yyyy'), to_date('03-08-2027', 'dd-mm-yyyy'), 985575896);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87818, 47, 'widow/er', to_date('31-10-2014', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 393455922);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (94748, 92, 'widow/er', to_date('16-02-2016', 'dd-mm-yyyy'), to_date('16-09-2027', 'dd-mm-yyyy'), 134725436);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89451, 17, 'lowIncome', to_date('19-08-2013', 'dd-mm-yyyy'), to_date('26-04-2027', 'dd-mm-yyyy'), 435997313);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (33139, 29, 'widow/er', to_date('07-09-2012', 'dd-mm-yyyy'), to_date('29-12-2025', 'dd-mm-yyyy'), 846747472);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16132, 48, 'disability', to_date('28-11-2012', 'dd-mm-yyyy'), to_date('16-03-2027', 'dd-mm-yyyy'), 665368626);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (19632, 36, 'singleParent', to_date('16-09-2013', 'dd-mm-yyyy'), to_date('25-05-2023', 'dd-mm-yyyy'), 175694676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (56458, 53, 'NationalService', to_date('27-12-2017', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), 994969989);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (71474, 86, 'disability', to_date('05-08-2013', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 195283793);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49546, 42, 'disability', to_date('07-03-2017', 'dd-mm-yyyy'), to_date('19-06-2024', 'dd-mm-yyyy'), 623829428);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (76722, 15, 'lowIncome', to_date('29-01-2014', 'dd-mm-yyyy'), to_date('13-04-2026', 'dd-mm-yyyy'), 143878386);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (13322, 47, 'widow/er', to_date('14-03-2013', 'dd-mm-yyyy'), to_date('21-03-2026', 'dd-mm-yyyy'), 599664992);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (54698, 32, 'disability', to_date('22-11-2014', 'dd-mm-yyyy'), to_date('13-09-2025', 'dd-mm-yyyy'), 281183263);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (72746, 62, 'lowIncome', to_date('04-03-2015', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 379629386);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (31698, 85, 'MilitaryService', to_date('14-07-2017', 'dd-mm-yyyy'), to_date('06-02-2026', 'dd-mm-yyyy'), 335877875);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (86438, 79, 'lowIncome', to_date('17-01-2013', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), 686989579);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (92894, 91, 'NationalService', to_date('20-11-2012', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), 746686122);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96838, 74, 'lowIncome', to_date('20-08-2017', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), 511824734);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12792, 71, 'singleParent', to_date('10-10-2017', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), 272113621);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48344, 95, 'widow/er', to_date('15-12-2013', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), 665368626);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14445, 29, 'NationalService', to_date('14-11-2014', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 717223769);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (42114, 31, 'widow/er', to_date('14-02-2012', 'dd-mm-yyyy'), to_date('08-06-2025', 'dd-mm-yyyy'), 862421559);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89647, 46, 'NationalService', to_date('14-10-2013', 'dd-mm-yyyy'), to_date('09-05-2025', 'dd-mm-yyyy'), 156569945);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (31313, 46, 'lowIncome', to_date('10-07-2012', 'dd-mm-yyyy'), to_date('05-09-2026', 'dd-mm-yyyy'), 134725436);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (19743, 64, 'lowIncome', to_date('20-02-2015', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), 338583256);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55518, 18, 'NationalService', to_date('23-06-2015', 'dd-mm-yyyy'), to_date('12-01-2025', 'dd-mm-yyyy'), 195283793);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12199, 66, 'NationalService', to_date('11-04-2017', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), 992942225);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (61934, 78, 'disability', to_date('16-07-2013', 'dd-mm-yyyy'), to_date('16-04-2026', 'dd-mm-yyyy'), 877281945);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49115, 23, 'singleParent', to_date('25-07-2013', 'dd-mm-yyyy'), to_date('08-04-2027', 'dd-mm-yyyy'), 992942225);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (85422, 65, 'NationalService', to_date('08-08-2016', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), 791492594);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (69991, 13, 'widow/er', to_date('22-12-2017', 'dd-mm-yyyy'), to_date('27-04-2027', 'dd-mm-yyyy'), 456295863);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22426, 33, 'disability', to_date('12-11-2012', 'dd-mm-yyyy'), to_date('08-07-2024', 'dd-mm-yyyy'), 683168743);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (64251, 48, 'singleParent', to_date('23-08-2012', 'dd-mm-yyyy'), to_date('23-01-2027', 'dd-mm-yyyy'), 598366132);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87453, 88, 'lowIncome', to_date('27-07-2016', 'dd-mm-yyyy'), to_date('08-10-2027', 'dd-mm-yyyy'), 759997767);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (25491, 88, 'lowIncome', to_date('15-01-2013', 'dd-mm-yyyy'), to_date('13-11-2026', 'dd-mm-yyyy'), 188273144);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16218, 88, 'lowIncome', to_date('06-07-2014', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 582315646);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53745, 28, 'widow/er', to_date('18-08-2014', 'dd-mm-yyyy'), to_date('01-11-2024', 'dd-mm-yyyy'), 946717935);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65484, 99, 'lowIncome', to_date('06-08-2015', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'), 657135795);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89949, 59, 'NationalService', to_date('21-11-2016', 'dd-mm-yyyy'), to_date('16-03-2026', 'dd-mm-yyyy'), 515423239);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14458, 39, 'disability', to_date('14-11-2016', 'dd-mm-yyyy'), to_date('18-09-2025', 'dd-mm-yyyy'), 683168743);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65299, 43, 'disability', to_date('16-04-2012', 'dd-mm-yyyy'), to_date('07-07-2027', 'dd-mm-yyyy'), 959631963);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (73897, 74, 'lowIncome', to_date('17-11-2015', 'dd-mm-yyyy'), to_date('01-06-2026', 'dd-mm-yyyy'), 951818691);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (47543, 86, 'singleParent', to_date('05-05-2014', 'dd-mm-yyyy'), to_date('02-06-2025', 'dd-mm-yyyy'), 445214224);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57762, 78, 'lowIncome', to_date('04-01-2013', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), 173889484);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16736, 59, 'singleParent', to_date('12-11-2013', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 288236313);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (95144, 91, 'lowIncome', to_date('04-10-2014', 'dd-mm-yyyy'), to_date('15-01-2025', 'dd-mm-yyyy'), 963512184);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (25945, 83, 'singleParent', to_date('21-02-2013', 'dd-mm-yyyy'), to_date('29-10-2027', 'dd-mm-yyyy'), 462266383);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65131, 47, 'widow/er', to_date('28-06-2014', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 133183683);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (94117, 94, 'NationalService', to_date('08-08-2014', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 118187742);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (76632, 15, 'widow/er', to_date('24-08-2014', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 118187742);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48915, 88, 'singleParent', to_date('19-11-2016', 'dd-mm-yyyy'), to_date('29-07-2027', 'dd-mm-yyyy'), 137513264);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (15845, 82, 'disability', to_date('21-10-2015', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), 992942225);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28791, 37, 'NationalService', to_date('05-11-2017', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), 246853156);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55865, 39, 'singleParent', to_date('11-09-2014', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), 683168743);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (21823, 96, 'widow/er', to_date('10-02-2013', 'dd-mm-yyyy'), to_date('22-01-2025', 'dd-mm-yyyy'), 237748624);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (88562, 97, 'widow/er', to_date('26-11-2015', 'dd-mm-yyyy'), to_date('24-02-2026', 'dd-mm-yyyy'), 726721537);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93613, 33, 'lowIncome', to_date('24-03-2013', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 796488261);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (27741, 15, 'singleParent', to_date('07-09-2012', 'dd-mm-yyyy'), to_date('20-11-2025', 'dd-mm-yyyy'), 322323561);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (72312, 73, 'disability', to_date('18-06-2013', 'dd-mm-yyyy'), to_date('18-02-2023', 'dd-mm-yyyy'), 934135551);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (31333, 49, 'lowIncome', to_date('11-02-2012', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'), 426289694);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (86617, 75, 'singleParent', to_date('03-03-2017', 'dd-mm-yyyy'), to_date('16-06-2026', 'dd-mm-yyyy'), 248773226);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81382, 82, 'MilitaryService', to_date('25-09-2012', 'dd-mm-yyyy'), to_date('09-07-2026', 'dd-mm-yyyy'), 564113272);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (71728, 58, 'singleParent', to_date('25-01-2012', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 665241182);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (88191, 61, 'NationalService', to_date('19-09-2016', 'dd-mm-yyyy'), to_date('16-06-2027', 'dd-mm-yyyy'), 348553139);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93379, 97, 'NationalService', to_date('04-06-2015', 'dd-mm-yyyy'), to_date('13-03-2026', 'dd-mm-yyyy'), 683795957);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91765, 73, 'lowIncome', to_date('26-11-2012', 'dd-mm-yyyy'), to_date('30-04-2027', 'dd-mm-yyyy'), 394998526);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (76339, 73, 'NationalService', to_date('20-06-2014', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), 633241913);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96325, 11, 'MilitaryService', to_date('21-02-2016', 'dd-mm-yyyy'), to_date('25-10-2027', 'dd-mm-yyyy'), 249417168);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22968, 29, 'disability', to_date('26-02-2012', 'dd-mm-yyyy'), to_date('03-08-2025', 'dd-mm-yyyy'), 589619935);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53367, 68, 'singleParent', to_date('18-08-2014', 'dd-mm-yyyy'), to_date('13-11-2024', 'dd-mm-yyyy'), 791492594);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14894, 43, 'singleParent', to_date('17-10-2015', 'dd-mm-yyyy'), to_date('13-11-2025', 'dd-mm-yyyy'), 585538532);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91167, 94, 'NationalService', to_date('05-03-2017', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 215176938);
commit;
prompt 100 records committed...
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91378, 93, 'widow/er', to_date('24-09-2017', 'dd-mm-yyyy'), to_date('04-04-2025', 'dd-mm-yyyy'), 147959435);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (68615, 29, 'lowIncome', to_date('09-11-2013', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), 865891844);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14197, 21, 'widow/er', to_date('25-05-2014', 'dd-mm-yyyy'), to_date('12-08-2024', 'dd-mm-yyyy'), 779616214);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98516, 69, 'lowIncome', to_date('03-03-2013', 'dd-mm-yyyy'), to_date('03-01-2027', 'dd-mm-yyyy'), 528277229);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93916, 55, 'widow/er', to_date('18-12-2015', 'dd-mm-yyyy'), to_date('28-12-2025', 'dd-mm-yyyy'), 434221241);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28966, 27, 'singleParent', to_date('22-03-2013', 'dd-mm-yyyy'), to_date('19-01-2025', 'dd-mm-yyyy'), 994266671);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98761, 71, 'NationalService', to_date('11-02-2012', 'dd-mm-yyyy'), to_date('16-08-2026', 'dd-mm-yyyy'), 633241913);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57535, 32, 'singleParent', to_date('07-07-2015', 'dd-mm-yyyy'), to_date('13-09-2025', 'dd-mm-yyyy'), 335877875);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41522, 44, 'singleParent', to_date('30-03-2012', 'dd-mm-yyyy'), to_date('12-05-2026', 'dd-mm-yyyy'), 587947759);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81118, 54, 'NationalService', to_date('19-06-2016', 'dd-mm-yyyy'), to_date('19-10-2027', 'dd-mm-yyyy'), 399523162);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (62292, 37, 'widow/er', to_date('26-12-2014', 'dd-mm-yyyy'), to_date('20-10-2024', 'dd-mm-yyyy'), 946717935);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89783, 27, 'MilitaryService', to_date('23-09-2014', 'dd-mm-yyyy'), to_date('04-07-2026', 'dd-mm-yyyy'), 452723368);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (23214, 94, 'disability', to_date('11-02-2013', 'dd-mm-yyyy'), to_date('07-07-2024', 'dd-mm-yyyy'), 587947759);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96163, 17, 'lowIncome', to_date('02-05-2017', 'dd-mm-yyyy'), to_date('25-03-2025', 'dd-mm-yyyy'), 717223769);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (99892, 69, 'NationalService', to_date('04-12-2015', 'dd-mm-yyyy'), to_date('17-08-2025', 'dd-mm-yyyy'), 322323561);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (23682, 36, 'disability', to_date('10-04-2015', 'dd-mm-yyyy'), to_date('15-10-2026', 'dd-mm-yyyy'), 141511782);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (84187, 63, 'singleParent', to_date('17-10-2017', 'dd-mm-yyyy'), to_date('06-01-2026', 'dd-mm-yyyy'), 144229452);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93467, 51, 'disability', to_date('03-02-2014', 'dd-mm-yyyy'), to_date('09-12-2026', 'dd-mm-yyyy'), 935491328);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51926, 15, 'disability', to_date('20-03-2012', 'dd-mm-yyyy'), to_date('24-09-2027', 'dd-mm-yyyy'), 983332176);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (15516, 51, 'widow/er', to_date('20-10-2012', 'dd-mm-yyyy'), to_date('27-10-2026', 'dd-mm-yyyy'), 426289694);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (36667, 24, 'widow/er', to_date('05-06-2015', 'dd-mm-yyyy'), to_date('16-07-2025', 'dd-mm-yyyy'), 878648646);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (82264, 84, 'singleParent', to_date('27-07-2016', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 698881133);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (35451, 97, 'singleParent', to_date('10-03-2016', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), 849377551);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (56269, 34, 'singleParent', to_date('20-03-2013', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 745141472);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96829, 26, 'disability', to_date('13-02-2017', 'dd-mm-yyyy'), to_date('22-12-2024', 'dd-mm-yyyy'), 779616214);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59541, 58, 'lowIncome', to_date('01-07-2012', 'dd-mm-yyyy'), to_date('30-11-2027', 'dd-mm-yyyy'), 878648646);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (78176, 45, 'widow/er', to_date('29-09-2017', 'dd-mm-yyyy'), to_date('20-06-2024', 'dd-mm-yyyy'), 824694479);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (52368, 43, 'disability', to_date('02-03-2012', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 492957321);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (71396, 56, 'NationalService', to_date('29-05-2016', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 587947759);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91217, 86, 'lowIncome', to_date('11-02-2016', 'dd-mm-yyyy'), to_date('21-05-2027', 'dd-mm-yyyy'), 385473659);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (45433, 93, 'lowIncome', to_date('29-10-2016', 'dd-mm-yyyy'), to_date('09-09-2025', 'dd-mm-yyyy'), 858212438);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59557, 63, 'MilitaryService', to_date('16-08-2016', 'dd-mm-yyyy'), to_date('16-10-2027', 'dd-mm-yyyy'), 963921632);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (36918, 23, 'lowIncome', to_date('20-06-2016', 'dd-mm-yyyy'), to_date('11-11-2025', 'dd-mm-yyyy'), 444249235);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (75131, 83, 'lowIncome', to_date('06-08-2014', 'dd-mm-yyyy'), to_date('08-09-2024', 'dd-mm-yyyy'), 435997313);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (11839, 79, 'singleParent', to_date('12-05-2013', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 511192572);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91485, 86, 'NationalService', to_date('16-09-2013', 'dd-mm-yyyy'), to_date('08-10-2025', 'dd-mm-yyyy'), 183686392);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16597, 43, 'widow/er', to_date('04-06-2015', 'dd-mm-yyyy'), to_date('12-09-2026', 'dd-mm-yyyy'), 133183683);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (39313, 55, 'singleParent', to_date('31-07-2012', 'dd-mm-yyyy'), to_date('08-05-2025', 'dd-mm-yyyy'), 833269959);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (69194, 72, 'lowIncome', to_date('23-08-2013', 'dd-mm-yyyy'), to_date('26-08-2024', 'dd-mm-yyyy'), 213497876);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (21455, 51, 'widow/er', to_date('10-02-2017', 'dd-mm-yyyy'), to_date('22-11-2027', 'dd-mm-yyyy'), 291532951);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (79634, 39, 'MilitaryService', to_date('19-07-2015', 'dd-mm-yyyy'), to_date('11-02-2027', 'dd-mm-yyyy'), 326161891);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (97248, 82, 'MilitaryService', to_date('12-03-2012', 'dd-mm-yyyy'), to_date('04-06-2026', 'dd-mm-yyyy'), 983332176);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12469, 76, 'NationalService', to_date('17-08-2012', 'dd-mm-yyyy'), to_date('19-01-2026', 'dd-mm-yyyy'), 746686122);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (19952, 29, 'widow/er', to_date('10-10-2017', 'dd-mm-yyyy'), to_date('24-08-2027', 'dd-mm-yyyy'), 414253853);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (68258, 59, 'widow/er', to_date('19-09-2014', 'dd-mm-yyyy'), to_date('21-10-2026', 'dd-mm-yyyy'), 574546683);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (94933, 57, 'disability', to_date('05-09-2012', 'dd-mm-yyyy'), to_date('11-11-2025', 'dd-mm-yyyy'), 248636811);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48248, 86, 'NationalService', to_date('28-08-2016', 'dd-mm-yyyy'), to_date('05-10-2027', 'dd-mm-yyyy'), 215176938);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (27938, 72, 'singleParent', to_date('15-12-2012', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), 482269464);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (38515, 73, 'singleParent', to_date('08-11-2012', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 146634974);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (44522, 93, 'singleParent', to_date('18-01-2016', 'dd-mm-yyyy'), to_date('03-02-2027', 'dd-mm-yyyy'), 172196718);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (58265, 96, 'NationalService', to_date('22-12-2012', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 183845483);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (56771, 36, 'NationalService', to_date('03-08-2012', 'dd-mm-yyyy'), to_date('17-10-2026', 'dd-mm-yyyy'), 116145276);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (31341, 51, 'widow/er', to_date('22-01-2013', 'dd-mm-yyyy'), to_date('12-04-2025', 'dd-mm-yyyy'), 698881133);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41395, 16, 'MilitaryService', to_date('29-04-2014', 'dd-mm-yyyy'), to_date('30-07-2026', 'dd-mm-yyyy'), 146126967);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (18795, 29, 'lowIncome', to_date('18-03-2014', 'dd-mm-yyyy'), to_date('06-06-2027', 'dd-mm-yyyy'), 749566745);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98978, 74, 'disability', to_date('30-03-2014', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), 675131781);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59879, 13, 'NationalService', to_date('17-06-2013', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 698881133);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55724, 54, 'lowIncome', to_date('10-09-2013', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 358578439);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57899, 18, 'widow/er', to_date('18-06-2017', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), 524453385);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98621, 18, 'widow/er', to_date('19-06-2013', 'dd-mm-yyyy'), to_date('19-12-2027', 'dd-mm-yyyy'), 183845483);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41563, 23, 'widow/er', to_date('28-12-2015', 'dd-mm-yyyy'), to_date('12-04-2025', 'dd-mm-yyyy'), 275782165);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89744, 43, 'singleParent', to_date('22-06-2015', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), 335683492);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (45723, 75, 'widow/er', to_date('18-12-2017', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'), 248636811);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (34956, 77, 'widow/er', to_date('20-02-2017', 'dd-mm-yyyy'), to_date('28-03-2025', 'dd-mm-yyyy'), 258439593);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (34774, 55, 'singleParent', to_date('20-09-2017', 'dd-mm-yyyy'), to_date('01-05-2027', 'dd-mm-yyyy'), 288236313);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (15281, 44, 'singleParent', to_date('16-01-2015', 'dd-mm-yyyy'), to_date('08-01-2025', 'dd-mm-yyyy'), 511824734);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87422, 38, 'lowIncome', to_date('06-01-2012', 'dd-mm-yyyy'), to_date('20-04-2027', 'dd-mm-yyyy'), 136626676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48385, 63, 'widow/er', to_date('10-06-2013', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 865947552);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (67795, 63, 'lowIncome', to_date('09-08-2017', 'dd-mm-yyyy'), to_date('02-03-2027', 'dd-mm-yyyy'), 673259866);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (86744, 24, 'NationalService', to_date('18-01-2016', 'dd-mm-yyyy'), to_date('28-12-2027', 'dd-mm-yyyy'), 889171657);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (77157, 62, 'NationalService', to_date('17-12-2017', 'dd-mm-yyyy'), to_date('23-02-2027', 'dd-mm-yyyy'), 994969989);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14642, 73, 'disability', to_date('19-09-2016', 'dd-mm-yyyy'), to_date('27-05-2026', 'dd-mm-yyyy'), 461317518);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (62915, 87, 'lowIncome', to_date('30-11-2012', 'dd-mm-yyyy'), to_date('02-03-2026', 'dd-mm-yyyy'), 279221286);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (29913, 42, 'disability', to_date('07-09-2015', 'dd-mm-yyyy'), to_date('28-07-2025', 'dd-mm-yyyy'), 865429285);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87877, 61, 'singleParent', to_date('17-10-2015', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 212466261);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41911, 34, 'NationalService', to_date('14-06-2015', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 246853156);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (26484, 44, 'lowIncome', to_date('08-05-2012', 'dd-mm-yyyy'), to_date('19-06-2024', 'dd-mm-yyyy'), 768124319);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (42625, 32, 'disability', to_date('17-11-2015', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 979746888);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65276, 53, 'lowIncome', to_date('14-12-2014', 'dd-mm-yyyy'), to_date('12-11-2025', 'dd-mm-yyyy'), 183457173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93337, 56, 'singleParent', to_date('23-08-2012', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 691872967);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (56957, 83, 'NationalService', to_date('28-10-2015', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 891864598);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87799, 56, 'widow/er', to_date('08-10-2015', 'dd-mm-yyyy'), to_date('11-01-2027', 'dd-mm-yyyy'), 136362534);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51914, 64, 'widow/er', to_date('06-02-2013', 'dd-mm-yyyy'), to_date('23-04-2027', 'dd-mm-yyyy'), 989919591);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55534, 75, 'lowIncome', to_date('08-09-2012', 'dd-mm-yyyy'), to_date('08-09-2026', 'dd-mm-yyyy'), 683168743);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65371, 88, 'singleParent', to_date('18-07-2013', 'dd-mm-yyyy'), to_date('16-03-2025', 'dd-mm-yyyy'), 272113621);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (44945, 41, 'disability', to_date('05-02-2012', 'dd-mm-yyyy'), to_date('16-02-2026', 'dd-mm-yyyy'), 585538532);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51455, 75, 'lowIncome', to_date('27-06-2015', 'dd-mm-yyyy'), to_date('27-03-2027', 'dd-mm-yyyy'), 664285891);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (79988, 89, 'disability', to_date('18-03-2015', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), 784898128);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (72886, 78, 'lowIncome', to_date('09-08-2017', 'dd-mm-yyyy'), to_date('12-05-2027', 'dd-mm-yyyy'), 427316471);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (21675, 11, 'singleParent', to_date('12-01-2014', 'dd-mm-yyyy'), to_date('03-06-2026', 'dd-mm-yyyy'), 419857592);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (47239, 21, 'widow/er', to_date('23-02-2012', 'dd-mm-yyyy'), to_date('09-03-2027', 'dd-mm-yyyy'), 296873554);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (58275, 15, 'singleParent', to_date('28-01-2013', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'), 259428855);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12355, 32, 'NationalService', to_date('24-07-2013', 'dd-mm-yyyy'), to_date('20-05-2027', 'dd-mm-yyyy'), 791492594);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (13957, 89, 'widow/er', to_date('20-05-2014', 'dd-mm-yyyy'), to_date('07-05-2025', 'dd-mm-yyyy'), 873642955);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (47834, 51, 'disability', to_date('12-02-2017', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), 692885158);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43868, 63, 'disability', to_date('10-11-2012', 'dd-mm-yyyy'), to_date('23-02-2027', 'dd-mm-yyyy'), 322323561);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81924, 58, 'widow/er', to_date('24-07-2015', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 389682785);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (13615, 58, 'NationalService', to_date('10-02-2017', 'dd-mm-yyyy'), to_date('19-12-2027', 'dd-mm-yyyy'), 924533695);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43585, 31, 'NationalService', to_date('28-09-2012', 'dd-mm-yyyy'), to_date('18-08-2026', 'dd-mm-yyyy'), 295425129);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43132, 31, 'lowIncome', to_date('18-07-2016', 'dd-mm-yyyy'), to_date('07-11-2026', 'dd-mm-yyyy'), 139239877);
commit;
prompt 200 records committed...
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22988, 66, 'MilitaryService', to_date('28-11-2014', 'dd-mm-yyyy'), to_date('27-12-2026', 'dd-mm-yyyy'), 273217942);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (21662, 81, 'widow/er', to_date('26-03-2017', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), 913474355);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16441, 67, 'singleParent', to_date('23-12-2013', 'dd-mm-yyyy'), to_date('28-10-2026', 'dd-mm-yyyy'), 152283235);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59596, 59, 'lowIncome', to_date('20-08-2015', 'dd-mm-yyyy'), to_date('04-11-2027', 'dd-mm-yyyy'), 152283235);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49611, 52, 'widow/er', to_date('06-02-2012', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 963921632);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (23792, 64, 'singleParent', to_date('12-10-2017', 'dd-mm-yyyy'), to_date('21-07-2024', 'dd-mm-yyyy'), 578778765);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65949, 22, 'disability', to_date('06-02-2013', 'dd-mm-yyyy'), to_date('14-03-2027', 'dd-mm-yyyy'), 816748933);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (83731, 91, 'NationalService', to_date('06-11-2017', 'dd-mm-yyyy'), to_date('21-02-2023', 'dd-mm-yyyy'), 464846577);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (39236, 52, 'lowIncome', to_date('24-10-2013', 'dd-mm-yyyy'), to_date('05-12-2024', 'dd-mm-yyyy'), 142424449);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87261, 47, 'disability', to_date('13-02-2017', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), 232362661);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (85377, 68, 'disability', to_date('14-07-2017', 'dd-mm-yyyy'), to_date('07-06-2025', 'dd-mm-yyyy'), 237259246);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81732, 95, 'lowIncome', to_date('24-03-2015', 'dd-mm-yyyy'), to_date('13-09-2025', 'dd-mm-yyyy'), 635462995);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (67197, 96, 'widow/er', to_date('27-01-2013', 'dd-mm-yyyy'), to_date('16-09-2024', 'dd-mm-yyyy'), 484174443);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12624, 63, 'lowIncome', to_date('04-11-2013', 'dd-mm-yyyy'), to_date('18-07-2025', 'dd-mm-yyyy'), 214286441);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (46712, 47, 'lowIncome', to_date('15-12-2012', 'dd-mm-yyyy'), to_date('02-09-2027', 'dd-mm-yyyy'), 469658897);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (76359, 89, 'MilitaryService', to_date('12-06-2014', 'dd-mm-yyyy'), to_date('23-10-2027', 'dd-mm-yyyy'), 183457173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (18883, 44, 'widow/er', to_date('26-10-2014', 'dd-mm-yyyy'), to_date('24-04-2026', 'dd-mm-yyyy'), 578778765);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (19454, 25, 'widow/er', to_date('08-10-2016', 'dd-mm-yyyy'), to_date('09-05-2027', 'dd-mm-yyyy'), 887589681);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49938, 69, 'singleParent', to_date('16-06-2013', 'dd-mm-yyyy'), to_date('27-11-2026', 'dd-mm-yyyy'), 523194253);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49829, 76, 'NationalService', to_date('06-08-2017', 'dd-mm-yyyy'), to_date('02-02-2026', 'dd-mm-yyyy'), 692885158);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (73175, 42, 'disability', to_date('19-04-2017', 'dd-mm-yyyy'), to_date('15-01-2027', 'dd-mm-yyyy'), 988272792);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98797, 28, 'disability', to_date('27-01-2017', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'), 877489359);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (75233, 78, 'disability', to_date('10-09-2016', 'dd-mm-yyyy'), to_date('21-08-2024', 'dd-mm-yyyy'), 469658897);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (46592, 62, 'widow/er', to_date('21-01-2013', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 535325336);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (45221, 16, 'disability', to_date('31-12-2016', 'dd-mm-yyyy'), to_date('27-12-2025', 'dd-mm-yyyy'), 656752466);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (69475, 74, 'singleParent', to_date('23-11-2017', 'dd-mm-yyyy'), to_date('26-06-2026', 'dd-mm-yyyy'), 237259246);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (29979, 59, 'lowIncome', to_date('28-12-2012', 'dd-mm-yyyy'), to_date('02-09-2027', 'dd-mm-yyyy'), 249934851);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (46242, 46, 'lowIncome', to_date('29-12-2013', 'dd-mm-yyyy'), to_date('07-02-2027', 'dd-mm-yyyy'), 618842857);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96459, 38, 'disability', to_date('14-05-2012', 'dd-mm-yyyy'), to_date('07-08-2026', 'dd-mm-yyyy'), 994266671);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91249, 95, 'lowIncome', to_date('13-08-2017', 'dd-mm-yyyy'), to_date('18-03-2025', 'dd-mm-yyyy'), 987532457);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96812, 71, 'disability', to_date('14-08-2015', 'dd-mm-yyyy'), to_date('18-10-2027', 'dd-mm-yyyy'), 379629386);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (73864, 55, 'singleParent', to_date('14-06-2012', 'dd-mm-yyyy'), to_date('15-03-2025', 'dd-mm-yyyy'), 461139558);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (15671, 42, 'MilitaryService', to_date('02-04-2015', 'dd-mm-yyyy'), to_date('09-12-2027', 'dd-mm-yyyy'), 248773226);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (77462, 28, 'lowIncome', to_date('06-03-2012', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 865891844);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (16747, 76, 'NationalService', to_date('27-01-2012', 'dd-mm-yyyy'), to_date('30-07-2025', 'dd-mm-yyyy'), 232362661);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (34666, 99, 'lowIncome', to_date('26-05-2013', 'dd-mm-yyyy'), to_date('05-12-2026', 'dd-mm-yyyy'), 431447543);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28785, 19, 'disability', to_date('18-08-2012', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), 143514188);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (26891, 63, 'disability', to_date('17-10-2014', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 439966173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (56852, 18, 'widow/er', to_date('16-03-2015', 'dd-mm-yyyy'), to_date('18-10-2024', 'dd-mm-yyyy'), 174663896);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53692, 31, 'lowIncome', to_date('28-02-2016', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 987532457);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43892, 33, 'NationalService', to_date('28-03-2016', 'dd-mm-yyyy'), to_date('05-08-2025', 'dd-mm-yyyy'), 363851854);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (37743, 91, 'widow/er', to_date('15-10-2015', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 635462995);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (58987, 74, 'MilitaryService', to_date('15-06-2012', 'dd-mm-yyyy'), to_date('27-08-2027', 'dd-mm-yyyy'), 213497876);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (66964, 67, 'disability', to_date('22-07-2017', 'dd-mm-yyyy'), to_date('22-07-2024', 'dd-mm-yyyy'), 795857146);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (61795, 66, 'lowIncome', to_date('12-01-2016', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 675131781);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (52392, 22, 'lowIncome', to_date('01-09-2017', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 683795957);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (67875, 76, 'disability', to_date('24-01-2017', 'dd-mm-yyyy'), to_date('08-09-2024', 'dd-mm-yyyy'), 385559488);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (11995, 62, 'lowIncome', to_date('28-08-2016', 'dd-mm-yyyy'), to_date('25-09-2027', 'dd-mm-yyyy'), 517354461);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (68229, 43, 'NationalService', to_date('25-12-2017', 'dd-mm-yyyy'), to_date('05-08-2026', 'dd-mm-yyyy'), 135187299);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65166, 41, 'widow/er', to_date('08-06-2014', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'), 336514439);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (25991, 42, 'NationalService', to_date('28-04-2012', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 683777489);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (46718, 22, 'widow/er', to_date('10-02-2012', 'dd-mm-yyyy'), to_date('27-07-2025', 'dd-mm-yyyy'), 921525641);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (66257, 15, 'MilitaryService', to_date('16-12-2013', 'dd-mm-yyyy'), to_date('30-06-2027', 'dd-mm-yyyy'), 232362661);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53255, 15, 'singleParent', to_date('04-03-2015', 'dd-mm-yyyy'), to_date('13-09-2026', 'dd-mm-yyyy'), 577492217);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (88474, 64, 'singleParent', to_date('15-03-2013', 'dd-mm-yyyy'), to_date('20-09-2026', 'dd-mm-yyyy'), 827848646);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57539, 58, 'NationalService', to_date('07-07-2017', 'dd-mm-yyyy'), to_date('26-05-2027', 'dd-mm-yyyy'), 657444127);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (85367, 47, 'lowIncome', to_date('10-12-2013', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 874933198);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (46967, 51, 'disability', to_date('28-12-2013', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), 136362534);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (97481, 56, 'widow/er', to_date('14-07-2013', 'dd-mm-yyyy'), to_date('17-09-2027', 'dd-mm-yyyy'), 484174443);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (74376, 71, 'disability', to_date('17-08-2014', 'dd-mm-yyyy'), to_date('14-09-2024', 'dd-mm-yyyy'), 139239877);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41157, 29, 'disability', to_date('07-12-2016', 'dd-mm-yyyy'), to_date('29-04-2027', 'dd-mm-yyyy'), 779616214);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (63824, 93, 'lowIncome', to_date('04-05-2016', 'dd-mm-yyyy'), to_date('15-02-2027', 'dd-mm-yyyy'), 335683492);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (64763, 42, 'disability', to_date('16-11-2012', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 675131781);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53394, 13, 'lowIncome', to_date('03-02-2013', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), 599664992);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (37973, 97, 'singleParent', to_date('30-09-2016', 'dd-mm-yyyy'), to_date('16-11-2025', 'dd-mm-yyyy'), 175694676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28397, 69, 'disability', to_date('25-09-2015', 'dd-mm-yyyy'), to_date('06-04-2027', 'dd-mm-yyyy'), 582315646);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (88742, 62, 'singleParent', to_date('17-01-2014', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 843885691);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (78977, 48, 'MilitaryService', to_date('13-11-2016', 'dd-mm-yyyy'), to_date('23-12-2026', 'dd-mm-yyyy'), 694557382);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (54652, 79, 'lowIncome', to_date('03-10-2015', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 296873554);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (65786, 29, 'widow/er', to_date('13-09-2013', 'dd-mm-yyyy'), to_date('03-08-2025', 'dd-mm-yyyy'), 116145276);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (93732, 52, 'singleParent', to_date('13-04-2017', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 839743986);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (38926, 81, 'MilitaryService', to_date('31-03-2012', 'dd-mm-yyyy'), to_date('09-09-2027', 'dd-mm-yyyy'), 673259866);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49278, 97, 'lowIncome', to_date('11-02-2017', 'dd-mm-yyyy'), to_date('24-04-2025', 'dd-mm-yyyy'), 665241182);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (23979, 14, 'NationalService', to_date('14-05-2012', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'), 488322515);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (85167, 25, 'disability', to_date('17-05-2016', 'dd-mm-yyyy'), to_date('03-01-2025', 'dd-mm-yyyy'), 851562463);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (24664, 32, 'widow/er', to_date('05-11-2015', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 511192572);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (38665, 31, 'singleParent', to_date('04-07-2016', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 399523162);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (31244, 24, 'lowIncome', to_date('21-03-2012', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 175694676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43499, 45, 'lowIncome', to_date('30-07-2012', 'dd-mm-yyyy'), to_date('01-05-2025', 'dd-mm-yyyy'), 718118922);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (99597, 71, 'widow/er', to_date('17-03-2016', 'dd-mm-yyyy'), to_date('11-04-2027', 'dd-mm-yyyy'), 627241567);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48973, 22, 'singleParent', to_date('03-12-2017', 'dd-mm-yyyy'), to_date('07-09-2026', 'dd-mm-yyyy'), 389145339);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (13879, 38, 'singleParent', to_date('12-01-2014', 'dd-mm-yyyy'), to_date('02-11-2024', 'dd-mm-yyyy'), 159536136);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (36333, 97, 'disability', to_date('02-11-2013', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'), 938358622);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (32858, 67, 'disability', to_date('07-02-2013', 'dd-mm-yyyy'), to_date('05-02-2027', 'dd-mm-yyyy'), 439966173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (23918, 31, 'lowIncome', to_date('19-08-2012', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'), 687386167);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (82349, 94, 'NationalService', to_date('08-04-2015', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 589619935);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (69668, 55, 'lowIncome', to_date('27-06-2014', 'dd-mm-yyyy'), to_date('12-03-2025', 'dd-mm-yyyy'), 469658897);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55261, 52, 'singleParent', to_date('29-03-2017', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 819944515);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (32195, 27, 'disability', to_date('14-02-2013', 'dd-mm-yyyy'), to_date('10-07-2026', 'dd-mm-yyyy'), 857622635);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (94889, 83, 'lowIncome', to_date('08-08-2016', 'dd-mm-yyyy'), to_date('01-01-2027', 'dd-mm-yyyy'), 175694676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22428, 88, 'widow/er', to_date('15-06-2014', 'dd-mm-yyyy'), to_date('14-11-2027', 'dd-mm-yyyy'), 747962567);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87346, 54, 'disability', to_date('05-11-2017', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 196478439);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (52348, 93, 'disability', to_date('19-10-2017', 'dd-mm-yyyy'), to_date('14-02-2027', 'dd-mm-yyyy'), 432443852);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28273, 52, 'disability', to_date('20-09-2017', 'dd-mm-yyyy'), to_date('29-11-2024', 'dd-mm-yyyy'), 945839263);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (41592, 85, 'lowIncome', to_date('30-12-2014', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 568989933);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55267, 92, 'widow/er', to_date('20-09-2013', 'dd-mm-yyyy'), to_date('19-01-2025', 'dd-mm-yyyy'), 175694676);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59515, 86, 'lowIncome', to_date('06-01-2017', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), 864724389);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (17493, 87, 'singleParent', to_date('25-12-2017', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 114983181);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89735, 77, 'widow/er', to_date('03-07-2013', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), 246141748);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (91777, 51, 'widow/er', to_date('28-02-2015', 'dd-mm-yyyy'), to_date('21-09-2024', 'dd-mm-yyyy'), 489596624);
commit;
prompt 300 records committed...
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49369, 22, 'MilitaryService', to_date('15-01-2015', 'dd-mm-yyyy'), to_date('25-10-2027', 'dd-mm-yyyy'), 941236614);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (67234, 92, 'NationalService', to_date('20-05-2013', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), 747962567);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (24636, 28, 'widow/er', to_date('18-12-2014', 'dd-mm-yyyy'), to_date('22-11-2023', 'dd-mm-yyyy'), 864724389);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (44682, 32, 'disability', to_date('15-06-2016', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 356216337);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (45699, 96, 'singleParent', to_date('17-03-2015', 'dd-mm-yyyy'), to_date('26-11-2026', 'dd-mm-yyyy'), 258439593);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (95735, 64, 'lowIncome', to_date('09-03-2017', 'dd-mm-yyyy'), to_date('14-02-2026', 'dd-mm-yyyy'), 322323561);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51614, 61, 'NationalService', to_date('24-07-2017', 'dd-mm-yyyy'), to_date('20-04-2026', 'dd-mm-yyyy'), 783476834);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (53949, 55, 'NationalService', to_date('02-11-2016', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 511192572);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (71592, 65, 'NationalService', to_date('28-11-2014', 'dd-mm-yyyy'), to_date('01-04-2025', 'dd-mm-yyyy'), 183457173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43256, 28, 'NationalService', to_date('01-02-2017', 'dd-mm-yyyy'), to_date('29-09-2026', 'dd-mm-yyyy'), 683795957);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (75556, 26, 'widow/er', to_date('22-06-2014', 'dd-mm-yyyy'), to_date('06-08-2026', 'dd-mm-yyyy'), 896461191);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (22339, 58, 'singleParent', to_date('02-07-2012', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 746686122);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (87953, 36, 'disability', to_date('25-07-2013', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 849377551);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81615, 42, 'MilitaryService', to_date('05-02-2016', 'dd-mm-yyyy'), to_date('21-06-2027', 'dd-mm-yyyy'), 133845483);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (84735, 79, 'disability', to_date('06-10-2012', 'dd-mm-yyyy'), to_date('07-11-2026', 'dd-mm-yyyy'), 959979886);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96135, 87, 'MilitaryService', to_date('24-06-2012', 'dd-mm-yyyy'), to_date('21-03-2027', 'dd-mm-yyyy'), 399523162);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (77366, 97, 'singleParent', to_date('22-12-2017', 'dd-mm-yyyy'), to_date('10-12-2025', 'dd-mm-yyyy'), 377243113);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89765, 32, 'disability', to_date('01-02-2012', 'dd-mm-yyyy'), to_date('13-08-2025', 'dd-mm-yyyy'), 419857592);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (49972, 77, 'lowIncome', to_date('29-01-2015', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 846221927);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (43153, 23, 'singleParent', to_date('29-05-2016', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 237748624);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (25314, 82, 'singleParent', to_date('07-03-2016', 'dd-mm-yyyy'), to_date('24-08-2026', 'dd-mm-yyyy'), 195985798);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28653, 72, 'lowIncome', to_date('09-03-2017', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), 759997767);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (42199, 91, 'NationalService', to_date('09-02-2015', 'dd-mm-yyyy'), to_date('26-10-2025', 'dd-mm-yyyy'), 824694479);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (73555, 48, 'singleParent', to_date('20-08-2014', 'dd-mm-yyyy'), to_date('07-06-2026', 'dd-mm-yyyy'), 958839685);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (82642, 61, 'singleParent', to_date('25-12-2012', 'dd-mm-yyyy'), to_date('27-04-2027', 'dd-mm-yyyy'), 787816584);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (68198, 14, 'NationalService', to_date('13-07-2015', 'dd-mm-yyyy'), to_date('14-11-2026', 'dd-mm-yyyy'), 664285891);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (13229, 22, 'disability', to_date('04-10-2014', 'dd-mm-yyyy'), to_date('24-09-2027', 'dd-mm-yyyy'), 116145276);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51581, 56, 'NationalService', to_date('13-07-2017', 'dd-mm-yyyy'), to_date('26-01-2026', 'dd-mm-yyyy'), 568989933);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (14691, 27, 'NationalService', to_date('09-01-2017', 'dd-mm-yyyy'), to_date('30-10-2024', 'dd-mm-yyyy'), 133628771);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (45392, 23, 'widow/er', to_date('05-08-2014', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), 718118922);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98893, 97, 'disability', to_date('15-07-2016', 'dd-mm-yyyy'), to_date('01-11-2025', 'dd-mm-yyyy'), 887589681);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (28792, 56, 'singleParent', to_date('24-03-2012', 'dd-mm-yyyy'), to_date('01-04-2025', 'dd-mm-yyyy'), 979746888);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59681, 77, 'lowIncome', to_date('18-06-2017', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 338583256);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (76269, 42, 'singleParent', to_date('02-08-2015', 'dd-mm-yyyy'), to_date('10-08-2026', 'dd-mm-yyyy'), 422522771);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (84399, 11, 'lowIncome', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 248773226);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (48283, 12, 'disability', to_date('12-04-2017', 'dd-mm-yyyy'), to_date('31-03-2026', 'dd-mm-yyyy'), 627146635);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (51331, 73, 'disability', to_date('11-03-2015', 'dd-mm-yyyy'), to_date('07-02-2026', 'dd-mm-yyyy'), 127968517);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (81454, 18, 'singleParent', to_date('14-06-2014', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 781714948);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (57518, 44, 'NationalService', to_date('01-04-2016', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'), 119289287);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (75547, 18, 'widow/er', to_date('09-09-2012', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 452723368);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (55383, 43, 'singleParent', to_date('04-12-2013', 'dd-mm-yyyy'), to_date('07-06-2025', 'dd-mm-yyyy'), 945839263);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (21582, 67, 'disability', to_date('05-01-2014', 'dd-mm-yyyy'), to_date('30-03-2026', 'dd-mm-yyyy'), 881511811);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (38449, 35, 'NationalService', to_date('15-08-2017', 'dd-mm-yyyy'), to_date('25-07-2026', 'dd-mm-yyyy'), 691872967);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (96819, 52, 'lowIncome', to_date('30-12-2014', 'dd-mm-yyyy'), to_date('04-07-2023', 'dd-mm-yyyy'), 959631963);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (98575, 57, 'singleParent', to_date('01-02-2017', 'dd-mm-yyyy'), to_date('11-03-2027', 'dd-mm-yyyy'), 765393268);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (89583, 26, 'lowIncome', to_date('10-02-2013', 'dd-mm-yyyy'), to_date('24-02-2027', 'dd-mm-yyyy'), 865947552);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (59124, 84, 'disability', to_date('04-02-2017', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 861373978);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (44873, 71, 'NationalService', to_date('30-10-2017', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'), 615154167);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (58247, 37, 'widow/er', to_date('13-02-2017', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'), 667846472);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (12123, 63, 'disability', to_date('24-07-2015', 'dd-mm-yyyy'), to_date('15-02-2026', 'dd-mm-yyyy'), 687312756);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (86296, 28, 'singleParent', to_date('24-12-2014', 'dd-mm-yyyy'), to_date('23-11-2025', 'dd-mm-yyyy'), 983332176);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (18441, 31, 'MilitaryService', to_date('05-11-2014', 'dd-mm-yyyy'), to_date('01-01-2027', 'dd-mm-yyyy'), 613385368);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (84142, 48, 'disability', to_date('05-05-2014', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'), 439966173);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (67912, 35, 'disability', to_date('08-07-2017', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 839279521);
insert into DISCOUNT (discount_id, discount_percent, discount_type, discount_start, discount_end, resident_id)
values (66653, 71, 'lowIncome', to_date('06-05-2013', 'dd-mm-yyyy'), to_date('21-12-2025', 'dd-mm-yyyy'), 414253853);
commit;
prompt 355 records loaded
prompt Loading OWNERSHIP...
insert into OWNERSHIP (asset_id, resident_id)
values (1065675650, 258439593);
insert into OWNERSHIP (asset_id, resident_id)
values (1088668426, 358578439);
insert into OWNERSHIP (asset_id, resident_id)
values (1132798801, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (1167083578, 791228183);
insert into OWNERSHIP (asset_id, resident_id)
values (1244412704, 698826441);
insert into OWNERSHIP (asset_id, resident_id)
values (1244412704, 934135551);
insert into OWNERSHIP (asset_id, resident_id)
values (1248443820, 627241567);
insert into OWNERSHIP (asset_id, resident_id)
values (1258965826, 692233694);
insert into OWNERSHIP (asset_id, resident_id)
values (1286867153, 846221927);
insert into OWNERSHIP (asset_id, resident_id)
values (1374296008, 783476834);
insert into OWNERSHIP (asset_id, resident_id)
values (1374296008, 784898128);
insert into OWNERSHIP (asset_id, resident_id)
values (1391563333, 237748624);
insert into OWNERSHIP (asset_id, resident_id)
values (1400268855, 246141748);
insert into OWNERSHIP (asset_id, resident_id)
values (1400268855, 692885158);
insert into OWNERSHIP (asset_id, resident_id)
values (1515627603, 747962567);
insert into OWNERSHIP (asset_id, resident_id)
values (1515627603, 862421559);
insert into OWNERSHIP (asset_id, resident_id)
values (1515627603, 891864598);
insert into OWNERSHIP (asset_id, resident_id)
values (1573637633, 385559488);
insert into OWNERSHIP (asset_id, resident_id)
values (1582633064, 291532951);
insert into OWNERSHIP (asset_id, resident_id)
values (1619479853, 784898128);
insert into OWNERSHIP (asset_id, resident_id)
values (1619479853, 891864598);
insert into OWNERSHIP (asset_id, resident_id)
values (1636001265, 553885863);
insert into OWNERSHIP (asset_id, resident_id)
values (1675548380, 615154167);
insert into OWNERSHIP (asset_id, resident_id)
values (1675548380, 839279521);
insert into OWNERSHIP (asset_id, resident_id)
values (1736993118, 588855746);
insert into OWNERSHIP (asset_id, resident_id)
values (1745220989, 249417168);
insert into OWNERSHIP (asset_id, resident_id)
values (1745220989, 637992576);
insert into OWNERSHIP (asset_id, resident_id)
values (1745220989, 842582727);
insert into OWNERSHIP (asset_id, resident_id)
values (1751609106, 414253853);
insert into OWNERSHIP (asset_id, resident_id)
values (1751609106, 446783813);
insert into OWNERSHIP (asset_id, resident_id)
values (1760892314, 951818691);
insert into OWNERSHIP (asset_id, resident_id)
values (1783981364, 996692122);
insert into OWNERSHIP (asset_id, resident_id)
values (1906548352, 637992576);
insert into OWNERSHIP (asset_id, resident_id)
values (1947849837, 349583951);
insert into OWNERSHIP (asset_id, resident_id)
values (1947849837, 452723368);
insert into OWNERSHIP (asset_id, resident_id)
values (1947849837, 963921632);
insert into OWNERSHIP (asset_id, resident_id)
values (1967564278, 691737316);
insert into OWNERSHIP (asset_id, resident_id)
values (1979175101, 249277281);
insert into OWNERSHIP (asset_id, resident_id)
values (1979175101, 464846577);
insert into OWNERSHIP (asset_id, resident_id)
values (1989535044, 247769836);
insert into OWNERSHIP (asset_id, resident_id)
values (1989535044, 247824318);
insert into OWNERSHIP (asset_id, resident_id)
values (1989535044, 633241913);
insert into OWNERSHIP (asset_id, resident_id)
values (2047556736, 278495136);
insert into OWNERSHIP (asset_id, resident_id)
values (2047556736, 935491328);
insert into OWNERSHIP (asset_id, resident_id)
values (2084006950, 874933198);
insert into OWNERSHIP (asset_id, resident_id)
values (2175095720, 172196718);
insert into OWNERSHIP (asset_id, resident_id)
values (2175095720, 461317518);
insert into OWNERSHIP (asset_id, resident_id)
values (2189282469, 959631963);
insert into OWNERSHIP (asset_id, resident_id)
values (2216083609, 435997313);
insert into OWNERSHIP (asset_id, resident_id)
values (2216083609, 697658135);
insert into OWNERSHIP (asset_id, resident_id)
values (2230417070, 212754324);
insert into OWNERSHIP (asset_id, resident_id)
values (2230417070, 247769836);
insert into OWNERSHIP (asset_id, resident_id)
values (2230417070, 878976731);
insert into OWNERSHIP (asset_id, resident_id)
values (2230417070, 998147894);
insert into OWNERSHIP (asset_id, resident_id)
values (2241491734, 189527387);
insert into OWNERSHIP (asset_id, resident_id)
values (2241491734, 196478439);
insert into OWNERSHIP (asset_id, resident_id)
values (2241491734, 218978761);
insert into OWNERSHIP (asset_id, resident_id)
values (2241491734, 958839685);
insert into OWNERSHIP (asset_id, resident_id)
values (2241491734, 989919591);
insert into OWNERSHIP (asset_id, resident_id)
values (2312620260, 675131781);
insert into OWNERSHIP (asset_id, resident_id)
values (2313590688, 726721537);
insert into OWNERSHIP (asset_id, resident_id)
values (2369227718, 544898831);
insert into OWNERSHIP (asset_id, resident_id)
values (2369227718, 741654353);
insert into OWNERSHIP (asset_id, resident_id)
values (2426274041, 174663896);
insert into OWNERSHIP (asset_id, resident_id)
values (2426274041, 273217942);
insert into OWNERSHIP (asset_id, resident_id)
values (2449849865, 144273597);
insert into OWNERSHIP (asset_id, resident_id)
values (2449849865, 531315627);
insert into OWNERSHIP (asset_id, resident_id)
values (2449849865, 777566944);
insert into OWNERSHIP (asset_id, resident_id)
values (2471212356, 295459114);
insert into OWNERSHIP (asset_id, resident_id)
values (2520783788, 432443852);
insert into OWNERSHIP (asset_id, resident_id)
values (2520783788, 665368626);
insert into OWNERSHIP (asset_id, resident_id)
values (2535415078, 783554776);
insert into OWNERSHIP (asset_id, resident_id)
values (2535415078, 846221927);
insert into OWNERSHIP (asset_id, resident_id)
values (2542080761, 858212438);
insert into OWNERSHIP (asset_id, resident_id)
values (2574461897, 233213812);
insert into OWNERSHIP (asset_id, resident_id)
values (2576960456, 431447543);
insert into OWNERSHIP (asset_id, resident_id)
values (2576960456, 947516768);
insert into OWNERSHIP (asset_id, resident_id)
values (2602003953, 174663896);
insert into OWNERSHIP (asset_id, resident_id)
values (2602003953, 279221286);
insert into OWNERSHIP (asset_id, resident_id)
values (2699034849, 613976282);
insert into OWNERSHIP (asset_id, resident_id)
values (2717637233, 818626721);
insert into OWNERSHIP (asset_id, resident_id)
values (2736109200, 612262453);
insert into OWNERSHIP (asset_id, resident_id)
values (2819312058, 139239877);
insert into OWNERSHIP (asset_id, resident_id)
values (2819312058, 446783813);
insert into OWNERSHIP (asset_id, resident_id)
values (2819312058, 929247419);
insert into OWNERSHIP (asset_id, resident_id)
values (2850579592, 627763311);
insert into OWNERSHIP (asset_id, resident_id)
values (2894369998, 625395847);
insert into OWNERSHIP (asset_id, resident_id)
values (2894369998, 914199663);
insert into OWNERSHIP (asset_id, resident_id)
values (2918436992, 446783813);
insert into OWNERSHIP (asset_id, resident_id)
values (2926330958, 246141748);
insert into OWNERSHIP (asset_id, resident_id)
values (2947450154, 136626676);
insert into OWNERSHIP (asset_id, resident_id)
values (2947450154, 338583256);
insert into OWNERSHIP (asset_id, resident_id)
values (2990732937, 218978761);
insert into OWNERSHIP (asset_id, resident_id)
values (2990732937, 784898128);
insert into OWNERSHIP (asset_id, resident_id)
values (3012372031, 385559488);
insert into OWNERSHIP (asset_id, resident_id)
values (3079205689, 585538532);
insert into OWNERSHIP (asset_id, resident_id)
values (3087270475, 582315646);
insert into OWNERSHIP (asset_id, resident_id)
values (3087270475, 768124319);
insert into OWNERSHIP (asset_id, resident_id)
values (3087270475, 914342673);
insert into OWNERSHIP (asset_id, resident_id)
values (3088353260, 461139558);
commit;
prompt 100 records committed...
insert into OWNERSHIP (asset_id, resident_id)
values (3088353260, 747962567);
insert into OWNERSHIP (asset_id, resident_id)
values (3088353260, 843885691);
insert into OWNERSHIP (asset_id, resident_id)
values (3103050114, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (3103050114, 838194879);
insert into OWNERSHIP (asset_id, resident_id)
values (3104566656, 125349632);
insert into OWNERSHIP (asset_id, resident_id)
values (3104566656, 831345862);
insert into OWNERSHIP (asset_id, resident_id)
values (3104566656, 878648646);
insert into OWNERSHIP (asset_id, resident_id)
values (3133585528, 935491328);
insert into OWNERSHIP (asset_id, resident_id)
values (3159215543, 553885863);
insert into OWNERSHIP (asset_id, resident_id)
values (3159215543, 635462995);
insert into OWNERSHIP (asset_id, resident_id)
values (3182399457, 492886366);
insert into OWNERSHIP (asset_id, resident_id)
values (3188478074, 152283235);
insert into OWNERSHIP (asset_id, resident_id)
values (3188478074, 667846472);
insert into OWNERSHIP (asset_id, resident_id)
values (3188478074, 946694629);
insert into OWNERSHIP (asset_id, resident_id)
values (3211788090, 959212511);
insert into OWNERSHIP (asset_id, resident_id)
values (3214807443, 188273144);
insert into OWNERSHIP (asset_id, resident_id)
values (3214807443, 553885863);
insert into OWNERSHIP (asset_id, resident_id)
values (3214807443, 656752466);
insert into OWNERSHIP (asset_id, resident_id)
values (3218254766, 283847892);
insert into OWNERSHIP (asset_id, resident_id)
values (3218254766, 813198268);
insert into OWNERSHIP (asset_id, resident_id)
values (3253266610, 783554776);
insert into OWNERSHIP (asset_id, resident_id)
values (3256666986, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (3258969786, 212466261);
insert into OWNERSHIP (asset_id, resident_id)
values (3295205865, 454651229);
insert into OWNERSHIP (asset_id, resident_id)
values (3321977282, 776589943);
insert into OWNERSHIP (asset_id, resident_id)
values (3321977282, 797751364);
insert into OWNERSHIP (asset_id, resident_id)
values (3352915106, 177374393);
insert into OWNERSHIP (asset_id, resident_id)
values (3352915106, 649328127);
insert into OWNERSHIP (asset_id, resident_id)
values (3352915106, 865477728);
insert into OWNERSHIP (asset_id, resident_id)
values (3396896996, 116145276);
insert into OWNERSHIP (asset_id, resident_id)
values (3396896996, 585538532);
insert into OWNERSHIP (asset_id, resident_id)
values (3396896996, 992942225);
insert into OWNERSHIP (asset_id, resident_id)
values (3435489165, 336514439);
insert into OWNERSHIP (asset_id, resident_id)
values (3514674840, 768124319);
insert into OWNERSHIP (asset_id, resident_id)
values (3514674840, 845327929);
insert into OWNERSHIP (asset_id, resident_id)
values (3533484242, 159531378);
insert into OWNERSHIP (asset_id, resident_id)
values (3533484242, 796488261);
insert into OWNERSHIP (asset_id, resident_id)
values (3556856508, 492957321);
insert into OWNERSHIP (asset_id, resident_id)
values (3561588201, 248773226);
insert into OWNERSHIP (asset_id, resident_id)
values (3561588201, 578778765);
insert into OWNERSHIP (asset_id, resident_id)
values (3642902100, 136362534);
insert into OWNERSHIP (asset_id, resident_id)
values (3642902100, 613976282);
insert into OWNERSHIP (asset_id, resident_id)
values (3642902100, 719688759);
insert into OWNERSHIP (asset_id, resident_id)
values (3660262339, 994969989);
insert into OWNERSHIP (asset_id, resident_id)
values (3669129449, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (3787366075, 274435187);
insert into OWNERSHIP (asset_id, resident_id)
values (3788893408, 871976242);
insert into OWNERSHIP (asset_id, resident_id)
values (3788893408, 945839263);
insert into OWNERSHIP (asset_id, resident_id)
values (3815957283, 935358341);
insert into OWNERSHIP (asset_id, resident_id)
values (3817575126, 484174443);
insert into OWNERSHIP (asset_id, resident_id)
values (3847266698, 258439593);
insert into OWNERSHIP (asset_id, resident_id)
values (3899914270, 143514188);
insert into OWNERSHIP (asset_id, resident_id)
values (3956266377, 461139558);
insert into OWNERSHIP (asset_id, resident_id)
values (3956266377, 718118922);
insert into OWNERSHIP (asset_id, resident_id)
values (3956266377, 765393268);
insert into OWNERSHIP (asset_id, resident_id)
values (3961040557, 675556678);
insert into OWNERSHIP (asset_id, resident_id)
values (3977916915, 683777489);
insert into OWNERSHIP (asset_id, resident_id)
values (3977916915, 849377551);
insert into OWNERSHIP (asset_id, resident_id)
values (3983338473, 946717935);
insert into OWNERSHIP (asset_id, resident_id)
values (4020816376, 142424449);
insert into OWNERSHIP (asset_id, resident_id)
values (4020816376, 747312363);
insert into OWNERSHIP (asset_id, resident_id)
values (4056887109, 625773541);
insert into OWNERSHIP (asset_id, resident_id)
values (4056887109, 871976242);
insert into OWNERSHIP (asset_id, resident_id)
values (4109310732, 842582727);
insert into OWNERSHIP (asset_id, resident_id)
values (4179819584, 741654353);
insert into OWNERSHIP (asset_id, resident_id)
values (4179819584, 994969989);
insert into OWNERSHIP (asset_id, resident_id)
values (4208510125, 283847892);
insert into OWNERSHIP (asset_id, resident_id)
values (4208510125, 791228183);
insert into OWNERSHIP (asset_id, resident_id)
values (4210340623, 249277281);
insert into OWNERSHIP (asset_id, resident_id)
values (4220905402, 434221241);
insert into OWNERSHIP (asset_id, resident_id)
values (4220905402, 658667536);
insert into OWNERSHIP (asset_id, resident_id)
values (4275411609, 216441838);
insert into OWNERSHIP (asset_id, resident_id)
values (4299378176, 814759218);
insert into OWNERSHIP (asset_id, resident_id)
values (4384527540, 247824318);
insert into OWNERSHIP (asset_id, resident_id)
values (4384527540, 488322515);
insert into OWNERSHIP (asset_id, resident_id)
values (4463515070, 683168743);
insert into OWNERSHIP (asset_id, resident_id)
values (4475790594, 295459114);
insert into OWNERSHIP (asset_id, resident_id)
values (4475790594, 322323561);
insert into OWNERSHIP (asset_id, resident_id)
values (4491485684, 112672359);
insert into OWNERSHIP (asset_id, resident_id)
values (4491485684, 988272792);
insert into OWNERSHIP (asset_id, resident_id)
values (4569723803, 851562463);
insert into OWNERSHIP (asset_id, resident_id)
values (4579341065, 173889484);
insert into OWNERSHIP (asset_id, resident_id)
values (4633957508, 141511782);
insert into OWNERSHIP (asset_id, resident_id)
values (4633957508, 612262453);
insert into OWNERSHIP (asset_id, resident_id)
values (4685116997, 996692122);
insert into OWNERSHIP (asset_id, resident_id)
values (4696237378, 146634974);
insert into OWNERSHIP (asset_id, resident_id)
values (4696237378, 898152989);
insert into OWNERSHIP (asset_id, resident_id)
values (4775596738, 618842857);
insert into OWNERSHIP (asset_id, resident_id)
values (4789866775, 144273597);
insert into OWNERSHIP (asset_id, resident_id)
values (4794469699, 389367138);
insert into OWNERSHIP (asset_id, resident_id)
values (4794469699, 842582727);
insert into OWNERSHIP (asset_id, resident_id)
values (4794469699, 882788466);
insert into OWNERSHIP (asset_id, resident_id)
values (4800177951, 633241913);
insert into OWNERSHIP (asset_id, resident_id)
values (4831583292, 136362534);
insert into OWNERSHIP (asset_id, resident_id)
values (4902410515, 275982699);
insert into OWNERSHIP (asset_id, resident_id)
values (4969661459, 368912915);
insert into OWNERSHIP (asset_id, resident_id)
values (4984502981, 616653695);
insert into OWNERSHIP (asset_id, resident_id)
values (5020588366, 358578439);
insert into OWNERSHIP (asset_id, resident_id)
values (5020588366, 535325336);
insert into OWNERSHIP (asset_id, resident_id)
values (5092207913, 281183263);
commit;
prompt 200 records committed...
insert into OWNERSHIP (asset_id, resident_id)
values (5092207913, 691737316);
insert into OWNERSHIP (asset_id, resident_id)
values (5092207913, 746686122);
insert into OWNERSHIP (asset_id, resident_id)
values (5092207913, 747962567);
insert into OWNERSHIP (asset_id, resident_id)
values (5092207913, 833269959);
insert into OWNERSHIP (asset_id, resident_id)
values (5101539127, 173889484);
insert into OWNERSHIP (asset_id, resident_id)
values (5101539127, 719688759);
insert into OWNERSHIP (asset_id, resident_id)
values (5105465284, 133628771);
insert into OWNERSHIP (asset_id, resident_id)
values (5112294938, 589619935);
insert into OWNERSHIP (asset_id, resident_id)
values (5112294938, 776589943);
insert into OWNERSHIP (asset_id, resident_id)
values (5112294938, 878276742);
insert into OWNERSHIP (asset_id, resident_id)
values (5124777926, 419857592);
insert into OWNERSHIP (asset_id, resident_id)
values (5124777926, 489596624);
insert into OWNERSHIP (asset_id, resident_id)
values (5124777926, 692233694);
insert into OWNERSHIP (asset_id, resident_id)
values (5200299790, 247824318);
insert into OWNERSHIP (asset_id, resident_id)
values (5253120199, 116688813);
insert into OWNERSHIP (asset_id, resident_id)
values (5253120199, 824694479);
insert into OWNERSHIP (asset_id, resident_id)
values (5272420503, 377243113);
insert into OWNERSHIP (asset_id, resident_id)
values (5272420503, 649328127);
insert into OWNERSHIP (asset_id, resident_id)
values (5362014774, 335683492);
insert into OWNERSHIP (asset_id, resident_id)
values (5362014774, 672227465);
insert into OWNERSHIP (asset_id, resident_id)
values (5434641757, 963921632);
insert into OWNERSHIP (asset_id, resident_id)
values (5456897652, 649328127);
insert into OWNERSHIP (asset_id, resident_id)
values (5462792083, 564113272);
insert into OWNERSHIP (asset_id, resident_id)
values (5462792083, 777566944);
insert into OWNERSHIP (asset_id, resident_id)
values (5513005926, 133628771);
insert into OWNERSHIP (asset_id, resident_id)
values (5513005926, 295459114);
insert into OWNERSHIP (asset_id, resident_id)
values (5561269008, 143878386);
insert into OWNERSHIP (asset_id, resident_id)
values (5737967291, 417183526);
insert into OWNERSHIP (asset_id, resident_id)
values (5737967291, 857622635);
insert into OWNERSHIP (asset_id, resident_id)
values (5753047730, 177374393);
insert into OWNERSHIP (asset_id, resident_id)
values (5753047730, 818382624);
insert into OWNERSHIP (asset_id, resident_id)
values (5779254416, 251468686);
insert into OWNERSHIP (asset_id, resident_id)
values (5791941422, 482269464);
insert into OWNERSHIP (asset_id, resident_id)
values (5795473406, 358578439);
insert into OWNERSHIP (asset_id, resident_id)
values (5845530936, 816748933);
insert into OWNERSHIP (asset_id, resident_id)
values (5845530936, 936757698);
insert into OWNERSHIP (asset_id, resident_id)
values (5894565826, 464473768);
insert into OWNERSHIP (asset_id, resident_id)
values (5894565826, 693771112);
insert into OWNERSHIP (asset_id, resident_id)
values (6067340267, 515423239);
insert into OWNERSHIP (asset_id, resident_id)
values (6067340267, 998282368);
insert into OWNERSHIP (asset_id, resident_id)
values (6084677955, 627763311);
insert into OWNERSHIP (asset_id, resident_id)
values (6089333170, 843885691);
insert into OWNERSHIP (asset_id, resident_id)
values (6131063922, 627763311);
insert into OWNERSHIP (asset_id, resident_id)
values (6278177294, 513496241);
insert into OWNERSHIP (asset_id, resident_id)
values (6301440603, 188273144);
insert into OWNERSHIP (asset_id, resident_id)
values (6301440603, 726721537);
insert into OWNERSHIP (asset_id, resident_id)
values (6301440603, 924826472);
insert into OWNERSHIP (asset_id, resident_id)
values (6374423052, 517354461);
insert into OWNERSHIP (asset_id, resident_id)
values (6374423052, 615154167);
insert into OWNERSHIP (asset_id, resident_id)
values (6374423052, 959979886);
insert into OWNERSHIP (asset_id, resident_id)
values (6435057959, 749566745);
insert into OWNERSHIP (asset_id, resident_id)
values (6508239771, 273217942);
insert into OWNERSHIP (asset_id, resident_id)
values (6508239771, 873642955);
insert into OWNERSHIP (asset_id, resident_id)
values (6517395497, 992942225);
insert into OWNERSHIP (asset_id, resident_id)
values (6519214320, 116688813);
insert into OWNERSHIP (asset_id, resident_id)
values (6525326634, 427316471);
insert into OWNERSHIP (asset_id, resident_id)
values (6594069555, 264286847);
insert into OWNERSHIP (asset_id, resident_id)
values (6594069555, 665368626);
insert into OWNERSHIP (asset_id, resident_id)
values (6613956007, 511824734);
insert into OWNERSHIP (asset_id, resident_id)
values (6664452390, 878976731);
insert into OWNERSHIP (asset_id, resident_id)
values (6684889558, 338583256);
insert into OWNERSHIP (asset_id, resident_id)
values (6684889558, 614763397);
insert into OWNERSHIP (asset_id, resident_id)
values (6684889558, 796488261);
insert into OWNERSHIP (asset_id, resident_id)
values (6687478049, 994266671);
insert into OWNERSHIP (asset_id, resident_id)
values (6707463501, 958839685);
insert into OWNERSHIP (asset_id, resident_id)
values (6766432421, 552836342);
insert into OWNERSHIP (asset_id, resident_id)
values (6821447958, 695717971);
insert into OWNERSHIP (asset_id, resident_id)
values (6822832032, 488322515);
insert into OWNERSHIP (asset_id, resident_id)
values (6902701474, 461139558);
insert into OWNERSHIP (asset_id, resident_id)
values (6902701474, 464734176);
insert into OWNERSHIP (asset_id, resident_id)
values (6922765964, 212466261);
insert into OWNERSHIP (asset_id, resident_id)
values (6922765964, 356216337);
insert into OWNERSHIP (asset_id, resident_id)
values (6980913746, 865947552);
insert into OWNERSHIP (asset_id, resident_id)
values (6988263092, 141511782);
insert into OWNERSHIP (asset_id, resident_id)
values (6988263092, 232362661);
insert into OWNERSHIP (asset_id, resident_id)
values (6988263092, 783554776);
insert into OWNERSHIP (asset_id, resident_id)
values (7073335064, 577492217);
insert into OWNERSHIP (asset_id, resident_id)
values (7093366225, 921525641);
insert into OWNERSHIP (asset_id, resident_id)
values (7190912917, 865477728);
insert into OWNERSHIP (asset_id, resident_id)
values (7307441345, 212466261);
insert into OWNERSHIP (asset_id, resident_id)
values (7307441345, 946717935);
insert into OWNERSHIP (asset_id, resident_id)
values (7348891327, 598366132);
insert into OWNERSHIP (asset_id, resident_id)
values (7364782150, 159536136);
insert into OWNERSHIP (asset_id, resident_id)
values (7399429664, 296978266);
insert into OWNERSHIP (asset_id, resident_id)
values (7399429664, 797751364);
insert into OWNERSHIP (asset_id, resident_id)
values (7404012563, 515423239);
insert into OWNERSHIP (asset_id, resident_id)
values (7456854517, 128461244);
insert into OWNERSHIP (asset_id, resident_id)
values (7456854517, 615154167);
insert into OWNERSHIP (asset_id, resident_id)
values (7496485111, 195283793);
insert into OWNERSHIP (asset_id, resident_id)
values (7496485111, 585538532);
insert into OWNERSHIP (asset_id, resident_id)
values (7505177774, 783554776);
insert into OWNERSHIP (asset_id, resident_id)
values (7527827606, 913474355);
insert into OWNERSHIP (asset_id, resident_id)
values (7535524459, 675131781);
insert into OWNERSHIP (asset_id, resident_id)
values (7535524459, 687386167);
insert into OWNERSHIP (asset_id, resident_id)
values (7554320950, 482269464);
insert into OWNERSHIP (asset_id, resident_id)
values (7562163114, 963921632);
insert into OWNERSHIP (asset_id, resident_id)
values (7595464912, 125349632);
insert into OWNERSHIP (asset_id, resident_id)
values (7595464912, 674886982);
insert into OWNERSHIP (asset_id, resident_id)
values (7609678396, 461139558);
insert into OWNERSHIP (asset_id, resident_id)
values (7609678396, 461317518);
commit;
prompt 300 records committed...
insert into OWNERSHIP (asset_id, resident_id)
values (7609678396, 816748933);
insert into OWNERSHIP (asset_id, resident_id)
values (7625239188, 484174443);
insert into OWNERSHIP (asset_id, resident_id)
values (7625239188, 683795957);
insert into OWNERSHIP (asset_id, resident_id)
values (7625239188, 691872967);
insert into OWNERSHIP (asset_id, resident_id)
values (7629344189, 462266383);
insert into OWNERSHIP (asset_id, resident_id)
values (7629344189, 733984539);
insert into OWNERSHIP (asset_id, resident_id)
values (7656473968, 183457173);
insert into OWNERSHIP (asset_id, resident_id)
values (7656473968, 335683492);
insert into OWNERSHIP (asset_id, resident_id)
values (7683360563, 524858663);
insert into OWNERSHIP (asset_id, resident_id)
values (7683360563, 776589943);
insert into OWNERSHIP (asset_id, resident_id)
values (7725831750, 795857146);
insert into OWNERSHIP (asset_id, resident_id)
values (7806058341, 127968517);
insert into OWNERSHIP (asset_id, resident_id)
values (7828499192, 141511782);
insert into OWNERSHIP (asset_id, resident_id)
values (7828499192, 747962567);
insert into OWNERSHIP (asset_id, resident_id)
values (7890353517, 246853156);
insert into OWNERSHIP (asset_id, resident_id)
values (7890353517, 456235494);
insert into OWNERSHIP (asset_id, resident_id)
values (7927911150, 146634974);
insert into OWNERSHIP (asset_id, resident_id)
values (7963878211, 664934526);
insert into OWNERSHIP (asset_id, resident_id)
values (7963878211, 674886982);
insert into OWNERSHIP (asset_id, resident_id)
values (7994468695, 249277281);
insert into OWNERSHIP (asset_id, resident_id)
values (8005880142, 237748624);
insert into OWNERSHIP (asset_id, resident_id)
values (8005880142, 932133821);
insert into OWNERSHIP (asset_id, resident_id)
values (8005880142, 938336827);
insert into OWNERSHIP (asset_id, resident_id)
values (8005880142, 947516768);
insert into OWNERSHIP (asset_id, resident_id)
values (8104910914, 971755198);
insert into OWNERSHIP (asset_id, resident_id)
values (8199889246, 249934851);
insert into OWNERSHIP (asset_id, resident_id)
values (8199889246, 839293878);
insert into OWNERSHIP (asset_id, resident_id)
values (8241838751, 861373978);
insert into OWNERSHIP (asset_id, resident_id)
values (8312407490, 268459128);
insert into OWNERSHIP (asset_id, resident_id)
values (8351193229, 159536136);
insert into OWNERSHIP (asset_id, resident_id)
values (8351193229, 971755198);
insert into OWNERSHIP (asset_id, resident_id)
values (8361127351, 788869614);
insert into OWNERSHIP (asset_id, resident_id)
values (8384245951, 623829428);
insert into OWNERSHIP (asset_id, resident_id)
values (8404356381, 488322515);
insert into OWNERSHIP (asset_id, resident_id)
values (8404356381, 665241182);
insert into OWNERSHIP (asset_id, resident_id)
values (8404356381, 781714948);
insert into OWNERSHIP (asset_id, resident_id)
values (8413545029, 515423239);
insert into OWNERSHIP (asset_id, resident_id)
values (8446932427, 568989933);
insert into OWNERSHIP (asset_id, resident_id)
values (8452053063, 776252852);
insert into OWNERSHIP (asset_id, resident_id)
values (8482947192, 225231663);
insert into OWNERSHIP (asset_id, resident_id)
values (8494198796, 838194879);
insert into OWNERSHIP (asset_id, resident_id)
values (8494198796, 893866938);
insert into OWNERSHIP (asset_id, resident_id)
values (8533096373, 389682785);
insert into OWNERSHIP (asset_id, resident_id)
values (8553252169, 511824734);
insert into OWNERSHIP (asset_id, resident_id)
values (8553252169, 741654353);
insert into OWNERSHIP (asset_id, resident_id)
values (8553252169, 864724389);
insert into OWNERSHIP (asset_id, resident_id)
values (8635476476, 147959435);
insert into OWNERSHIP (asset_id, resident_id)
values (8635476476, 658667536);
insert into OWNERSHIP (asset_id, resident_id)
values (8671175088, 824694479);
insert into OWNERSHIP (asset_id, resident_id)
values (8671175088, 874933198);
insert into OWNERSHIP (asset_id, resident_id)
values (8671175088, 893866938);
insert into OWNERSHIP (asset_id, resident_id)
values (8693128990, 585538532);
insert into OWNERSHIP (asset_id, resident_id)
values (8693128990, 592611699);
insert into OWNERSHIP (asset_id, resident_id)
values (8693128990, 615154167);
insert into OWNERSHIP (asset_id, resident_id)
values (8749809604, 893866938);
insert into OWNERSHIP (asset_id, resident_id)
values (8769844530, 544898831);
insert into OWNERSHIP (asset_id, resident_id)
values (8769844530, 687439599);
insert into OWNERSHIP (asset_id, resident_id)
values (8869303099, 457297875);
insert into OWNERSHIP (asset_id, resident_id)
values (8869303099, 537569649);
insert into OWNERSHIP (asset_id, resident_id)
values (8931445919, 588855746);
insert into OWNERSHIP (asset_id, resident_id)
values (8931445919, 661697766);
insert into OWNERSHIP (asset_id, resident_id)
values (8931445919, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (9043304204, 196478439);
insert into OWNERSHIP (asset_id, resident_id)
values (9099696492, 749383727);
insert into OWNERSHIP (asset_id, resident_id)
values (9130032427, 135187299);
insert into OWNERSHIP (asset_id, resident_id)
values (9130032427, 484174443);
insert into OWNERSHIP (asset_id, resident_id)
values (9130032427, 683795957);
insert into OWNERSHIP (asset_id, resident_id)
values (9162989180, 136362534);
insert into OWNERSHIP (asset_id, resident_id)
values (9162989180, 249934851);
insert into OWNERSHIP (asset_id, resident_id)
values (9162989180, 747336372);
insert into OWNERSHIP (asset_id, resident_id)
values (9247514972, 524858663);
insert into OWNERSHIP (asset_id, resident_id)
values (9247514972, 719688759);
insert into OWNERSHIP (asset_id, resident_id)
values (9261301886, 133183683);
insert into OWNERSHIP (asset_id, resident_id)
values (9268249802, 795857146);
insert into OWNERSHIP (asset_id, resident_id)
values (9290263895, 135187299);
insert into OWNERSHIP (asset_id, resident_id)
values (9338252812, 896461191);
insert into OWNERSHIP (asset_id, resident_id)
values (9343519676, 113345784);
insert into OWNERSHIP (asset_id, resident_id)
values (9343519676, 116688813);
insert into OWNERSHIP (asset_id, resident_id)
values (9343519676, 281183263);
insert into OWNERSHIP (asset_id, resident_id)
values (9354706968, 212466261);
insert into OWNERSHIP (asset_id, resident_id)
values (9452957378, 245536542);
insert into OWNERSHIP (asset_id, resident_id)
values (9456435150, 476485619);
insert into OWNERSHIP (asset_id, resident_id)
values (9469660734, 412764773);
insert into OWNERSHIP (asset_id, resident_id)
values (9517888555, 133845483);
insert into OWNERSHIP (asset_id, resident_id)
values (9517888555, 215176938);
insert into OWNERSHIP (asset_id, resident_id)
values (9517888555, 246853156);
insert into OWNERSHIP (asset_id, resident_id)
values (9540595214, 783554776);
insert into OWNERSHIP (asset_id, resident_id)
values (9540595214, 865947552);
insert into OWNERSHIP (asset_id, resident_id)
values (9554106426, 539536672);
insert into OWNERSHIP (asset_id, resident_id)
values (9554106426, 698826441);
insert into OWNERSHIP (asset_id, resident_id)
values (9578288739, 426289694);
insert into OWNERSHIP (asset_id, resident_id)
values (9578288739, 436819126);
insert into OWNERSHIP (asset_id, resident_id)
values (9578288739, 544898831);
insert into OWNERSHIP (asset_id, resident_id)
values (9638313312, 861373978);
insert into OWNERSHIP (asset_id, resident_id)
values (9691187776, 349583951);
insert into OWNERSHIP (asset_id, resident_id)
values (9691187776, 592611699);
insert into OWNERSHIP (asset_id, resident_id)
values (9691187776, 783311218);
insert into OWNERSHIP (asset_id, resident_id)
values (9789146077, 336514439);
insert into OWNERSHIP (asset_id, resident_id)
values (9812199767, 686989579);
insert into OWNERSHIP (asset_id, resident_id)
values (9812199767, 945839263);
commit;
prompt 400 records committed...
insert into OWNERSHIP (asset_id, resident_id)
values (9868052411, 865947552);
insert into OWNERSHIP (asset_id, resident_id)
values (9886682835, 588692828);
insert into OWNERSHIP (asset_id, resident_id)
values (9923510736, 139239877);
insert into OWNERSHIP (asset_id, resident_id)
values (9923510736, 759997767);
commit;
prompt 404 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4855219992, 5369, 'Credit', to_date('26-04-2020', 'dd-mm-yyyy'), to_date('11-07-2018', 'dd-mm-yyyy'), 3556248286);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5634444376, 1064, 'Cash', to_date('22-09-2022', 'dd-mm-yyyy'), to_date('12-08-2019', 'dd-mm-yyyy'), 5635937656);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7279963145, 1642, 'Cash', to_date('06-04-2017', 'dd-mm-yyyy'), to_date('26-07-2018', 'dd-mm-yyyy'), 3654654692);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8116812838, 5002, 'Cash', to_date('12-10-2017', 'dd-mm-yyyy'), to_date('18-11-2018', 'dd-mm-yyyy'), 4159894618);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6437536484, 619, 'Check', to_date('21-06-2016', 'dd-mm-yyyy'), to_date('12-01-2019', 'dd-mm-yyyy'), 4295446744);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4235573289, 1262, 'Check', to_date('10-01-2015', 'dd-mm-yyyy'), to_date('28-07-2019', 'dd-mm-yyyy'), 5498647191);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5236482748, 4341, 'Cash', to_date('22-12-2018', 'dd-mm-yyyy'), to_date('02-06-2018', 'dd-mm-yyyy'), 5445886759);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8655551441, 3708, 'Cash', to_date('04-05-2021', 'dd-mm-yyyy'), to_date('16-04-2021', 'dd-mm-yyyy'), 1882193391);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8558699675, 770, 'Credit', to_date('25-06-2023', 'dd-mm-yyyy'), to_date('24-10-2018', 'dd-mm-yyyy'), 1557417384);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5684951388, 3099, 'Cash', to_date('30-11-2019', 'dd-mm-yyyy'), to_date('07-10-2015', 'dd-mm-yyyy'), 1942157435);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8382414384, 5838, 'Cash', to_date('09-11-2019', 'dd-mm-yyyy'), to_date('02-08-2015', 'dd-mm-yyyy'), 1568965874);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5784637242, 2615, 'Cash', to_date('12-01-2019', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'), 1999296696);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4193165719, 1919, 'Check', to_date('29-11-2022', 'dd-mm-yyyy'), to_date('14-08-2016', 'dd-mm-yyyy'), 3714195382);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1586456289, 3967, 'Cash', to_date('05-05-2015', 'dd-mm-yyyy'), to_date('15-12-2022', 'dd-mm-yyyy'), 7762114179);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9898591875, 5713, 'Cash', to_date('09-07-2020', 'dd-mm-yyyy'), to_date('08-12-2015', 'dd-mm-yyyy'), 3522788675);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6575871613, 2763, 'Cash', to_date('23-11-2022', 'dd-mm-yyyy'), to_date('18-04-2017', 'dd-mm-yyyy'), 3358837585);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2732417811, 1646, 'Credit', to_date('26-04-2016', 'dd-mm-yyyy'), to_date('30-04-2018', 'dd-mm-yyyy'), 2871978594);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7859315524, 3491, 'Credit', to_date('03-07-2018', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'), 1523698569);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9686759135, 3810, 'Cash', to_date('12-02-2019', 'dd-mm-yyyy'), to_date('23-08-2020', 'dd-mm-yyyy'), 7332468413);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3947823793, 1482, 'Check', to_date('12-05-2019', 'dd-mm-yyyy'), to_date('13-04-2015', 'dd-mm-yyyy'), 7223476559);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1758316694, 3084, 'Check', to_date('17-03-2017', 'dd-mm-yyyy'), to_date('19-11-2019', 'dd-mm-yyyy'), 5661359651);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3513795582, 3936, 'Credit', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('03-03-2016', 'dd-mm-yyyy'), 7214938872);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1286159574, 5341, 'Credit', to_date('12-01-2019', 'dd-mm-yyyy'), to_date('23-04-2020', 'dd-mm-yyyy'), 2117975264);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5677729281, 3281, 'Cash', to_date('09-08-2019', 'dd-mm-yyyy'), to_date('24-08-2021', 'dd-mm-yyyy'), 6227681244);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5326798636, 635, 'Cash', to_date('23-08-2021', 'dd-mm-yyyy'), to_date('13-05-2018', 'dd-mm-yyyy'), 3631696238);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3775525616, 5202, 'Check', to_date('05-10-2016', 'dd-mm-yyyy'), to_date('28-02-2021', 'dd-mm-yyyy'), 4313216129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2567599918, 4782, 'Credit', to_date('22-06-2023', 'dd-mm-yyyy'), to_date('08-05-2022', 'dd-mm-yyyy'), 1822686733);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8946143698, 4412, 'Credit', to_date('19-06-2023', 'dd-mm-yyyy'), to_date('03-04-2021', 'dd-mm-yyyy'), 2658286596);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6739346757, 2450, 'Credit', to_date('04-01-2015', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 8926282748);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7938378759, 1074, 'Credit', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('16-11-2020', 'dd-mm-yyyy'), 4433298125);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5985783457, 1562, 'Credit', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('02-06-2022', 'dd-mm-yyyy'), 5718998928);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9724281695, 2437, 'Cash', to_date('05-10-2015', 'dd-mm-yyyy'), to_date('13-06-2022', 'dd-mm-yyyy'), 5799489168);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3492595647, 3085, 'Cash', to_date('02-09-2020', 'dd-mm-yyyy'), to_date('14-10-2019', 'dd-mm-yyyy'), 3154335321);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4376398557, 1181, 'Check', to_date('01-08-2018', 'dd-mm-yyyy'), to_date('03-03-2019', 'dd-mm-yyyy'), 9632833738);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6216689863, 2959, 'Cash', to_date('24-08-2017', 'dd-mm-yyyy'), to_date('13-10-2021', 'dd-mm-yyyy'), 2931666897);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8934771745, 961, 'Check', to_date('20-01-2017', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), 5393842389);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8627889377, 2729, 'Check', to_date('30-07-2018', 'dd-mm-yyyy'), to_date('11-02-2020', 'dd-mm-yyyy'), 3995261136);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9728538852, 5543, 'Cash', to_date('27-04-2016', 'dd-mm-yyyy'), to_date('24-04-2018', 'dd-mm-yyyy'), 3117192153);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9223471332, 3960, 'Check', to_date('03-08-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), 9223442661);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5474728445, 3089, 'Credit', to_date('22-03-2015', 'dd-mm-yyyy'), to_date('24-05-2017', 'dd-mm-yyyy'), 3764995215);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2113222141, 5659, 'Cash', to_date('23-01-2023', 'dd-mm-yyyy'), to_date('08-04-2022', 'dd-mm-yyyy'), 7342291545);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7452365495, 2956, 'Credit', to_date('13-11-2023', 'dd-mm-yyyy'), to_date('13-07-2020', 'dd-mm-yyyy'), 9781174318);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1679161383, 1257, 'Check', to_date('22-05-2015', 'dd-mm-yyyy'), to_date('07-04-2017', 'dd-mm-yyyy'), 5662161994);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3912962848, 5045, 'Check', to_date('21-05-2020', 'dd-mm-yyyy'), to_date('25-07-2017', 'dd-mm-yyyy'), 4185413791);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8828799276, 3543, 'Check', to_date('08-05-2017', 'dd-mm-yyyy'), to_date('19-10-2017', 'dd-mm-yyyy'), 4146846981);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2237832582, 5325, 'Credit', to_date('30-05-2019', 'dd-mm-yyyy'), to_date('22-09-2020', 'dd-mm-yyyy'), 4866413555);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9533548461, 881, 'Credit', to_date('23-10-2021', 'dd-mm-yyyy'), to_date('30-06-2018', 'dd-mm-yyyy'), 9992577847);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6677591899, 2743, 'Cash', to_date('26-01-2020', 'dd-mm-yyyy'), to_date('03-03-2016', 'dd-mm-yyyy'), 5792543598);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8539781885, 5543, 'Credit', to_date('17-07-2020', 'dd-mm-yyyy'), to_date('15-05-2017', 'dd-mm-yyyy'), 7534254276);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9598176117, 4931, 'Credit', to_date('21-03-2017', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), 4828895987);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6262314696, 2379, 'Check', to_date('18-04-2018', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), 3671333763);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6188194679, 3511, 'Check', to_date('07-08-2018', 'dd-mm-yyyy'), to_date('10-11-2019', 'dd-mm-yyyy'), 2363661557);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4575239253, 2547, 'Check', to_date('07-02-2016', 'dd-mm-yyyy'), to_date('18-03-2022', 'dd-mm-yyyy'), 2151622185);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8447225682, 1516, 'Credit', to_date('29-07-2015', 'dd-mm-yyyy'), to_date('05-06-2017', 'dd-mm-yyyy'), 5766963764);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9537525912, 4315, 'Cash', to_date('22-06-2022', 'dd-mm-yyyy'), to_date('01-09-2017', 'dd-mm-yyyy'), 5393842389);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9395898834, 3492, 'Credit', to_date('17-02-2023', 'dd-mm-yyyy'), to_date('04-12-2020', 'dd-mm-yyyy'), 6561357232);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9112543725, 1750, 'Credit', to_date('28-01-2022', 'dd-mm-yyyy'), to_date('20-05-2020', 'dd-mm-yyyy'), 1252464813);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5415267916, 5412, 'Cash', to_date('17-12-2017', 'dd-mm-yyyy'), to_date('15-05-2016', 'dd-mm-yyyy'), 7314372264);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6389979951, 5731, 'Cash', to_date('12-09-2015', 'dd-mm-yyyy'), to_date('11-08-2016', 'dd-mm-yyyy'), 3576298243);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1785652399, 2688, 'Credit', to_date('10-11-2020', 'dd-mm-yyyy'), to_date('02-09-2016', 'dd-mm-yyyy'), 7537563939);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4654922129, 5162, 'Credit', to_date('20-08-2018', 'dd-mm-yyyy'), to_date('24-05-2016', 'dd-mm-yyyy'), 9223442661);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3577186685, 1334, 'Credit', to_date('13-03-2020', 'dd-mm-yyyy'), to_date('03-05-2020', 'dd-mm-yyyy'), 4238776638);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7578455743, 1601, 'Cash', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('03-04-2019', 'dd-mm-yyyy'), 2551276128);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3512668385, 4419, 'Credit', to_date('02-04-2021', 'dd-mm-yyyy'), to_date('22-10-2020', 'dd-mm-yyyy'), 4249847684);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2137369349, 5010, 'Credit', to_date('06-08-2017', 'dd-mm-yyyy'), to_date('12-01-2015', 'dd-mm-yyyy'), 2242972333);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3727685567, 1846, 'Cash', to_date('13-06-2020', 'dd-mm-yyyy'), to_date('12-09-2016', 'dd-mm-yyyy'), 5933246817);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6889563478, 4678, 'Credit', to_date('03-08-2016', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'), 7127372749);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1252887897, 2399, 'Check', to_date('04-05-2023', 'dd-mm-yyyy'), to_date('08-05-2015', 'dd-mm-yyyy'), 9957395313);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7712355338, 4375, 'Credit', to_date('21-01-2021', 'dd-mm-yyyy'), to_date('18-06-2017', 'dd-mm-yyyy'), 5766697281);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9565628834, 1839, 'Cash', to_date('13-05-2021', 'dd-mm-yyyy'), to_date('24-02-2020', 'dd-mm-yyyy'), 3897721262);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1723125681, 989, 'Check', to_date('03-07-2020', 'dd-mm-yyyy'), to_date('23-05-2020', 'dd-mm-yyyy'), 2954698321);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1845382927, 3972, 'Credit', to_date('14-06-2022', 'dd-mm-yyyy'), to_date('23-07-2018', 'dd-mm-yyyy'), 3785529772);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8599325311, 1255, 'Credit', to_date('23-04-2023', 'dd-mm-yyyy'), to_date('13-12-2017', 'dd-mm-yyyy'), 2116147667);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8694833721, 4286, 'Credit', to_date('20-09-2022', 'dd-mm-yyyy'), to_date('16-11-2020', 'dd-mm-yyyy'), 4786651373);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1249441185, 657, 'Credit', to_date('20-08-2023', 'dd-mm-yyyy'), to_date('15-04-2022', 'dd-mm-yyyy'), 9877814153);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5248411898, 1944, 'Cash', to_date('19-12-2019', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 6371867477);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6443255483, 2163, 'Check', to_date('11-08-2023', 'dd-mm-yyyy'), to_date('29-09-2018', 'dd-mm-yyyy'), 1891155287);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8374521468, 2881, 'Check', to_date('20-05-2023', 'dd-mm-yyyy'), to_date('10-01-2015', 'dd-mm-yyyy'), 6537778743);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7958884221, 1147, 'Cash', to_date('30-08-2020', 'dd-mm-yyyy'), to_date('28-12-2020', 'dd-mm-yyyy'), 7788211143);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5617355483, 4772, 'Cash', to_date('20-06-2018', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 2871978594);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3191373171, 542, 'Cash', to_date('31-01-2022', 'dd-mm-yyyy'), to_date('12-04-2021', 'dd-mm-yyyy'), 5165328338);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7171621957, 1894, 'Credit', to_date('02-04-2023', 'dd-mm-yyyy'), to_date('17-10-2017', 'dd-mm-yyyy'), 2151622185);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5967261415, 2258, 'Cash', to_date('16-03-2022', 'dd-mm-yyyy'), to_date('08-04-2018', 'dd-mm-yyyy'), 4866413555);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7371432519, 3183, 'Check', to_date('27-08-2023', 'dd-mm-yyyy'), to_date('07-10-2016', 'dd-mm-yyyy'), 5582234829);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8699461864, 5451, 'Check', to_date('11-01-2022', 'dd-mm-yyyy'), to_date('01-09-2016', 'dd-mm-yyyy'), 7429724848);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5977483216, 511, 'Check', to_date('26-07-2021', 'dd-mm-yyyy'), to_date('20-06-2017', 'dd-mm-yyyy'), 5949649787);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8823482734, 3195, 'Cash', to_date('03-03-2018', 'dd-mm-yyyy'), to_date('12-05-2015', 'dd-mm-yyyy'), 9138129716);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9441833715, 2937, 'Credit', to_date('31-03-2018', 'dd-mm-yyyy'), to_date('02-02-2019', 'dd-mm-yyyy'), 9346399791);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8392749266, 2216, 'Check', to_date('15-12-2022', 'dd-mm-yyyy'), to_date('27-01-2016', 'dd-mm-yyyy'), 4185733533);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8285373991, 5192, 'Check', to_date('05-08-2023', 'dd-mm-yyyy'), to_date('23-04-2015', 'dd-mm-yyyy'), 8864155356);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5215817422, 2904, 'Check', to_date('30-10-2018', 'dd-mm-yyyy'), to_date('14-11-2015', 'dd-mm-yyyy'), 4828895987);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3433248959, 3188, 'Cash', to_date('20-09-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), 8387436752);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7513443997, 2645, 'Cash', to_date('29-08-2016', 'dd-mm-yyyy'), to_date('16-09-2022', 'dd-mm-yyyy'), 3254484582);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1647546965, 3345, 'Cash', to_date('28-11-2018', 'dd-mm-yyyy'), to_date('15-10-2022', 'dd-mm-yyyy'), 4347482366);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7877835917, 1205, 'Credit', to_date('01-03-2016', 'dd-mm-yyyy'), to_date('02-02-2022', 'dd-mm-yyyy'), 8863711117);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4278413425, 3196, 'Check', to_date('23-10-2021', 'dd-mm-yyyy'), to_date('05-05-2021', 'dd-mm-yyyy'), 1252464813);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8359629955, 2319, 'Credit', to_date('22-12-2017', 'dd-mm-yyyy'), to_date('15-08-2022', 'dd-mm-yyyy'), 5475167869);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6546557673, 4846, 'Check', to_date('11-08-2017', 'dd-mm-yyyy'), to_date('18-09-2022', 'dd-mm-yyyy'), 7598254851);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2445154837, 1464, 'Cash', to_date('26-06-2022', 'dd-mm-yyyy'), to_date('02-06-2019', 'dd-mm-yyyy'), 8132641268);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6679346363, 2362, 'Check', to_date('23-06-2015', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), 1613227394);
commit;
prompt 100 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6133722682, 2113, 'Credit', to_date('11-04-2019', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), 7959151316);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6917124375, 2074, 'Cash', to_date('24-04-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), 6786213942);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9677651267, 4146, 'Credit', to_date('17-09-2023', 'dd-mm-yyyy'), to_date('03-03-2020', 'dd-mm-yyyy'), 1553993598);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3395632593, 1937, 'Cash', to_date('12-08-2023', 'dd-mm-yyyy'), to_date('04-02-2019', 'dd-mm-yyyy'), 3694621928);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3477397342, 4133, 'Credit', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('20-07-2021', 'dd-mm-yyyy'), 5933246817);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2761821192, 3702, 'Cash', to_date('26-09-2016', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 3522788675);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6866293936, 4042, 'Check', to_date('18-03-2020', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'), 4687272626);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5291262181, 4383, 'Cash', to_date('08-05-2015', 'dd-mm-yyyy'), to_date('19-03-2015', 'dd-mm-yyyy'), 2629944151);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5819686232, 1062, 'Check', to_date('08-05-2023', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'), 4844171756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3515299235, 4111, 'Credit', to_date('11-05-2015', 'dd-mm-yyyy'), to_date('14-10-2020', 'dd-mm-yyyy'), 1918613131);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4937749769, 5366, 'Credit', to_date('14-03-2015', 'dd-mm-yyyy'), to_date('08-02-2016', 'dd-mm-yyyy'), 2918995427);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9247735713, 2201, 'Check', to_date('11-11-2016', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 1755565188);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7631489313, 1293, 'Cash', to_date('23-07-2022', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 3897721262);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8155249373, 4722, 'Check', to_date('01-09-2015', 'dd-mm-yyyy'), to_date('02-03-2022', 'dd-mm-yyyy'), 2926669992);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4297223767, 4247, 'Check', to_date('19-01-2020', 'dd-mm-yyyy'), to_date('31-05-2020', 'dd-mm-yyyy'), 3899829445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4937298381, 4459, 'Check', to_date('07-01-2023', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'), 2936693947);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2162361646, 1566, 'Cash', to_date('13-08-2015', 'dd-mm-yyyy'), to_date('21-10-2015', 'dd-mm-yyyy'), 4844171756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7261372978, 1390, 'Check', to_date('02-10-2022', 'dd-mm-yyyy'), to_date('19-10-2017', 'dd-mm-yyyy'), 9138129716);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2824891181, 4862, 'Credit', to_date('17-02-2023', 'dd-mm-yyyy'), to_date('12-06-2020', 'dd-mm-yyyy'), 8262797734);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1134986732, 5619, 'Cash', to_date('14-08-2021', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'), 4433298125);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5891544734, 2136, 'Credit', to_date('30-07-2015', 'dd-mm-yyyy'), to_date('23-06-2021', 'dd-mm-yyyy'), 1613227394);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6736728833, 1185, 'Credit', to_date('12-09-2022', 'dd-mm-yyyy'), to_date('18-03-2016', 'dd-mm-yyyy'), 5847945678);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3117941219, 1091, 'Cash', to_date('26-04-2017', 'dd-mm-yyyy'), to_date('19-01-2015', 'dd-mm-yyyy'), 7429724848);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5931875893, 4935, 'Cash', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('23-02-2020', 'dd-mm-yyyy'), 6795552533);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1726389762, 4182, 'Cash', to_date('14-07-2017', 'dd-mm-yyyy'), to_date('02-11-2017', 'dd-mm-yyyy'), 9586323889);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3217566227, 3367, 'Check', to_date('12-05-2020', 'dd-mm-yyyy'), to_date('10-07-2016', 'dd-mm-yyyy'), 3671333763);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4473281678, 4007, 'Credit', to_date('14-10-2023', 'dd-mm-yyyy'), to_date('20-09-2020', 'dd-mm-yyyy'), 4159894618);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2192648644, 1088, 'Credit', to_date('01-11-2018', 'dd-mm-yyyy'), to_date('01-02-2015', 'dd-mm-yyyy'), 7462697486);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7369923163, 2606, 'Cash', to_date('06-02-2015', 'dd-mm-yyyy'), to_date('29-08-2017', 'dd-mm-yyyy'), 6775977362);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7843124677, 3379, 'Check', to_date('01-07-2023', 'dd-mm-yyyy'), to_date('08-11-2015', 'dd-mm-yyyy'), 7153189418);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3259144577, 2706, 'Check', to_date('05-04-2017', 'dd-mm-yyyy'), to_date('07-07-2016', 'dd-mm-yyyy'), 1494366839);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2894485969, 2555, 'Check', to_date('29-12-2022', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), 8374595871);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7925611218, 3556, 'Cash', to_date('14-04-2017', 'dd-mm-yyyy'), to_date('19-05-2021', 'dd-mm-yyyy'), 8132641268);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1278868854, 1349, 'Credit', to_date('31-10-2019', 'dd-mm-yyyy'), to_date('30-12-2015', 'dd-mm-yyyy'), 3995261136);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7591223858, 3746, 'Credit', to_date('27-06-2015', 'dd-mm-yyyy'), to_date('22-01-2022', 'dd-mm-yyyy'), 6285298595);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1788442357, 4398, 'Credit', to_date('05-07-2023', 'dd-mm-yyyy'), to_date('25-01-2022', 'dd-mm-yyyy'), 2563441712);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3423624431, 2840, 'Check', to_date('16-08-2017', 'dd-mm-yyyy'), to_date('06-11-2020', 'dd-mm-yyyy'), 4866413555);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6288478218, 1621, 'Credit', to_date('20-09-2019', 'dd-mm-yyyy'), to_date('19-10-2022', 'dd-mm-yyyy'), 8262797734);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4416434232, 1633, 'Cash', to_date('23-07-2016', 'dd-mm-yyyy'), to_date('12-02-2021', 'dd-mm-yyyy'), 6837512131);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2775346825, 4866, 'Check', to_date('21-09-2015', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 8814989295);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1327841241, 1728, 'Credit', to_date('14-05-2020', 'dd-mm-yyyy'), to_date('05-08-2020', 'dd-mm-yyyy'), 3694621928);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9987855526, 5922, 'Credit', to_date('17-04-2016', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'), 4891838229);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1631991774, 3242, 'Credit', to_date('06-09-2017', 'dd-mm-yyyy'), to_date('05-02-2022', 'dd-mm-yyyy'), 6424172964);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8744142648, 1625, 'Credit', to_date('18-06-2016', 'dd-mm-yyyy'), to_date('07-05-2018', 'dd-mm-yyyy'), 8595366756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5299657174, 2097, 'Cash', to_date('01-04-2023', 'dd-mm-yyyy'), to_date('13-01-2022', 'dd-mm-yyyy'), 4313216129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4929369216, 1508, 'Check', to_date('02-03-2019', 'dd-mm-yyyy'), to_date('27-08-2022', 'dd-mm-yyyy'), 1998974929);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6931725122, 5498, 'Credit', to_date('29-06-2021', 'dd-mm-yyyy'), to_date('24-07-2020', 'dd-mm-yyyy'), 2617574129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7619996842, 1401, 'Check', to_date('19-03-2023', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 1882193391);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3341975128, 1999, 'Credit', to_date('15-03-2017', 'dd-mm-yyyy'), to_date('15-04-2020', 'dd-mm-yyyy'), 1858925246);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1471575868, 3505, 'Check', to_date('13-12-2018', 'dd-mm-yyyy'), to_date('29-01-2019', 'dd-mm-yyyy'), 8469385777);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7599779862, 3086, 'Credit', to_date('19-06-2019', 'dd-mm-yyyy'), to_date('31-12-2017', 'dd-mm-yyyy'), 4168397516);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8659923842, 1184, 'Check', to_date('16-10-2015', 'dd-mm-yyyy'), to_date('01-03-2017', 'dd-mm-yyyy'), 9211935538);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4471552853, 3067, 'Credit', to_date('20-07-2020', 'dd-mm-yyyy'), to_date('21-06-2020', 'dd-mm-yyyy'), 2628998293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2191717878, 3012, 'Cash', to_date('13-02-2021', 'dd-mm-yyyy'), to_date('17-12-2021', 'dd-mm-yyyy'), 9182836259);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7484476978, 5294, 'Credit', to_date('17-01-2016', 'dd-mm-yyyy'), to_date('14-05-2019', 'dd-mm-yyyy'), 1494366839);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5684286991, 5019, 'Check', to_date('04-10-2018', 'dd-mm-yyyy'), to_date('31-07-2022', 'dd-mm-yyyy'), 2563441712);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1223175414, 4077, 'Check', to_date('12-07-2023', 'dd-mm-yyyy'), to_date('13-08-2019', 'dd-mm-yyyy'), 7614183181);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2756821765, 3950, 'Cash', to_date('23-12-2019', 'dd-mm-yyyy'), to_date('12-05-2018', 'dd-mm-yyyy'), 4964928271);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1967868791, 3981, 'Cash', to_date('07-07-2015', 'dd-mm-yyyy'), to_date('04-03-2015', 'dd-mm-yyyy'), 8926282748);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7363443782, 4270, 'Credit', to_date('24-11-2019', 'dd-mm-yyyy'), to_date('20-06-2019', 'dd-mm-yyyy'), 3714195382);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9351296641, 5824, 'Check', to_date('13-03-2018', 'dd-mm-yyyy'), to_date('09-08-2019', 'dd-mm-yyyy'), 4866413555);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9233785415, 2980, 'Check', to_date('23-09-2019', 'dd-mm-yyyy'), to_date('28-02-2020', 'dd-mm-yyyy'), 4146846981);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5955688178, 1045, 'Cash', to_date('01-10-2021', 'dd-mm-yyyy'), to_date('15-02-2019', 'dd-mm-yyyy'), 7788211143);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6625619561, 4650, 'Cash', to_date('26-05-2019', 'dd-mm-yyyy'), to_date('05-05-2022', 'dd-mm-yyyy'), 6649259712);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7333752441, 4395, 'Credit', to_date('12-02-2021', 'dd-mm-yyyy'), to_date('13-10-2021', 'dd-mm-yyyy'), 8338351458);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3376966242, 4705, 'Check', to_date('12-12-2022', 'dd-mm-yyyy'), to_date('09-06-2020', 'dd-mm-yyyy'), 9641782372);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5742528791, 1631, 'Credit', to_date('12-05-2022', 'dd-mm-yyyy'), to_date('01-08-2018', 'dd-mm-yyyy'), 8469385777);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9137133619, 3149, 'Credit', to_date('27-08-2018', 'dd-mm-yyyy'), to_date('11-07-2015', 'dd-mm-yyyy'), 7959151316);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5386661349, 743, 'Credit', to_date('25-04-2016', 'dd-mm-yyyy'), to_date('30-01-2019', 'dd-mm-yyyy'), 4685341693);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1243482324, 735, 'Credit', to_date('15-12-2016', 'dd-mm-yyyy'), to_date('15-05-2020', 'dd-mm-yyyy'), 2464419131);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2513263943, 1687, 'Check', to_date('13-11-2020', 'dd-mm-yyyy'), to_date('09-05-2021', 'dd-mm-yyyy'), 1574356834);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5252179825, 886, 'Check', to_date('01-11-2020', 'dd-mm-yyyy'), to_date('26-06-2019', 'dd-mm-yyyy'), 4249544451);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8417349474, 888, 'Credit', to_date('14-05-2018', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'), 5538114597);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2918848683, 2090, 'Check', to_date('30-10-2017', 'dd-mm-yyyy'), to_date('04-06-2020', 'dd-mm-yyyy'), 7127372749);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3398567389, 5370, 'Credit', to_date('13-12-2020', 'dd-mm-yyyy'), to_date('10-08-2015', 'dd-mm-yyyy'), 2989134417);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4996979286, 1798, 'Cash', to_date('27-07-2018', 'dd-mm-yyyy'), to_date('16-11-2020', 'dd-mm-yyyy'), 5796492881);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8163752425, 4399, 'Credit', to_date('26-09-2016', 'dd-mm-yyyy'), to_date('24-10-2020', 'dd-mm-yyyy'), 1982548571);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6432284233, 1262, 'Cash', to_date('13-02-2018', 'dd-mm-yyyy'), to_date('24-12-2015', 'dd-mm-yyyy'), 5266472322);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1119225251, 4669, 'Check', to_date('09-11-2021', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'), 9138129716);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4443694491, 3414, 'Cash', to_date('02-06-2018', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 3654654692);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7662143595, 2245, 'Credit', to_date('20-08-2023', 'dd-mm-yyyy'), to_date('09-08-2017', 'dd-mm-yyyy'), 4238776638);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8673649167, 5658, 'Cash', to_date('08-07-2019', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 4477446264);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4222959444, 3483, 'Check', to_date('17-07-2023', 'dd-mm-yyyy'), to_date('17-06-2022', 'dd-mm-yyyy'), 1999296696);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9726673824, 3886, 'Check', to_date('17-01-2019', 'dd-mm-yyyy'), to_date('11-08-2020', 'dd-mm-yyyy'), 5766697281);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3323165539, 913, 'Cash', to_date('02-01-2018', 'dd-mm-yyyy'), to_date('06-02-2022', 'dd-mm-yyyy'), 3337485563);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7798863935, 4998, 'Credit', to_date('13-12-2018', 'dd-mm-yyyy'), to_date('13-01-2016', 'dd-mm-yyyy'), 2989134417);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4634885889, 4772, 'Credit', to_date('26-02-2015', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), 7494443274);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4937767242, 1289, 'Credit', to_date('27-02-2015', 'dd-mm-yyyy'), to_date('20-04-2015', 'dd-mm-yyyy'), 7462697486);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8349131829, 3121, 'Cash', to_date('14-06-2021', 'dd-mm-yyyy'), to_date('17-05-2016', 'dd-mm-yyyy'), 9334379264);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5392166982, 647, 'Check', to_date('14-12-2016', 'dd-mm-yyyy'), to_date('26-04-2015', 'dd-mm-yyyy'), 7762114179);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3764933797, 1771, 'Credit', to_date('19-11-2021', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 8146142557);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5314481364, 1089, 'Credit', to_date('10-09-2020', 'dd-mm-yyyy'), to_date('30-11-2019', 'dd-mm-yyyy'), 9358277964);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9581775813, 3289, 'Check', to_date('20-03-2022', 'dd-mm-yyyy'), to_date('30-10-2022', 'dd-mm-yyyy'), 3995261136);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1683647522, 700, 'Cash', to_date('28-03-2020', 'dd-mm-yyyy'), to_date('18-06-2019', 'dd-mm-yyyy'), 3531192527);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8284781822, 4648, 'Check', to_date('21-04-2017', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), 9153846231);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9826772372, 5056, 'Credit', to_date('28-10-2016', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 3467579293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7575892893, 2331, 'Check', to_date('27-06-2023', 'dd-mm-yyyy'), to_date('10-02-2020', 'dd-mm-yyyy'), 8491577337);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8232979764, 1536, 'Credit', to_date('21-10-2021', 'dd-mm-yyyy'), to_date('03-09-2016', 'dd-mm-yyyy'), 7856264556);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3217117954, 3318, 'Cash', to_date('01-10-2023', 'dd-mm-yyyy'), to_date('08-03-2017', 'dd-mm-yyyy'), 2298965679);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5766848771, 5765, 'Check', to_date('17-09-2020', 'dd-mm-yyyy'), to_date('19-12-2020', 'dd-mm-yyyy'), 9848367623);
commit;
prompt 200 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8515658922, 3704, 'Credit', to_date('01-09-2017', 'dd-mm-yyyy'), to_date('17-09-2019', 'dd-mm-yyyy'), 5313199237);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4372682728, 5431, 'Credit', to_date('20-01-2016', 'dd-mm-yyyy'), to_date('03-02-2019', 'dd-mm-yyyy'), 9358277964);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8273616511, 5075, 'Cash', to_date('08-05-2023', 'dd-mm-yyyy'), to_date('23-11-2017', 'dd-mm-yyyy'), 5313199237);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9684842192, 1215, 'Credit', to_date('14-02-2023', 'dd-mm-yyyy'), to_date('26-01-2017', 'dd-mm-yyyy'), 3568793363);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2553974134, 3499, 'Credit', to_date('19-05-2023', 'dd-mm-yyyy'), to_date('08-05-2015', 'dd-mm-yyyy'), 8493468112);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7768693662, 4184, 'Check', to_date('11-09-2018', 'dd-mm-yyyy'), to_date('26-05-2023', 'dd-mm-yyyy'), 4471966292);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2375989427, 981, 'Credit', to_date('27-09-2015', 'dd-mm-yyyy'), to_date('11-05-2022', 'dd-mm-yyyy'), 9297327832);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1375565495, 1460, 'Cash', to_date('30-04-2022', 'dd-mm-yyyy'), to_date('21-02-2016', 'dd-mm-yyyy'), 1252464813);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8155789843, 5277, 'Check', to_date('01-05-2018', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 1726756224);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1181956523, 3109, 'Check', to_date('26-06-2018', 'dd-mm-yyyy'), to_date('30-06-2017', 'dd-mm-yyyy'), 4561385332);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6254659665, 2434, 'Check', to_date('30-07-2020', 'dd-mm-yyyy'), to_date('31-01-2015', 'dd-mm-yyyy'), 9574279431);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2498949468, 527, 'Cash', to_date('23-11-2023', 'dd-mm-yyyy'), to_date('04-10-2021', 'dd-mm-yyyy'), 6561357232);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8932594898, 3685, 'Cash', to_date('04-05-2017', 'dd-mm-yyyy'), to_date('02-05-2022', 'dd-mm-yyyy'), 2628998293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9656389442, 1568, 'Check', to_date('30-12-2023', 'dd-mm-yyyy'), to_date('26-06-2021', 'dd-mm-yyyy'), 2324346182);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3232352752, 4606, 'Credit', to_date('04-06-2023', 'dd-mm-yyyy'), to_date('06-10-2015', 'dd-mm-yyyy'), 6775977362);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7918565379, 3767, 'Cash', to_date('16-04-2022', 'dd-mm-yyyy'), to_date('04-07-2015', 'dd-mm-yyyy'), 3654654692);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2295432767, 3298, 'Credit', to_date('10-02-2016', 'dd-mm-yyyy'), to_date('22-11-2018', 'dd-mm-yyyy'), 4345355892);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8138424197, 1680, 'Cash', to_date('20-08-2018', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), 3116514217);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8632591474, 2671, 'Credit', to_date('24-07-2017', 'dd-mm-yyyy'), to_date('24-04-2017', 'dd-mm-yyyy'), 4297133476);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7375247662, 2582, 'Cash', to_date('12-06-2020', 'dd-mm-yyyy'), to_date('05-11-2022', 'dd-mm-yyyy'), 9214671395);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7623155956, 2692, 'Check', to_date('12-11-2023', 'dd-mm-yyyy'), to_date('23-07-2016', 'dd-mm-yyyy'), 3531192527);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2953896445, 3069, 'Check', to_date('29-03-2019', 'dd-mm-yyyy'), to_date('02-06-2017', 'dd-mm-yyyy'), 7637833876);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2844775968, 1594, 'Cash', to_date('12-05-2017', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), 4178165241);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7856992712, 4436, 'Cash', to_date('07-06-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 5165328338);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9149264161, 1691, 'Credit', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('05-02-2019', 'dd-mm-yyyy'), 2389291999);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1136692883, 3144, 'Check', to_date('08-09-2018', 'dd-mm-yyyy'), to_date('04-04-2020', 'dd-mm-yyyy'), 7566335653);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6968827859, 5674, 'Credit', to_date('15-05-2020', 'dd-mm-yyyy'), to_date('11-11-2019', 'dd-mm-yyyy'), 7153662356);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2216897755, 4598, 'Cash', to_date('18-01-2018', 'dd-mm-yyyy'), to_date('18-01-2019', 'dd-mm-yyyy'), 7734731985);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4125347438, 3923, 'Check', to_date('27-07-2015', 'dd-mm-yyyy'), to_date('20-09-2015', 'dd-mm-yyyy'), 8699926337);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1896119171, 3465, 'Check', to_date('05-07-2016', 'dd-mm-yyyy'), to_date('10-02-2016', 'dd-mm-yyyy'), 3631696238);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3627928683, 4169, 'Check', to_date('11-11-2020', 'dd-mm-yyyy'), to_date('18-10-2017', 'dd-mm-yyyy'), 7762114179);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1572719835, 4987, 'Cash', to_date('08-12-2016', 'dd-mm-yyyy'), to_date('24-04-2019', 'dd-mm-yyyy'), 6317891282);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6376399952, 1548, 'Check', to_date('22-03-2015', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'), 5933246817);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5382962318, 4102, 'Check', to_date('01-07-2021', 'dd-mm-yyyy'), to_date('06-01-2022', 'dd-mm-yyyy'), 7223476559);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8629966417, 3442, 'Check', to_date('22-03-2022', 'dd-mm-yyyy'), to_date('07-12-2015', 'dd-mm-yyyy'), 1175969255);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1846884717, 4784, 'Check', to_date('29-10-2022', 'dd-mm-yyyy'), to_date('08-08-2019', 'dd-mm-yyyy'), 9123486739);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1416526379, 1824, 'Check', to_date('19-02-2021', 'dd-mm-yyyy'), to_date('14-01-2017', 'dd-mm-yyyy'), 9483442283);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9685136338, 2944, 'Credit', to_date('30-11-2019', 'dd-mm-yyyy'), to_date('23-03-2019', 'dd-mm-yyyy'), 8117638562);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4949434318, 2623, 'Check', to_date('28-04-2023', 'dd-mm-yyyy'), to_date('05-10-2021', 'dd-mm-yyyy'), 5448466479);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3811372569, 2155, 'Check', to_date('03-10-2017', 'dd-mm-yyyy'), to_date('09-01-2016', 'dd-mm-yyyy'), 8699926337);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4149525264, 4824, 'Cash', to_date('21-06-2018', 'dd-mm-yyyy'), to_date('22-11-2017', 'dd-mm-yyyy'), 4313216129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4635977361, 1985, 'Credit', to_date('25-03-2021', 'dd-mm-yyyy'), to_date('14-09-2021', 'dd-mm-yyyy'), 2512132428);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7137818982, 3289, 'Credit', to_date('05-08-2016', 'dd-mm-yyyy'), to_date('03-04-2017', 'dd-mm-yyyy'), 1891219639);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8712761732, 4160, 'Credit', to_date('04-12-2017', 'dd-mm-yyyy'), to_date('19-09-2020', 'dd-mm-yyyy'), 5538114597);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5838466143, 2755, 'Cash', to_date('24-07-2020', 'dd-mm-yyyy'), to_date('25-08-2020', 'dd-mm-yyyy'), 7214938872);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3171737456, 2391, 'Credit', to_date('01-06-2017', 'dd-mm-yyyy'), to_date('13-08-2015', 'dd-mm-yyyy'), 8145984896);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9747526375, 5234, 'Credit', to_date('04-11-2018', 'dd-mm-yyyy'), to_date('26-09-2020', 'dd-mm-yyyy'), 8595366756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6393831829, 3703, 'Cash', to_date('25-09-2023', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'), 2247813915);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6292796688, 3279, 'Cash', to_date('02-06-2020', 'dd-mm-yyyy'), to_date('06-10-2018', 'dd-mm-yyyy'), 9615467928);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8387696923, 2792, 'Credit', to_date('24-01-2018', 'dd-mm-yyyy'), to_date('07-09-2020', 'dd-mm-yyyy'), 6427793236);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1255983683, 5965, 'Check', to_date('31-12-2019', 'dd-mm-yyyy'), to_date('22-01-2023', 'dd-mm-yyyy'), 9263977762);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7819324631, 1952, 'Cash', to_date('20-09-2020', 'dd-mm-yyyy'), to_date('26-09-2017', 'dd-mm-yyyy'), 4166236398);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6857277273, 4052, 'Credit', to_date('29-05-2015', 'dd-mm-yyyy'), to_date('23-01-2015', 'dd-mm-yyyy'), 1542369856);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6356838783, 5567, 'Cash', to_date('03-10-2022', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), 3899829445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8315644911, 2697, 'Cash', to_date('15-11-2018', 'dd-mm-yyyy'), to_date('20-11-2019', 'dd-mm-yyyy'), 1942157435);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7418154194, 5202, 'Check', to_date('29-11-2020', 'dd-mm-yyyy'), to_date('01-06-2018', 'dd-mm-yyyy'), 5856245445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5555462662, 4679, 'Check', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('16-10-2015', 'dd-mm-yyyy'), 2989134417);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8448569731, 4884, 'Cash', to_date('16-03-2015', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), 4593717428);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7984559477, 2541, 'Credit', to_date('18-02-2019', 'dd-mm-yyyy'), to_date('24-06-2016', 'dd-mm-yyyy'), 7127372749);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3115868192, 2740, 'Cash', to_date('08-10-2019', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), 7494443274);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6363393496, 1671, 'Cash', to_date('11-07-2018', 'dd-mm-yyyy'), to_date('05-10-2017', 'dd-mm-yyyy'), 5721949743);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6922234983, 5882, 'Check', to_date('27-11-2018', 'dd-mm-yyyy'), to_date('16-03-2019', 'dd-mm-yyyy'), 5651222298);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1495794152, 2238, 'Check', to_date('04-10-2023', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), 3117192153);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6232123748, 1500, 'Cash', to_date('17-12-2015', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'), 9322173772);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5111668815, 2642, 'Cash', to_date('25-01-2018', 'dd-mm-yyyy'), to_date('11-07-2017', 'dd-mm-yyyy'), 9142435762);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6119449933, 3613, 'Cash', to_date('21-11-2016', 'dd-mm-yyyy'), to_date('11-09-2018', 'dd-mm-yyyy'), 5486167339);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4317372276, 4615, 'Check', to_date('31-03-2016', 'dd-mm-yyyy'), to_date('11-09-2016', 'dd-mm-yyyy'), 7959151316);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7772558865, 2249, 'Check', to_date('24-08-2015', 'dd-mm-yyyy'), to_date('23-11-2019', 'dd-mm-yyyy'), 5382196513);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8671514612, 2403, 'Credit', to_date('19-07-2016', 'dd-mm-yyyy'), to_date('19-01-2016', 'dd-mm-yyyy'), 4687272626);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5192951161, 4312, 'Credit', to_date('11-07-2019', 'dd-mm-yyyy'), to_date('24-07-2018', 'dd-mm-yyyy'), 2628998293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8458271332, 5424, 'Check', to_date('19-03-2018', 'dd-mm-yyyy'), to_date('19-06-2021', 'dd-mm-yyyy'), 6644866893);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7681285138, 1934, 'Cash', to_date('16-05-2016', 'dd-mm-yyyy'), to_date('15-01-2020', 'dd-mm-yyyy'), 6769459998);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8625457389, 1117, 'Credit', to_date('09-04-2017', 'dd-mm-yyyy'), to_date('09-08-2015', 'dd-mm-yyyy'), 7637833876);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9345225367, 1191, 'Cash', to_date('18-08-2018', 'dd-mm-yyyy'), to_date('02-07-2020', 'dd-mm-yyyy'), 6818789889);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2594148592, 5836, 'Check', to_date('26-06-2018', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), 7429724848);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7125754364, 3368, 'Credit', to_date('06-10-2016', 'dd-mm-yyyy'), to_date('24-08-2020', 'dd-mm-yyyy'), 2994527266);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6989391711, 619, 'Cash', to_date('26-10-2017', 'dd-mm-yyyy'), to_date('24-01-2021', 'dd-mm-yyyy'), 3361638591);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7634541546, 564, 'Check', to_date('22-03-2022', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 2629944151);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6812815927, 3070, 'Credit', to_date('22-04-2018', 'dd-mm-yyyy'), to_date('27-01-2017', 'dd-mm-yyyy'), 3671333763);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3448862714, 4554, 'Cash', to_date('08-10-2021', 'dd-mm-yyyy'), to_date('30-05-2023', 'dd-mm-yyyy'), 9632833738);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5263864482, 1664, 'Check', to_date('05-07-2020', 'dd-mm-yyyy'), to_date('03-11-2020', 'dd-mm-yyyy'), 3337485563);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3713283667, 766, 'Cash', to_date('30-06-2021', 'dd-mm-yyyy'), to_date('27-05-2016', 'dd-mm-yyyy'), 8474714847);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8153445245, 4787, 'Credit', to_date('12-11-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 4347482366);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9862725413, 2041, 'Cash', to_date('29-01-2019', 'dd-mm-yyyy'), to_date('18-11-2017', 'dd-mm-yyyy'), 1326966921);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2492118759, 1455, 'Credit', to_date('23-08-2017', 'dd-mm-yyyy'), to_date('02-08-2021', 'dd-mm-yyyy'), 2554219385);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1216647718, 4069, 'Cash', to_date('23-02-2020', 'dd-mm-yyyy'), to_date('09-03-2020', 'dd-mm-yyyy'), 9781174318);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7532713418, 4082, 'Cash', to_date('31-01-2023', 'dd-mm-yyyy'), to_date('11-02-2016', 'dd-mm-yyyy'), 4313216129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3485124771, 1182, 'Credit', to_date('21-11-2021', 'dd-mm-yyyy'), to_date('05-02-2018', 'dd-mm-yyyy'), 6795552533);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7763393243, 3200, 'Check', to_date('17-02-2019', 'dd-mm-yyyy'), to_date('30-12-2015', 'dd-mm-yyyy'), 9182836259);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3834823546, 5625, 'Cash', to_date('14-05-2015', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 6915866749);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6682462347, 1808, 'Cash', to_date('05-01-2023', 'dd-mm-yyyy'), to_date('03-02-2015', 'dd-mm-yyyy'), 3522788675);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7966325624, 5532, 'Check', to_date('20-06-2023', 'dd-mm-yyyy'), to_date('16-03-2018', 'dd-mm-yyyy'), 5856245445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2447816185, 1353, 'Cash', to_date('12-06-2021', 'dd-mm-yyyy'), to_date('19-01-2017', 'dd-mm-yyyy'), 7127372749);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2537277313, 3882, 'Credit', to_date('06-02-2020', 'dd-mm-yyyy'), to_date('01-02-2015', 'dd-mm-yyyy'), 3358837585);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8914533521, 4776, 'Check', to_date('20-04-2017', 'dd-mm-yyyy'), to_date('03-01-2020', 'dd-mm-yyyy'), 8695394947);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9629148189, 3015, 'Cash', to_date('19-03-2017', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), 4485634271);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6384282296, 1071, 'Check', to_date('30-12-2016', 'dd-mm-yyyy'), to_date('30-06-2015', 'dd-mm-yyyy'), 6227681244);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8476562127, 1281, 'Credit', to_date('06-05-2020', 'dd-mm-yyyy'), to_date('29-08-2017', 'dd-mm-yyyy'), 4844171756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5262895434, 1333, 'Cash', to_date('05-07-2023', 'dd-mm-yyyy'), to_date('04-09-2016', 'dd-mm-yyyy'), 4841422773);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5787917351, 840, 'Cash', to_date('12-03-2022', 'dd-mm-yyyy'), to_date('21-06-2019', 'dd-mm-yyyy'), 1142896819);
commit;
prompt 300 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3336695489, 5266, 'Credit', to_date('04-05-2019', 'dd-mm-yyyy'), to_date('26-05-2016', 'dd-mm-yyyy'), 6795552533);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2942596994, 3887, 'Check', to_date('22-08-2015', 'dd-mm-yyyy'), to_date('02-02-2021', 'dd-mm-yyyy'), 1162271649);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7756685563, 5133, 'Check', to_date('25-04-2015', 'dd-mm-yyyy'), to_date('30-09-2016', 'dd-mm-yyyy'), 6837512131);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5757574524, 3038, 'Check', to_date('30-04-2020', 'dd-mm-yyyy'), to_date('01-05-2019', 'dd-mm-yyyy'), 1999296696);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4215173654, 3048, 'Cash', to_date('05-11-2018', 'dd-mm-yyyy'), to_date('27-02-2016', 'dd-mm-yyyy'), 5194133875);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1958586774, 2546, 'Credit', to_date('03-01-2023', 'dd-mm-yyyy'), to_date('21-03-2017', 'dd-mm-yyyy'), 5847945678);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4171682951, 808, 'Credit', to_date('26-10-2018', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 4333196364);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6394917681, 1858, 'Check', to_date('05-09-2019', 'dd-mm-yyyy'), to_date('24-07-2015', 'dd-mm-yyyy'), 5718998928);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1111711632, 5694, 'Credit', to_date('30-09-2019', 'dd-mm-yyyy'), to_date('12-03-2017', 'dd-mm-yyyy'), 9296943778);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8186236832, 1968, 'Check', to_date('21-12-2016', 'dd-mm-yyyy'), to_date('09-09-2020', 'dd-mm-yyyy'), 4649114331);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1825632227, 648, 'Check', to_date('17-07-2015', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 9211935538);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3835882343, 654, 'Check', to_date('02-08-2019', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 7575562786);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8163285413, 1663, 'Check', to_date('05-09-2023', 'dd-mm-yyyy'), to_date('30-03-2018', 'dd-mm-yyyy'), 5856245445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5655248154, 553, 'Cash', to_date('18-06-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 5475167869);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7724362923, 4717, 'Cash', to_date('12-10-2017', 'dd-mm-yyyy'), to_date('14-03-2018', 'dd-mm-yyyy'), 8411468431);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7953569916, 4733, 'Check', to_date('19-07-2015', 'dd-mm-yyyy'), to_date('04-10-2019', 'dd-mm-yyyy'), 4146846981);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5719239131, 574, 'Check', to_date('05-02-2016', 'dd-mm-yyyy'), to_date('23-01-2019', 'dd-mm-yyyy'), 4584246332);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4622783572, 1452, 'Check', to_date('09-06-2015', 'dd-mm-yyyy'), to_date('07-03-2017', 'dd-mm-yyyy'), 6424172964);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6655636134, 4470, 'Credit', to_date('18-03-2019', 'dd-mm-yyyy'), to_date('14-09-2016', 'dd-mm-yyyy'), 4844171756);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2257446165, 5775, 'Credit', to_date('13-12-2021', 'dd-mm-yyyy'), to_date('20-01-2018', 'dd-mm-yyyy'), 1234567891);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9312544244, 5529, 'Check', to_date('18-10-2017', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 5133611251);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5676379468, 4206, 'Check', to_date('25-03-2017', 'dd-mm-yyyy'), to_date('29-12-2019', 'dd-mm-yyyy'), 5475167869);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5671594482, 845, 'Check', to_date('25-07-2019', 'dd-mm-yyyy'), to_date('26-07-2021', 'dd-mm-yyyy'), 2389291999);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2154211182, 4816, 'Cash', to_date('27-12-2018', 'dd-mm-yyyy'), to_date('24-12-2020', 'dd-mm-yyyy'), 2628998293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4313919586, 647, 'Check', to_date('17-01-2016', 'dd-mm-yyyy'), to_date('21-12-2015', 'dd-mm-yyyy'), 5448466479);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5283382546, 4535, 'Credit', to_date('11-03-2019', 'dd-mm-yyyy'), to_date('13-12-2020', 'dd-mm-yyyy'), 1613227394);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9669851276, 2645, 'Check', to_date('19-09-2021', 'dd-mm-yyyy'), to_date('24-07-2021', 'dd-mm-yyyy'), 6786213942);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7839658178, 2330, 'Credit', to_date('07-08-2019', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 4163743852);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2611518348, 633, 'Cash', to_date('24-12-2018', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 5661359651);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3237175243, 2073, 'Credit', to_date('05-04-2022', 'dd-mm-yyyy'), to_date('01-12-2016', 'dd-mm-yyyy'), 9223442661);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3725767323, 2967, 'Credit', to_date('22-11-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 9641782372);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9499224847, 4890, 'Check', to_date('15-12-2020', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 6175197286);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1534424239, 2169, 'Cash', to_date('26-12-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 9632833738);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2563475484, 3850, 'Check', to_date('23-09-2017', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'), 7119638695);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4979261477, 3598, 'Check', to_date('02-06-2022', 'dd-mm-yyyy'), to_date('20-11-2019', 'dd-mm-yyyy'), 3568793363);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2263681971, 3746, 'Cash', to_date('16-03-2016', 'dd-mm-yyyy'), to_date('09-12-2022', 'dd-mm-yyyy'), 5475167869);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2923594133, 5213, 'Cash', to_date('13-10-2015', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 5721949743);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7575736466, 3917, 'Credit', to_date('14-07-2021', 'dd-mm-yyyy'), to_date('16-07-2020', 'dd-mm-yyyy'), 2652893613);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5914859853, 1976, 'Credit', to_date('01-01-2020', 'dd-mm-yyyy'), to_date('20-06-2020', 'dd-mm-yyyy'), 7494443274);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1432254857, 2773, 'Check', to_date('12-10-2017', 'dd-mm-yyyy'), to_date('07-10-2022', 'dd-mm-yyyy'), 5397199644);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6444273593, 3633, 'Check', to_date('12-03-2017', 'dd-mm-yyyy'), to_date('17-03-2018', 'dd-mm-yyyy'), 7494443274);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5236822274, 2079, 'Check', to_date('02-02-2018', 'dd-mm-yyyy'), to_date('02-12-2017', 'dd-mm-yyyy'), 6441149813);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7524842716, 4845, 'Credit', to_date('18-11-2017', 'dd-mm-yyyy'), to_date('24-06-2019', 'dd-mm-yyyy'), 2628998293);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8447977693, 1884, 'Credit', to_date('14-11-2023', 'dd-mm-yyyy'), to_date('15-12-2021', 'dd-mm-yyyy'), 2411452572);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3251127375, 4266, 'Credit', to_date('09-12-2022', 'dd-mm-yyyy'), to_date('02-05-2017', 'dd-mm-yyyy'), 5327567578);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7231844245, 1012, 'Check', to_date('21-02-2019', 'dd-mm-yyyy'), to_date('30-04-2022', 'dd-mm-yyyy'), 7494443274);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9527259911, 5042, 'Cash', to_date('14-12-2021', 'dd-mm-yyyy'), to_date('17-02-2018', 'dd-mm-yyyy'), 6277365464);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7721844538, 1342, 'Check', to_date('15-05-2020', 'dd-mm-yyyy'), to_date('18-02-2017', 'dd-mm-yyyy'), 3995376445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4399671646, 577, 'Credit', to_date('29-06-2017', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'), 5397199644);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8284598396, 1117, 'Check', to_date('09-09-2020', 'dd-mm-yyyy'), to_date('30-09-2015', 'dd-mm-yyyy'), 1472156759);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5459423512, 2339, 'Cash', to_date('03-12-2022', 'dd-mm-yyyy'), to_date('15-09-2018', 'dd-mm-yyyy'), 2211965788);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7231813741, 5736, 'Check', to_date('11-01-2023', 'dd-mm-yyyy'), to_date('01-02-2016', 'dd-mm-yyyy'), 5753121797);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3537624395, 4503, 'Credit', to_date('26-05-2017', 'dd-mm-yyyy'), to_date('21-02-2016', 'dd-mm-yyyy'), 3116514217);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4483973948, 2806, 'Cash', to_date('31-03-2021', 'dd-mm-yyyy'), to_date('27-09-2015', 'dd-mm-yyyy'), 4584246332);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4578118215, 2030, 'Check', to_date('18-01-2021', 'dd-mm-yyyy'), to_date('10-01-2016', 'dd-mm-yyyy'), 1472156759);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9942361661, 2257, 'Cash', to_date('12-08-2022', 'dd-mm-yyyy'), to_date('09-03-2016', 'dd-mm-yyyy'), 1443299343);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3829145755, 4861, 'Credit', to_date('16-07-2018', 'dd-mm-yyyy'), to_date('29-08-2020', 'dd-mm-yyyy'), 5296343145);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5149486359, 5314, 'Credit', to_date('21-11-2023', 'dd-mm-yyyy'), to_date('10-12-2018', 'dd-mm-yyyy'), 5681232999);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4824317926, 3419, 'Cash', to_date('24-02-2015', 'dd-mm-yyyy'), to_date('24-03-2017', 'dd-mm-yyyy'), 1523698569);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7942739566, 4822, 'Check', to_date('06-04-2022', 'dd-mm-yyyy'), to_date('15-10-2020', 'dd-mm-yyyy'), 5949649787);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7874267439, 2684, 'Cash', to_date('07-04-2020', 'dd-mm-yyyy'), to_date('08-01-2019', 'dd-mm-yyyy'), 9288211241);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3413794637, 3502, 'Check', to_date('18-12-2018', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'), 2551276128);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6946546785, 2681, 'Credit', to_date('08-10-2021', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'), 2999722448);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5625451493, 3914, 'Check', to_date('12-06-2016', 'dd-mm-yyyy'), to_date('25-06-2015', 'dd-mm-yyyy'), 5856245445);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2218729677, 5615, 'Check', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('23-04-2019', 'dd-mm-yyyy'), 2989134417);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3243574917, 1973, 'Credit', to_date('17-05-2018', 'dd-mm-yyyy'), to_date('05-09-2018', 'dd-mm-yyyy'), 1726756224);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5371347959, 2968, 'Credit', to_date('26-10-2021', 'dd-mm-yyyy'), to_date('02-04-2018', 'dd-mm-yyyy'), 4297133476);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6274563159, 4440, 'Cash', to_date('12-02-2015', 'dd-mm-yyyy'), to_date('19-06-2017', 'dd-mm-yyyy'), 9586323889);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1811776391, 2435, 'Check', to_date('14-07-2019', 'dd-mm-yyyy'), to_date('05-04-2015', 'dd-mm-yyyy'), 9853322754);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3939898612, 1231, 'Cash', to_date('09-10-2016', 'dd-mm-yyyy'), to_date('10-10-2016', 'dd-mm-yyyy'), 4561385332);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8553952795, 4008, 'Cash', to_date('12-01-2022', 'dd-mm-yyyy'), to_date('03-09-2015', 'dd-mm-yyyy'), 2411452572);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4156914937, 5236, 'Credit', to_date('22-12-2020', 'dd-mm-yyyy'), to_date('27-06-2016', 'dd-mm-yyyy'), 1542369856);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6526579839, 666, 'Check', to_date('31-12-2018', 'dd-mm-yyyy'), to_date('13-11-2020', 'dd-mm-yyyy'), 7153189418);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3478431771, 5450, 'Credit', to_date('18-02-2018', 'dd-mm-yyyy'), to_date('25-02-2015', 'dd-mm-yyyy'), 4249847684);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7956968121, 5299, 'Credit', to_date('04-01-2016', 'dd-mm-yyyy'), to_date('14-05-2022', 'dd-mm-yyyy'), 8312714527);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1661198381, 750, 'Check', to_date('07-01-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 9273343542);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8148919852, 2523, 'Check', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('16-03-2017', 'dd-mm-yyyy'), 4238776638);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6371642146, 3825, 'Credit', to_date('06-07-2016', 'dd-mm-yyyy'), to_date('11-01-2020', 'dd-mm-yyyy'), 1982548571);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (8279232628, 3411, 'Cash', to_date('11-10-2018', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), 7537563939);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6316258948, 4308, 'Cash', to_date('03-09-2017', 'dd-mm-yyyy'), to_date('21-07-2017', 'dd-mm-yyyy'), 4477446264);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6692982678, 4928, 'Check', to_date('29-03-2023', 'dd-mm-yyyy'), to_date('09-10-2020', 'dd-mm-yyyy'), 3337485563);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5365871629, 5343, 'Cash', to_date('19-12-2019', 'dd-mm-yyyy'), to_date('01-03-2022', 'dd-mm-yyyy'), 1891219639);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (2414538616, 3749, 'Check', to_date('30-01-2018', 'dd-mm-yyyy'), to_date('08-12-2021', 'dd-mm-yyyy'), 5662161994);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9276522485, 5712, 'Cash', to_date('05-04-2017', 'dd-mm-yyyy'), to_date('09-08-2019', 'dd-mm-yyyy'), 2652893613);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5691682787, 609, 'Cash', to_date('18-11-2015', 'dd-mm-yyyy'), to_date('14-02-2017', 'dd-mm-yyyy'), 2658286596);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6613241166, 4674, 'Check', to_date('04-12-2019', 'dd-mm-yyyy'), to_date('30-10-2019', 'dd-mm-yyyy'), 7447317627);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1739582941, 2516, 'Check', to_date('02-11-2020', 'dd-mm-yyyy'), to_date('04-09-2019', 'dd-mm-yyyy'), 5555537348);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5714717598, 2857, 'Credit', to_date('13-08-2016', 'dd-mm-yyyy'), to_date('26-02-2021', 'dd-mm-yyyy'), 8474714847);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7684747526, 2753, 'Cash', to_date('15-02-2016', 'dd-mm-yyyy'), to_date('24-07-2018', 'dd-mm-yyyy'), 1553993598);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4774684366, 5777, 'Check', to_date('18-07-2017', 'dd-mm-yyyy'), to_date('10-07-2020', 'dd-mm-yyyy'), 2757791555);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (5491865735, 508, 'Credit', to_date('26-06-2015', 'dd-mm-yyyy'), to_date('20-01-2023', 'dd-mm-yyyy'), 9128556832);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6589467172, 854, 'Credit', to_date('06-01-2017', 'dd-mm-yyyy'), to_date('31-12-2020', 'dd-mm-yyyy'), 8651255669);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (7849461142, 1464, 'Credit', to_date('30-06-2022', 'dd-mm-yyyy'), to_date('07-02-2021', 'dd-mm-yyyy'), 6917521728);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (3583129899, 5682, 'Cash', to_date('05-10-2022', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 9214671395);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (4599794186, 1723, 'Credit', to_date('22-02-2015', 'dd-mm-yyyy'), to_date('08-08-2017', 'dd-mm-yyyy'), 1558671129);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9247256446, 5577, 'Check', to_date('27-10-2019', 'dd-mm-yyyy'), to_date('20-06-2021', 'dd-mm-yyyy'), 9586426278);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (6227543989, 3767, 'Check', to_date('17-07-2023', 'dd-mm-yyyy'), to_date('30-01-2016', 'dd-mm-yyyy'), 8679186711);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9559625296, 1778, 'Check', to_date('04-02-2016', 'dd-mm-yyyy'), to_date('05-04-2022', 'dd-mm-yyyy'), 2324346182);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1156219862, 650, 'Credit', to_date('07-11-2015', 'dd-mm-yyyy'), to_date('22-01-2023', 'dd-mm-yyyy'), 2886648525);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (9357985686, 1401, 'Check', to_date('11-06-2021', 'dd-mm-yyyy'), to_date('21-11-2021', 'dd-mm-yyyy'), 5486167339);
commit;
prompt 400 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000000, 255, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 9349733469);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000001, 39, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 6477259176);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000002, 69, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 5538114597);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000003, 265, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 7432379598);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000004, 25, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 7432379598);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000005, 49, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 7685767957);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000006, 38, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 7685767957);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000007, 175, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 5458194925);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000008, 5, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 5458194925);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000009, 48, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 3814719621);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000010, 136, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 3814719621);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000011, 23, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 3814719621);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000012, 225, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 7589546594);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000013, 109, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 4232346788);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000014, 188, 'Credit', to_date('30-06-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'), 4232346788);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000015, 198, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 6917521728);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000016, 239, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 9214671395);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000017, 16, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 1982548571);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000018, 344, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 6424172964);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000019, 99, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 1998974929);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000020, 49, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 3995261136);
insert into PAYMENT (payment_id, payment_amount, payment_type, payment_date, payment_receipt, tax_id)
values (1000000021, 265, 'Credit', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 2229849136);
commit;
prompt 422 records loaded
prompt Enabling foreign key constraints for ASSET...
alter table ASSET enable constraint SYS_C007708;
prompt Enabling foreign key constraints for DEBT...
alter table DEBT enable constraint SYS_C007715;
prompt Enabling foreign key constraints for DISCOUNT...
alter table DISCOUNT enable constraint SYS_C007731;
prompt Enabling foreign key constraints for OWNERSHIP...
alter table OWNERSHIP enable constraint SYS_C007735;
alter table OWNERSHIP enable constraint SYS_C007736;
prompt Enabling foreign key constraints for PAYMENT...
alter table PAYMENT enable constraint SYS_C007744;
prompt Enabling triggers for TAX_ACCOUNT...
alter table TAX_ACCOUNT enable all triggers;
prompt Enabling triggers for ASSET...
alter table ASSET enable all triggers;
prompt Enabling triggers for DEBT...
alter table DEBT enable all triggers;
prompt Enabling triggers for RESIDENT...
alter table RESIDENT enable all triggers;
prompt Enabling triggers for DISCOUNT...
alter table DISCOUNT enable all triggers;
prompt Enabling triggers for OWNERSHIP...
alter table OWNERSHIP enable all triggers;
prompt Enabling triggers for PAYMENT...
alter table PAYMENT enable all triggers;

set feedback on
set define on
prompt Done
