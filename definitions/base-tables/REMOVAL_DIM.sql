-- create REMOVAL_DIM table

-- DROP TABLE portal_redux.REMOVAL_DIM;
CREATE TABLE portal_redux.REMOVAL_DIM (
	ID_REMOVAL_DIM int NOT NULL,
	CD_RMVL_MNR int NULL,
	TX_RMVL_MNR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_REMOVAL_DIM PRIMARY KEY (ID_REMOVAL_DIM)
);

-- load table data

BULK INSERT portal_redux.REMOVAL_DIM
FROM 'D:\S3\fldw-in\REMOVAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);