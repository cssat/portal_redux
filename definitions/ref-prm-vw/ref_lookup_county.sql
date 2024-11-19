-- create ref_lookup_county table

-- DROP TABLE portal_redux.ref_lookup_county;
CREATE TABLE portal_redux.ref_lookup_county (
	county_cd INT NOT NULL,
	county_desc VARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_region INT NULL,
	old_region_cd INT NULL,
	old_region_desc VARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	countyfips INT NULL,
	CONSTRAINT PK_ref_lookup_county PRIMARY KEY (county_cd)
);