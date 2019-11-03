
create table datamining.singapore_haze_psi (
obs_timestamp timestamp, 
westPsi int, 
eastPsi int, 
centralPsi int, 
southPsi int, 
northPsi int, 
westPM25 int, 
eastPM25 int, 
centralPM25 int, 
southPM25 int, 
northPM25 int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1') 

--drop table singapore_haze_psi

LOAD DATA LOCAL INPATH '/home/jiunnjye/Project/SingaporeHazePSI_2009-01-01-2019-10-24-cleanDate.csv' OVERWRITE INTO TABLE datamining.singapore_haze_psi;

	

create table singapore_haze_psi_by_month as
select 
	year(obs_timestamp) || '-' || month(obs_timestamp) as month,
	min(westpsi) as min_westpsi, 
	max(westpsi) as max_westpsi, 
	avg(westpsi) as avg_westpsi,
	min(eastPsi) as min_eastpsi, 
	max(eastPsi) as max_eastpsi, 
	avg(eastPsi) as avg_eastpsi,
	min(centralPsi) as min_centralpsi, 
	max(centralPsi) as max_centralpsi, 
	avg(centralPsi) as avg_centralpsi,
	min(southPsi) as min_southpsi, 
	max(southPsi) as max_southpsi, 
	avg(southPsi) as avg_southpsi,
	min(northPsi) as min_northpsi, 
	max(northPsi) as max_northpsi, 
	avg(northPsi) as avg_northpsi 
from 
	datamining.singapore_haze_psi
group by year(obs_timestamp) || '-' || month(obs_timestamp);

create table datamining.singapore_haze_psi_by_month as
select 
	from_unixtime(unix_timestamp(obs_timestamp), 'yyyyMM') as month,
	min(westpsi) as min_westpsi, 
	max(westpsi) as max_westpsi, 
	avg(westpsi) as avg_westpsi,
	min(eastPsi) as min_eastpsi, 
	max(eastPsi) as max_eastpsi, 
	avg(eastPsi) as avg_eastpsi,
	min(centralPsi) as min_centralpsi, 
	max(centralPsi) as max_centralpsi, 
	avg(centralPsi) as avg_centralpsi,
	min(southPsi) as min_southpsi, 
	max(southPsi) as max_southpsi, 
	avg(southPsi) as avg_southpsi,
	min(northPsi) as min_northpsi, 
	max(northPsi) as max_northpsi, 
	avg(northPsi) as avg_northpsi 
from 
	datamining.singapore_haze_psi
group by from_unixtime(unix_timestamp(obs_timestamp), 'yyyyMM');

--drop table singapore_haze_psi_by_month;

select * from datamining.singapore_haze_psi_by_month;
	


