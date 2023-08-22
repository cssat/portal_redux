-- create PERMANENCY_PLAN_DIM table

-- DROP TABLE portal_redux.PERMANENCY_PLAN_DIM;
CREATE TABLE portal_redux.PERMANENCY_PLAN_DIM (
	ID_PERMANENCY_PLAN_DIM int NOT NULL,
	CD_RESULT int NULL,
	TX_PERM_PLAN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_PERM_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_PERMANENCY_PLAN_DIM PRIMARY KEY (ID_PERMANENCY_PLAN_DIM)
);

-- load table data

BULK INSERT portal_redux.PERMANENCY_PLAN_DIM
FROM 'D:\S3\fldw-in\PERMANENCY_PLAN_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);