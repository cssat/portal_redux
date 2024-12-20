-- recreate tbl_ihs_episodes table
DROP TABLE IF EXISTS portal_redux.tbl_ihs_episodes;
CREATE TABLE portal_redux.tbl_ihs_episodes (
	id_ihs_episode								INT				NULL,
	id_case										INT				NOT NULL,
	case_sort									BIGINT			NOT NULL,
	ihs_begin_date								DATETIME		NOT NULL,
	ihs_end_date								DATETIME		NULL,
	first_ihs_date								DATETIME		NULL,
	latest_ihs_date								DATETIME		NULL,
	intake_county_cd							INT				NULL,
	intake_zip									NVARCHAR(10)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_plcmnt_prior_ihs							INT				NULL,
	plcmnt_date									DATETIME		NULL,
	days_from_rfrd_date							INT				NULL,
	nbr_svc_paid								INT				NULL,
	total_amt_paid								NUMERIC(18,2)	NULL,
	most_exp_cd_srvc							INT				NULL,
	most_exp_tx_srvc							VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	total_most_exp_srvc							NUMERIC(18,2)	NULL,
	fl_family_focused_services					INT				NULL,
	fl_child_care								INT				NULL,
	fl_therapeutic_services						INT				NULL,
	fl_behavioral_rehabiliation_services		INT				NULL,
	fl_other_therapeutic_living_situations		INT				NULL,
	fl_specialty_adolescent_services			INT				NULL,
	fl_respite									INT				NULL,
	fl_transportation							INT				NULL,
	fl_ihs_reun									INT				NULL,
	fl_concrete_goods							INT				NULL,
	fl_budget_C12								INT				NULL,
	fl_budget_C14								INT				NULL,
	fl_budget_C19								INT				NULL,
	fl_uncat_svc								INT				NULL,
	cd_asgn_type								INT				NULL,
	tx_asgn_type								VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_force_end_date							INT				NULL,
	min_id_table_origin							INT				NULL,
	max_id_table_origin							INT				NULL,
	cnt_id_table_origin							INT				NULL,
	dtl_min_id_payment_fact						INT				NOT NULL,
	dtl_max_id_payment_fact						INT				NOT NULL,
	tbl_origin									VARCHAR(50)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tbl_origin_cd								INT				NULL,
	id_intake_fact								INT				NULL,
	rfrd_date									DATETIME		NULL,
	cd_sib_age_grp								INT				NULL,
	cd_race_census_hh							INT				NULL,
	census_hispanic_latino_origin_cd_hh			INT				NULL,
	fl_first_IHS_after_intake					INT				NULL,
	nxt_placement_date							DATETIME		NULL,
	int_filter_service_category					INT				NULL,
	CONSTRAINT pk_tbl_ihs_episodes PRIMARY KEY (id_case, ihs_begin_date)
);
CREATE NONCLUSTERED INDEX idx_id_ihs_episode ON portal_redux.tbl_ihs_episodes (id_ihs_episode ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_intake_fact ON portal_redux.tbl_ihs_episodes (id_intake_fact ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_ihs_begin_date ON portal_redux.tbl_ihs_episodes (ihs_begin_date ASC, ihs_end_date ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_ihs_end_date ON portal_redux.tbl_ihs_episodes (ihs_end_date ASC, ihs_begin_date ASC)
    WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_param_filter ON portal_redux.tbl_ihs_episodes (cd_race_census_hh ASC, census_hispanic_latino_origin_cd_hh ASC, cd_sib_age_grp ASC, intake_county_cd ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
