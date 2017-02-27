DROP TABLE survey_results;

Create Table survey_results as
SELECT	
cast (Provider_Number as int) as provider_id,
cast (HCAHPS_Base_Score as int) ,
cast (HCAHPS_Consistency_Score as int),
cast((HCAHPS_Base_Score+ HCAHPS_Consistency_Score) as int) as Patient_Care_Score 
FROM surveys_responses;




