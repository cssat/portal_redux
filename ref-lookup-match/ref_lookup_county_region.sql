-- create ref_lookup_county_region table

-- DROP TABLE portal_redux.ref_lookup_county_region;
CREATE TABLE portal_redux.ref_lookup_county_region (
	county_cd INT NULL,
	county VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	region_cd INT NULL,
	old_region_cd INT NULL,
	region_6_cd SMALLINT NULL,
	region_6_tx VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	small_fl SMALLINT NULL
);