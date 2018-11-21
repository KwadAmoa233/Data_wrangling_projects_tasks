---selecting top 10 columns of my table 
select top 10* from kamoako.DIQ_DATA

---renaming the columns of my table
SP_RENAME 'kamoako.DIQ_DATA._SEQN_', 'ID' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ010_', 'diabetes_status' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID040_', 'diabetes_age' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ160_', 'prediabetes_knowledge' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ170_', 'health_risk_knowledge' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ172_', 'risk_awareness' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175A_', 'family_history' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175B_', 'overweight' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175C_', 'Age' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175D_', 'poor_diet' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175E_', 'race' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175F_', 'babyweight' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175G_', 'physical_activity' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175H_', 'high-blood_pressure' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175I_', 'high_blood_sugar' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175J_', 'high_cholestrol' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175K_', 'hypoglycemic' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175L_', 'extreme_hunger' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175M_', 'numbness' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175N_', 'blurred_vision' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175O_', 'increased_fatigue' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175P_', 'anyone_at_risk' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175Q_', 'doctor_warning' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175R_', 'other_risk' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175S_', 'gestational_diabetes' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175T_', 'frequent_urination' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175U_', 'thirst' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175V_', 'sugar_craving' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175W_', 'medication' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ175X_', 'polycystic_ovarian_syndrome' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ180_', 'blood_test_in_3yrs' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ050_', 'current_insulin_intake' , 'COLUMN'-----
SP_RENAME 'kamoako.DIQ_DATA._DID060_', 'years_of_insulin_intake' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ060U_', 'insulin_unit_measure' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ070_', 'taking_diabetic_pills' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ230_', 'time_to_specialist' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ240_', 'doc_for_diabetes' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID250_', 'pastyear_doc_visit' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID260_', 'glucose_check' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ260U_', 'glucose_unit_measure' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ275_', 'pastyear_doc_check' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ280_', 'last_A1C_level' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ291_', 'A1C_required' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ300S_', 'recent_SBP' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ300D_', 'recent-DBP' , 'COLUMN'---
SP_RENAME 'kamoako.DIQ_DATA._DID310S_', 'SBP_required' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID310D_', 'DBP_required' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID320_', 'recent_LDL_number' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID330_', 'LDL_required' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID341_', 'pastyear_doc_feetcheck' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DID350_', 'feet_check' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ350U_', 'sore_unit_measure' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ360_', 'dilated pupils' , 'COLUMN'
SP_RENAME 'kamoako.DIQ_DATA._DIQ080_', 'retinopathy' , 'COLUMN'

---Doing count check for some variables
select [overweight], count (*) from kamoako.DIQ_DATA group by [overweight]
select [Age], count (*) from kamoako.DIQ_DATA group by [Age]
select [family_history], count (*) from kamoako.DIQ_DATA group by [family_history]
select [doctor_warning], count (*) from kamoako.DIQ_DATA group by [doctor_warning]
select [health_risk_knowledge], count (*) from kamoako.DIQ_DATA group by [health_risk_knowledge]
select [overweight], count (*) from kamoako.DIQ_DATA group by [overweight]

---deleting some empty rows
delete from kamoako.DIQ_DATA
where current_insulin_intake='2'
and health_risk_knowledge='na'
and diabetes_status='2'

