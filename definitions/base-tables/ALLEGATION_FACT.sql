-- recreate ALLEGATION_FACT table

DROP TABLE IF EXISTS portal_redux.ALLEGATION_FACT;
CREATE TABLE portal_redux.ALLEGATION_FACT (
	id_allegation_fact					INT			NOT NULL,
	id_algt								INT			NULL,
	id_cps								INT			NULL,
	id_intake_fact						INT			NULL,
	id_investigation_assessment_fact	INT			NULL,
	id_abuse_type_dim					INT			NULL,
	id_case_dim							INT			NULL,
	id_findings_dim						INT			NULL,
	id_people_dim_subject				INT			NULL,
	id_people_dim_victim				INT			NULL,
	id_relationship_dim					INT			NULL,
	fl_fatality							TINYINT		NULL,
	fl_fatality_invs					TINYINT		NULL,
	fl_invs								TINYINT		NULL,
	child_age							TINYINT		NULL,
	fl_expunged							CHAR(1)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_prsn_subject						INT			NULL,
	id_prsn_victim						INT			NULL,
	id_case								INT			NULL,
	CONSTRAINT pk_id_allegation_fact PRIMARY KEY (id_allegation_fact),
	CONSTRAINT fk_allegation_fact_id_abuse_type_dim					FOREIGN KEY (id_abuse_type_dim)
			REFERENCES portal_redux.ABUSE_TYPE_DIM (id_abuse_type_dim),
	CONSTRAINT fk_allegation_fact_id_case_dim						FOREIGN KEY (id_case_dim)
			REFERENCES portal_redux.CASE_DIM (id_case_dim),
	CONSTRAINT fk_allegation_fact_id_findings_dim					FOREIGN KEY (id_findings_dim)
			REFERENCES portal_redux.FINDINGS_DIM (id_findings_dim),
	CONSTRAINT fk_allegation_fact_id_intake_fact					FOREIGN KEY (id_intake_fact)
			REFERENCES portal_redux.INTAKE_FACT (id_intake_fact),
	CONSTRAINT fk_allegation_fact_id_investigation_assessment_fact	FOREIGN KEY (id_investigation_assessment_fact)
			REFERENCES portal_redux.INVESTIGATION_ASSESSMENT_FACT (id_investigation_assessment_fact),
	CONSTRAINT fk_allegation_fact_id_people_dim_subject				FOREIGN KEY (id_people_dim_subject)
			REFERENCES portal_redux.PEOPLE_DIM (id_people_dim),
	CONSTRAINT fk_allegation_fact_id_relationship_dim				FOREIGN KEY (id_relationship_dim)
			REFERENCES portal_redux.RELATIONSHIP_DIM (id_relationship_dim)
);
CREATE NONCLUSTERED INDEX idx_id_cps_victim ON portal_redux.ALLEGATION_FACT (id_cps ASC, id_people_dim_victim ASC)  
	INCLUDE (id_abuse_type_dim, id_prsn_victim, id_relationship_dim)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_intake_fact ON portal_redux.ALLEGATION_FACT (id_intake_fact ASC)  
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
