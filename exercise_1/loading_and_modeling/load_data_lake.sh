#!/bin/bash

#save my current directory 
MY_DIR=$(pwd)

#creating staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1
cd ~staging/exercise_1

#get file  and unzip from data.medicare.gov

wget "https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip" -O medicaredata.zip
unzip medicaredata.zip

#Creating HDFS Directory
hdfs dfs -mkdir /user/w205/hospital_compare

#remove header from each csv file and rename file. Move file to HDFS directory
tail -n +2 "Hospital General Information.csv" > hospitals.csv
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
tail -n +2 "Measure Dates.csv" > Measures.csv
hdfs dfs -put Measures.csv /user/w205/hospital_compare
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > surveys_responses.csv
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare


#Change back to orig directory
cd "$MY_DIR"



