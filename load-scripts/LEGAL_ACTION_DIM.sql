-- create LEGAL_ACTION_DIM table

-- DROP TABLE portal_redux.LEGAL_ACTION_DIM;
CREATE TABLE portal_redux.LEGAL_ACTION_DIM (
	ID_LEGAL_ACTION_DIM int NOT NULL,
	CD_LEGAL_ACTION int NULL,
	TX_LEGAL_ACTION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE numeric(18,0) NULL,
	IS_CURRENT numeric(18,0) NULL,
	CONSTRAINT PK_LEGAL_ACTION_DIM PRIMARY KEY (ID_LEGAL_ACTION_DIM)
);

-- load table data

BULK INSERT portal_redux.LEGAL_ACTION_DIM
FROM 'D:\S3\fldw-in\LEGAL_ACTION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);