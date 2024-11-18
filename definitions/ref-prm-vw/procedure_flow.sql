-- recreate procedure_flow table
DROP TABLE IF EXISTS portal_redux.procedure_flow;
CREATE TABLE portal_redux.procedure_flow (
	ikey				INT					IDENTITY(1,1) NOT NULL,
	execute_order		INT					NULL,
	procedure_nm		VARCHAR(500)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	last_run_date		DATETIME			NULL
);



--populate procedure_flow table
INSERT INTO portal_redux.procedure_flow (execute_order, procedure_nm, last_run_date)
VALUES 
	(1, 'prod_update_rptPlacement_after_CA_LOAD', NULL),
	(2, 'prod_build_tbl_case_dim', NULL),
	(3, 'prod_build_tbl_intakes', NULL),
	(4, 'prod_update_rptPlacement_with_intakes', NULL),
	(5, 'prod_update_tbl_intakes', NULL),
	(6, 'prod_build_tbl_intake_grouper', NULL),
	(7, 'prod_build_tbls_ihs_episode_services', NULL),
	(8, 'prod_update_tbl_intakes_after_ihs', NULL),
	(9, 'prod_update_rptPlacement_after_ihs', NULL),
	(10, 'prod_build_WRK_NonDCFS', NULL),
	(11, 'prod_build_WRK_TRHEvents', NULL),
	(12, 'prod_build_placement_payment_services', NULL),
	(13, 'prod_build_episode_payment_services', NULL),
	(14, 'prod_update_rptPlacement_after_basetables', NULL),
	(15, 'prod_update_ref_last_month_qtr_yr', NULL),
	(16, 'prod_build_match_allegation', NULL),
	(17, 'prod_build_match_finding', NULL),
	(18, 'prod_build_match_srvc_type_category', NULL),
	(19, 'prod_build_match_srvc_type_budget', NULL),
	(20, 'prod_build_placement_care_days_mobility', NULL),
	(21, 'prod_build_episode_care_days', NULL);
