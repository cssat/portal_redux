-- create LICENSE_ATTRIB_DIM table

-- DROP TABLE portal_redux.LICENSE_ATTRIB_DIM;
CREATE TABLE portal_redux.LICENSE_ATTRIB_DIM (
	ID_LICENSE_ATTRIB_DIM int NOT NULL,
	ID_LCNS int NULL,
	CD_APPLICATION_STATUS int NULL,
	TX_LICENSE_APPLICATION_STATUS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CHILD_SPECIFIC_FOSTER_HOME char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_LICENSE_CHILD_SPECIFIC varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_FACILITY_TYPE int NULL,
	TX_LICENSE_FACILITY_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LCNS_STAT int NULL,
	TX_LCNS_STAT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LCNS_TYPE int NULL,
	TX_LCNS_TYPE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LICENSE_CERTIFICATE int NULL,
	TX_LICENSE_CERTIFICATE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LICENSE_REASON int NULL,
	TX_LICENSE_REASON varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_GENDER varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT PK_LICENSE_ATTRIB_DIM PRIMARY KEY (ID_LICENSE_ATTRIB_DIM)
);

-- load table data

BULK INSERT portal_redux.LICENSE_ATTRIB_DIM
FROM 'D:\S3\fldw-in\LICENSE_ATTRIB_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);