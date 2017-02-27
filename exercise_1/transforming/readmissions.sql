DROP TABLE readmissionsrate;

Create Table readmissionsrate as
SELECT	
cast (Provider_ID as int) as provider_id,
Measure_ID,
Measure_Name,
cast (Score as float),
Compared_to_National
FROM readmissions;
