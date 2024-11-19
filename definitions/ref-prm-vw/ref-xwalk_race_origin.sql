-- create ref_xwalk_race_origin table

DROP TABLE IF EXISTS portal_redux.ref_xwalk_race_origin;
CREATE TABLE portal_redux.ref_xwalk_race_origin (
	cd_race_census int NOT NULL,
	census_hispanic_latino_origin_cd int NOT NULL,
	CONSTRAINT PK_ref_xwalk_race_origin PRIMARY KEY (cd_race_census,census_hispanic_latino_origin_cd)
);