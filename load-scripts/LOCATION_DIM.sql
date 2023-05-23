-- create LOCATION_DIM table

-- DROP TABLE portal_redux.LOCATION_DIM;
CREATE TABLE portal_redux.LOCATION_DIM (
	ID_LOCATION_DIM int NOT NULL,
	CD_CNTY varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_CNTY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LCTN int NULL,
	TX_LCTN varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_OFFICE int NULL,
	TX_OFFICE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_REGION int NULL,
	TX_REGION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_TOWN int NULL,
	TX_TOWN varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_UNIT int NULL,
	TX_UNIT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ACTIVE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RGN int NULL,
	CD_STATE varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ZIP varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	zip_5 varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CITY_TYPE varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_CITY_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_LOCATION_DIM PRIMARY KEY (ID_LOCATION_DIM)
);

-- load table data

BULK INSERT portal_redux.LOCATION_DIM
FROM 'D:\S3\fldw-in\LOCATION_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);