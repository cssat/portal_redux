-- create cache_qry_param_pbcs2 table

-- DROP TABLE portal_redux.cache_qry_param_pbcs2;
CREATE TABLE portal_redux.cache_qry_param_pbcs2 (
	int_param_key bigint NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	qry_id int NOT NULL,
	int_all_param_key numeric(12,0) NOT NULL
);