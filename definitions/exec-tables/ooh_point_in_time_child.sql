-- recreate ooh_point_in_time_child table
DROP TABLE IF EXISTS portal_redux.ooh_point_in_time_child;
CREATE TABLE portal_redux.ooh_point_in_time_child (
	id_prsn_child							INT				NOT NULL,
	point_in_time_date						DATETIME		NOT NULL,
	id_removal_episode_fact					INT				NOT NULL,
	id_placement_fact						INT				NULL,
	removal_dt								DATETIME		NULL,
	discharge_dt							DATETIME		NULL,
	begin_date								DATETIME		NOT NULL,
	end_date								DATETIME		NULL,
	date_type								INT				NOT NULL,
	qry_type								INT				NOT NULL,
	row_num									BIGINT			NULL,
	birth_dt								DATE			NULL,
	bin_dep_cd								INT				NOT NULL,
	bin_placement_cd						INT				NOT NULL,
	max_bin_los_cd							INT				NOT NULL,
	bin_ihs_svc_cd							INT				NOT NULL,
	cd_reporter_type						INT				NOT NULL,
	filter_access_type						INT				NOT NULL,
	filter_allegation						INT				NOT NULL,
	filter_finding							INT				NOT NULL,
	pk_gndr									INT				NOT NULL,
	cd_race_census							INT				NOT NULL,
	census_hispanic_latino_origin_cd		INT				NOT NULL,
	init_cd_plcm_setng						INT				NOT NULL,
	long_cd_plcm_setng						INT				NOT NULL,
	pit_county_cd							INT				NOT NULL,
	age_grouping_cd_census					INT				NOT NULL,
	age_grouping_cd_mix						INT				NOT NULL,
	dur_days								INT				NULL,
	int_match_param_key_census				INT				NOT NULL,
	int_match_param_key_mix					INT				NOT NULL,
	plctypc									INT				NULL,
	plctypc_desc							CHAR(200)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	qualevt_w3w4							INT				NULL,
	kinmark									INT				NULL,
	tempevt									INT				NULL,
	cd_plcm_setng							INT				NULL,
	curr_prtl_cd_plcm_setng					INT				NULL,
	fl_out_trial_return_home				INT				NOT NULL,
	CONSTRAINT pk_ooh_point_in_time_child PRIMARY KEY (id_prsn_child, point_in_time_date, date_type,qry_type)
);
CREATE NONCLUSTERED INDEX idx_id_removal_episode_fact ON portal_redux.ooh_point_in_time_child (id_removal_episode_fact ASC)  
	INCLUDE (age_grouping_cd_census, age_grouping_cd_mix, bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, cd_race_census, cd_reporter_type, census_Hispanic_Latino_Origin_cd, date_type, filter_access_type, filter_allegation, filter_finding, fl_out_trial_return_home, id_placement_fact, id_prsn_child, init_cd_plcm_setng, int_match_param_key_census, int_match_param_key_mix, kinmark, long_cd_plcm_setng, max_bin_los_cd, pit_county_cd, pk_gndr, plctypc, plctypc_desc, point_in_time_date, qry_type, qualevt_w3w4, tempevt) 
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_ooh_point_in_time_child_BX8W3 ON portal_redux.ooh_point_in_time_child (point_in_time_date ASC, date_type ASC, qry_type ASC, pit_county_cd ASC)  
	INCLUDE (cd_race_census, id_prsn_child) 
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_pbcw4_1 ON portal_redux.ooh_point_in_time_child (id_placement_fact ASC)  
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
