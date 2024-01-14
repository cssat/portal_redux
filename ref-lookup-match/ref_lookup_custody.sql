-- create ref_lookup_custody table

-- DROP TABLE portal_redux.ref_lookup_custody;
CREATE TABLE portal_redux.ref_lookup_custody (
	custody_id TINYINT NOT NULL,
	custody_desc VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);