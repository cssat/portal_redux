-- create ref_filter_nbr_placement table

-- DROP TABLE portal_redux.ref_filter_nbr_placement;
CREATE TABLE portal_redux.ref_filter_nbr_placement (
	bin_placement_cd int NOT NULL,
	bin_placement_desc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nbr_placement_from int NULL,
	nbr_placement_thru int NULL,
	CONSTRAINT PK_ref_filter_nbr_placement PRIMARY KEY (bin_placement_cd)
);