
DROP TABLE avghospitalscores;
Create Table avghospitalscores as
select 
provider_id,
round(avg(Score),3) as avghospitalscore
From procedures
GROUP BY provider_id;



--Correlation between average procedural score for each hospital and patient survey score for that hospital
select
concat("correlation between average hospital procedural score and survey score = ", round(corr(c.avghospitalscore,p.Patient_Care_Score),3))
from avghospitalscores c FULL JOIN survey_results p 
ON c.provider_id=p.provider_id
;


--Correlation between each hospital procedure score and patient_care_score for each hospital. 

select
concat("correlation between meaasure measure ",Measure_ID," and survey score = ", round(corr(p.Score,s.Patient_Care_Score),3))
FROM procedures p FULL JOIN survey_results s
ON p.provider_id= s.provider_id
group by p.Measure_ID;


