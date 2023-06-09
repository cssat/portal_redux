-- create TRAINING_TYPE_DIM table

-- DROP TABLE portal_redux.TRAINING_TYPE_DIM;
CREATE TABLE portal_redux.TRAINING_TYPE_DIM (
	ID_TRAINING_TYPE_DIM int NOT NULL,
	CD_TRAINING_TYPE int NULL,
	TX_TRAINING_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK__TRAINING__016E736294039A2A PRIMARY KEY (ID_TRAINING_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.TRAINING_TYPE_DIM
FROM 'D:\S3\fldw-in\TRAINING_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);