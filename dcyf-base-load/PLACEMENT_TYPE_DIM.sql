-- create PLACEMENT_TYPE_DIM definition

-- DROP TABLE portal_redux.PLACEMENT_TYPE_DIM;
CREATE TABLE portal_redux.PLACEMENT_TYPE_DIM (
	ID_PLACEMENT_TYPE_DIM int NOT NULL,
	CD_EPSD_TYPE int NULL,
	TX_EPSD_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PLCM_SETNG int NULL,
	TX_PLCM_SETNG varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_PLACEMENT_TYPE_DIM PRIMARY KEY (ID_PLACEMENT_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.PLACEMENT_TYPE_DIM
FROM 'D:\S3\fldw-in\PLACEMENT_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);