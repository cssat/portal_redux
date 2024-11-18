-- recreate tbl_ihs_services table
DROP TABLE IF EXISTS portal_redux.tbl_ihs_services;
CREATE TABLE portal_redux.tbl_ihs_services (
	id_ihs_episode				INT				NOT NULL,
	dtl_id_payment_fact			INT				NOT NULL,
	id_case						INT				NULL,
	id_prsn						INT				NULL,
	prsn_age					INT				NULL,
	srvc_dt_begin				DATETIME		NOT NULL,
	srvc_dt_end					DATETIME		NULL,
	cd_srvc						INT				NULL,
	tx_srvc						VARCHAR(40)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	am_rate						FLOAT			NULL,
	am_units					FLOAT			NULL,
	am_total_paid				NUMERIC(18,2)	NULL,
	id_service_type_dim			INT				NULL,
	id_provider_dim_service		INT				NULL,
	cd_unit_rate_type			INT				NULL,
	tx_unit_rate_type			VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_srvc_ctgry				INT				NULL,
	tx_srvc_ctgry				VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_budget_poc_frc			INT				NULL,
	tx_budget_poc_frc			VARCHAR(100)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_subctgry_poc_frc			INT				NULL,
	tx_subctgry_poc_frc			VARCHAR(100)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dur_days					INT				NULL,
	ihs_rank					INT				NOT NULL,
	fl_no_pay					INT				NULL,
	CONSTRAINT pk_tbl_ihs_services PRIMARY KEY (id_ihs_episode, dtl_id_payment_fact)
);
CREATE NONCLUSTERED INDEX idx_id_ihs_episode ON portal_redux.tbl_ihs_services (id_ihs_episode ASC)
    WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];