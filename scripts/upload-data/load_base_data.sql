-- reloads dcyf base data tables from D drive in database
-- truncates all dcyf base data from previous quarter

-- *** run 'drop_constraints.sql' before running this script
--  and run 'add_constraints.sql' to add fk constraints across base tables


TRUNCATE TABLE portal_redux.ABUSE_FACT;
BULK INSERT portal_redux.ABUSE_FACT
FROM 'D:\S3\fldw-in\ABUSE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.ABUSE_TYPE_DIM;
BULK INSERT portal_redux.ABUSE_TYPE_DIM
FROM 'D:\S3\fldw-in\ABUSE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.ALLEGATION_FACT;
BULK INSERT portal_redux.ALLEGATION_FACT
FROM 'D:\S3\fldw-in\ALLEGATION_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.ASSIGNMENT_ATTRIBUTE_DIM;
BULK INSERT portal_redux.ASSIGNMENT_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\ASSIGNMENT_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.ASSIGNMENT_FACT;
BULK INSERT portal_redux.ASSIGNMENT_FACT
FROM 'D:\S3\fldw-in\ASSIGNMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.CALENDAR_DIM;
BULK INSERT portal_redux.CALENDAR_DIM
FROM 'D:\S3\fldw-in\CALENDAR_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.CASE_DIM;
BULK INSERT portal_redux.CASE_DIM
FROM 'D:\S3\fldw-in\CASE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.CASE_PARTICIPANT_FACT;
BULK INSERT portal_redux.CASE_PARTICIPANT_FACT
FROM 'D:\S3\fldw-in\CASE_PARTICIPANT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.DISPOSITION_DIM;
BULK INSERT portal_redux.DISPOSITION_DIM
FROM 'D:\S3\fldw-in\DISPOSITION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.EDUCATION_PLAN_DIM;
BULK INSERT portal_redux.EDUCATION_PLAN_DIM
FROM 'D:\S3\fldw-in\EDUCATION_PLAN_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.EDUCATION_PLAN_FACT;
BULK INSERT portal_redux.EDUCATION_PLAN_FACT
FROM 'D:\S3\fldw-in\EDUCATION_PLAN_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.FINDINGS_DIM;
BULK INSERT portal_redux.FINDINGS_DIM
FROM 'D:\S3\fldw-in\FINDINGS_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.IL_ANSELL_CASEY_ASSESSMENT_FACT;
BULK INSERT portal_redux.IL_ANSELL_CASEY_ASSESSMENT_FACT
FROM 'D:\S3\fldw-in\IL_ANSELL_CASEY_ASSESSMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM;
BULK INSERT portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.IL_NYTD_QUESTIONS_FACT;
BULK INSERT portal_redux.IL_NYTD_QUESTIONS_FACT
FROM 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



/* -- no table structure found
TRUNCATE TABLE portal_redux.IL_SERVICE_CATEGORY_TYPE_DIM;
BULK INSERT portal_redux.IL_SERVICE_CATEGORY_TYPE_DIM
FROM 'D:\S3\fldw-in\IL_SERVICE_CATEGORY_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
); */



TRUNCATE TABLE portal_redux.INDEPENDENT_LIVING_BRIDGE_FACT;
BULK INSERT portal_redux.INDEPENDENT_LIVING_BRIDGE_FACT
FROM 'D:\S3\fldw-in\INDEPENDENT_LIVING_BRIDGE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INDEPENDENT_LIVING_FACT;
BULK INSERT portal_redux.INDEPENDENT_LIVING_FACT
FROM 'D:\S3\fldw-in\INDEPENDENT_LIVING_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_ATTRIBUTE_DIM;
BULK INSERT portal_redux.INTAKE_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\INTAKE_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_FACT;
BULK INSERT portal_redux.INTAKE_FACT
FROM 'D:\S3\fldw-in\INTAKE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_PARTICIPANT_FACT;
BULK INSERT portal_redux.INTAKE_PARTICIPANT_FACT
FROM 'D:\S3\fldw-in\INTAKE_PARTICIPANT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_PARTICIPANT_ROLES_DIM;
BULK INSERT portal_redux.INTAKE_PARTICIPANT_ROLES_DIM
FROM 'D:\S3\fldw-in\INTAKE_PARTICIPANT_ROLES_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_SERVICE_BRIDGE_FACT;
BULK INSERT portal_redux.INTAKE_SERVICE_BRIDGE_FACT
FROM 'D:\S3\fldw-in\INTAKE_SERVICE_BRIDGE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_TYPE_DIM;
BULK INSERT portal_redux.INTAKE_TYPE_DIM
FROM 'D:\S3\fldw-in\INTAKE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.INTAKE_VICTIM_FACT;
BULK INSERT portal_redux.INTAKE_VICTIM_FACT
FROM 'D:\S3\fldw-in\INTAKE_VICTIM_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


