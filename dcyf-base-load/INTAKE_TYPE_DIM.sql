-- create INTAKE_TYPE_DIM table

-- DROP TABLE portal_redux.INTAKE_TYPE_DIM;
CREATE TABLE portal_redux.INTAKE_TYPE_DIM (
	ID_INTAKE_TYPE_DIM int NOT NULL,
	CD_ACCESS_TYPE int NULL,
	TX_ACCESS_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CPS_SUPERVISOR_DECISION int NULL,
	TX_CPS_SUPERVISOR_DECISION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FINAL_DECISION int NULL,
	TX_FINAL_DECISION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SUPERVISOR_DECISION int NULL,
	TX_SUPERVISOR_DECISION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_WORKER_DECISION int NULL,
	TX_WORKER_DECISION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CD_INTAKE_TYPE_DERIVED int NULL,
	TX_INTAKE_TYPE_DERIVED varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ID_INTAKE_TYPE_DIM PRIMARY KEY (ID_INTAKE_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.INTAKE_TYPE_DIM
FROM 'D:\S3\fldw-in\INTAKE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);