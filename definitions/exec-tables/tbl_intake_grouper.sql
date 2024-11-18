-- recreate tbl_intake_grouper table

DROP TABLE IF EXISTS portal_redux.tbl_intake_grouper;
CREATE TABLE portal_redux.tbl_intake_grouper (
	intake_grouper		INT		NOT NULL,
	id_case				INT		NOT NULL,
	id_intake_fact		INT		NOT NULL,
	intk_grp_seq_nbr	INT		NULL,
	CONSTRAINT pk_tbl_intake_grouper PRIMARY KEY (id_intake_fact)
);
CREATE NONCLUSTERED INDEX idx_intake_grouper ON portal_redux.tbl_intake_grouper (id_intake_fact ASC)
	INCLUDE (id_case , intake_grouper)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
