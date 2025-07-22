-- loads data files from s3 dcyf-fldw-in to ca_ods D: drive
-- 76 files in total

-- **BEFORE RUNNING**: folders are labeled by quarter
-- 	find & replace all '2025-Q1' with current year & quarter in below statements

--		run to view task progress
-- SELECT * FROM msdb.dbo.rds_fn_task_status(NULL,0);

-- 		run to view files in the D: drive
-- EXEC msdb.dbo.rds_gather_file_details;
--		(task number will be returned)
--
-- SELECT * FROM msdb.dbo.rds_fn_list_file_details( *task number here* );



EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/ABUSE_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\ABUSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/ABUSE_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\ABUSE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/ALLEGATION_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\ALLEGATION_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/ASSIGNMENT_ATTRIBUTE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\ASSIGNMENT_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/ASSIGNMENT_FACT.txt',
	@rds_file_path = 'D:\S3\fldw-in\ASSIGNMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/CALENDAR_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\CALENDAR_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/CASE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\CASE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/CASE_PARTICIPANT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\CASE_PARTICIPANT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/DISPOSITION_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\DISPOSITION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/EDUCATION_PLAN_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\EDUCATION_PLAN_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/EDUCATION_PLAN_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\EDUCATION_PLAN_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/FINDINGS_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\FINDINGS_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/IL_ANSELL_CASEY_ASSESSMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\IL_ANSELL_CASEY_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/IL_NYTD_QUESTIONS_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/IL_SERVICE_CATEGORY_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\IL_SERVICE_CATEGORY_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INDEPENDENT_LIVING_BRIDGE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INDEPENDENT_LIVING_BRIDGE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INDEPENDENT_LIVING_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INDEPENDENT_LIVING_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_ATTRIBUTE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_PARTICIPANT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_PARTICIPANT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_PARTICIPANT_ROLES_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_PARTICIPANT_ROLES_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_SERVICE_BRIDGE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_SERVICE_BRIDGE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INTAKE_VICTIM_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INTAKE_VICTIM_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INVESTIGATION_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INVESTIGATION_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/INVESTIGATIVE_ASSESSMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\INVESTIGATIVE_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_ACTION_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_ACTION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_AGGRAVATED_CIRCUMSTANCES_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_JURISDICTION_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_JURISDICTION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_RESULT_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_RESULT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_STATUS_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_STATUS_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LEGAL_TPR_REFERRAL_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LEGAL_TPR_REFERRAL_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LICENSE_ACTION_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_ACTION_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LICENSE_ATTRIB_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_ATTRIB_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LICENSE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LICENSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/LOCATION_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\LOCATION_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PAYMENT_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PAYMENT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PAYMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PAYMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PEOPLE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PEOPLE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PERMANENCY_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PERMANENCY_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PERMANENCY_PLAN_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PERMANENCY_PLAN_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PLACEMENT_CARE_AUTH_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PLACEMENT_CARE_AUTH_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_CARE_AUTH_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PLACEMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PLACEMENT_RESULT_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_RESULT_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PLACEMENT_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PLACEMENT_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/POC_Table_Counts.txt',
	@rds_file_path = 'D:\S3\fldw-in\POC_Table_Counts.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PRIMARY_ASSIGNMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PRIMARY_ASSIGNMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PROVIDER_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PROVIDER_PART_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_PART_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/PROVIDER_SERVICE_LICENSE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\PROVIDER_SERVICE_LICENSE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/RELATIONSHIP_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\RELATIONSHIP_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/REMOVAL_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\REMOVAL_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/REMOVAL_EPISODE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\REMOVAL_EPISODE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/REPEAT_MALTREATMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\REPEAT_MALTREATMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/RESPONSE_TIME_EXP_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\RESPONSE_TIME_EXP_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptFosterHomes.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptFosterHomes.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptIntake_Children.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntake_Children.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptIntake_Subjects.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntake_Subjects.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptIntakes.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptIntakes.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptPlacement_Events.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptPlacement_Events.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/rptPlacements.txt',
	@rds_file_path = 'D:\S3\fldw-in\rptPlacements.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SAFETY_ASSESSMENT_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SAFETY_ASSESSMENT_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SERVICE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SERVICE_REFERRAL_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_REFERRAL_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SERVICE_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SERVICE_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SIBLING_RELATIONSHIP_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SIBLING_RELATIONSHIP_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/SUBSTANCE_ABUSE_WIZARD_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\SUBSTANCE_ABUSE_WIZARD_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/TRAINING_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\TRAINING_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/TRAINING_TYPE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\TRAINING_TYPE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/TRIBE_ATTRIBUTE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_ATTRIBUTE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/TRIBE_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_DIM.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/TRIBE_FACT.TXT',
	@rds_file_path = 'D:\S3\fldw-in\TRIBE_FACT.txt',
	@overwrite_file = 1;


EXEC msdb.dbo.rds_download_from_s3
	@s3_arn_of_file = 'arn:aws:s3:::dcyf-fldw-in/2025-Q1/WORKER_DIM.TXT',
	@rds_file_path = 'D:\S3\fldw-in\WORKER_DIM.txt',
	@overwrite_file = 1;

