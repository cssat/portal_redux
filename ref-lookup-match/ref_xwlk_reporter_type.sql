-- create ref_xwlk_reporter_type table

-- DROP TABLE portal_redux.ref_xwlk_reporter_type;
CREATE TABLE portal_redux.ref_xwlk_reporter_type (
	cd_reporter_type int NOT NULL,
	tx_reporter_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	collapsed_cd_reporter_type int NULL,
	collapsed_tx_reporter_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_xwlk_reporter_type PRIMARY KEY (cd_reporter_type)
);