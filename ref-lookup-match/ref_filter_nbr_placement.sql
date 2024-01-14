-- create ref_filter_nbr_placement table

-- DROP TABLE portal_redux.ref_filter_nbr_placement;
CREATE TABLE portal_redux.ref_filter_nbr_placement (
	bin_placement_cd INT NOT NULL,
	bin_placement_desc VARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nbr_placement_from INT NULL,
	nbr_placement_thru INT NULL,
	CONSTRAINT PK_ref_filter_nbr_placement PRIMARY KEY (bin_placement_cd)
);