-- recreate ASSIGNMENT_FACT table

DROP TABLE IF EXISTS portal_redux.ASSIGNMENT_FACT;
CREATE TABLE portal_redux.ASSIGNMENT_FACT (
	id_assignment_fact				INT			NOT NULL,
	id_asgn							INT			NULL,
	id_intake_fact					INT			NULL,
	id_assignment_attribute_dim		INT			NULL,
	id_calendar_dim_begin			INT			NULL,
	id_calendar_dim_end				INT			NULL,
	id_case_dim						INT			NULL,
	id_location_dim					INT			NULL,
	id_people_dim					INT			NULL,
	id_provider_dim					INT			NULL,
	id_worker_dim					INT			NULL,
	fl_expunged						CHAR(1)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_case							INT			NULL,
	id_prsn							INT			NULL,
	id_prvd_org						INT			NULL,
	CONSTRAINT pk_id_assignment_fact PRIMARY KEY (id_assignment_fact),
	CONSTRAINT fk_assignment_fact_id_assignment_attribute_dim	FOREIGN KEY (id_assignment_attribute_dim)
			REFERENCES portal_redux.ASSIGNMENT_ATTRIBUTE_DIM (id_assignment_attribute_dim),
	CONSTRAINT fk_assignment_fact_id_calendar_dim_begin			FOREIGN KEY (id_calendar_dim_begin)
			REFERENCES portal_redux.CALENDAR_DIM (id_calendar_dim),
	CONSTRAINT fk_assignment_fact_id_calendar_dim_end			FOREIGN KEY (id_calendar_dim_end)
			REFERENCES portal_redux.CALENDAR_DIM (id_calendar_dim),
	CONSTRAINT fk_assignment_fact_id_case_dim					FOREIGN KEY (id_case_dim)
			REFERENCES portal_redux.CASE_DIM (id_case_dim),
	CONSTRAINT fk_assignment_fact_id_location_dim				FOREIGN KEY (id_location_dim)
			REFERENCES portal_redux.LOCATION_DIM (id_location_dim),
	CONSTRAINT fk_assignment_fact_id_people_dim					FOREIGN KEY (id_people_dim)
			REFERENCES portal_redux.PEOPLE_DIM (id_people_dim),
	CONSTRAINT fk_assignment_fact_id_provider_dim				FOREIGN KEY (id_provider_dim)
			REFERENCES portal_redux.PROVIDER_DIM (id_provider_dim),
	CONSTRAINT fk_assignment_fact_id_worker_dim					FOREIGN KEY (id_worker_dim)
			REFERENCES portal_redux.WORKER_DIM (id_worker_dim)
);
CREATE NONCLUSTERED INDEX nonclusteredindex_20140603_133409 ON portal_redux.ASSIGNMENT_FACT (id_calendar_dim_begin ASC, id_case ASC)  
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_asf_case_worker_begin_inc_fact_dim_end ON portal_redux.ASSIGNMENT_FACT (id_worker_dim ASC, id_case ASC, id_calendar_dim_begin ASC)  
	INCLUDE (id_assignment_attribute_dim, id_assignment_fact, id_calendar_dim_end) 
	WITH (PAD_INDEX = OFF,FILLFACTOR = 100,SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_case_id_calendar_dim_begin_aad ON portal_redux.ASSIGNMENT_FACT (id_case ASC)  
	INCLUDE (id_assignment_attribute_dim, id_assignment_fact, id_calendar_dim_begin) 
	WITH (PAD_INDEX = OFF,FILLFACTOR = 100,SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_workder_dim_id_prsn_id_calendar_dim_begin ON portal_redux.ASSIGNMENT_FACT (id_prsn ASC)  
	INCLUDE (id_calendar_dim_begin, id_calendar_dim_end, id_worker_dim) 
	WITH (PAD_INDEX = OFF,FILLFACTOR = 100,SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
