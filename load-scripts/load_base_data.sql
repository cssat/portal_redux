-- reloads dcyf base data tables
-- focuses on '_DIM' files with few dependencies that can be easily replaced
-- run after running ./drop_base_data.sql

--BULK INSERT portal_redux.DISPOSITION_DIM
--FROM 'D:\S3\fldw-in\DISPOSITION_DIM.txt'
--WITH (
--    firstrow = 2,
--    fieldterminator = '|',
--    rowterminator = '\n'
--);


DELETE FROM portal_redux.ABUSE_TYPE_DIM;

BULK INSERT portal_redux.ABUSE_TYPE_DIM
FROM 'D:\S3\fldw-in\ABUSE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.ASSIGNMENT_ATTRIBUTE_DIM;

BULK INSERT portal_redux.ASSIGNMENT_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\ASSIGNMENT_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.CALENDAR_DIM;

BULK INSERT portal_redux.CALENDAR_DIM
FROM 'D:\S3\fldw-in\CALENDAR_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.DISPOSITION_DIM;

BULK INSERT portal_redux.DISPOSITION_DIM
FROM 'D:\S3\fldw-in\DISPOSITION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.EDUCATION_PLAN_DIM;

BULK INSERT portal_redux.EDUCATION_PLAN_DIM
FROM 'D:\S3\fldw-in\EDUCATION_PLAN_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.FINDINGS_DIM;

BULK INSERT portal_redux.FINDINGS_DIM
FROM 'D:\S3\fldw-in\FINDINGS_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM;

BULK INSERT portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.INTAKE_ATTRIBUTE_DIM;

BULK INSERT portal_redux.INTAKE_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\INTAKE_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.INTAKE_PARTICIPANT_ROLES_DIM;

BULK INSERT portal_redux.INTAKE_PARTICIPANT_ROLES_DIM
FROM 'D:\S3\fldw-in\INTAKE_PARTICIPANT_ROLES_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.INTAKE_TYPE_DIM;

BULK INSERT portal_redux.INTAKE_TYPE_DIM
FROM 'D:\S3\fldw-in\INTAKE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.INVESTIGATION_TYPE_DIM;

BULK INSERT portal_redux.INVESTIGATION_TYPE_DIM
FROM 'D:\S3\fldw-in\INVESTIGATION_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LEGAL_ACTION_DIM;

BULK INSERT portal_redux.LEGAL_ACTION_DIM
FROM 'D:\S3\fldw-in\LEGAL_ACTION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LEGAL_JURISDICTION_DIM;

BULK INSERT portal_redux.LEGAL_JURISDICTION_DIM
FROM 'D:\S3\fldw-in\LEGAL_JURISDICTION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LEGAL_RESULT_DIM;

BULK INSERT portal_redux.LEGAL_RESULT_DIM
FROM 'D:\S3\fldw-in\LEGAL_RESULT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LEGAL_STATUS_DIM;

BULK INSERT portal_redux.LEGAL_STATUS_DIM
FROM 'D:\S3\fldw-in\LEGAL_STATUS_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LICENSE_ATTRIB_DIM;

BULK INSERT portal_redux.LICENSE_ATTRIB_DIM
FROM 'D:\S3\fldw-in\LICENSE_ATTRIB_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.LOCATION_DIM;

BULK INSERT portal_redux.LOCATION_DIM
FROM 'D:\S3\fldw-in\LOCATION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.PAYMENT_DIM;

BULK INSERT portal_redux.PAYMENT_DIM
FROM 'D:\S3\fldw-in\PAYMENT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.PERMANENCY_PLAN_DIM;

BULK INSERT portal_redux.PERMANENCY_PLAN_DIM
FROM 'D:\S3\fldw-in\PERMANENCY_PLAN_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.PLACEMENT_CARE_AUTH_DIM;

BULK INSERT portal_redux.PLACEMENT_CARE_AUTH_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.PLACEMENT_RESULT_DIM;

BULK INSERT portal_redux.PLACEMENT_RESULT_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_RESULT_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.PLACEMENT_TYPE_DIM;

BULK INSERT portal_redux.PLACEMENT_TYPE_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.RELATIONSHIP_DIM;

BULK INSERT portal_redux.RELATIONSHIP_DIM
FROM 'D:\S3\fldw-in\RELATIONSHIP_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.REMOVAL_DIM;

BULK INSERT portal_redux.REMOVAL_DIM
FROM 'D:\S3\fldw-in\REMOVAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.RESPONSE_TIME_EXP_DIM;

BULK INSERT portal_redux.RESPONSE_TIME_EXP_DIM
FROM 'D:\S3\fldw-in\RESPONSE_TIME_EXP_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.SERVICE_REFERRAL_DIM;

BULK INSERT portal_redux.SERVICE_REFERRAL_DIM
FROM 'D:\S3\fldw-in\SERVICE_REFERRAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.SERVICE_TYPE_DIM;

BULK INSERT portal_redux.SERVICE_TYPE_DIM
FROM 'D:\S3\fldw-in\SERVICE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.TRAINING_TYPE_DIM;

BULK INSERT portal_redux.TRAINING_TYPE_DIM
FROM 'D:\S3\fldw-in\TRAINING_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.TRIBE_ATTRIBUTE_DIM;

BULK INSERT portal_redux.TRIBE_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\TRIBE_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);


DELETE FROM portal_redux.TRIBE_DIM;

BULK INSERT portal_redux.TRIBE_DIM
FROM 'D:\S3\fldw-in\TRIBE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);
