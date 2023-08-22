-- create ref_filter_los table

-- DROP TABLE portal_redux.ref_filter_los;
CREATE TABLE portal_redux.ref_filter_los (
	bin_los_cd int NOT NULL,
	bin_los_desc char(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dur_days_from int NULL,
	dur_days_thru int NULL,
	lag int NULL,
	CONSTRAINT PK_ref_filter_los PRIMARY KEY (bin_los_cd)
);