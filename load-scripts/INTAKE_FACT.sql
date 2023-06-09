-- create INTAKE_FACT table

-- DROP TABLE portal_redux.INTAKE_FACT;
CREATE TABLE portal_redux.INTAKE_FACT (
	ID_INTAKE_FACT int NOT NULL,
	ID_ACCESS_REPORT int NULL,
	ID_POLICE_REPORT varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_CALENDAR_DIM_ACCESS_RCVD int NULL,
	ID_CALENDAR_DIM_CPS_SPVR_DSCN int NULL,
	ID_CALENDAR_DIM_INCD int NULL,
	ID_CALENDAR_DIM_SPVR_DSCN int NULL,
	ID_CALENDAR_DIM_WRKR_DSCN int NULL,
	ID_CASE_DIM int NULL,
	ID_INTAKE_ATTRIBUTE_DIM int NULL,
	ID_INTAKE_TYPE_DIM int NULL,
	ID_LOCATION_DIM_INTAKE_WORKER int NULL,
	ID_PROVIDER_DIM_INTAKE int NULL,
	ID_RESPONSE_TIME_EXP_DIM int NULL,
	ID_WORKER_DIM_CPS_SUPERVISOR int NULL,
	ID_WORKER_DIM_INTAKE int NULL,
	ID_WORKER_DIM_INTAKE_SUPERVISOR int NULL,
	DT_ACCESS_RCVD datetime NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_CASE int NULL,
	ID_PRVD_ORG_INTAKE int NULL,
	ID_INVS int NULL,
	ID_FACP int NULL,
	CD_INTAKE_VERSION int NULL,
	CONSTRAINT PK_INTAKE_FACT PRIMARY KEY (ID_INTAKE_FACT),
	CONSTRAINT fk_INTAKE_FACT_ID_CALENDAR_DIM_ACCESS_RCVD FOREIGN KEY (ID_CALENDAR_DIM_ACCESS_RCVD) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_CALENDAR_DIM_CPS_SPVR_DSCN FOREIGN KEY (ID_CALENDAR_DIM_CPS_SPVR_DSCN) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_CALENDAR_DIM_INCD FOREIGN KEY (ID_CALENDAR_DIM_INCD) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_CALENDAR_DIM_SPVR_DSCN FOREIGN KEY (ID_CALENDAR_DIM_SPVR_DSCN) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_CALENDAR_DIM_WRKR_DSCN FOREIGN KEY (ID_CALENDAR_DIM_WRKR_DSCN) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_CASE_DIM FOREIGN KEY (ID_CASE_DIM) REFERENCES portal_redux.CASE_DIM(ID_CASE_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_INTAKE_ATTRIBUTE_DIM FOREIGN KEY (ID_INTAKE_ATTRIBUTE_DIM) REFERENCES portal_redux.INTAKE_ATTRIBUTE_DIM(ID_INTAKE_ATTRIBUTE_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_INTAKE_TYPE_DIM FOREIGN KEY (ID_INTAKE_TYPE_DIM) REFERENCES portal_redux.INTAKE_TYPE_DIM(ID_INTAKE_TYPE_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_LOCATION_DIM_INTAKE_WORKER FOREIGN KEY (ID_LOCATION_DIM_INTAKE_WORKER) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_PROVIDER_DIM_INTAKE FOREIGN KEY (ID_PROVIDER_DIM_INTAKE) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_RESPONSE_TIME_EXP_DIM FOREIGN KEY (ID_RESPONSE_TIME_EXP_DIM) REFERENCES portal_redux.RESPONSE_TIME_EXP_DIM(ID_RESPONSE_TIME_EXP_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_WORKER_DIM_CPS_SUPERVISOR FOREIGN KEY (ID_WORKER_DIM_CPS_SUPERVISOR) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_WORKER_DIM_INTAKE FOREIGN KEY (ID_WORKER_DIM_INTAKE) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM),
	CONSTRAINT fk_INTAKE_FACT_ID_WORKER_DIM_INTAKE_SUPERVISOR FOREIGN KEY (ID_WORKER_DIM_INTAKE_SUPERVISOR) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM)
);

-- load table data

BULK INSERT portal_redux.INTAKE_FACT
FROM 'D:\S3\fldw-in\INTAKE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);