-- create tbl_ihs_episodes table

-- DROP TABLE portal_redux.tbl_ihs_episodes;
CREATE TABLE portal_redux.tbl_ihs_episodes (
	id_ihs_episode int NULL,
	id_case int NOT NULL,
	case_sort bigint NOT NULL,
	ihs_begin_date datetime NOT NULL,
	ihs_end_date datetime NULL,
	first_ihs_date datetime NULL,
	latest_ihs_date datetime NULL,
	intake_county_cd int NULL,
	intake_zip nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_plcmnt_prior_ihs int NULL,
	plcmnt_date datetime NULL,
	days_from_rfrd_date int NULL,
	nbr_svc_paid int NULL,
	total_amt_paid numeric(18,2) NULL,
	most_exp_cd_srvc int NULL,
	most_exp_tx_srvc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	total_most_exp_srvc numeric(18,2) NULL,
	fl_family_focused_services int NULL,
	fl_child_care int NULL,
	fl_therapeutic_services int NULL,
	fl_behavioral_rehabiliation_services int NULL,
	fl_other_therapeutic_living_situations int NULL,
	fl_specialty_adolescent_services int NULL,
	fl_respite int NULL,
	fl_transportation int NULL,
	fl_ihs_reun int NULL,
	fl_concrete_goods int NULL,
	fl_budget_C12 int NULL,
	fl_budget_C14 int NULL,
	fl_budget_C19 int NULL,
	fl_uncat_svc int NULL,
	cd_asgn_type int NULL,
	tx_asgn_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_force_end_date int NULL,
	min_id_table_origin int NULL,
	max_id_table_origin int NULL,
	cnt_id_table_origin int NULL,
	dtl_min_id_payment_fact int NOT NULL,
	dtl_max_id_payment_fact int NOT NULL,
	tbl_origin varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tbl_origin_cd int NULL,
	id_intake_fact int NULL,
	rfrd_date datetime NULL,
	cd_sib_age_grp int NULL,
	cd_race_census_hh int NULL,
	census_hispanic_latino_origin_cd_hh int NULL,
	fl_first_IHS_after_intake int NULL,
	nxt_placement_date datetime NULL,
	int_filter_service_category int NULL,
	CONSTRAINT PK__tbl_ihs___B37E54A96EAE6C63 PRIMARY KEY (id_case,ihs_begin_date)
);
CREATE NONCLUSTERED INDEX idx_id_ihs_episode ON portal_redux.tbl_ihs_episodes (  id_ihs_episode ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ] ;
CREATE NONCLUSTERED INDEX idx_id_intake_fact ON portal_redux.tbl_ihs_episodes (  id_intake_fact ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ] ;
CREATE NONCLUSTERED INDEX idx_ihs_begin_date ON portal_redux.tbl_ihs_episodes (  ihs_begin_date ASC  , ihs_end_date ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ] ;
CREATE NONCLUSTERED INDEX idx_ihs_end_date ON portal_redux.tbl_ihs_episodes (  ihs_end_date ASC  , ihs_begin_date ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ] ;
CREATE NONCLUSTERED INDEX idx_param_filter ON portal_redux.tbl_ihs_episodes (  cd_race_census_hh ASC  , census_hispanic_latino_origin_cd_hh ASC  , cd_sib_age_grp ASC  , intake_county_cd ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ];