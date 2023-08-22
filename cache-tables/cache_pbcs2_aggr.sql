-- create cache_pbcs2_aggr table

-- DROP TABLE portal_redux.cache_pbcs2_aggr;
CREATE TABLE portal_redux.cache_pbcs2_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	[month] int NOT NULL,
	among_first_cmpt_rereferred decimal(9,2) NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(21,0) NULL,
	qry_id int NOT NULL,
	start_year int NULL
);