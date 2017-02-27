
DROP TABLE readmissions_transformed;
Create Table readmissions_transformed as
select 
provider_id,
sum(Score) as TPSDeathScore
From readmissionsrate
WHERE Measure_ID="MORT_30_AMI" OR Measure_ID="MORT_30_PN" OR Measure_ID="MORT_30_HF"
GROUP BY provider_id;





DROP TABLE best_hospitals;

Create Table best_hospitals as
SELECT
my_hospitals.provider_id,
my_hospitals.hospital_name,
my_hospitals.state,
round (0.75*(sum(procedures.score) + readmissions_transformed.TPSDeathScore) + 0.25*survey_results.patient_care_score, 3)  as TPS_Score
From my_hospitals FULL OUTER JOIN procedures ON my_hospitals.provider_id=procedures.provider_id
FULL OUTER JOIN survey_results on my_hospitals.provider_id = survey_results.provider_id 
FULL OUTER JOIN readmissions_transformed on my_hospitals.provider_id=readmissions_transformed.provider_id
WHERE procedures.Measure_ID="OP_20" OR procedures.Measure_ID="PC_01" or procedures.Measure_ID="IMM_2"
GROUP BY my_hospitals.provider_id,my_hospitals.hospital_name, my_hospitals.state, survey_results.patient_care_score, readmissions_transformed.TPSDeathScore
ORDER BY TPS_Score DESC;

select * from best_hospitals limit 10;