/*
TRUNCATE TABLE portal_redux.INVESTIGATION_ASSESSMENT_FACT;
BULK INSERT portal_redux.INVESTIGATION_ASSESSMENT_FACT
FROM 'D:\S3\fldw-in\INVESTIGATION_ASSESSMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);
*/



TRUNCATE TABLE portal_redux.INVESTIGATION_TYPE_DIM;
BULK INSERT portal_redux.INVESTIGATION_TYPE_DIM
FROM 'D:\S3\fldw-in\INVESTIGATION_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_ACTION_DIM;
BULK INSERT portal_redux.LEGAL_ACTION_DIM
FROM 'D:\S3\fldw-in\LEGAL_ACTION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT;
BULK INSERT portal_redux.LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT
FROM 'D:\S3\fldw-in\LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_FACT;
BULK INSERT portal_redux.LEGAL_FACT
FROM 'D:\S3\fldw-in\LEGAL_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_JURISDICTION_DIM;
BULK INSERT portal_redux.LEGAL_JURISDICTION_DIM
FROM 'D:\S3\fldw-in\LEGAL_JURISDICTION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_RESULT_DIM;
BULK INSERT portal_redux.LEGAL_RESULT_DIM
FROM 'D:\S3\fldw-in\LEGAL_RESULT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_STATUS_DIM;
BULK INSERT portal_redux.LEGAL_STATUS_DIM
FROM 'D:\S3\fldw-in\LEGAL_STATUS_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LEGAL_TPR_REFERRAL_FACT;
BULK INSERT portal_redux.LEGAL_TPR_REFERRAL_FACT
FROM 'D:\S3\fldw-in\LEGAL_TPR_REFERRAL_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LICENSE_ACTION_FACT;
BULK INSERT portal_redux.LICENSE_ACTION_FACT
FROM 'D:\S3\fldw-in\LICENSE_ACTION_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LICENSE_ATTRIB_DIM;
BULK INSERT portal_redux.LICENSE_ATTRIB_DIM
FROM 'D:\S3\fldw-in\LICENSE_ATTRIB_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LICENSE_FACT;
BULK INSERT portal_redux.LICENSE_FACT
FROM 'D:\S3\fldw-in\LICENSE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.LOCATION_DIM;
BULK INSERT portal_redux.LOCATION_DIM
FROM 'D:\S3\fldw-in\LOCATION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PAYMENT_DIM;
BULK INSERT portal_redux.PAYMENT_DIM
FROM 'D:\S3\fldw-in\PAYMENT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PAYMENT_FACT;
BULK INSERT portal_redux.PAYMENT_FACT
FROM 'D:\S3\fldw-in\PAYMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PEOPLE_DIM;
BULK INSERT portal_redux.PEOPLE_DIM
FROM 'D:\S3\fldw-in\PEOPLE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PERMANENCY_FACT;
BULK INSERT portal_redux.PERMANENCY_FACT
FROM 'D:\S3\fldw-in\PERMANENCY_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PERMANENCY_PLAN_DIM;
BULK INSERT portal_redux.PERMANENCY_PLAN_DIM
FROM 'D:\S3\fldw-in\PERMANENCY_PLAN_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PLACEMENT_CARE_AUTH_DIM;
BULK INSERT portal_redux.PLACEMENT_CARE_AUTH_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PLACEMENT_CARE_AUTH_FACT;
BULK INSERT portal_redux.PLACEMENT_CARE_AUTH_FACT
FROM 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PLACEMENT_FACT;
BULK INSERT portal_redux.PLACEMENT_FACT
FROM 'D:\S3\fldw-in\PLACEMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PLACEMENT_RESULT_DIM;
BULK INSERT portal_redux.PLACEMENT_RESULT_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_RESULT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PLACEMENT_TYPE_DIM;
BULK INSERT portal_redux.PLACEMENT_TYPE_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


TRUNCATE TABLE portal_redux.POC_Table_Counts;
BULK INSERT portal_redux.POC_Table_Counts
FROM 'D:\S3\fldw-in\poc_table_counts.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


