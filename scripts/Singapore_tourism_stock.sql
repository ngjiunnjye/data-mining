
create table datamining.singapore_top5_tourism_stock_data (
stock_code string, 
stock_name string, 
stock_date date, 
open float, 
high float, 
low float, 
close float, 
adj_close float, 
volume int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1') 

select * from  datamining.singapore_top5_tourism_stock_data ;

LOAD DATA LOCAL INPATH '/home/jiunnjye/Project/Singapore_Tourism_Top_5_stocks_data.csv' OVERWRITE INTO TABLE datamining.singapore_top5_tourism_stock_data;

select * from datamining.singapore_top5_tourism_stock_data;

create table datamining.singapore_top5_tourism_stock_data_by_month as
select 
	from_unixtime(unix_timestamp(stock_date), 'yyyyMM') as month,
	stock_name,
	min(open) as min_open, 
	max(open) as max_open, 
	avg(open) as avg_open,
	min(high) as min_high, 
	max(high) as max_high, 
	avg(high) as avg_high,
	min(low) as min_low, 
	max(low) as max_low, 
	avg(low) as avg_low,
	min(adj_close) as min_adj_close, 
	max(adj_close) as max_adj_close, 
	avg(adj_close) as avg_adj_close,
	min(volume) as min_volume, 
	max(volume) as max_volume, 
	avg(volume) as avg_volume 
from 
	datamining.singapore_top5_tourism_stock_data
group by from_unixtime(unix_timestamp(stock_date), 'yyyyMM') , stock_name;

select * from datamining.singapore_top5_tourism_stock_data_by_month; 

create table datamining.singapore_top5_tourism_stock_data_by_month_flatten as
select * from (
select month as month,
min_open  as Singapore_Airlines_min_open ,
max_open  as Singapore_Airlines_max_open ,
avg_open as Singapore_Airlines_avg_open,
min_high  as Singapore_Airlines_min_high ,
max_high  as Singapore_Airlines_max_high ,
avg_high as Singapore_Airlines_avg_high,
min_low  as Singapore_Airlines_min_low ,
max_low  as Singapore_Airlines_max_low ,
avg_low as Singapore_Airlines_avg_low,
min_adj_close  as Singapore_Airlines_min_adj_close ,
max_adj_close  as Singapore_Airlines_max_adj_close ,
avg_adj_close as Singapore_Airlines_avg_adj_close,
min_volume  as Singapore_Airlines_min_volume ,
max_volume  as Singapore_Airlines_max_volume ,
avg_volume  as Singapore_Airlines_avg_volume 
from datamining.singapore_top5_tourism_stock_data_by_month
where stock_name =  'Singapore Airlines' ) as SA, 
(select month as mo_month,
min_open  as Mandarin_Oriental_min_open ,
max_open  as Mandarin_Oriental_max_open ,
avg_open as Mandarin_Oriental_avg_open,
min_high  as Mandarin_Oriental_min_high ,
max_high  as Mandarin_Oriental_max_high ,
avg_high as Mandarin_Oriental_avg_high,
min_low  as Mandarin_Oriental_min_low ,
max_low  as Mandarin_Oriental_max_low ,
avg_low as Mandarin_Oriental_avg_low,
min_adj_close  as Mandarin_Oriental_min_adj_close ,
max_adj_close  as Mandarin_Oriental_max_adj_close ,
avg_adj_close as Mandarin_Oriental_avg_adj_close,
min_volume  as Mandarin_Oriental_min_volume ,
max_volume  as Mandarin_Oriental_max_volume ,
avg_volume  as Mandarin_Oriental_avg_volume 
from datamining.singapore_top5_tourism_stock_data_by_month
where stock_name =  'Mandarin Oriental') as MO,
(select month as hp_month,
min_open  as Hotel_Properties_min_open ,
max_open  as Hotel_Properties_max_open ,
avg_open as Hotel_Properties_avg_open,
min_high  as Hotel_Properties_min_high ,
max_high  as Hotel_Properties_max_high ,
avg_high as Hotel_Properties_avg_high,
min_low  as Hotel_Properties_min_low ,
max_low  as Hotel_Properties_max_low ,
avg_low as Hotel_Properties_avg_low,
min_adj_close  as Hotel_Properties_min_adj_close ,
max_adj_close  as Hotel_Properties_max_adj_close ,
avg_adj_close as Hotel_Properties_avg_adj_close,
min_volume  as Hotel_Properties_min_volume ,
max_volume  as Hotel_Properties_max_volume ,
avg_volume  as Hotel_Properties_avg_volume 
from datamining.singapore_top5_tourism_stock_data_by_month
where stock_name =  'Hotel Properties') as HP ,
(select month as gs_month,
min_open  as Genting_Singapore_min_open ,
max_open  as Genting_Singapore_max_open ,
avg_open as Genting_Singapore_avg_open,
min_high  as Genting_Singapore_min_high ,
max_high  as Genting_Singapore_max_high ,
avg_high as Genting_Singapore_avg_high,
min_low  as Genting_Singapore_min_low ,
max_low  as Genting_Singapore_max_low ,
avg_low as Genting_Singapore_avg_low,
min_adj_close  as Genting_Singapore_min_adj_close ,
max_adj_close  as Genting_Singapore_max_adj_close ,
avg_adj_close as Genting_Singapore_avg_adj_close,
min_volume  as Genting_Singapore_min_volume ,
max_volume  as Genting_Singapore_max_volume ,
avg_volume  as Genting_Singapore_avg_volume 
from datamining.singapore_top5_tourism_stock_data_by_month
where stock_name =  'Genting Singapore') as GS,
(select month as ar_month,
min_open  as Ascott_Residence_Trust_min_open ,
max_open  as Ascott_Residence_Trust_max_open ,
avg_open as Ascott_Residence_Trust_avg_open,
min_high  as Ascott_Residence_Trust_min_high ,
max_high  as Ascott_Residence_Trust_max_high ,
avg_high as Ascott_Residence_Trust_avg_high,
min_low  as Ascott_Residence_Trust_min_low ,
max_low  as Ascott_Residence_Trust_max_low ,
avg_low as Ascott_Residence_Trust_avg_low,
min_adj_close  as Ascott_Residence_Trust_min_adj_close ,
max_adj_close  as Ascott_Residence_Trust_max_adj_close ,
avg_adj_close as Ascott_Residence_Trust_avg_adj_close,
min_volume  as Ascott_Residence_Trust_min_volume ,
max_volume  as Ascott_Residence_Trust_max_volume ,
avg_volume  as Ascott_Residence_Trust_avg_volume 
from datamining.singapore_top5_tourism_stock_data_by_month
where stock_name =  'Ascott Residence Trust') as AR 
where sa.month = mo.mo_month
and  sa.month = hp.hp_month
and sa.month = gs.gs_month
and sa.month = ar.ar_month;


select * from datamining.singapore_top5_tourism_stock_data_by_month_flatten;
