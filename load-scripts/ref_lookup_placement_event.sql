-- create ref_lookup_placement_event table

-- DROP TABLE portal_redux.ref_lookup_placement_event;
CREATE TABLE portal_redux.ref_lookup_placement_event (
	id_plcmnt_evnt int NOT NULL,
	cd_plcmnt_evnt char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_plcmnt_evnt_desc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_plcm_setng int NULL
);