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
