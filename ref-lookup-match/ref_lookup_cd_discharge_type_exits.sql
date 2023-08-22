-- create ref_lookup_cd_discharge_type_exits table

-- DROP TABLE portal_redux.ref_lookup_cd_discharge_type_exits;
CREATE TABLE portal_redux.ref_lookup_cd_discharge_type_exits (
	cd_discharge_type int NULL,
	discharge_type varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	alt_discharge_type varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);