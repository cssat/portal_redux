-- create ref_lookup_county table

-- DROP TABLE portal_redux.ref_lookup_county;
CREATE TABLE portal_redux.ref_lookup_county (
	county_cd int NOT NULL,
	county_desc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_region int NULL,
	old_region_cd int NULL,
	old_region_desc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	countyfips int NULL,
	CONSTRAINT PK_ref_lookup_county PRIMARY KEY (county_cd)
);