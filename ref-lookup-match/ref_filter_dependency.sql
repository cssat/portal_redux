-- create ref_filter_dependency table

-- DROP TABLE portal_redux.ref_filter_dependency;
CREATE TABLE portal_redux.ref_filter_dependency (
	bin_dep_cd INT NOT NULL,
	bin_dep_desc CHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	diff_days_from INT NULL,
	diff_days_thru INT NULL,
	fl_dep_exist TINYINT NULL,
	lag INT NULL,
	min_filter_date DATETIME NULL,
	CONSTRAINT PK_ref_filter_dependency PRIMARY KEY (bin_dep_cd)
);