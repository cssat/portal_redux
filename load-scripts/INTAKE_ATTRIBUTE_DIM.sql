-- create INTAKE_ATTRIBUTE_DIM table

-- DROP TABLE portal_redux.INTAKE_ATTRIBUTE_DIM;
CREATE TABLE portal_redux.INTAKE_ATTRIBUTE_DIM (
	ID_INTAKE_ATTRIBUTE_DIM int NOT NULL,
	ID_ACCESS_REPORT int NULL,
	CD_ALLEGATION_ABUSE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_ALLEGATION_ABUSE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_BEHAVIORAL_PROBLEMS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_BEHAVIORAL_PROBLEMS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_BENEFIT_TREATMENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_BENEFIT_TREATMENT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CHILD_ASLTD_IN_DOMESTIC_VIOLENCE int NULL,
	TX_CHILD_ASLTD_IN_DOMESTIC_VIOLENCE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CHRONICITY char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_CHRONICITY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_COMPLAINTS_HYGIENE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_COMPLAINTS_HYGIENE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CONTACT_OTHERS int NULL,
	TX_CONTACT_OTHERS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_CPS_SPVR_RSN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_DCF_WRK_INV char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_DCF_WRK_INV varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_DEVELOPMENTAL_DISABILITY char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_DEVELOPMENTAL_DISABILITY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_DNGR_TO_CHLD_IN_DOMESTIC_VIOLENCE int NULL,
	TX_DNGR_TO_CHLD_IN_DOMESTIC_VIOLENCE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_DRUG_ABUSE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_DRUG_ABUSE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_DSCN_OVERRIDE int NULL,
	TX_DSCN_OVERRIDE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FAILURE_BASIC_NEEDS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_FAILURE_BASIC_NEEDS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FAILURE_CLOTHING char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_FAILURE_CLOTHING varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FAILURE_SUPERVISE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_FAILURE_SUPERVISE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FAILURE_TREATMENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_FAILURE_TREATMENT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FEAR_AFRAID char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_FEAR_AFRAID varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_HAZARDOUS_CONDITIONS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_HAZARDOUS_CONDITIONS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_IMMEDIATE_CPS_RESPONSE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_IMMEDIATE_CPS_RESPONSE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_IMMEDIATE_MEDICAL char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_IMMEDIATE_MEDICAL varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INDIAN_RESERVATION int NULL,
	TX_INDIAN_RESERVATION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LANG int NULL,
	TX_LANG varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LOCO_PARENTIS int NULL,
	TX_LOCO_PARENTIS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MEDICAL_NEGLECT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_MEDICAL_NEGLECT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MEET_WAC int NULL,
	TX_MEET_WAC varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MEMBER int NULL,
	TX_MEMBER varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MTHD int NULL,
	TX_MTHD varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_NATIVE int NULL,
	TX_NATIVE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_OVERRIDE_REASON int NULL,
	TX_OVERRIDE_REASON varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PHYSICAL_HARM char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_PHYSICAL_HARM varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PHYSICAL_SEXUAL_ABUSE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_PHYSICAL_SEXUAL_ABUSE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_POOR_JUDGMENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_POOR_JUDGMENT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PREVIOUS_FOUNDED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_PREVIOUS_FOUNDED varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PRNT_KILLED_BY_PERPETRATOR int NULL,
	TX_PRNT_KILLED_BY_PERPETRATOR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RPTR_DSCR int NULL,
	TX_RPTR_DSCR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RTM_DSGNTN int NULL,
	TX_RTM_DSGNTN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SERIOUS_INJURIES char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_SERIOUS_INJURIES varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SPVR_RSN int NULL,
	TX_SPVR_RSN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_THREAT_LIFE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_THREAT_LIFE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_THREAT_PHSCL_FRC_AGNST_ADLT int NULL,
	TX_THREAT_PHSCL_FRC_AGNST_ADLT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_UNDER_AGE int NULL,
	TX_UNDER_AGE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_UNREALISTIC_EXPECTATION char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_UNREALISTIC_EXPECTATION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_WARD_TRIBAL_COURT int NULL,
	TX_WARD_TRIBAL_COURT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_WRKR_RSN int NULL,
	TX_WRKR_RSN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_AFTER_HOURS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_CIA char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_EFFS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_INTERP char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_INVS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_MNDREP char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_NTC_GEN char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_OTHR char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PCKT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_POLICE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PRVD_ASSOCIATED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_REFERRER_REQ_CONFIDENTIALITY char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_RESPONSE_COMPLETE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_RPT_ADDRSS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_RSPNS_DSCN_OVERRIDE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_RTM_TIME char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_SER_INCD_RPT_GNRTD char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_WRKR_SFTY_CONCERNS char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	FL_DELETED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INTAKE_TYPE_DERIVED int NULL,
	TX_INTAKE_TYPE_DERIVED varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ID_INTAKE_ATTRIBUTE_DIM PRIMARY KEY (ID_INTAKE_ATTRIBUTE_DIM)
);

-- load table data

BULK INSERT portal_redux.INTAKE_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\INTAKE_ATTRIBUTE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);