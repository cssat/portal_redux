-- create ref_filter_allegation table

-- DROP TABLE portal_redux.ref_filter_allegation;
CREATE TABLE portal_redux.ref_filter_allegation (
	cd_allegation int NOT NULL,
	tx_allegation varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_multiplier numeric(9,0) NULL,
	fl_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	min_filter_date datetime NULL,
	CONSTRAINT PK_ref_filter_allegation PRIMARY KEY (cd_allegation)
);