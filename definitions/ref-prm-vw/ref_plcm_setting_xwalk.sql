-- create ref_plcm_setting_xwalk table

-- DROP TABLE portal_redux.ref_plcm_setting_xwalk;
CREATE TABLE portal_redux.ref_plcm_setting_xwalk (
	cd_plcm_setng int NOT NULL,
	tx_plcm_setng varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	berk_tx_plcm_setng varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	berk_cd_plcm_setng int NULL,
	CONSTRAINT PK__ref_plcm__83BC689B69190855 PRIMARY KEY (cd_plcm_setng)
);