-- recreate tbl_case_dim table
DROP TABLE IF EXISTS portal_redux.tbl_case_dim;
CREATE TABLE portal_redux.tbl_case_dim (
	id_case				INT				NOT NULL,
	cd_case_type		INT				NULL,
	tx_case_type		VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dt_case_opn			DATETIME		NOT NULL,
	dt_case_cls			DATETIME		NOT NULL,
	cseq				BIGINT			NULL,
	case_opn_days		INT				NULL,
	cd_region			INT				NULL,
	cd_office			INT				NULL,
	cd_county			INT				NULL,
	tbl_refresh_dt		DATETIME		NULL,
    CONSTRAINT pk_tbl_case_dim PRIMARY KEY (id_case, dt_case_opn, dt_case_cls)
);
