---selecting top 10 rows from my table
select top 10*from kamoako.IC_BP

---creating a new column for controlled and uncontrolled BP status
ALTER TABLE kamoako.IC_BP 
add BP_Control_Status nvarchar(100)

---creating a new column for BP status
ALTER TABLE kamoako.IC_BP 
add BP_status numeric(38,6)

---setting Hypo1 to controlled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Controlled blood pressure'
WHERE BPAlerts = 'Hypo1'

---setting normal to controlled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Controlled blood pressure'
WHERE BPAlerts = 'Normal'

---setting hypo2 to uncontrolled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Unontrolled blood pressure'
WHERE BPAlerts = 'Hypo2'

---setting HTN1 to uncontrolled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Unontrolled blood pressure'
WHERE BPAlerts = 'HTN1'

---setting HTN2 to uncontrolled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Unontrolled blood pressure'
WHERE BPAlerts = 'HTN2'

---setting HTN3 to uncontrolled blood pressure
UPDATE kamoako.IC_BP 
SET BP_Control_Status = 'Unontrolled blood pressure'
WHERE BPAlerts = 'HTN3'

---setting controlled blood pressure to zero(0)
UPDATE kamoako.IC_BP 
SET BP_Status = '1'
WHERE BP_Control_Status = 'Controlled blood pressure'

--setting uncontrolled blood pressure to zero(0)
UPDATE kamoako.IC_BP 
SET BP_Status = '0'
WHERE BP_Control_Status = 'Unontrolled blood pressure'

---selecting the Domographic database
select * into kamoako.qbsfinal from Demographics


---Deleting unwanted columns from my new table
ALTER TABLE kamoako.qbsfinal drop column gh1
ALTER TABLE kamoako.qbsfinal drop column test
ALTER TABLE kamoako.qbsfinal drop column gh2
ALTER TABLE kamoako.qbsfinal drop column pf02
ALTER TABLE kamoako.qbsfinal drop column gh3
ALTER TABLE kamoako.qbsfinal drop column gh4
ALTER TABLE kamoako.qbsfinal drop column gh5

---selecting first 10 rows from kamoako.qbsfinal
select top 10* from kamoako.qbsfinal

---merging my two blood pressure table and demographic(kamoako.qbsfinal) tables 
select A.*, B.* into kamoako.new
from kamoako.IC_BP A
INNER JOIN 
kamoako.qbsfinal B on A.ID=B.contactid

-- selecting the  minimum time for each patient as reference time  

select ID as patientid, min(ObservedTime) as mintime into kamoako.reftime
from kamoako.new 
group by ID;

select top 10* from kamoako.reftime;

-- selecting the maximum time for each patient 

select ID as contactid, max(ObservedTime) as maxtime into kamoako.maxtime
from kamoako.new
group by ID;


select top 10* from kamoako.maxtime

-- selecting min time for each subject 

select * into kamoako.reftime2 from kamoako.reftime
inner join kamoako.new on 
kamoako.new.ID = kamoako.reftime.patientid;


---dropping one of the id colmns to have a unique id 
alter table kamoako.reftime2
drop column contactid;

select top 10* from kamoako.reftime2


-- combine with the earlier table to include min and max time 
select * into kamoako.bothtimes from kamoako.maxtime
inner join kamoako.reftime2 on kamoako.reftime2.ID = kamoako.maxtime.contactid;


select top 10* from kamoako.bothtimes
---deleting repeated id
alter table kamoako.bothtimes
drop column contactid;
alter table kamoako.bothtimes
drop column ID;


---seleccting columns of interest for calculations
select patientid, BP_status, ObservedTime, mintime, maxtime into kamoako.means from  kamoako.bothtimes;

select top 10* from kamoako.means;

-- creating a 12 week period for each patient
alter table kamoako.means add week_number nvarchar(50);

update kamoako.means
set week_number = datediff(week, mintime, maxtime) + 1;


-- Getting rid of null values so it does not affect averages

select BP_status, patientid
from kamoako.means
where ISNUMERIC(BP_status) = 0

delete from kamoako.means where BP_status IS NULL;

alter table kamoako.means
alter column BP_Status numeric(1); 





select [patientid], [mintime], [week_number], avg(BP_status) as week1avg from kamoako.means where [ObservedTime] between mintime and DATEADD(week, 1, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week2avg from kamoako.means where [ObservedTime] between DATEADD(week, 1, mintime) and DATEADD(week, 2, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week3avg from kamoako.means where [ObservedTime] between DATEADD(week, 2, mintime) and DATEADD(week, 3, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week4avg from kamoako.means where [ObservedTime] between DATEADD(week, 3, mintime) and DATEADD(week, 4, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week5avg from kamoako.means where [ObservedTime] between DATEADD(week, 4, mintime) and DATEADD(week, 5, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week6avg from kamoako.means where [ObservedTime] between DATEADD(week, 5, mintime) and DATEADD(week, 6, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week7avg from kamoako.means where [ObservedTime] between DATEADD(week, 6, mintime) and DATEADD(week, 7, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week8avg from kamoako.means where [ObservedTime] between DATEADD(week, 7, mintime) and DATEADD(week, 8, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week9avg from kamoako.means where [ObservedTime] between DATEADD(week, 8, mintime) and DATEADD(week, 9, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week10avg from kamoako.means where [ObservedTime] between DATEADD(week, 9, mintime) and DATEADD(week, 10, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week11avg from kamoako.means where [ObservedTime] between DATEADD(week, 10, mintime) and DATEADD(week, 11, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;

select [patientid], [mintime], [week_number], avg(BP_status) as week12avg from kamoako.means where [ObservedTime] between DATEADD(week, 11, mintime) and DATEADD(week, 12, mintime)
group by [patientid], [mintime], [week_number] order by [patientid] asc;



---did a manual comparison between week 1 and week 12 and found 7 people moved from uncontrolled to controlled


















