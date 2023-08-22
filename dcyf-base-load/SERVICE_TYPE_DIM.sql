-- create SERVICE_TYPE_DIM table

-- DROP TABLE portal_redux.SERVICE_TYPE_DIM;
CREATE TABLE portal_redux.SERVICE_TYPE_DIM (
	ID_SERVICE_TYPE_DIM int NOT NULL,
	CD_PAYMENT_TYPE int NULL,
	TX_PAYMENT_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SERVICE_CONCURRENCY int NULL,
	TX_SERVICE_CONCURRENCY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SOCIAL_SRV_PAYMENT_SYS_SRV_CODE int NULL,
	CD_SRVC int NULL,
	TX_SRVC varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SRVC_CTGRY int NULL,
	TX_SRVC_CTGRY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SSPS_REASON char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SUBCTGRY int NULL,
	TX_SUBCTGRY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_UNIT_RATE_TYPE int NULL,
	TX_UNIT_RATE_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_ELIGIBLE_IVE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_FUNDING_IV_E char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_IV_E_PENETRATION_RATE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	FL_RGAP char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ID_SERVICE_TYPE_DIM PRIMARY KEY (ID_SERVICE_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.SERVICE_TYPE_DIM
FROM 'D:\S3\fldw-in\SERVICE_TYPE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);