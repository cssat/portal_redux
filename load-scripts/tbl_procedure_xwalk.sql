-- create tbl_procedure_xwalk table

-- DROP TABLE portal_redux.tbl_procedure_xwalk;
CREATE TABLE portal_redux.tbl_procedure_xwalk (
	procedure_id int NOT NULL,
	tbl_id int NOT NULL,
	tbl_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tbl_seq_nbr int NULL,
	CONSTRAINT PK_tbl_procedure_xwalk PRIMARY KEY (tbl_id),
	CONSTRAINT FK_tbl_procedure_xwalk_ref_lookup_max_date FOREIGN KEY (procedure_id) REFERENCES portal_redux.ref_lookup_max_date(id)
);