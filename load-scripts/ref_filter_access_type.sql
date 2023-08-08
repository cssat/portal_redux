-- create ref_filter_access_type table

-- DROP TABLE portal_redux.ref_filter_access_type;
CREATE TABLE portal_redux.ref_filter_access_type (
	cd_access_type int NOT NULL,
	tx_access_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fl_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_multiplier decimal(18,0) NULL,
	filter_access_type int NOT NULL,
	min_filter_date datetime NULL,
	CONSTRAINT PK_ref_filter_access_type PRIMARY KEY (cd_access_type)
);