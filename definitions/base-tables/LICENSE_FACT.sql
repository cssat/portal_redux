-- create LICENSE_FACT table

-- DROP TABLE portal_redux.LICENSE_FACT;
CREATE TABLE portal_redux.LICENSE_FACT (
	ID_LICENSE_FACT int NOT NULL,
	ID_BSNS int NULL,
	ID_LCNS int NULL,
	ID_CALENDAR_DIM_APPLICATION int NULL,
	ID_CALENDAR_DIM_CLOSED int NULL,
	ID_CALENDAR_DIM_EXPIRATION int NULL,
	ID_CALENDAR_DIM_ISSUE int NULL,
	ID_LICENSE_ATTRIB_DIM int NULL,
	ID_LOCATION_DIM int NULL,
	ID_PROVIDER_DIM int NULL,
	ID_WORKER_DIM int NULL,
	FL_AGE_GROUP1 tinyint NULL,
	FL_AGE_GROUP2 tinyint NULL,
	FL_AGE_GROUP3 tinyint NULL,
	FL_BRS tinyint NULL,
	FL_FOSTER_CARE_LEVEL1 tinyint NULL,
	FL_FOSTER_CARE_LEVEL2 tinyint NULL,
	FL_FOSTER_CARE_LEVEL3 tinyint NULL,
	FL_FOSTER_CARE_LEVEL4 tinyint NULL,
	FL_NEW_LCNS tinyint NULL,
	FL_RESPITE tinyint NULL,
	QT_AGE_FROM_MONTH tinyint NULL,
	QT_AGE_FROM_YEAR tinyint NULL,
	QT_AGE_TO_MONTH tinyint NULL,
	QT_AGE_TO_YEAR tinyint NULL,
	QT_CHILDREN_UNDER_TWO_MAXIMUM int NULL,
	QT_EITHER_CAP int NULL,
	QT_FEMALE_CAP int NULL,
	QT_MALE_CAP int NULL,
	QT_PENDING_DAYS int NULL,
	QT_TOTAL_CAP int NULL,
	ID_PRVD_ORG int NULL,
	CONSTRAINT PK_ID_LICENSE_FACT PRIMARY KEY (ID_LICENSE_FACT),
	CONSTRAINT fk_LICENSE_FACT_ID_CALENDAR_DIM_APPLICATION FOREIGN KEY (ID_CALENDAR_DIM_APPLICATION) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_CALENDAR_DIM_CLOSED FOREIGN KEY (ID_CALENDAR_DIM_CLOSED) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_CALENDAR_DIM_EXPIRATION FOREIGN KEY (ID_CALENDAR_DIM_EXPIRATION) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_CALENDAR_DIM_ISSUE FOREIGN KEY (ID_CALENDAR_DIM_ISSUE) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_LICENSE_ATTRIB_DIM FOREIGN KEY (ID_LICENSE_ATTRIB_DIM) REFERENCES portal_redux.LICENSE_ATTRIB_DIM(ID_LICENSE_ATTRIB_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_LOCATION_DIM FOREIGN KEY (ID_LOCATION_DIM) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_PROVIDER_DIM FOREIGN KEY (ID_PROVIDER_DIM) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_LICENSE_FACT_ID_WORKER_DIM FOREIGN KEY (ID_WORKER_DIM) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM)
);

-- load table data

BULK INSERT portal_redux.LICENSE_FACT
FROM 'D:\S3\fldw-in\LICENSE_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);