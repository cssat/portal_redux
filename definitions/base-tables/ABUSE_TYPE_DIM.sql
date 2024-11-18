-- recreate ABUSE_TYPE_DIM table

DROP TABLE IF EXISTS portal_redux.ABUSE_TYPE_DIM;
CREATE TABLE portal_redux.ABUSE_TYPE_DIM (
	id_abuse_type_dim	INT				NOT NULL,
	cd_allegation		INT				NULL,
	tx_allegation		VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dt_row_begin 		DATETIME		NULL,
	dt_row_end 			DATETIME		NULL,
	id_cycle 			INT				NULL,
	is_current 			CHAR(1)			COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT pk_id_abuse_type_dim PRIMARY KEY (id_abuse_type_dim)
);
