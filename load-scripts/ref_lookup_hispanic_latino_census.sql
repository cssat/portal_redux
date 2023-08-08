-- create ref_lookup_hispanic_latino_census table

-- DROP TABLE portal_redux.ref_lookup_hispanic_latino_census;
CREATE TABLE portal_redux.ref_lookup_hispanic_latino_census (
	census_hispanic_latino_origin_cd int NOT NULL,
	census_hispanic_latino_origin varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_race_census int NULL,
	CONSTRAINT PK_ref_lookup_hispanic_latino_census PRIMARY KEY (census_hispanic_latino_origin_cd)
);