-- create PROVIDER_PART_FACT table

-- DROP TABLE portal_redux.PROVIDER_PART_FACT;
CREATE TABLE portal_redux.PROVIDER_PART_FACT (
	ID_PROVIDER_PART_FACT int NOT NULL,
	ID_BSNS int NULL,
	ID_PRSN int NULL,
	ID_PRVD_ORG int NULL,
	ID_CALENDAR_DIM_END int NULL,
	ID_CALENDAR_DIM_START int NULL,
	ID_PEOPLE_DIM int NULL,
	ID_PROVIDER_DIM_CAREGIVER int NULL,
	CD_ROLE int NULL,
	TX_ROLE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RSN_END int NULL,
	TX_RSN_END varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RSN_START int NULL,
	TX_RSN_START varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TS_CR datetime NULL,
	CONSTRAINT PK_ID_PROVIDER_PART_FACT PRIMARY KEY (ID_PROVIDER_PART_FACT),
	CONSTRAINT fk_PROVIDER_PART_FACT_ID_CALENDAR_DIM_END FOREIGN KEY (ID_CALENDAR_DIM_END) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_PROVIDER_PART_FACT_ID_CALENDAR_DIM_START FOREIGN KEY (ID_CALENDAR_DIM_START) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_PROVIDER_PART_FACT_ID_PEOPLE_DIM FOREIGN KEY (ID_PEOPLE_DIM) REFERENCES portal_redux.PEOPLE_DIM(ID_PEOPLE_DIM),
	CONSTRAINT fk_PROVIDER_PART_FACT_ID_PROVIDER_DIM_CAREGIVER FOREIGN KEY (ID_PROVIDER_DIM_CAREGIVER) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM)
);

-- load table data

BULK INSERT portal_redux.PROVIDER_PART_FACT
FROM 'D:\S3\fldw-in\PROVIDER_PART_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);