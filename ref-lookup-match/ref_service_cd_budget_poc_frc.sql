-- create ref_service_cd_budget_poc_frc table

-- DROP TABLE portal_redux.ref_service_cd_budget_poc_frc;
CREATE TABLE portal_redux.ref_service_cd_budget_poc_frc (
	cd_budget_poc_frc int NOT NULL,
	tx_budget_poc_frc varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	multiplier numeric(38,0) NULL,
	power_10 int NULL,
	fl_plc_svc int NULL,
	fl_ihs_svc int NULL,
	CONSTRAINT PK_ref_service_cd_budget_poc_frc PRIMARY KEY (cd_budget_poc_frc)
);