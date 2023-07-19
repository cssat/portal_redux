-- create ref_lookup_gender table

-- DROP TABLE portal_redux.ref_lookup_gender;
CREATE TABLE portal_redux.ref_lookup_gender (
	pk_gndr int NOT NULL,
	cd_gndr varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tx_gndr varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT ct_pk_gndr PRIMARY KEY (pk_gndr)
);