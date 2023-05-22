-- create PLACEMENT_FACT table

-- DROP TABLE portal_redux.PLACEMENT_FACT;
CREATE TABLE portal_redux.PLACEMENT_FACT (
	ID_PLACEMENT_FACT int NOT NULL,
	ID_EPSD int NOT NULL,
	ID_REMOVAL_EPISODE_FACT int NULL,
	ID_CALENDAR_DIM_BEGIN int NULL,
	ID_CALENDAR_DIM_END int NULL,
	ID_CALENDAR_DIM_RMVL int NULL,
	ID_CASE_DIM int NOT NULL,
	ID_LOCATION_DIM_PLACEMENT int NULL,
	ID_LOCATION_DIM_REMOVAL int NULL,
	ID_LOCATION_DIM_WORKER int NULL,
	ID_PEOPLE_DIM_CHILD int NULL,
	ID_PLACEMENT_CARE_AUTH_DIM int NULL,
	ID_PLACEMENT_DISCHARGE_REASON_DIM int NULL,
	ID_PLACEMENT_RESULT_DIM int NULL,
	ID_PLACEMENT_TYPE_DIM int NULL,
	ID_PROVIDER_DIM_CAREGIVER int NULL,
	ID_SERVICE_TYPE_DIM int NULL,
	CD_REL int NULL,
	TX_REL varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_CITY_SAME_AS_REMOVAL tinyint NULL,
	FL_COUNTY_SAME_AS_REMOVAL tinyint NULL,
	FL_REGION_SAME_AS_REMOVAL tinyint NULL,
	FL_STATE_SAME_AS_REMOVAL tinyint NULL,
	FL_ZIP_SAME_AS_REMOVAL tinyint NULL,
	QT_DAYS_CLOSURE_LAG int NULL,
	CHILD_AGE_PLACEMENT_BEGIN int NULL,
	CHILD_AGE_PLACEMENT_END int NULL,
	LENGTH_OF_STAY int NULL,
	ID_LEGAL_STATUS_DIM int NULL,
	ID_PRSN_CHILD int NULL,
	ID_CASE int NULL,
	ID_PRVD_ORG_CAREGIVER int NULL,
	CONSTRAINT PK_PLACEMENT_FACT PRIMARY KEY (ID_PLACEMENT_FACT),
	CONSTRAINT fk_PLACEMENT_FACT_ID_CALENDAR_DIM_BEGIN FOREIGN KEY (ID_CALENDAR_DIM_BEGIN) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_CALENDAR_DIM_END FOREIGN KEY (ID_CALENDAR_DIM_END) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_CALENDAR_DIM_RMVL FOREIGN KEY (ID_CALENDAR_DIM_RMVL) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_CASE_DIM FOREIGN KEY (ID_CASE_DIM) REFERENCES portal_redux.CASE_DIM(ID_CASE_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_LEGAL_STATUS_DIM FOREIGN KEY (ID_LEGAL_STATUS_DIM) REFERENCES portal_redux.LEGAL_STATUS_DIM(ID_LEGAL_STATUS_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_LOCATION_DIM_PLACEMENT FOREIGN KEY (ID_LOCATION_DIM_PLACEMENT) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_LOCATION_DIM_REMOVAL FOREIGN KEY (ID_LOCATION_DIM_REMOVAL) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_LOCATION_DIM_WORKER FOREIGN KEY (ID_LOCATION_DIM_WORKER) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_PEOPLE_DIM_CHILD FOREIGN KEY (ID_PEOPLE_DIM_CHILD) REFERENCES portal_redux.PEOPLE_DIM(ID_PEOPLE_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_PLACEMENT_CARE_AUTH_DIM FOREIGN KEY (ID_PLACEMENT_CARE_AUTH_DIM) REFERENCES portal_redux.PLACEMENT_CARE_AUTH_DIM(ID_PLACEMENT_CARE_AUTH_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_PLACEMENT_RESULT_DIM FOREIGN KEY (ID_PLACEMENT_RESULT_DIM) REFERENCES portal_redux.PLACEMENT_RESULT_DIM(ID_PLACEMENT_RESULT_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_PLACEMENT_TYPE_DIM FOREIGN KEY (ID_PLACEMENT_TYPE_DIM) REFERENCES portal_redux.PLACEMENT_TYPE_DIM(ID_PLACEMENT_TYPE_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_PROVIDER_DIM_CAREGIVER FOREIGN KEY (ID_PROVIDER_DIM_CAREGIVER) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_PLACEMENT_FACT_ID_REMOVAL_EPISODE_FACT FOREIGN KEY (ID_REMOVAL_EPISODE_FACT) REFERENCES portal_redux.REMOVAL_EPISODE_FACT(ID_REMOVAL_EPISODE_FACT),
	CONSTRAINT fk_PLACEMENT_FACT_ID_SERVICE_TYPE_DIM FOREIGN KEY (ID_SERVICE_TYPE_DIM) REFERENCES portal_redux.SERVICE_TYPE_DIM(ID_SERVICE_TYPE_DIM)
);

-- load table data

BULK INSERT portal_redux.PLACEMENT_FACT
FROM 'D:\S3\fldw-in\PLACEMENT_FACT.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);