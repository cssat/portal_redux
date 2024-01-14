-- create ref_service_category table

DROP TABLE IF EXISTS portal_redux.ref_service_category;
CREATE TABLE portal_redux.ref_service_category (
	cd_srvc int NOT NULL,
	tx_srvc varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_subctgry int NULL,
	tx_subctgry varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_budget_poc_frc int NULL,
	tx_budget_poc_frc varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_subctgry_poc_frc int NULL,
	tx_subctgry_poc_frc varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_plc_svc int NOT NULL,
	fl_prim_plc_svc int NOT NULL,
	fl_prim_plc_svc_all int NOT NULL,
	fl_ihs_svc int DEFAULT 0 NULL,
	fl_pcit int NULL,
	fl_home_based_svc int NULL,
	fl_family_preservation_svc int NULL,
	fl_functional_family_therapy int NULL,
	fl_alternate_response int NULL,
	fl_ifps int NULL,
	fl_brs int DEFAULT 0 NOT NULL,
	last_update_dt datetime NULL,
	CONSTRAINT PK_ref_service_category PRIMARY KEY (cd_srvc)
);