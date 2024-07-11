-- loads data files from s3 dcyf-fldw-in to ca_ods D drive
-- 75 files in total

-- **BEFORE RUNNING**: folders are labeled by quarter
-- 		find & replace all '2024-Q2' with current year & quarter in below statements

-- 		run to review tasks
-- EXEC msdb.dbo.rds_gather_file_details;
--		(task number will be returned)
--
-- SELECT * FROM msdb.dbo.rds_fn_list_file_details(*task number here*);
--  	(takes at least 10 min before showing results)


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/ABUSE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\ABUSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/ABUSE_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\ABUSE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/ALLEGATION_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\ALLEGATION_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/ASSIGNMENT_ATTRIBUTE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\ASSIGNMENT_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/ASSIGNMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\ASSIGNMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/CALENDAR_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\CALENDAR_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/CASE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\CASE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/CASE_PARTICIPANT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\CASE_PARTICIPANT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/DISPOSITION_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\DISPOSITION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/EDUCATION_PLAN_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\EDUCATION_PLAN_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/EDUCATION_PLAN_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\EDUCATION_PLAN_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/FINDINGS_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\FINDINGS_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/IL_ANSELL_CASEY_ASSESSMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\IL_ANSELL_CASEY_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/IL_NYTD_QUESTIONS_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/IL_SERVICE_CATEGORY_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\IL_SERVICE_CATEGORY_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INDEPENDENT_LIVING_BRIDGE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INDEPENDENT_LIVING_BRIDGE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INDEPENDENT_LIVING_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INDEPENDENT_LIVING_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_ATTRIBUTE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_PARTICIPANT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_PARTICIPANT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_PARTICIPANT_ROLES_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_PARTICIPANT_ROLES_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_SERVICE_BRIDGE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_SERVICE_BRIDGE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INTAKE_VICTIM_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_VICTIM_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INVESTIGATION_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\INVESTIGATION_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/INVESTIGATIVE_ASSESSMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\INVESTIGATIVE_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_ACTION_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_ACTION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_JURISDICTION_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_JURISDICTION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_RESULT_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_RESULT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_STATUS_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_STATUS_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LEGAL_TPR_REFERRAL_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_TPR_REFERRAL_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LICENSE_ACTION_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_ACTION_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LICENSE_ATTRIB_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_ATTRIB_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LICENSE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/LOCATION_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\LOCATION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PAYMENT_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PAYMENT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PAYMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PAYMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PEOPLE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PEOPLE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PERMANENCY_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PERMANENCY_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PERMANENCY_PLAN_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PERMANENCY_PLAN_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PLACEMENT_CARE_AUTH_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PLACEMENT_CARE_AUTH_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PLACEMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PLACEMENT_RESULT_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_RESULT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PLACEMENT_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PRIMARY_ASSIGNMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PRIMARY_ASSIGNMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PROVIDER_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PROVIDER_PART_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_PART_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/PROVIDER_SERVICE_LICENSE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_SERVICE_LICENSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/RELATIONSHIP_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\RELATIONSHIP_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/REMOVAL_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\REMOVAL_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/REMOVAL_EPISODE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\REMOVAL_EPISODE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/REPEAT_MALTREATMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\REPEAT_MALTREATMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/RESPONSE_TIME_EXP_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\RESPONSE_TIME_EXP_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptFosterHomes.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptFosterHomes.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptIntake_Children.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntake_Children.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptIntake_Subjects.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntake_Subjects.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptIntakes.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntakes.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptPlacement_Events.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptPlacement_Events.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/rptPlacements.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptPlacements.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SAFETY_ASSESSMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\SAFETY_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SERVICE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SERVICE_REFERRAL_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_REFERRAL_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SERVICE_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SIBLING_RELATIONSHIP_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\SIBLING_RELATIONSHIP_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/SUBSTANCE_ABUSE_WIZARD_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\SUBSTANCE_ABUSE_WIZARD_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/TRAINING_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\TRAINING_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/TRAINING_TYPE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\TRAINING_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/TRIBE_ATTRIBUTE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/TRIBE_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/TRIBE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 's3://dcyf-fldw-in/2024-Q2/WORKER_DIM.txt',
	@rds_file_path = 'D:\S3\fldw-in\WORKER_DIM.txt',
	@overwrite_file = 1;

