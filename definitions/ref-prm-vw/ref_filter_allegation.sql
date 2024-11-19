-- create ref_filter_allegation table

-- DROP TABLE portal_redux.ref_filter_allegation;
CREATE TABLE portal_redux.ref_filter_allegation (
	cd_allegation INT NOT NULL,
	tx_allegation VARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_multiplier NUMERIC(9,0) NULL,
	fl_name VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	min_filter_date DATETIME NULL,
	CONSTRAINT PK_ref_filter_allegation PRIMARY KEY (cd_allegation)
);