-- create INVESTIGATION_ASSESSMENT_FACT table

-- DROP TABLE portal_redux.INVESTIGATION_ASSESSMENT_FACT;
CREATE TABLE portal_redux.INVESTIGATION_ASSESSMENT_FACT (
	ID_INVESTIGATION_ASSESSMENT_FACT int NOT NULL,
	ID_INVS int NULL,
	ID_CALENDAR_DIM_LEVEL1_APPROVED int NULL,
	ID_CALENDAR_DIM_LEVEL2_APPROVED int NULL,
	ID_CASE_DIM int NULL,
	ID_DISPOSITION_DIM int NULL,
	ID_INVESTIGATION_TYPE_DIM int NULL,
	ID_LOCATION_DIM int NULL,
	ID_PROVIDER_DIM int NULL,
	ID_WORKER_DIM int NULL,
	QT_DAYS_LEVEL1_APPROVAL int NULL,
	QT_DAYS_LEVEL2_APPROVAL int NULL,
	FL_EXPUNGED varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_CASE int NULL,
	ID_PRVD_ORG int NULL,
	CONSTRAINT PK_ID_INVESTIGATION_ASSESSMENT_FACT PRIMARY KEY (ID_INVESTIGATION_ASSESSMENT_FACT),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_CALENDAR_DIM_LEVEL1_APPROVED FOREIGN KEY (ID_CALENDAR_DIM_LEVEL1_APPROVED) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_CALENDAR_DIM_LEVEL2_APPROVED FOREIGN KEY (ID_CALENDAR_DIM_LEVEL2_APPROVED) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_CASE_DIM FOREIGN KEY (ID_CASE_DIM) REFERENCES portal_redux.CASE_DIM(ID_CASE_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_DISPOSITION_DIM FOREIGN KEY (ID_DISPOSITION_DIM) REFERENCES portal_redux.DISPOSITION_DIM(ID_DISPOSITION_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_INVESTIGATION_TYPE_DIM FOREIGN KEY (ID_INVESTIGATION_TYPE_DIM) REFERENCES portal_redux.INVESTIGATION_TYPE_DIM(ID_INVESTIGATION_TYPE_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_LOCATION_DIM FOREIGN KEY (ID_LOCATION_DIM) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_PROVIDER_DIM FOREIGN KEY (ID_PROVIDER_DIM) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_INVESTIGATION_ASSESSMENT_FACT_ID_WORKER_DIM FOREIGN KEY (ID_WORKER_DIM) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM)
);

-- load table data

BULK INSERT portal_redux.INVESTIGATION_ASSESSMENT_FACT
FROM 'D:\S3\fldw-in\INVESTIGATION_ASSESSMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);