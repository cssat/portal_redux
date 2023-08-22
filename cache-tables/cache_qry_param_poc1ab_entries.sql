-- create cache_qry_param_poc1ab_entries table

-- DROP TABLE portal_redux.cache_qry_param_poc1ab_entries;
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