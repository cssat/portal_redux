-- create ref_age_groupings_census table

-- DROP TABLE portal_redux.ref_age_groupings_census;
CREATE TABLE portal_redux.ref_age_groupings_census (
	age_grouping_cd int NOT NULL,
	age_begin int NOT NULL,
	age_lessthan_end int NOT NULL,
	age_grouping char(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_Age_Groupings_census PRIMARY KEY (age_grouping_cd)
);