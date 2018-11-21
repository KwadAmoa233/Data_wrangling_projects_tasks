select * from PhoneCall
---copying the content of phonecall into anoter table
select * into kamoako.hw2 from PhoneCall
---viewing the top 10 rows of my new table
select top 10 * from kamoako.hw2
---creating a new column
ALTER TABLE kamoako.hw2
add EnrollmentGroup  nvarchar(100)
---inserting values into my new table
UPDATE kamoako.hw2
SET EnrollmentGroup = 'ClinicalAlert'
WHERE EncounterCode = '125060000'
---
UPDATE kamoako.hw2
SET EnrollmentGroup = 'HealthCoaching'
WHERE EncounterCode = '125060001'
---
UPDATE kamoako.hw2
SET EnrollmentGroup = 'TechnixalQuestion'
WHERE EncounterCode = '125060002'
---
UPDATE kamoako.hw2
SET EnrollmentGroup = 'Administrative'
WHERE EncounterCode = '125060003'
---
UPDATE kamoako.hw2
SET EnrollmentGroup = 'Other'
WHERE EncounterCode = '125060004'
---
UPDATE kamoako.hw2
SET EnrollmentGroup = 'Lackof_Engagement'
WHERE EncounterCode = '125060005'
---2. finding the total number of recoreds in each distinct group
SELECT (Count(EncounterCode)),EnrollmentGroup
from kamoako.hw2
group by EnrollmentGroup
---
---selecting data from callduration table into another table
select * into kamoako.hw2c from CallDuration
---checking top rows of the table
select top 10* from kamoako.hw2c
---3. Joing the two tables

SELECT * into kamoako.hw2d
FROM kamoako.hw2
INNER JOIN kamoako.hw2c
ON kamoako.hw2.CustomerId = kamoako.hw2c.tri_CustomerIDEntityReference
---Selecting 10 10 rows
select top 10 * from kamoako.hw2d
---counting number of call outcome
SELECT (Count(CallOutcome)),CallOutcome
from kamoako.hw2d
group by CallOutcome
--- counting number of call types
SELECT (Count(CallType)),CallType
from kamoako.hw2d
group by CallType
---summing call durations for each enrollment grou
SELECT (sum(CallDuration)),EnrollmentGroup
from kamoako.hw2d
group by EnrollmentGroup
---Selecting Demographics,chronic conditions and Textmessages into different tables
select * into kamoako.hw2e from Demographics
select * into kamoako.hw2f from ChronicConditions
select * into kamoako.hw2g from [Text]
---merging the three tables
select A.*, B.*,C.* into kamoako.hw2h
from kamoako.hw2e A
INNER JOIN 
kamoako.hw2g B on A.contactid=B.tri_contactId
INNER JOIN
kamoako.hw2f C on A.contactid=C.tri_patientid
---Viewing top 10 rows of my newly created table
select top 10* from kamoako.hw2h
---letters per week for system
select count(SenderName) from kamoako.hw2h
where SenderName='System'
select max(TextSentDate) from kamoako.hw2h
where SenderName='System'
select min(TextSentDate) from kamoako.hw2h
where SenderName='System'
select DATEDIFF(week,'2016-03-21','2017-02-03')
---letters per week for Customer
select count(SenderName) from kamoako.hw2h
where SenderName='Customer'
select max(TextSentDate) from kamoako.hw2h
where SenderName='Customer'
select min(TextSentDate) from kamoako.hw2h
where SenderName='Customer'
select DATEDIFF(week,'2016-03-01','2017-02-03')
---letters per week for Clinician
select count(SenderName) from kamoako.hw2h
where SenderName='Clinician'
select max(TextSentDate) from kamoako.hw2h
where SenderName='clinician'
select min(TextSentDate) from kamoako.hw2h
where SenderName='clinician'
select DATEDIFF(week,'2016-02-07','2017-02-03')
---letters per week for Clinician
select count(SenderName) from kamoako.hw2h
where SenderName='Clinician'
select max(TextSentDate) from kamoako.hw2h
where SenderName='clinician'
select min(TextSentDate) from kamoako.hw2h
where SenderName='clinician'
select DATEDIFF(week,'2016-02-07','2017-02-03')

select distinct tri_name from kamoako.hw2h
---messages per week for Activity Monitoring
select count(tri_name) from kamoako.hw2h
where tri_name='Activity Monitoring'
select max(TextSentDate) from kamoako.hw2h
where tri_name='Activity Monitoring'
select min(TextSentDate) from kamoako.hw2h
where tri_name='Activity Monotoring'
select DATEDIFF(week,'NULL','2017-02-03')
---messages per week for COPD
select count(tri_name) from kamoako.hw2h
where tri_name='COPD'
select max(TextSentDate) from kamoako.hw2h
where tri_name='COPD'
select min(TextSentDate) from kamoako.hw2h
where tri_name='COPD'
select DATEDIFF(week,'2016-03-03','2017-02-03')
---messages per week for Diabetes
select count(tri_name) from kamoako.hw2h
where tri_name='Diabetes'
select max(TextSentDate) from kamoako.hw2h
where tri_name='Diabetes'
select min(TextSentDate) from kamoako.hw2h
where tri_name='Diabetes'
select DATEDIFF(week,'2016-03-07','2017-02-03')
---messages per week for Hypertension
select count(tri_name) from kamoako.hw2h
where tri_name='Hypertension'
select max(TextSentDate) from kamoako.hw2h
where tri_name='Hypertension'
select min(TextSentDate) from kamoako.hw2h
where tri_name='Hypertension'
select DATEDIFF(week,'2016-03-02','2017-02-03')
---messages per week for congestive Heart Failure
select count(tri_name) from kamoako.hw2h
where tri_name='Congestive Heart Failure'
select max(TextSentDate) from kamoako.hw2h
where tri_name='Congestive Heart Failure'
select min(TextSentDate) from kamoako.hw2h
where tri_name='Congestive Heart Failure'
select DATEDIFF(week,'2016-03-15','2017-02-03')
