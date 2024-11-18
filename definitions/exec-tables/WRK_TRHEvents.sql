-- recreate WRK_TRHEvents table
DROP TABLE IF EXISTS portal_redux.WRK_TRHEvents;
CREATE TABLE portal_redux.WRK_TRHEvents (
    id_prsn_child				INT				NOT NULL,
    id_removal_episode_fact		INT				NULL,
	trh_begin					DATETIME		NULL,
	trh_end						DATETIME		NULL,
	trhtype						INT				NOT NULL,
	trhmark						INT				NOT NULL,
	n_trh						INT				NULL,
	daysctrh_tot				INT				NULL,
	fl_ret_to_care				VARCHAR(1)		COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fl_last_eps_oh_plcmnt		VARCHAR(1)		COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	tbl_refresh_dt				DATETIME		NULL
);
