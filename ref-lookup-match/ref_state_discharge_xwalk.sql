-- create ref_state_discharge_xwalk table

-- DROP TABLE portal_redux.ref_state_discharge_xwalk;
CREATE TABLE portal_redux.ref_state_discharge_xwalk (
	cd_dsch_rsn int NOT NULL,
	tx_dsch_rsn varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	state_discharge_reason_code int NULL,
	cd_discharge_type int NULL,
	discharge_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__ref_stat__DCC2BBBE80CF95A7 PRIMARY KEY (cd_dsch_rsn)
);