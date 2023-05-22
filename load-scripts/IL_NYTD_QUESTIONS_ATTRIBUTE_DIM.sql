-- create IL_NYTD_QUESTIONS_ATTRIBUTE_DIM table

-- DROP TABLE portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM;
CREATE TABLE portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM (
	ID_IL_NYTD_QUESTIONS_ATTRIBUTE_DIM int NOT NULL,
	CD_TYPE int NULL,
	TX_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PARTICIPATION_STATUS int NULL,
	TX_PARTICIPATION_STATUS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK__IL_NYTD___700D827FE9C38D65 PRIMARY KEY (ID_IL_NYTD_QUESTIONS_ATTRIBUTE_DIM)
);

-- load table data

BULK INSERT portal_redux.IL_NYTD_QUESTIONS_ATTRIBUTE_DIM
FROM 'D:\S3\fldw-in\IL_NYTD_QUESTIONS_ATTRIBUTE_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);