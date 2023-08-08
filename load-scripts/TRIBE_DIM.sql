-- create TRIBE_DIM table

-- DROP TABLE portal_redux.TRIBE_DIM;
CREATE TABLE portal_redux.TRIBE_DIM (
	ID_TRIBE_DIM int NOT NULL,
	CD_TRIBE_TYPE int NULL,
	TX_TRIBE_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_TRIBE_NAME varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_FED_TRIBE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	ID_TRIBE int NULL,
	CONSTRAINT PK_TRIBE_DIM PRIMARY KEY (ID_TRIBE_DIM)
);

-- load table data

BULK INSERT portal_redux.TRIBE_DIM
FROM 'D:\S3\fldw-in\TRIBE_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);