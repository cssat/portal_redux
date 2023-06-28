-- create ref_lookup_sib_age_grp table

-- DROP TABLE portal_redux.ref_lookup_sib_age_grp;
CREATE TABLE portal_redux.ref_lookup_sib_age_grp (
	cd_sib_age_grp int NOT NULL,
	tx_sib_age_grp varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ref_lookup_sib_age_grp PRIMARY KEY (cd_sib_age_grp)
);