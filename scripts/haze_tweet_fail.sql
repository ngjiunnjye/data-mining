create table datamining.twitter_haze (
message string, 
Username string,
tweet_datetime timestamp, 
Location string,
Retweet_Count string,
Month string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1')

LOAD DATA LOCAL INPATH '/home/jiunnjye/Project/Raw_Twitter_Data.csv' OVERWRITE INTO TABLE datamining.twitter_haze;

select * from datamining.twitter_haze;