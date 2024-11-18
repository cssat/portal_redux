-- recreate ABUSE_FACT table

DROP TABLE IF EXISTS portal_redux.ABUSE_FACT;
CREATE TABLE portal_redux.ABUSE_FACT (
	id_abuse_fact 							INT			NOT NULL,
	id_cps 									INT			NULL,
	id_prsn_vctm 							INT			NULL,
	id_calendar_dim_founded					INT			NULL,
	id_calendar_dim_incident 				INT			NULL,
	id_calendar_dim_referred 				INT			NULL,
	id_case_dim 							INT			NULL,
	id_location_dim_incident 				INT			NULL,
	id_location_dim_intake_worker 			INT			NULL,
	id_location_dim_investigation_worker	INT			NULL,
	id_location_dim_primary_worker 			INT			NULL,
	id_people_dim_victim 					INT			NULL,
	id_placement_type_dim 					INT			NULL,
	id_provider_dim 						INT			NULL,
	id_worker_dim_primary 					INT 		NULL,
	child_age 								TINYINT		NULL,
	fl_expunged 							CHAR(1)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_case 								INT			NULL,
	id_prvd_org 							INT			NULL,
	CONSTRAINT pk_id_abuse_fact PRIMARY KEY (id_abuse_fact),
	CONSTRAINT fk_id_calendar_dim_founded			FOREIGN KEY (id_calendar_dim_founded)
			REFERENCES portal_redux.CALENDAR_DIM (id_calendar_dim),
	CONSTRAINT fk_id_calendar_dim_incident			FOREIGN KEY (id_calendar_dim_incident)
			REFERENCES portal_redux.CALENDAR_DIM (id_calendar_dim),
	CONSTRAINT fk_id_calendar_dim_referred			FOREIGN KEY (id_calendar_dim_referred)
			REFERENCES portal_redux.CALENDAR_DIM (id_calendar_dim),
	CONSTRAINT fk_id_case_dim						FOREIGN KEY (id_case_dim)
			REFERENCES portal_redux.CASE_DIM (id_case_dim),
	CONSTRAINT fk_id_location_dim_incident			FOREIGN KEY (id_location_dim_incident)
			REFERENCES portal_redux.LOCATION_DIM (id_location_dim),
	CONSTRAINT fk_id_location_dim_intake_worker		FOREIGN KEY (id_location_dim_intake_worker)
			REFERENCES portal_redux.LOCATION_DIM (id_location_dim),
	CONSTRAINT fk_id_location_dim_primary_worker	FOREIGN KEY (id_location_dim_primary_worker)
			REFERENCES portal_redux.LOCATION_DIM (id_location_dim),
	CONSTRAINT fk_id_people_dim_victim				FOREIGN KEY (id_people_dim_victim)
			REFERENCES portal_redux.PEOPLE_DIM (id_people_dim),
	CONSTRAINT fk_id_placement_type_dim				FOREIGN KEY (id_placement_type_dim)
			REFERENCES portal_redux.PLACEMENT_TYPE_DIM (id_placement_type_dim),
	CONSTRAINT id_provider_dim						FOREIGN KEY (id_provider_dim)
			REFERENCES portal_redux.PROVIDER_DIM (id_provider_dim),
	CONSTRAINT fk_id_worker_dim_primary				FOREIGN KEY (id_worker_dim_primary)
			REFERENCES portal_redux.WORKER_DIM (id_worker_dim)
);
