-- create ref_filter_los table

-- DROP TABLE portal_redux.ref_filter_los;
CREATE TABLE portal_redux.ref_filter_los (
	bin_los_cd INT NOT NULL,
	bin_los_desc CHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dur_days_from INT NULL,
	dur_days_thru INT NULL,
	lag INT NULL,
	CONSTRAINT PK_ref_filter_los PRIMARY KEY (bin_los_cd)
);