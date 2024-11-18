-- recreate ASSIGNMENT_ATTRIBUTE_DIM table

DROP TABLE IF EXISTS portal_redux.ASSIGNMENT_ATTRIBUTE_DIM;
CREATE TABLE portal_redux.ASSIGNMENT_ATTRIBUTE_DIM (
	id_assignment_attribute_dim		INT				NOT	NULL,
	cd_asgn_ctgry					INT				NULL,
	tx_asgn_ctgry					VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_asgn_role					INT				NULL,
	tx_asgn_role					VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_asgn_RSPNS					INT				NULL,
	tx_asgn_RSPNS					VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_asgn_type					INT				NULL,
	tx_asgn_type					VARCHAR(200)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	dt_row_begin					DATETIME		NULL,
	dt_row_end						DATETIME		NULL,
	id_cycle						INT				NULL,
	is_current						INT				NULL,
	CONSTRAINT pk_id_assignment_attribute_dim PRIMARY KEY (id_assignment_attribute_dim)
);
