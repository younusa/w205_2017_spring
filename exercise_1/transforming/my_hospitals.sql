DROP TABLE my_hospitals;

Create Table my_hospitals as
SELECT	
Provider_ID,
Hospital_Name,
Address,
City,
State,
ZIP_Code,
County_Name,
Phone_Number,
Hospital_Overall_Rating
FROM hospitals;

ALTER TABLE my_hospitals
CHANGE Hospital_Overall_Rating Hospital_Overall_Rating int
CHANGE provider_id provider_id int
;