--- selecting the contents of Demographics into another table kamoako.demo2
select * into kamoako.qbs181hw1 from Demographics
---Viewing the top 10 rows of my new table
select top 10 * from kamoako.qbs181hw1
---Deleting certain columns from my new table
ALTER TABLE kamoako.qbs181hw1 drop column gh1
ALTER TABLE kamoako.qbs181hw1 drop column test
ALTER TABLE kamoako.qbs181hw1 drop column gh2
ALTER TABLE kamoako.qbs181hw1 drop column pf02
ALTER TABLE kamoako.qbs181hw1 drop column gh3
ALTER TABLE kamoako.qbs181hw1 drop column gh4
ALTER TABLE kamoako.qbs181hw1 drop column gh5
select distinct (tri_enrollmentcompletedate) from kamoako.qbs181hw1
---Renaming the columns in my new table
SP_RENAME 'kamoako.qbs181hw1.tri_age', 'Age' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.gendercode', 'Gender' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.contactid', 'Patient_ID' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.address1_stateorprovince', 'State' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.tri_enrollmentcompletedate', 'Completedate' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.parentcontactidname', 'Parent_ID' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.tri_imaginecareenrollmentemailsentdate', 'Emailsent_Date' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.Time_tocompleteenrollment', 'Emailrecieved_Date' , 'COLUMN'
SP_RENAME 'kamoako.qbs181hw1.tri_imaginecareenrollmentstatus', 'Enrollment_Code' , 'COLUMN'
---creating a column to calculate the number of days for completing enrollment
ALTER TABLE kamoako.qbs181hw1 
add [Enrollment_Time] as DATEDIFF(day, try_convert(date,Emailsent_Date),try_convert(date,Completedate))
---creating a new column for time(days) to complete enrollment
ALTER TABLE kamoako.qbs181hw1 
add Time_tocompleteenrollment nvarchar(100)
---creating a new column called Enrollment_status
alter table kamoako.qbs181hw1  
add Enrollment_Status nvarchar(100)
---checking the distinct values of tri_imaginecareenrollment status
select  distinct (tri_imaginecareenrollmentstatus) from kamoako.demo2
---inserting values into our newly created tables
UPDATE kamoako.qbs181hw1 
SET Enrollment_Status = 'Complete'
WHERE Enrollment_Code = '167410011'
---Doing a quick check to see if all rows with ID 167410011 has changed
select Enrollment_Status from kamoako.demo2
WHERE Enrollment_Code = '167410011'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Non_Responder'
WHERE Enrollment_Code = '167410004'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Facilitated_Enrollment'
WHERE Enrollment_Code = '167410005'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Incomplete_Enrollment'
WHERE Enrollment_Code = '167410002'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Opted_Out'
WHERE Enrollment_Code = '167410003'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Unprocessed_Code'
WHERE Enrollment_Code = '167410000'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Second_Email_Sent'
WHERE Enrollment_Code = '167410006'
---
UPDATE kamoako.demo2 
SET Enrollment_Status = 'Email_Sent'
WHERE Enrollment_Code = '167410001'

---creating a new column called SEX
ALTER TABLE kamoako.qbs181hw1
add SEX nvarchar(100)
---inserting values into my new column
UPDATE kamoako.qbs181hw1
SET SEX = 'Female'
WHERE Gender = '2'
---
UPDATE kamoako.qbs181hw1 
SET SEX = 'Male'
WHERE Gender = '1'
---
UPDATE kamoako.qbs181hw1 
SET SEX = 'Other'
WHERE Enrollment_Code = '167410000'
---
UPDATE kamoako.qbs181hw1 
SET SEX = 'Unknown'
WHERE Gender = 'NULL'
---
---creating a new column called AgeGroup
ALTER TABLE kamoako.qbs181hw1
add Age_Group nvarchar(100)
---Checking the maximum age in the data

---Inserting Age_Groups into columns
UPDATE kamoako.qbs181hw1 
SET Age_Group = '0-25'
WHERE Age <= '25'
---
 UPDATE kamoako.qbs181hw1
SET Age_Group = '26-50'
WHERE Age > '25' AND Age <= '50'
---
UPDATE kamoako.qbs181hw1 
SET Age_Group = '51-75'
WHERE Age > '50' AND Age <= '75'
---
UPDATE kamoako.qbs181hw1 
SET Age_Group = '76-1000'
WHERE Age > '75' AND Age <= '100'

---selecting 20 random rows from table
select top 20* from kamoako.qbs181hw1 order by NEWID();