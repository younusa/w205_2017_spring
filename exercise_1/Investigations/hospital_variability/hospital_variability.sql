DROP TABLE procedures_transformed;

Create TABLE procedures_transformed as
select
provider_id,
Measure_ID,
Measure_Name,
Score
from procedures
WHERE Score IS NOT NULL
GROUP BY Measure_ID, Score, provider_id, Measure_Name
;

DROP TABLE procedures_variability ;

CREATE TABLE procedures_variability as
select
Measure_ID,
Measure_Name,
round(avg(score),3) as AverageScore,
round(variance(Score),3) as Score_Variance,
round(stddev_pop(Score), 3) as Score_STDev,
round(max(Score)-min(Score),3) as ScoreRange
from procedures_transformed
GROUP BY Measure_id, Measure_Name
;

DROP TABLE Adjusted_Variation;
CREATE TABLE Adjusted_Variation as
select 
Measure_ID,
Measure_Name,
Score_Variance,
round(Score_Variance/AverageScore,3) as Adjusted_Variance,
AverageScore,
ScoreRange
from procedures_variability
order by Adjusted_Variance DESC
;

select * from Adjusted_Variation
order by Adjusted_Variance DESC
limit 10;


