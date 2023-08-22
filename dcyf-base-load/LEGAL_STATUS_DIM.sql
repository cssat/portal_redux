-- create LEGAL_STATUS_DIM table

-- DROP TABLE portal_redux.LEGAL_STATUS_DIM;
CREATE TABLE portal_redux.LEGAL_STATUS_DIM (
	ID_LEGAL_STATUS_DIM int NOT NULL,
	CD_LGL_STAT int NULL,
	TX_LGL_STAT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_LEGAL_STATUS_DIM PRIMARY KEY (ID_LEGAL_STATUS_DIM)
);

-- load table data

BULK INSERT portal_redux.LEGAL_STATUS_DIM
FROM 'D:\S3\fldw-in\LEGAL_STATUS_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);