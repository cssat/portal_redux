-- create DISPOSITION_DIM table

-- DROP TABLE portal_redux.DISPOSITION_DIM;
CREATE TABLE portal_redux.DISPOSITION_DIM (
	ID_DISPOSITION_DIM int NOT NULL,
	CD_INVS_DISP int NULL,
	TX_INVS_DISP varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_DISPOSITION_DIM PRIMARY KEY (ID_DISPOSITION_DIM)
);

-- load table data

BULK INSERT portal_redux.DISPOSITION_DIM
FROM 'D:\S3\fldw-in\DISPOSITION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);