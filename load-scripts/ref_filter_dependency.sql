-- create ref_filter_dependency table

-- DROP TABLE portal_redux.ref_filter_dependency;
CREATE TABLE portal_redux.ref_filter_dependency (
	bin_dep_cd int NOT NULL,
	bin_dep_desc char(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	diff_days_from int NULL,
	diff_days_thru int NULL,
	fl_dep_exist tinyint NULL,
	lag int NULL,
	min_filter_date datetime NULL,
	CONSTRAINT PK_ref_filter_dependency PRIMARY KEY (bin_dep_cd)
);