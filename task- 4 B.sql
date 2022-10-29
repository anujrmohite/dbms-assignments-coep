create database exam1;
-- drop database exam1;
use exam1;
-- B.Write SQL Create table statements to create the following schema.  
-- Include all appropriate primary and foreign key declarations.  
-- Choose appropriate types for each attribute.

-- 1.remotecentre(centreId, college, town, state)
create table remotecentre(
centreID int primary key,
college varchar(50),
town varchar(50),
state varchar(50));
insert into remotecentre values ('142103002' , 'COEP' , 'Pune' , 'Maharashtra');

select * from remotecentre;

-- 2.person(ID, name, email)
create table person(
ID int primary key,
name varchar(50),
email varchar(50));
insert into person values ('1234','Anuj','anujmohite001@gmail.com');

select * from person;

-- 3.programme(progId, title, fromdate, todate)
create table programme(
programID int primary key,
title varchar(50) not null,
fromdate date,
todate date );
insert into programme values ('7780','Data science','2021-12-12','2022-1-1');
select * from programme;

-- 4.coordinator(ID, progId, centreId)
create table coordinator(
ID int,
programId int,
centreId int,
primary key(ID , programId, centreId),
foreign key(ID) references person(ID) on delete cascade);
insert into coordinator values('1234','7780','142103002');

select * from coordinator;

-- 5.participant(ID, progId, centreId)
create table participant(
ID int,
programId int,
centreId int,
primary key(ID , programId, centreId),
foreign key(ID) references person(ID) on delete cascade);

insert into participant values ('1234','7780','123125');
select * from participant;





