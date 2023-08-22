-- create cache_poc1ab_entries_aggr table

-- DROP TABLE portal_redux.cache_poc1ab_entries_aggr;
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