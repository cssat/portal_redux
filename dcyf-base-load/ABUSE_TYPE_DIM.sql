-- create ABUSE_TYPE_DIM table

-- DROP TABLE portal_redux.ABUSE_TYPE_DIM;
CREATE TABLE portal_redux.ABUSE_TYPE_DIM (
	ID_ABUSE_TYPE_DIM int NOT NULL,
	CD_ALLEGATION int NULL,
	TX_ALLEGATION varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ID_ABUSE_TYPE_DIM PRIMARY KEY (ID_ABUSE_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.ABUSE_TYPE_DIM
FROM 'D:\S3\fldw-in\ABUSE_TYPE_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);