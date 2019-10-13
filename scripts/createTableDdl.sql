create database datamining; 

use dataiming; 

create table Malaysia_tourist_arrival (
year int, 
destination string, 
Jan_arrival int, 
Feb_arrival int, 
Mac_arrival int, 
Apr_arrival int,
May_arrival int, 
Jun_arrival int, 
Jul_arrival int, 
Aug_arrival int, 
Sep_arrival int, 
Oct_arrival int,
Nov_arrival int, 
Dec_arrival int,
Jan_pct_chg_yoy int, 
Feb_pct_chg_yoy int, 
Mac_pct_chg_yoy int, 
Apr_pct_chg_yoy int,
May_pct_chg_yoy int, 
Jun_pct_chg_yoy int, 
Jul_pct_chg_yoy int, 
Aug_pct_chg_yoy int, 
Sep_pct_chg_yoy int, 
Oct_pct_chg_yoy int,
Nov_pct_chg_yoy int, 
Dec_pct_chg_yoy int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1') ;


LOAD DATA LOCAL INPATH '/home/sftpuser/Data/TouristArrival_20190929.csv' OVERWRITE INTO TABLE Malaysia_tourist_arrival;


CREATE TABLE Malaysia_Live_Aqi (
city string,
obs_time string,
Aqi int,
Temp int,
Pressure int,
Humidity int,
wind int)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/sftpuser/Data/AirQuality_20190930_00.data' OVERWRITE INTO TABLE Malaysia_Live_Aqi;


create table Malaysia_Aqi_history (
obs_date string, 
obs_time string, 
state string, 
district string, 
api string) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1') ;

LOAD DATA LOCAL INPATH '/home/sftpuser/Data/14-bacaanipu2005-2013.csv' OVERWRITE INTO TABLE Malaysia_Aqi_history;
