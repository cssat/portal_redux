-- create INTAKE_PARTICIPANT_ROLES_DIM table

-- DROP TABLE portal_redux.INTAKE_PARTICIPANT_ROLES_DIM;
CREATE TABLE portal_redux.INTAKE_PARTICIPANT_ROLES_DIM (
	ID_INTAKE_PARTICIPANT_ROLES_DIM int NOT NULL,
	CD_ROLE1 int NULL,
	TX_ROLE1 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ROLE2 int NULL,
	TX_ROLE2 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ROLE3 int NULL,
	TX_ROLE3 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ROLE4 int NULL,
	TX_ROLE4 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_ROLE5 int NULL,
	TX_ROLE5 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	CONSTRAINT pk_id_intake_participant_roles_dim PRIMARY KEY (ID_INTAKE_PARTICIPANT_ROLES_DIM)
);

-- load table data

BULK INSERT portal_redux.INTAKE_PARTICIPANT_ROLES_DIM
FROM 'D:\S3\fldw-in\INTAKE_PARTICIPANT_ROLES_DIM.TXT'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);