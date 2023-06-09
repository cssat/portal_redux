-- create LICENSE_ACTION_FACT table

-- DROP TABLE portal_redux.LICENSE_ACTION_FACT;
CREATE TABLE portal_redux.LICENSE_ACTION_FACT (
	ID_LICENSE_ACTION_FACT int NOT NULL,
	ID_LCNS int NULL,
	ID_LCNS_ACTN int NULL,
	ID_CALENDAR_DIM_ACTION int NULL,
	ID_LICENSE_ATTRIB_DIM int NULL,
	ID_PROVIDER_DIM int NULL,
	CD_ACTN varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_ACTN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ACTN_RSN int NULL,
	TX_ACTN_RSN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ACTN_RSN2 int NULL,
	TX_ACTN_RSN2 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_PRVD_ORG int NULL,
	CONSTRAINT pk_ID_LICENSE_ACTION_FACT PRIMARY KEY (ID_LICENSE_ACTION_FACT),
	CONSTRAINT fk_LICENSE_ACTION_FACT_ID_CALENDAR_DIM_ACTION FOREIGN KEY (ID_CALENDAR_DIM_ACTION) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_LICENSE_ACTION_FACT_ID_LICENSE_ATTRIB_DIM FOREIGN KEY (ID_LICENSE_ATTRIB_DIM) REFERENCES portal_redux.LICENSE_ATTRIB_DIM(ID_LICENSE_ATTRIB_DIM),
	CONSTRAINT fk_LICENSE_ACTION_FACT_ID_PROVIDER_DIM FOREIGN KEY (ID_PROVIDER_DIM) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM)
);

-- load table data

BULK INSERT portal_redux.LICENSE_ACTION_FACT
FROM 'D:\S3\fldw-in\LICENSE_ACTION_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);