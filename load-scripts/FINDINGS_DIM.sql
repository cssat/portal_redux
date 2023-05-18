-- create FINDINGS_DIM table

-- DROP TABLE portal_redux.FINDINGS_DIM;
CREATE TABLE portal_redux.FINDINGS_DIM (
	ID_FINDINGS_DIM int NOT NULL,
	CD_FINDING int NULL,
	TX_FINDING varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_FINDINGS_DIM PRIMARY KEY (ID_FINDINGS_DIM)
);

-- load table data

BULK INSERT portal_redux.FINDINGS_DIM
FROM 'D:\S3\fldw-in\FINDINGS_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);