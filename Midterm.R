#loading package to help read xpt file into R
library(foreign)
data=read.xport(file.choose())
head(data)
attach(data)
#Renaming the columns in the data
colnames(data)[colnames(data)=="SEQN"] <- "ID"
colnames(data)[colnames(data)=="DIQ010"] <- "diabetes_status"
colnames(data)[colnames(data)=="DID040"] <- "diabetes_age"
colnames(data)[colnames(data)=="DIQ160"] <- "Prediabetes_knowlegde"
colnames(data)[colnames(data)=="DIQ170"] <- "health_risk_knowledge"
colnames(data)[colnames(data)=="DIQ172"] <- "risk_awareness"
colnames(data)[colnames(data)=="DIQ175A"] <- "family_history"
colnames(data)[colnames(data)=="DIQ175B"] <- "overweight"
colnames(data)[colnames(data)=="DIQ175C"] <- "age"
colnames(data)[colnames(data)=="DIQ175D"] <- "poor_diet"
colnames(data)[colnames(data)=="DIQ175E"] <- "race_risk"
colnames(data)[colnames(data)=="DIQ175F"] <- "babyweight_risk"
colnames(data)[colnames(data)=="DIQ175G"] <- "physical_activity"
colnames(data)[colnames(data)=="DIQ175H"] <- "high_blood_pressure"
colnames(data)[colnames(data)=="DIQ175I"] <- "high_blood_sugar"
colnames(data)[colnames(data)=="DIQ175J"] <- "high_cholestrol"
colnames(data)[colnames(data)=="DIQ175K"] <- "hypoglycemic"
colnames(data)[colnames(data)=="DIQ175L"] <- "extreme_hunger"
colnames(data)[colnames(data)=="DIQ175M"] <- "numbness"
colnames(data)[colnames(data)=="DIQ175N"] <- "blurred_vision"
colnames(data)[colnames(data)=="DIQ175O"] <- "increased_fatigue"
colnames(data)[colnames(data)=="DIQ175P"] <- "anyone_at_risk"
colnames(data)[colnames(data)=="DIQ175Q"] <- "doctor_warning"
colnames(data)[colnames(data)=="DIQ175R"] <- "other_risk"
colnames(data)[colnames(data)=="DIQ175S"] <- "gestational_diabetes"
colnames(data)[colnames(data)=="DIQ175T"] <- "frequent_urination"
colnames(data)[colnames(data)=="DIQ175U"] <- "thirst"
colnames(data)[colnames(data)=="DIQ175V"] <- "sugar_craving"
colnames(data)[colnames(data)=="DIQ175W"] <- "medication"
colnames(data)[colnames(data)=="DIQ175X"] <- "polycystic_ovarian_syndrome"
colnames(data)[colnames(data)=="DIQ180"] <- "blood_test_in_3yrs"
colnames(data)[colnames(data)=="DIQ050"] <- "current_insulin_intake"
colnames(data)[colnames(data)=="DID060"] <- "years_of_insulin_intake"
colnames(data)[colnames(data)=="DIQ060U"] <- "insulin_unit_measure"
colnames(data)[colnames(data)=="DIQ070"] <- "taking_diabeteic_pills"
colnames(data)[colnames(data)=="DIQ230"] <- "time_to_specialist"
colnames(data)[colnames(data)=="DIQ240"] <- "doc_for_diabetes"
colnames(data)[colnames(data)=="DID250"] <- "pastyear_doc_visit"
colnames(data)[colnames(data)=="DID260"] <- "glucose_check"
colnames(data)[colnames(data)=="DIQ260U"] <- "glucose_unit_measure"
colnames(data)[colnames(data)=="DIQ275"] <- "pastyear_doc_check"
colnames(data)[colnames(data)=="DIQ280"] <- "last_A1C_level"
colnames(data)[colnames(data)=="DIQ291"] <- "A1C_required"
colnames(data)[colnames(data)=="DIQ300S"] <- "recent_SBP"
colnames(data)[colnames(data)=="DIQ300D"] <- "recent_DBP"
colnames(data)[colnames(data)=="DID310S"] <- "SBP_required"
colnames(data)[colnames(data)=="DID310D"] <- "DBP_required"
colnames(data)[colnames(data)=="DID320"] <- "recent_LDL_number"
colnames(data)[colnames(data)=="DID330"] <- "LDL_required"
colnames(data)[colnames(data)=="DID341"] <- "pastyear_dr_feetcheck"
colnames(data)[colnames(data)=="DID350"] <- "feet_check"
colnames(data)[colnames(data)=="DIQ350U"] <- "sore_unit_measure"
colnames(data)[colnames(data)=="DIQ360"] <- "dilated_pupils"
colnames(data)[colnames(data)=="DIQ080"] <- "retinopathy"
attach(data)
#changing the data types of some variables
as.factor(retinopathy)
as.factor(dilated_pupils)
as.factor(sore_unit_measure)
as.factor(feet_check)
as.factor(pastyear_doc_check)
as.factor(LDL_required)
as.factor(recent_LDL_number)
as.factor(DBP_required)
as.factor(SBP_required)
as.factor(recent_DBP)
as.factor(recent_SBP)
as.factor(AIC_required)
as.numeric(last_AIC_level)
as.factor(pastyear_doc_check)
as.factor(glucose_unit_measure)
as.factor(pastyear_doc_visit)
as.factor(doc_for_diabetes)
as.factor(time_to_specialist)
as.factor(taking_diabeteic_pills)
as.factor(current_insulin_intake)
as.factor(blood_test_in_3yrs)
as.factor(risk_awareness)
as.factor(health_risk_knowledge)
as.factor(Prediabetes_knowlegde)
as.factor(diabetes_status)
#verifying the counts of some variaables
#counts for diabetes status
data.frame(table(data$diabetes_status))
#counts for current insulin intake
data.frame(table(data$current_insulin_intake))
#counts for risk awareness
data.frame(table(data$risk_awareness))
#counts for time to specialist
data.frame(table(data$time_to_specialist))
#counts to 
data.frame(table(data$health_risk_knowledge))

