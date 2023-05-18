-- create PAYMENT_DIM definition

-- DROP TABLE portal_redux.PAYMENT_DIM;
CREATE TABLE portal_redux.PAYMENT_DIM (
	ID_PAYMENT_DIM int NOT NULL,
	CD_PAYMENT_SRVC_UNIT_TYPE int NULL,
	tx_PAYMENT_SRVC_UNIT_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_PAYMENT_DIM PRIMARY KEY (ID_PAYMENT_DIM)
);

-- load table data

BULK INSERT portal_redux.PAYMENT_DIM
FROM 'D:\S3\fldw-in\PAYMENT_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);