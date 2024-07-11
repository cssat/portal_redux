-- create cache_pbcp5_aggr table

DROP TABLE IF EXISTS portal_redux.cache_pbcp5_aggr;
CREATE TABLE portal_redux.cache_pbcp5_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	cohort_exit_year datetime NOT NULL,
	cd_discharge_type int NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	reentry_within_month int NOT NULL,
	reentry_rate numeric(18,4) NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_all_param_key decimal(22,0) NOT NULL,
	qry_id int NOT NULL,
	exit_year int NULL,
	reentry_count int NULL,
	total_count int NULL
);


-- create cache_pbcp5_params table

DROP TABLE IF EXISTS portal_redux.cache_pbcp5_params;
CREATE TABLE portal_redux.cache_pbcp5_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_pbcp5 table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_pbcp5;
CREATE TABLE portal_redux.cache_qry_param_pbcp5 (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NULL
);


-- create cache_pbcw3_aggr table

DROP TABLE IF EXISTS portal_redux.cache_pbcw3_aggr;
CREATE TABLE portal_redux.cache_pbcw3_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	cohort_entry_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	family_setting_dcfs_prcntg numeric(9,2) DEFAULT NULL NULL,
	family_setting_private_agency_prcntg numeric(9,2) DEFAULT NULL NULL,
	relative_prcntg numeric(9,2) DEFAULT NULL NULL,
	group_inst_care_prcntg numeric(9,2) DEFAULT NULL NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	qry_id int NOT NULL,
	cohort_begin_year int DEFAULT NULL NULL,
	int_hash_key decimal(22,0) DEFAULT '0' NOT NULL
);


-- create cache_pbcw3_params table

DROP TABLE IF EXISTS portal_redux.cache_pbcw3_params;
CREATE TABLE portal_redux.cache_pbcw3_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_pbcw3 table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_pbcw3;
CREATE TABLE portal_redux.cache_qry_param_pbcw3 (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);


-- create cache_pbcw4_aggr table

DROP TABLE IF EXISTS portal_redux.cache_pbcw4_aggr;
CREATE TABLE portal_redux.cache_pbcw4_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	cohort_entry_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	kincare int NOT NULL,
	bin_sibling_group_size int NOT NULL,
	all_together decimal(9,2) NOT NULL,
	some_together decimal(9,2) NOT NULL,
	none_together decimal(9,2) NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	qry_id int NOT NULL,
	cohort_begin_year int NULL,
	int_hash_key decimal(22,0) NOT NULL,
	cnt_cohort int NOT NULL
);


-- create cache_pbcw4_params table

DROP TABLE IF EXISTS portal_redux.cache_pbcw4_params;
CREATE TABLE portal_redux.cache_pbcw4_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_pbcw4 table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_pbcw4;
CREATE TABLE portal_redux.cache_qry_param_pbcw4 (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key decimal(22,0) NOT NULL
);


-- create cache_poc1ab_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_aggr;
CREATE TABLE portal_redux.cache_poc1ab_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	custody_id int DEFAULT 0 NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	cnt_start_date int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(22,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	fl_include_perCapita int NULL
);
CREATE NONCLUSTERED INDEX idx_qry_id_start_year ON portal_redux.cache_poc1ab_aggr (  qry_id ASC  , start_year ASC  , county_cd ASC  , cd_race ASC  , age_grouping_cd ASC  , pk_gndr ASC  , cnt_start_date ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY ] ;


-- create cache_poc1ab_params table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_params;
CREATE TABLE portal_redux.cache_poc1ab_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_poc1ab table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc1ab;
CREATE TABLE portal_redux.cache_qry_param_poc1ab (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL,
	key_filter_id bigint NULL
);


-- create cache_outcomes_aggr table

DROP TABLE IF EXISTS portal_redux.cache_outcomes_aggr;
CREATE TABLE portal_redux.cache_outcomes_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	cohort_entry_date datetime NOT NULL,
	cd_discharge_type int NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	[month] int NOT NULL,
	rate numeric(18,2) NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(22,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	discharge_count int NULL,
	cohort_count int NULL
);


-- create cache_outcomes_params table

DROP TABLE IF EXISTS portal_redux.cache_outcomes_params;
CREATE TABLE portal_redux.cache_outcomes_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_outcomes table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_outcomes;
CREATE TABLE portal_redux.cache_qry_param_outcomes (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);


-- create cache_poc1ab_exits_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_exits_aggr;
CREATE TABLE portal_redux.cache_poc1ab_exits_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	custody_id int DEFAULT 0 NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	cd_discharge_type int NOT NULL,
	cnt_exits int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(22,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	fl_include_perCapita int NULL
);


-- create cache_poc1ab_exits_params table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_exits_params;
CREATE TABLE portal_redux.cache_poc1ab_exits_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_poc1ab_exits table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc1ab_exits;
CREATE TABLE portal_redux.cache_qry_param_poc1ab_exits (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);


