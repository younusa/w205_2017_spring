DROP TABLE my_hospitals;

Create Table my_hospitals as
SELECT	
cast (Provider_ID as int) as Provider_ID,
Hospital_Name,
Address,
City,
State,
ZIP_Code,
County_Name,
Phone_Number
FROM hospitals;


