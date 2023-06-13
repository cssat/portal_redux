-- create ref_lookup_max_date table

-- DROP TABLE portal_redux.ref_lookup_max_date;
CREATE TABLE portal_redux.ref_lookup_max_date (
	id int NOT NULL,
	procedure_name nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	max_date_all datetime NULL,
	max_date_any datetime NULL,
	max_date_qtr datetime NULL,
	max_date_yr datetime NULL,
	min_date_any datetime NULL,
	is_current int NULL,
	CONSTRAINT PK_ref_lookup_max_date PRIMARY KEY (id)
);