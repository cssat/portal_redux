-- create SERVICE_REFERRAL_DIM table

-- DROP TABLE portal_redux.SERVICE_REFERRAL_DIM;
CREATE TABLE portal_redux.SERVICE_REFERRAL_DIM (
	ID_SERVICE_REFERRAL_DIM int NOT NULL,
	CD_SERVICE_REFERRAL_TYPE int NULL,
	TX_SERVICE_REFERRAL_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SPECIFIC_SERVICE_REQUESTED int NULL,
	NM_SPECIFIC_SERVICE_REQUESTED varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_RQST_SRVC_POSITION int NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_ID_SERVICE_REFERRAL_DIM PRIMARY KEY (ID_SERVICE_REFERRAL_DIM)
);

-- load table data

BULK INSERT portal_redux.SERVICE_REFERRAL_DIM
FROM 'D:\S3\fldw-in\SERVICE_REFERRAL_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);