-- create age_dim table

-- DROP TABLE portal_redux.age_dim;
CREATE TABLE portal_redux.age_dim (
	age_mo int NOT NULL,
	age_yr int NULL,
	census_child_group_cd int NULL,
	census_child_group_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	census_20_group_cd int NULL,
	census_20_group_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	census_all_group_cd int NULL,
	census_all_group_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	custom_group_cd int NULL,
	custom_group_tx int NULL,
	developmental_age_cd int NULL,
	developmental_age_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	school_age_cd int NULL,
	school_age_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cdc_age_cd int NULL,
	cdc_age_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cdc_census_mix_age_cd int NULL,
	cdc_census_mix_age_tx varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);