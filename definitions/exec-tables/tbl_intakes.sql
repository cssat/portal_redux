-- recreate tbl_intakes table
DROP TABLE IF EXISTS portal_redux.tbl_intakes;
CREATE TABLE portal_redux.tbl_intakes (
    id_intake_fact							INT				NOT NULL,
	id_case									INT				NOT NULL,
	id_investigation_assessment_fact		INT				NULL,
	id_safety_assessment_fact				INT				NULL,
	rfrd_date								DATETIME		NULL,
	inv_ass_start							DATETIME		NULL,
	inv_ass_stop							DATETIME		NULL,
	ia_cmplt_dt								DATE			NULL,
	screen_in_spvr_dcsn_dt					DATE			NULL,
	cd_access_type							INT				NULL,
	tx_access_type							VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_invs_type							INT				NULL,
	tx_invs_type							CHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_invs_disp							INT				NULL,
	tx_invs_disp							CHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	close_id_assgn_fact						INT				NULL,
	close_assgn_begin_dt					DATETIME		NULL,
	close_assgn_end_dt						DATETIME		NULL,
	close_assgn_cd_rmts_wrkr_type			INT				NULL,
	close_assgn_tx_rmts_wrkr_type			VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_spvr_rsn								INT				NULL,
	tx_spvr_rsn								VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_final_decision						INT				NULL,
	tx_final_decision						VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_asgn_type							INT				NULL,
	tx_asgn_type							VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_asgn_rspns							INT				NULL,
	tx_asgn_rspns							VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_reporter								INT				NULL,
	tx_reporter								VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_people_dim_hh						INT				NULL,
	id_prsn_hh								INT				NULL,
	pk_gndr									INT				NULL,
	dt_birth								DATETIME		NULL,
	is_current								INT				NULL,
	cd_race_census							INT				NULL,
	census_hispanic_latino_origin_cd		INT				NULL,
	cd_sib_age_grp							INT				NULL,
	cd_office_first_worker					INT				NULL,
	tx_office_first_worker					VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_region								INT				NULL,
	fl_ihs_90_day							INT				NULL,
	fl_phys_abuse							INT				NULL,
	fl_sexual_abuse							INT				NULL,
	fl_neglect								INT				NULL,
	fl_other_maltreatment					INT				NULL,
	fl_allegation_any						INT				NULL,
	fl_founded_phys_abuse					INT				NULL,
	fl_founded_sexual_abuse					INT				NULL,
	fl_founded_neglect						INT				NULL,
	fl_founded_other_maltreatment			INT				NULL,
	fl_founded_any_legal					INT				NULL,
	fl_prior_phys_abuse						INT				NULL,
	fl_prior_sexual_abuse					INT				NULL,
	fl_prior_neglect						INT				NULL,
	fl_prior_other_maltreatment				INT				NULL,
	fl_prior_allegation_any					INT				NULL,
	fl_founded_prior_phys_abuse				INT				NULL,
	fl_founded_prior_sexual_abuse			INT				NULL,
	fl_founded_prior_neglect				INT				NULL,
	fl_founded_prior_other_maltreatment		INT				NULL,
	fl_founded_prior_any_legal				INT				NULL,
	fl_hh_is_mother							INT				NULL,
	fl_cps_invs								INT				NOT NULL,
	fl_cfws									INT				NOT NULL,
	fl_risk_only							INT				NOT NULL,
	fl_alternate_intervention				INT				NOT NULL,
	fl_frs									INT				NOT NULL,
	fl_reopen_case							INT				NOT NULL,
	fl_dlr									INT				NOT NULL,
	fl_far									INT				NULL,
	cnt_children_at_intake					INT				NULL,
	first_intake_date						DATETIME		NULL,
	latest_intake_date						DATETIME		NULL,
	nbr_intakes								INT				NULL,
	nbr_cps_intakes							INT				NULL,
	intake_rank								INT				NOT NULL,
	fl_ooh_prior_this_referral				INT				NULL,
	fl_ooh_after_this_referral				INT				NULL,
	case_nxt_intake_dt						DATETIME		NULL,
	id_access_report						INT				NULL,
	intake_zip								NVARCHAR(10)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	intake_county_cd						INT				NULL,
	first_worker_id_prsn					INT				NULL,
	first_worker_type						VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT pk_tbl_intakes PRIMARY KEY (id_intake_fact)
);
CREATE NONCLUSTERED INDEX idx_783ld4kg ON portal_redux.tbl_intakes (cd_final_decision ASC)
	INCLUDE (cd_race_census, cd_reporter, cd_sib_age_grp, census_hispanic_latino_origin_cd, fl_allegation_any, fl_alternate_intervention, fl_cfws, fl_cps_invs, fl_dlr, fl_far, fl_founded_any_legal, fl_founded_neglect, fl_founded_other_maltreatment, fl_founded_phys_abuse, fl_founded_prior_any_legal, fl_founded_prior_neglect, fl_founded_prior_other_maltreatment, fl_founded_prior_phys_abuse, fl_founded_prior_sexual_abuse, fl_founded_sexual_abuse, fl_frs, fl_neglect, fl_other_maltreatment, fl_phys_abuse, fl_prior_allegation_any, fl_prior_neglect, fl_prior_other_maltreatment, fl_prior_phys_abuse, fl_prior_sexual_abuse, fl_risk_only, fl_sexual_abuse, id_intake_fact, intake_county_cd)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_cd_final_decision ON portal_redux.tbl_intakes (cd_final_decision ASC)
	INCLUDE (fl_alternate_intervention, fl_cfws, fl_cps_invs, fl_founded_neglect, fl_founded_other_maltreatment, fl_founded_phys_abuse, fl_founded_prior_neglect, fl_founded_prior_other_maltreatment, fl_founded_prior_phys_abuse, fl_founded_prior_sexual_abuse, fl_founded_sexual_abuse, fl_frs, fl_hh_is_mother, fl_neglect, fl_other_maltreatment, fl_phys_abuse, fl_prior_neglect, fl_prior_other_maltreatment, fl_prior_phys_abuse, fl_prior_sexual_abuse, fl_risk_only, fl_sexual_abuse, id_intake_fact, inv_ass_start)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_cps_874 ON portal_redux.tbl_intakes (fl_cps_invs ASC)
	INCLUDE (id_investigation_assessment_fact, inv_ass_stop)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_dafsdf ON portal_redux.tbl_intakes (id_access_report ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_final_decision ON portal_redux.tbl_intakes (cd_final_decision ASC)
	INCLUDE (cd_reporter, fl_allegation_any, fl_alternate_intervention, fl_cfws, fl_cps_invs, fl_dlr, fl_far, fl_founded_any_legal, fl_founded_neglect, fl_founded_other_maltreatment, fl_founded_phys_abuse, fl_founded_prior_any_legal, fl_founded_prior_neglect, fl_founded_prior_other_maltreatment, fl_founded_prior_phys_abuse, fl_founded_prior_sexual_abuse, fl_founded_sexual_abuse, fl_frs, fl_neglect, fl_other_maltreatment, fl_phys_abuse, fl_prior_allegation_any, fl_prior_neglect, fl_prior_other_maltreatment, fl_prior_phys_abuse, fl_prior_sexual_abuse, fl_risk_only, fl_sexual_abuse, id_intake_fact)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_final_decision_incl_intk_alg_fnd ON portal_redux.tbl_intakes (cd_final_decision ASC)
	INCLUDE (fl_allegation_any, fl_founded_any_legal, fl_founded_neglect, fl_founded_other_maltreatment, fl_founded_phys_abuse, fl_founded_prior_any_legal, fl_founded_prior_neglect, fl_founded_prior_other_maltreatment, fl_founded_prior_phys_abuse, fl_founded_prior_sexual_abuse, fl_founded_sexual_abuse, fl_neglect, fl_other_maltreatment, fl_phys_abuse, fl_prior_allegation_any, fl_prior_neglect, fl_prior_other_maltreatment, fl_prior_phys_abuse, fl_prior_sexual_abuse, fl_sexual_abuse, id_intake_fact)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_tbl_intakes ON portal_redux.tbl_intakes (fl_reopen_case ASC)
	INCLUDE (cd_access_type, cd_final_decision, fl_cps_invs, inv_ass_start)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_tbl_intakes_filters ON portal_redux.tbl_intakes (id_intake_fact ASC)
	INCLUDE (cd_reporter, fl_alternate_intervention, fl_cfws, fl_cps_invs, fl_frs, fl_risk_only)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
