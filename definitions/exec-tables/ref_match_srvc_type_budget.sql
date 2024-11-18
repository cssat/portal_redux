-- recreate ref_match_srvc_type_budget table
DROP TABLE IF EXISTS portal_redux.ref_match_srvc_type_budget;
CREATE TABLE portal_redux.ref_match_srvc_type_budget (
	filter_service_budget		INT			NOT NULL,
	fl_budget_c12				INT			NULL,
	fl_budget_c14				INT			NULL,
	fl_budget_c15				INT			NULL,
	fl_budget_c16				INT			NULL,
	fl_budget_c18				INT			NULL,
	fl_budget_c19				INT			NULL,
	fl_uncat_svc				INT			NULL,
	cd_budget_poc_frc			INT			NOT NULL,
	id_service_budget			INT			NULL,
	CONSTRAINT pk_ref_match_srvc_type_budget PRIMARY KEY (filter_service_budget, cd_budget_poc_frc)
);
