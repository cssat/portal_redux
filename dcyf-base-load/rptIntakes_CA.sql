-- create rptIntakes_CA table

-- DROP TABLE portal_redux.rptIntakes_CA;
CREATE TABLE portal_redux.rptIntakes_CA (
	TableKey int NULL,
	ID_ACCESS_REPORT int NOT NULL,
	DT_ACCESS_RCVD datetime NULL,
	YEAR datetime NULL,
	YEAR_NAME varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MONTH_NAME varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_YEAR_NAME varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_YEAR_NAME varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CPS_YESNO char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	INTAKE_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_NON_CPS nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SCREEN_DCSN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_REASON int NULL,
	REASON varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	RESPONSE_TIME varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MAJOR_CAN int NULL,
	PHYSICAL_ABUSE int NULL,
	SEXUAL_ABUSE int NULL,
	NEGLECT int NULL,
	SEXUAL_EXPLOIT int NULL,
	ABANDONED int NULL,
	OTHER int NULL,
	ID_CASE int NULL,
	ID_PRVD_ORG_INTAKE int NULL,
	REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_REGION int NULL,
	INTAKE_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INTAKE_REGION int NULL,
	INTAKE_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INTAKE_OFFICE int NULL,
	INTAKE_UNIT nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CASE_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CASE_REGION int NULL,
	CASE_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CASE_OFFICE int NULL,
	PRIMARY_WRKR nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WRKR_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_WRKR_REGION int NULL,
	WORKER_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_WORKER_OFFICE int NULL,
	WORKER_UNIT nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COUNTY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	INTAKE_ZIP nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IA_WRKR_ID nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IA_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IA_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IA_UNIT nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CHILDREN int NULL,
	REFRESH_DT datetime NULL,
	dv_threat_intake varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_DEATH_SERIOUS_INJURY varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_NEAR_DEATH_INJURY varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER int NULL,
	FIRST_WORKER_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_CD_REGION int NULL,
	FIRST_WORKER_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_CD_OFFICE int NULL,
	FIRST_WORKER_UNIT nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_TOWN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_CD_TOWN nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_CNTY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FIRST_WORKER_CD_CNTY int NULL,
	FIRST_WORKER_Type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Month varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quarter varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quarter_Name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INTAKE WORKER] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INTAKE AA] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INTAKE SUP] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INTAKE_TYPE_DERIVED varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_INTAKE_TYPE_DERIVED varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_INVS int NULL,
	ID_FACP int NULL,
	CD_INTAKE_VERSION varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_rptIntakes_CA PRIMARY KEY (ID_ACCESS_REPORT)
);

-- load table data

BULK INSERT portal_redux.rptIntakes_CA
FROM 'D:\S3\fldw-in\rptIntakes.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
<<<<<<< HEAD
);
=======
);
>>>>>>> main
