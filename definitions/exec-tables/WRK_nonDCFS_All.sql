-- recreate WRK_nonDCFS_All table
DROP TABLE IF EXISTS portal_redux.WRK_nonDCFS_All;
CREATE TABLE portal_redux.WRK_nonDCFS_All (
    id_prsn						INT				NULL,
    cust_begin					DATETIME		NULL,
	cust_end					DATETIME		NULL,
	backtodcfs					INT				NULL,
	cd_placement_care_auth		INT				NULL,
	placement_care_auth			VARCHAR(16)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nondcfs_mark				INT				NOT NULL,
	tbl_refresh_dt				DATETIME		NULL
);
