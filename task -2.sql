create database assignment_12;
use assignment_12;
create table trainhalts
	(id varchar(5) , 
	seqno integer , 
	stcode varchar(10), 
	timein  varchar(5) ,
	timeout varchar(5) , 
	primary key (id,seqno) ); 

create table track
	(stcode1 varchar(5) ,
	stcode2 varchar(5), 
	distance integer ,
	primary key (stcode1,stcode2) );

create table station
	(stcode varchar(5),
	name varchar(20),
	primary key (stcode));

create table train
	(id varchar(5) ,
	name varchar(20),
	primary key (id) );


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
insert into train values ('KP11' ,'CST-KYN');
insert into train values ('KP11L' ,'CST-KYN_LOCAL');
insert into train values ('T129' ,'CST-TNA_LOCAL');
insert into train values ('A63' ,'CST-DL_LOCAL');
insert into train values ('K101' ,'CST-KYN_LOCAL');
insert into train values ('N27' ,'CST-TNA_LOCAL');
insert into train values ('S33' ,'CST-KGR_LOCAL');
insert into train values ('A65' ,'CST-AMR_LOCAL');
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

-- Create the Railway schema using the commands in the Railway DDL  script; The DDL script also contains a description of the railway Schema. 
-- Insert sample data using the command in the file SampleRailwayData.
use  assignment_12;
-- Write the following Queries for Railway Schema.
-- 1.Find pairs of stations (station codes) that have a track (direct connection) with distance less than 20Kms between them.
select stcode1, stcode2 from track where distance < 20;
-- 2.Find the IDs of all the trains which have a stop at THANE
select trainhalts.id from trainhalts inner join station on station.stcode = trainhalts.stcode where station.name = 'THANE';
-- 3.Find the names of all trains that start at MUMBAI.
select train.name from train where train.id in (select trainhalts.id from trainhalts inner join station on trainhalts.stcode = station.stcode where station.name = "MUMBAI");
-- 4.List all the stations in order of visit by the train 'CST-AMR_LOCAL'.
select trainhalts.stcode,timein,timeout from trainhalts inner join train on train.id = trainhalts.id where train.name = 'CST-AMR_LOCAL';
-- row by values== segregate all the values by row 
-- default order will be ascending
-- if is decending we need to explicitely mention it
-- cartesian product 



-- drop database assignment_12
-- drop table trainhalts;
-- drop table train;
-- drop table track;
-- drop table station;

-- delete from trainhalts;
-- delete from station;
-- delete from track;
-- delete from train;

-- drop database assignment_12;

-- This table contains one row for every halt of a train. 
-- id     : id of the train
-- seqno  : the halt number. Assume that the starting station has seqno as 0
-- stcode : station code of this halt 
-- timein : time at which the train arrives at this station. (will be null for the starting station of a train)
-- timeout: time at which the train departs this station. (will be null for the terminating station of a train)
-- If a train passes through a station without stopping, then there will be an entry with timein = timeout.

-- This table stores the distances between directly connected stations stcode1 and stcode2.
-- Assume that this represents a directed track. i.e, for two stations A and B, there will be 
-- an entry corresponding to (A, B, distance) and another for (B,A, distance).



