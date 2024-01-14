-- create ref_filter_reporter_type table

-- DROP TABLE portal_redux.ref_filter_reporter_type;
CREATE TABLE portal_redux.ref_filter_reporter_type (
	cd_reporter_type INT NOT NULL,
	tx_reporter_type VARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_filter_reporter_type PRIMARY KEY (cd_reporter_type)
);