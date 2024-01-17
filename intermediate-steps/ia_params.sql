-- create ia_params table

DROP TABLE IF EXISTS portal_redux.ia_params;
CREATE TABLE portal_redux.ia_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_county varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);