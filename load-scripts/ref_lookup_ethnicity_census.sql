-- create ref_lookup_race_census table

-- DROP TABLE portal_redux.ref_lookup_race_census;
CREATE TABLE portal_redux.ref_lookup_race_census (
	cd_race_census int NOT NULL,
	tx_race_census varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT ct_pk_cd_race_census PRIMARY KEY (cd_race_census)
);