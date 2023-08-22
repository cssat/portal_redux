-- create cache_poc1ab_entries_params table

-- DROP TABLE portal_redux.cache_poc1ab_entries_params;
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
