-- create SUBSTANCE_ABUSE_WIZARD_FACT table

-- DROP TABLE portal_redux.SUBSTANCE_ABUSE_WIZARD_FACT;
CREATE TABLE portal_redux.SUBSTANCE_ABUSE_WIZARD_FACT (
	ID_SUBSTANCE_ABUSE_WIZARD_FACT int NULL,
	ID_SUBSTANCE_ABUSE int NULL,
	ID_INVESTIGATION_ASSESSMENT_FACT int NULL,
	ID_PEOPLE_DIM_SUBJECT int NULL,
	CD_DRUG_ALCOHOL_PROBLEM int NULL,
	TX_DRUG_ALCOHOL_PROBLEM varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_REFER_CHEM_DEP_SRVS int NULL,
	TX_REFER_CHEM_DEP_SRVS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SUBST_ABUSE_SRVS int NULL,
	TX_SUBST_ABUSE_SRVS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_ALCOHOL_DURING_TWELVE_MOS tinyint NULL,
	FL_ALCOHOL_PRIOR_TWELVE_MOS tinyint NULL,
	FL_DRUG_DURING_TWELVE_MOS tinyint NULL,
	FL_DRUG_PRIOR_TWELVE_MOS tinyint NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_PRSN_SUBJECT int NULL,
	CONSTRAINT fk_SUBSTANCE_ABUSE_WIZARD_FACT_ID_PEOPLE_DIM_SUBJECT FOREIGN KEY (ID_PEOPLE_DIM_SUBJECT) REFERENCES portal_redux.PEOPLE_DIM(ID_PEOPLE_DIM)
);

-- load table data

BULK INSERT portal_redux.SUBSTANCE_ABUSE_WIZARD_FACT
FROM 'D:\S3\fldw-in\SUBSTANCE_ABUSE_WIZARD_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);