-- create ABUSE_FACT table

-- DROP TABLE portal_redux.ABUSE_FACT;
CREATE TABLE portal_redux.ABUSE_FACT (
	ID_ABUSE_FACT int NOT NULL,
	ID_CPS int NULL,
	ID_PRSN_VCTM int NULL,
	ID_CALENDAR_DIM_FOUNDED int NULL,
	ID_CALENDAR_DIM_INCIDENT int NULL,
	ID_CALENDAR_DIM_REFERRED int NULL,
	ID_CASE_DIM int NULL,
	ID_LOCATION_DIM_INCIDENT int NULL,
	ID_LOCATION_DIM_INTAKE_WORKER int NULL,
	ID_LOCATION_DIM_INVESTIGATION_WORKER int NULL,
	ID_LOCATION_DIM_PRIMARY_WORKER int NULL,
	ID_PEOPLE_DIM_VICTIM int NULL,
	ID_PLACEMENT_TYPE_DIM int NULL,
	ID_PROVIDER_DIM int NULL,
	ID_WORKER_DIM_PRIMARY int NULL,
	CHILD_AGE tinyint NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_CASE int NULL,
	ID_PRVD_ORG int NULL,
	CONSTRAINT PK_ID_ABUSE_FACT PRIMARY KEY (ID_ABUSE_FACT),
	CONSTRAINT fk_ID_CALENDAR_DIM_INCIDENT FOREIGN KEY (ID_CALENDAR_DIM_INCIDENT) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_ID_CALENDAR_DIM_REFERRED FOREIGN KEY (ID_CALENDAR_DIM_REFERRED) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_ID_CASE_DIM FOREIGN KEY (ID_CASE_DIM) REFERENCES portal_redux.CASE_DIM(ID_CASE_DIM),
	CONSTRAINT fk_ID_LOCATION_DIM_INCIDENT FOREIGN KEY (ID_LOCATION_DIM_INCIDENT) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_ID_LOCATION_DIM_INTAKE_WORKER FOREIGN KEY (ID_LOCATION_DIM_INTAKE_WORKER) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_ID_LOCATION_DIM_PRIMARY_WORKER FOREIGN KEY (ID_LOCATION_DIM_PRIMARY_WORKER) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_ID_PEOPLE_DIM_VICTIM FOREIGN KEY (ID_PEOPLE_DIM_VICTIM) REFERENCES portal_redux.PEOPLE_DIM(ID_PEOPLE_DIM),
	CONSTRAINT fk_ID_PLACEMENT_TYPE_DIM FOREIGN KEY (ID_PLACEMENT_TYPE_DIM) REFERENCES portal_redux.PLACEMENT_TYPE_DIM(ID_PLACEMENT_TYPE_DIM),
	CONSTRAINT fk_ID_PROVIDER_DIM FOREIGN KEY (ID_PROVIDER_DIM) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_ID_WORKER_DIM_PRIMARY FOREIGN KEY (ID_WORKER_DIM_PRIMARY) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM),
	CONSTRAINT fk_id_calendar_dim_founded FOREIGN KEY (ID_CALENDAR_DIM_FOUNDED) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM)
);

-- load table data

BULK INSERT portal_redux.ABUSE_FACT
FROM 'D:\S3\fldw-in\ABUSE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);