-- create ref_braam_race table

DROP TABLE IF EXISTS portal_redux.ref_braam_race;
CREATE TABLE portal_redux.ref_braam_race (
	cd_braam_race int NOT NULL,
	tx_braam_race varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_ethinicty int NULL
);