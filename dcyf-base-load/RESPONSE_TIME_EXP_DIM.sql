-- create RESPONSE_TIME_EXP_DIM table

-- DROP TABLE portal_redux.RESPONSE_TIME_EXP_DIM;
CREATE TABLE portal_redux.RESPONSE_TIME_EXP_DIM (
	ID_RESPONSE_TIME_EXP_DIM int NOT NULL,
	CD_RESPONSE_TIME_CAT int NULL,
	TX_RESPONSE_TIME_CAT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_RESPONSE_TIME_EXP_DIM PRIMARY KEY (ID_RESPONSE_TIME_EXP_DIM)
);

-- load table data

BULK INSERT portal_redux.RESPONSE_TIME_EXP_DIM
FROM 'D:\S3\fldw-in\RESPONSE_TIME_EXP_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);