-- recreate placement_payment_services table
DROP TABLE IF EXISTS portal_redux.placement_payment_services;
CREATE TABLE portal_redux.placement_payment_services (
	id_prsn_child								INT					NOT NULL,
	begin_date									DATETIME			NOT NULL,
	end_date									DATETIME			NOT NULL,
	id_removal_episode_fact						INT					NOT NULL,
	id_placement_fact							INT					NOT NULL,
	id_provider_dim_caregiver					INT					NULL,
	id_case										INT					NOT NULL,
	dur_days									INT					NULL,
	fl_close									INT					NULL,
	id_payment_fact								INT					NOT NULL,
	svc_begin_date								DATETIME			NOT NULL,
	svc_end_date								DATETIME			NULL,
	pymt_cd_srvc								INT					NOT NULL,
	pymt_tx_srvc								VARCHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_primary_srvc								INT					NOT NULL,
	srvc_match									INT					NOT NULL,
	prov_match									INT					NOT NULL,
	rate										NUMERIC(9,4)		NULL,
	unit										NUMERIC(9,2)		NULL,
	total_paid									NUMERIC(18,2)		NULL,
	cd_budget_poc_frc							INT					NULL,
	tx_budget_poc_frc							VARCHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_subctgry_poc_frc							INT					NULL,
	tx_subctgry_poc_frc							VARCHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_plc_svc									INT					NULL,
	fl_dup_payment								INT					NULL,
	plcm_pymnt_sort_asc							INT					NULL,
	filter_service_category_todate				DECIMAL(21,0)		NULL,
	filter_service_budget_todate				DECIMAL(9,0)		NULL,
	fl_family_focused_services					INT					NULL,
	fl_child_care								INT					NULL,
	fl_therapeutic_services						INT					NULL,
	fl_mh_services								INT					NULL,
	fl_receiving_care							INT					NULL,
	fl_family_home_placements					INT					NULL,
	fl_behavioral_rehabiliation_services		INT					NULL,
	fl_other_therapeutic_living_situations		INT					NULL,
	fl_specialty_adolescent_services			INT					NULL,
	fl_respite									INT					NULL,
	fl_transportation							INT					NULL,
	fl_clothing_incidentals						INT					NULL,
	fl_sexually_aggressive_youth				INT					NULL,
	fl_adoption_support							INT					NULL,
	fl_various									INT					NULL,
	fl_medical									INT					NULL,
	fl_ihs_reun									INT					NULL,
	fl_concrete_goods							INT					NULL,
	fl_budget_c12								INT					NULL,
	fl_budget_c14								INT					NULL,
	fl_budget_c15								INT					NULL,
	fl_budget_c16								INT					NULL,
	fl_budget_c18								INT					NULL,
	fl_budget_c19								INT					NULL,
	fl_uncat_svc								INT					NULL,
	CONSTRAINT pk_placement_payment_services PRIMARY KEY (id_payment_fact)
);
CREATE NONCLUSTERED INDEX idx_filter_service_category_to_date ON portal_redux.placement_payment_services (filter_service_category_todate ASC)
	INCLUDE (begin_date, cd_budget_poc_frc, cd_subctgry_poc_frc, dur_days, end_date, filter_service_budget_todate, fl_adoption_support, fl_behavioral_rehabiliation_services, fl_budget_C12, fl_budget_C14, fl_budget_C15, fl_budget_C16, fl_budget_C18, fl_budget_C19, fl_child_care, fl_close, fl_clothing_incidentals, fl_dup_payment, fl_family_focused_services, fl_family_home_placements, fl_medical, fl_mh_services, fl_other_therapeutic_living_situations, fl_plc_svc, fl_primary_srvc, fl_receiving_care, fl_respite, fl_sexually_aggressive_youth, fl_specialty_adolescent_services, fl_therapeutic_services, fl_transportation, fl_uncat_svc, fl_various, id_case, id_payment_fact, id_placement_fact, id_provider_dim_caregiver, id_prsn_child, id_removal_episode_fact, plcm_pymnt_sort_asc, prov_match, pymt_cd_srvc, pymt_tx_srvc, rate, srvc_match, svc_begin_date, svc_end_date, total_paid, tx_budget_poc_frc, tx_subctgry_poc_frc, unit) 
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_placement_fact ON portal_redux.placement_payment_services (id_placement_fact ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_prsn_child ON portal_redux.placement_payment_services (id_prsn_child ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_removal_episode_fact ON portal_redux.placement_payment_services (id_removal_episode_fact ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_pps_id_placement_fact ON portal_redux.placement_payment_services (pymt_cd_srvc ASC)
	INCLUDE (id_placement_fact)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
