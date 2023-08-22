-- create rptIntake_Subjects table

-- DROP TABLE portal_redux.rptIntake_Subjects;
CREATE TABLE portal_redux.rptIntake_Subjects (
	rowkey int NULL,
	id_access_report int NULL,
	subject int NULL,
	cd_rel int NULL,
	tx_rel varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dt_birth datetime NULL,
	age_at_intake int NULL,
	dt_death datetime NULL,
	tx_gndr varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_multirace varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_cmbn_ethn varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_braam_race varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_ltd_english varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Refresh_DT datetime NULL
);

-- load table data

BULK INSERT portal_redux.rptIntake_Subjects
FROM 'D:\S3\fldw-in\rptIntake_Subjects.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);