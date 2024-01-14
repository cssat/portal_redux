-- create prtl_tables_last_update table

-- DROP TABLE portal_redux.prtl_tables_last_update;
CREATE TABLE portal_redux.prtl_tables_last_update (
	tbl_id int NOT NULL,
	tbl_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	last_build_date datetime NULL,
	row_count bigint NULL,
	load_time_mins int NULL,
	CONSTRAINT PK__prtl_tab__58302C19A26ADF5A PRIMARY KEY (tbl_id)
);