TRUNCATE TABLE portal_redux.PRIMARY_ASSIGNMENT_FACT;
BULK INSERT portal_redux.PRIMARY_ASSIGNMENT_FACT
FROM 'D:\S3\fldw-in\PRIMARY_ASSIGNMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PROVIDER_DIM;
BULK INSERT portal_redux.PROVIDER_DIM
FROM 'D:\S3\fldw-in\PROVIDER_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PROVIDER_PART_FACT;
BULK INSERT portal_redux.PROVIDER_PART_FACT
FROM 'D:\S3\fldw-in\PROVIDER_PART_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.PROVIDER_SERVICE_LICENSE_FACT;
BULK INSERT portal_redux.PROVIDER_SERVICE_LICENSE_FACT
FROM 'D:\S3\fldw-in\PROVIDER_SERVICE_LICENSE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.RELATIONSHIP_DIM;
BULK INSERT portal_redux.RELATIONSHIP_DIM
FROM 'D:\S3\fldw-in\RELATIONSHIP_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.REMOVAL_DIM;
BULK INSERT portal_redux.REMOVAL_DIM
FROM 'D:\S3\fldw-in\REMOVAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.REMOVAL_EPISODE_FACT;
BULK INSERT portal_redux.REMOVAL_EPISODE_FACT
FROM 'D:\S3\fldw-in\REMOVAL_EPISODE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.REPEAT_MALTREATMENT_FACT;
BULK INSERT portal_redux.REPEAT_MALTREATMENT_FACT
FROM 'D:\S3\fldw-in\REPEAT_MALTREATMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.RESPONSE_TIME_EXP_DIM;
BULK INSERT portal_redux.RESPONSE_TIME_EXP_DIM
FROM 'D:\S3\fldw-in\RESPONSE_TIME_EXP_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptFosterHomes;
BULK INSERT portal_redux.rptFosterHomes
FROM 'D:\S3\fldw-in\rptFosterHomes.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptIntake_Children;
BULK INSERT portal_redux.rptIntake_Children
FROM 'D:\S3\fldw-in\rptIntake_Children.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptIntake_Subjects;
BULK INSERT portal_redux.rptIntake_Subjects
FROM 'D:\S3\fldw-in\rptIntake_Subjects.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptIntakes_CA;
BULK INSERT portal_redux.rptIntakes_CA
FROM 'D:\S3\fldw-in\rptIntakes.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptPlacement_Events;
BULK INSERT portal_redux.rptPlacement_Events
FROM 'D:\S3\fldw-in\rptPlacement_Events.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.rptPlacement;
BULK INSERT portal_redux.rptPlacement
FROM 'D:\S3\fldw-in\rptPlacements.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SAFETY_ASSESSMENT_FACT;
BULK INSERT portal_redux.SAFETY_ASSESSMENT_FACT
FROM 'D:\S3\fldw-in\SAFETY_ASSESSMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SERVICE_FACT;
BULK INSERT portal_redux.SERVICE_FACT
FROM 'D:\S3\fldw-in\SERVICE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SERVICE_REFERRAL_DIM;
BULK INSERT portal_redux.SERVICE_REFERRAL_DIM
FROM 'D:\S3\fldw-in\SERVICE_REFERRAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SERVICE_TYPE_DIM;
BULK INSERT portal_redux.SERVICE_TYPE_DIM
FROM 'D:\S3\fldw-in\SERVICE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SIBLING_RELATIONSHIP_FACT;
BULK INSERT portal_redux.SIBLING_RELATIONSHIP_FACT
FROM 'D:\S3\fldw-in\SIBLING_RELATIONSHIP_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.SUBSTANCE_ABUSE_WIZARD_FACT;
BULK INSERT portal_redux.SUBSTANCE_ABUSE_WIZARD_FACT
FROM 'D:\S3\fldw-in\SUBSTANCE_ABUSE_WIZARD_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.TRAINING_FACT;
BULK INSERT portal_redux.TRAINING_FACT
FROM 'D:\S3\fldw-in\TRAINING_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.TRAINING_TYPE_DIM;
BULK INSERT portal_redux.TRAINING_TYPE_DIM
FROM 'D:\S3\fldw-in\TRAINING_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.TRIBE_ATTRIBUTE_DIM;
BULK INSERT portal_redux.TRIBE_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\TRIBE_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.TRIBE_DIM;
BULK INSERT portal_redux.TRIBE_DIM
FROM 'D:\S3\fldw-in\TRIBE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.TRIBE_FACT;
BULK INSERT portal_redux.TRIBE_FACT
FROM 'D:\S3\fldw-in\TRIBE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);



TRUNCATE TABLE portal_redux.WORKER_DIM;
BULK INSERT portal_redux.WORKER_DIM
FROM 'D:\S3\fldw-in\WORKER_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);
	