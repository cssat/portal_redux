-- create CASE_PARTICIPANT_FACT table

-- DROP TABLE portal_redux.CASE_PARTICIPANT_FACT;
CREATE TABLE portal_redux.CASE_PARTICIPANT_FACT (
	ID_CASE_PARTICIPANT_FACT int NOT NULL,
	ID_CASE int NULL,
	ID_PRSN int NULL,
	ID_CASE_DIM int NULL,
	ID_PEOPLE_DIM int NULL,
	ID_CASE_PARTICIPANT_STATUS_DIM int NULL,
	FL_ACTIVE_PARTICIPANT int NULL,
	CONSTRAINT PK_ID_CASE_PARTICIPANT_FACT PRIMARY KEY (ID_CASE_PARTICIPANT_FACT)
);

-- load table data

BULK INSERT portal_redux.CASE_PARTICIPANT_FACT
FROM 'D:\S3\fldw-in\CASE_PARTICIPANT_FACT.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);