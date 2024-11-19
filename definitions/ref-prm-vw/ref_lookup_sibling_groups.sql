-- create ref_lookup_sibling_groups table

--DROP TABLE portal_redux.ref_lookup_sibling_groups;
CREATE TABLE portal_redux.ref_lookup_sibling_groups (
	nbr_siblings int NOT NULL,
	sibling_group_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_lookup_sibling_groups PRIMARY KEY (nbr_siblings)
);