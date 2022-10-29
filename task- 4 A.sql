create database Railway;
-- drop database Railway;
use Railway;
create table trainhalts
	(id varchar(5) , 
	seqno integer , 
	stcode varchar(10), 
	timein  varchar(5) ,
	timeout varchar(5) , 
	primary key (id,seqno) ); 

select * from trainhalts;

insert into trainhalts values ('KP11' , 0 , 'CST' , NULL, '20.23');
insert into trainhalts values ('KP11' , 1 , 'BYC' , '20.31', '20.32');
insert into trainhalts values ('KP11' , 2 , 'DR' , '20.41', '20.42');
insert into trainhalts values ('KP11' , 3 , 'GPR' , '20.52', '20.53');
insert into trainhalts values ('KP11' , 4 , 'GPR' , '20.52', '20.53');
insert into trainhalts values ('KP11' , 5 , 'DR' , '20.41', '20.42');
insert into trainhalts values ('KP11' , 6 , 'GPR' , '20.58', '20.59');
insert into trainhalts values ('KP11' , 7 , 'TNA' , '21.21', '21.22');
insert into trainhalts values ('KP11' , 8 , 'DL' , '21.45', '21.46');
insert into trainhalts values ('KP11' , 9 , 'KYN' , '21.54', NULL);
insert into trainhalts values ('A65' , 0 , 'CST' , NULL , '20.52');
insert into trainhalts values ('A65' , 1 , 'BYC' , '21.00' , '21.01');
insert into trainhalts values ('A65' , 2 , 'DR' , '21.10' , '21.11');
insert into trainhalts values ('A65' , 3 , 'KRL' , '21.22' , '21.23');
insert into trainhalts values ('A65' , 4 , 'GPR' , '21.28' , '21.29');
insert into trainhalts values ('A65' , 5 , 'TNA' , '21.49' , '21.50');
insert into trainhalts values ('A65' , 6 , 'DL' , '22.13' , '22.14');
insert into trainhalts values ('A65' , 7 , 'KYN' , '22.22' , '22.23');
insert into trainhalts values ('A65' , 8 , 'AMR' , '22.36' , NULL);
insert into trainhalts values ('A64', 9, 'DL', '22.45', '22.34');

select * from trainhalts;

create table track
	(stcode1 varchar(5) ,
	stcode2 varchar(5), 
	distance integer ,
	primary key (stcode1,stcode2) );

select * from track;

insert into track values ('CST' ,'BYC', 5);
insert into track values ('CST' ,'DR', 9);
insert into track values ('CST' ,'KRL', 16);
insert into track values ('CST' ,'GPR', 20);
insert into track values ('CST' ,'TNA', 34);
insert into track values ('CST' ,'DL', 49);
insert into track values ('CST' ,'KYN', 54);
insert into track values ('CST' ,'KSR', 77);
insert into track values ('CST' ,'AMR', 65);
insert into track values ('BYC' ,'DR', 4);
insert into track values ('BYC' ,'KRL', 11);
insert into track values ('GRP' ,'TNA', 14);
insert into track values ('DR' ,'TNA', 25);
insert into track values ('KRL' ,'KYN', 38);
insert into track values ('TNA' ,'KYN', 20);
insert into track values ('TNA' ,'KSR', 43);

select * from track;

create table station
	(stcode varchar(5),
	name varchar(20),
	primary key (stcode));
    
insert into station values ('CST' ,'MUMBAI');
insert into station values ('BYC' ,'BYCULLA');
insert into station values ('DR' ,'DADAR');
insert into station values ('KRL' ,'KURLA');
insert into station values ('GPR' ,'GHATKOPAR');
insert into station values ('TNA' ,'THANE');
insert into station values ('DL' ,'DOMBIVALI');
insert into station values ('AMR' , 'AMBARNATH');
insert into station values ('KYN' ,'KALYAN');
insert into station values ('KSR' ,'KASARA');

select * from station;

create table train
	(id varchar(5) ,
	name varchar(20),
	primary key (id) );
    
select * from train;

insert into train values ('KP11' ,'CST-KYN');
insert into train values ('KP11L' ,'CST-KYN_LOCAL');
insert into train values ('T129' ,'CST-TNA_LOCAL');
insert into train values ('A63' ,'CST-DL_LOCAL');
insert into train values ('K101' ,'CST-KYN_LOCAL');
insert into train values ('N27' ,'CST-TNA_LOCAL');
insert into train values ('S33' ,'CST-KGR_LOCAL');
insert into train values ('A65' ,'CST-AMR_LOCAL');


#Assignment 4
-- Assignment 4: Schema creation and constraints
-- Statement: Create the schema and constraints on the relations.
-- Modify the trains schema which we saw earlier  to create constraints to check the following:

-- 1.The value of timein is always less than or equal to timeout
alter table trainhalts add constraint check(timein <= timeout);
insert into trainhalts values ('A64', 9, 'DL', '22.45', '22.34');

-- 2.When a train is removed from service, all its halts should be deleted.
alter table trainhalts add foreign key (id) references train(id) on delete cascade;
delete from train where id = 'A63';
select * from trainhalts;

-- 3.Insert inconsistent data and verify the constraints.
insert into trainhalts values ('A9', 9, 'KR', '22.00', '21.34');
select * from trainhalts;













