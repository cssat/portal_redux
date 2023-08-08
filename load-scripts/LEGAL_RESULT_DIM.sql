-- create LEGAL_RESULT_DIM table

-- DROP TABLE portal_redux.LEGAL_RESULT_DIM;
CREATE TABLE portal_redux.LEGAL_RESULT_DIM (
	ID_LEGAL_RESULT_DIM int NOT NULL,
	CD_RESULT int NULL,
	TX_RESULT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_LEGAL_RESULT_DIM PRIMARY KEY (ID_LEGAL_RESULT_DIM)
);

-- load table data

BULK INSERT portal_redux.LEGAL_RESULT_DIM
FROM 'D:\S3\fldw-in\LEGAL_RESULT_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);