-- create ref_lookup_plcmnt table

-- DROP TABLE portal_redux.ref_lookup_plcmnt;
CREATE TABLE portal_redux.ref_lookup_plcmnt (
	cd_plcm_setng int NOT NULL,
	tx_plcm_setng varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_lookup_plcmnt PRIMARY KEY (cd_plcm_setng)
);