---changing how the levels were coded for some categorical variables
-- prediabetes knowledge
UPDATE kamoako.DIQ_DATA 
SET prediabetes_knowledge = 'Yes'
WHERE prediabetes_knowledge = '1'
UPDATE kamoako.DIQ_DATA 
SET prediabetes_knowledge = 'No'
WHERE prediabetes_knowledge = '2'
UPDATE kamoako.DIQ_DATA 
SET prediabetes_knowledge = 'Refused'
WHERE prediabetes_knowledge = '3'
UPDATE kamoako.DIQ_DATA 
SET prediabetes_knowledge = 'Dont Know'
WHERE prediabetes_knowledge = '9'
---for diabetes status
---converting the column to nvarchar
alter table kamoako.DIQ_DATA alter column diabetes_status nvarchar(100)
UPDATE kamoako.DIQ_DATA 
SET diabetes_status = 'Yes'
WHERE diabetes_status = '1'
UPDATE kamoako.DIQ_DATA 
SET diabetes_status = 'No'
WHERE diabetes_status = '2'
UPDATE kamoako.DIQ_DATA 
SET diabetes_status = 'Border line'
WHERE diabetes_status = '3'
UPDATE kamoako.DIQ_DATA
SET diabetes_age='Dont know'
WHERE diabetes_status='7'
UPDATE kamoako.DIQ_DATA 
SET prediabetes_knowledge = 'Dont Know'
WHERE diabetes_status = '9'
---for retinopathy
UPDATE kamoako.DIQ_DATA 
SET retinopathy = 'Yes'
WHERE retinopathy = '1'
UPDATE kamoako.DIQ_DATA 
SET retinopathy = 'No'
WHERE retinopathy = '2'
UPDATE kamoako.DIQ_DATA 
SET retinopathy = 'Refused'
WHERE prediabetes_knowledge = '7'
UPDATE kamoako.DIQ_DATA 
SET retinopathy = 'Dont Know'
WHERE retinopathy = '9'
---past year doc check
UPDATE kamoako.DIQ_DATA 
SET pastyear_doc_check = 'Yes'
WHERE pastyear_doc_check = '1'
UPDATE kamoako.DIQ_DATA 
SET pastyear_doc_check = 'No'
WHERE pastyear_doc_check = '2'
UPDATE kamoako.DIQ_DATA 
SET pastyear_doc_check = 'Refused'
WHERE pastyear_doc_check = '3'
UPDATE kamoako.DIQ_DATA 
SET pastyear_doc_check = 'Dont Know'
WHERE pastyear_doc_check = '9'
---doc for diabetes
UPDATE kamoako.DIQ_DATA 
SET doc_for_diabetes = 'Yes'
WHERE doc_for_diabetes = '1'
UPDATE kamoako.DIQ_DATA 
SET doc_for_diabetes = 'No'
WHERE doc_for_diabetes = '2'
UPDATE kamoako.DIQ_DATA 
SET doc_for_diabetes = 'Refused'
WHERE doc_for_diabetes= '3'
UPDATE kamoako.DIQ_DATA 
SET doc_for_diabetes = 'Dont Know'
WHERE doc_for_diabetes = '9'
---taking diabeteic pills
UPDATE kamoako.DIQ_DATA 
SET taking_diabetic_pills = 'Yes'
WHERE taking_diabetic_pills = '1'
UPDATE kamoako.DIQ_DATA 
SET taking_diabetic_pills = 'No'
WHERE taking_diabetic_pills = '2'
UPDATE kamoako.DIQ_DATA 
SET taking_diabetic_pills = 'Refused'
WHERE taking_diabetic_pills = '3'
UPDATE kamoako.DIQ_DATA 
SET taking_diabetic_pills = 'Dont Know'
WHERE taking_diabetic_pills = '9'
----taking insulin
---converting the column to nvarchar
alter table kamoako.DIQ_DATA alter column current_insulin_intake nvarchar(100)
UPDATE kamoako.DIQ_DATA 
SET current_insulin_intake = 'Yes'
WHERE current_insulin_intake = '1'
UPDATE kamoako.DIQ_DATA 
SET current_insulin_intake = 'No'
WHERE current_insulin_intake = '2'
UPDATE kamoako.DIQ_DATA 
SET current_insulin_intake = 'Refused'
WHERE current_insulin_intake = '3'
UPDATE kamoako.DIQ_DATA 
SET current_insulin_intake = 'Dont Know'
WHERE current_insulin_intake = '9'
---blood test in 3 years
UPDATE kamoako.DIQ_DATA 
SET blood_test_in_3yrs = 'Yes'
WHERE blood_test_in_3yrs = '1'
UPDATE kamoako.DIQ_DATA 
SET blood_test_in_3yrs = 'No'
WHERE blood_test_in_3yrs = '2'
UPDATE kamoako.DIQ_DATA 
SET blood_test_in_3yrs = 'Refused'
WHERE blood_test_in_3yrs = '3'
UPDATE kamoako.DIQ_DATA 
SET blood_test_in_3yrs = 'Dont Know'
WHERE blood_test_in_3yrs = '9'