-- create cache_poc1ab_entries_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_entries_aggr;
CREATE TABLE portal_redux.cache_poc1ab_entries_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_dep_cd int NOT NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	custody_id int DEFAULT 0 NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	cnt_entries int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(22,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	fl_include_perCapita int NULL
);


-- create cache_poc1ab_entries_params table

DROP TABLE IF EXISTS portal_redux.cache_poc1ab_entries_params;
CREATE TABLE portal_redux.cache_poc1ab_entries_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pk_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	init_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	long_cd_plcm_setng varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	county_cd varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_los_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_placement_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_dep_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_poc1ab_entries table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc1ab_entries;
CREATE TABLE portal_redux.cache_qry_param_poc1ab_entries (
	int_param_key bigint NOT NULL,
	bin_dep_cd int NULL,
	bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NOT NULL,
	long_cd_plcm_setng int NOT NULL,
	county_cd int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);


--  @prm_procedure_id is ID from ref_lookup_max_date :  0 means run all


CREATE procedure [portal_redux].[prod_build_cache_ooh_tables]( @prm_procedure_id int )
as
--  @prm_procedure_id is ID from ref_lookup_max_date :  0 means run all
--if @permission_key = (select cutoff_date from portal_redux.ref_Last_DW_Transfer )
begin
	declare @loop int
	declare @date varchar(50)
	declare @qry_id bigint
	declare @age_grouping_cd varchar(30)
	declare @race_cd varchar(30)
	declare @gender_cd varchar(10)
	declare @init_cd_plcm_setng varchar(30)
	declare @long_cd_plcm_setng varchar(30)
	declare @County_Cd  varchar(200)
	declare @bin_los_cd varchar(30) 
	declare @bin_placement_cd varchar(30) 
	declare @bin_ihs_svc_cd varchar(30) 
	declare  @cd_reporter_type varchar(100) 
	declare  @filter_access_type varchar(30) 
	declare  @filter_allegation  varchar(100)
	declare @filter_finding varchar(100)
	declare  @filter_service_category  varchar(100)
	declare  @filter_service_budget varchar(100)
	declare @bin_dep_cd varchar(20)
	declare @max_qry_id int
	declare @mysql varchar(5000)
	declare @flag_run_all_procedures  int
	declare @procedure_id int
	declare @loop_procedure int;
	declare @stop_loop_procedure int;
	declare @tbl_id varchar(2);
	declare @tbl_name varchar(300)
	declare @starttime datetime=getdate();
	declare @endtime datetime=getdate();
			
	set @procedure_id=@prm_procedure_id
	set @flag_run_all_procedures=0;	
	if  @procedure_id=0 set  @flag_run_all_procedures=1 
	
	set @max_qry_id = (select  max(qry_id) from  portal_redux.cache_ooh_params_backup )
		
	set @date='2000-01-01,' + convert(varchar(10),(select dateadd(mm,-1,[month]) from portal_redux.calendar_dim 
			where CALENDAR_DATE =(select cutoff_date from portal_redux.ref_Last_DW_Transfer)),121)

	if OBJECT_ID('tempDB..#params') is not null drop table #params
	select *
	into #params
	from portal_redux.cache_ooh_params_backup	
	where  qry_id <=@max_qry_id 
	order by qry_id asc

	if object_ID('tempDB..#procs') is not null drop table #procs;
	select id [procedure_id],[procedure_name] name,ROW_NUMBER() over (order by id) sort_key 
		into #procs from portal_redux.ref_lookup_max_date where is_current=1
		and charindex('ooh',[procedure_name])>0 and charindex('rate',[procedure_name])=0  and charindex('pvt',[procedure_name])=0 order by id
		
	set @loop_procedure=(select sort_key from #procs where procedure_id=@procedure_id);
	set @stop_loop_procedure=(select sort_key from #procs where procedure_id=@procedure_id);
	
	if @flag_run_all_procedures=1 
	begin
		set @loop_procedure=1 ;
		select @stop_loop_procedure=max(sort_key) from #procs;
	end;
		
	while @loop_procedure <=@stop_loop_procedure
	begin
			set @loop =1 
			select @procedure_id=procedure_id from #procs where sort_key=@loop_procedure;

			set @mysql='';
			set @loop=1;
			while @loop <=3
			begin
			set @mysql=@mysql + 'truncate table portal_redux.'
			set @mysql=@mysql + (select top 1 tbl_name from portal_redux.tbl_procedure_xwalk where procedure_id=@procedure_id  and tbl_seq_nbr=@loop ) + ';' +  char(13) + char(10)
			--select @mysql
			exec (@mysql);
				set @mysql=''; 
			set @loop+=1;
			end

			--if @procedure_id=19
			--	begin
			--		IF OBJECT_ID (N'portal_redux.PK_cache_poc1ab_aggr', N'PK') IS NOT NULL
			--			ALTER TABLE portal_redux.cache_poc1ab_aggr 
			--			DROP CONSTRAINT 	PK_cache_poc1ab_aggr;
			--	end
			
			set @starttime=getdate();
			while @loop <=@max_qry_id
			begin			
						SELECT @qry_id=[qry_ID]
							  ,@age_grouping_cd=[age_grouping_cd]
							  ,@race_cd=[cd_race_census]
							  ,@gender_cd=[pk_gndr]
							  ,@init_cd_plcm_setng=[init_cd_plcm_setng]
							  ,@long_cd_plcm_setng=[long_cd_plcm_setng]
							  ,@County_Cd=[county_cd]
							  ,@bin_los_cd=[bin_los_cd]
							  ,@bin_placement_cd=[bin_placement_cd]
							  ,@bin_ihs_svc_cd=[bin_ihs_svc_cd]
							  ,@cd_reporter_type=[cd_reporter_type]
							  ,@filter_access_type=[filter_access_type]
							  ,@filter_allegation=[filter_allegation]
							  ,@filter_finding=[filter_finding]
							  ,@filter_service_category=[filter_srvc_type]
							  ,@filter_service_budget=[filter_budget]
							  ,@bin_dep_cd=bin_dep_cd
						FROM #params
						where qry_ID=@loop

				
						if @procedure_id in  (19,24,25) and @age_grouping_cd='1,2,3,4,5,6,7' set @age_grouping_cd='1,2,3,4';
				
						set @mysql='exec portal_redux.'
						set   @mysql=@mysql + (select [procedure_name] from portal_redux.ref_lookup_max_Date where id=@procedure_id);

						set @mysql = @mysql + char(13) + char(10)  ;
						set @mysql=@mysql +   char(39) + @date   +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @age_grouping_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @race_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @gender_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @init_cd_plcm_setng +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @long_cd_plcm_setng +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @County_Cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @bin_los_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @bin_placement_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @bin_ihs_svc_cd +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) +  @cd_reporter_type +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) + @filter_access_type +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) + @filter_allegation +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) + @filter_finding +   char(39) + char(13) + char(10) + ',';
						--set @mysql=@mysql +   char(39) + @filter_service_category +   char(39) + char(13) + char(10) + ',';
						--set @mysql=@mysql +   char(39) + @filter_service_budget +   char(39) + char(13) + char(10) + ',';
						set @mysql=@mysql +   char(39) + @bin_dep_cd +   char(39) + char(13) + char(10) + ',0';

						exec (@mysql);
						set @mysql='';
						set @loop+= 1;
				end ;
					
				--if @procedure_id=19
				--begin
				--	IF OBJECT_ID (N'portal_redux.PK_cache_poc1ab_aggr', N'PK') IS NULL
				--		ALTER TABLE portal_redux.cache_poc1ab_aggr 
				--		ADD CONSTRAINT [PK_cache_poc1ab_aggr] PRIMARY KEY CLUSTERED (
				--					[qry_type] ASC,
				--					[date_type] ASC,
				--					[start_date] ASC,
				--					[int_hash_key] ASC
				--				)
				--end
				set @loop_procedure+=1;
				set @loop=1;
				while @loop <=3
				begin
					set @endtime=getdate();
					set @mysql=' ';
						
					set @mysql=@mysql + 'update portal_redux.prtl_tables_last_update' + char(13) + char(10)
					set @mysql=@mysql + 'set last_build_date=getdate()'  + char(13) + char(10)
					set @mysql=@mysql + ',row_count=(select count(*) from portal_redux.'  + ((select xwlk.tbl_name from portal_redux.prtl_tables_last_update  tbl join portal_redux.tbl_procedure_xwalk xwlk on tbl.tbl_id=xwlk.tbl_id where xwlk.procedure_id=@procedure_id and tbl_seq_nbr=@loop ) )
 +  ')' + char(13) + char(10)
					set @mysql=@mysql + ',load_time_mins=portal_redux.fnc_datediff_mis(' + char(39) + convert(varchar,@starttime) + char(39) + ',' + char(39) + convert(varchar,@endtime) + char(39) + ')'
					set @mysql=@mysql +'where tbl_id='  +   ((select convert(varchar(2),xwlk.tbl_id)  from portal_redux.prtl_tables_last_update  tbl join portal_redux.tbl_procedure_xwalk xwlk on tbl.tbl_id=xwlk.tbl_id where procedure_id=@procedure_id and tbl_seq_nbr=@loop ))  + char(13
) + char(10)
					
					--select @mysql
					exec (@mysql);
					
					set @loop+=1;
			end;
	 end;
end

