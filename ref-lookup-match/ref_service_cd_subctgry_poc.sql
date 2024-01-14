-- CA_ODS.dbo.ref_service_cd_subctgry_poc table

-- DROP TABLE portal_redux.ref_service_cd_subctgry_poc;
CREATE TABLE portal_redux.ref_service_cd_subctgry_poc (
	cd_subctgry_poc_frc int NOT NULL,
	tx_subctgry_poc_frc varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	multiplier numeric(38,0) NULL,
	power_10 int NULL,
	[ordering] smallint NULL,
	fl_plc_svc int NULL,
	fl_ihs_svc int NULL
);