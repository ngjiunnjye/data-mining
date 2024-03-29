create table datamining.singapore_tourist_arrival (
month string , 
Total_International int ,     
     Southeast_Asia int,
         Brunei int ,
         Indonesia int,
         Malaysia int,         
         Myanmar  int,
         Philippines  int,
         Thailand  int,
         Vietm  int,
         Other_Southeast_Asia  int,
     Greater_China  int,
         Chi  int,
         Hong_Kong_SAR  int,
         Taiwan  int,
         Other_Greater_China  int,
     North_Asia  int,
         Japan  int,
         South_Korea  int,
         Other_North_Asia  int,
     South_Asia  int,
         Bangladesh  int,
         India  int,
         Pakistan  int,
         Sri_Lanka  int,
         Other_South_Asia  int,
     West_Asia  int,
         Iran  int,
         Israel  int,
         Kuwait  int,
         Saudi_Arabia  int,
         United_Arab_Emirates  int,
         Other_West_Asia  int,
     Americas  int,
         Canada  int,
         USA  int,
         Other_Americas  int,
     Europe  int,
         Belgium_Luxembourg  int,
         Denmark  int,
         Finland  int,
         France  int,
         Germany  int,
         Italy  int,
         Netherlands  int,
         Norway  int,
         Rep_Of_Ireland  int,
         Russian  int,
         Spain  int,
         Sweden  int,
         Switzerland  int,
         United_Kingdom  int,
         Other_Europe  int,
     Oceania  int,
         Australia  int,
         New_Zealand  int,
         Other_Oceania  int,
     Africa  int,
         Egypt  int,
         Mauritius  int,
         South_Africa int,
         Other_Africa  int,
     Others int)
ROW FORMAT DELIMITED

FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1') 

LOAD DATA LOCAL INPATH '/home/jiunnjye/Project/singapore_tourism_data.csv' OVERWRITE INTO TABLE datamining.singapore_tourist_arrival;

select * from datamining.singapore_tourist_arrival;