-- recreate prtl_pbcp5 table

DROP TABLE IF EXISTS portal_redux.prtl_pbcp5;
CREATE TABLE portal_redux.prtl_pbcp5 (
	cohort_exit_year					DATETIME		NOT NULL,
	date_type							INT				NOT NULL,
	qry_type							INT				NOT NULL,
	cd_discharge_type					INT				NOT NULL,
	age_grouping_cd						INT				NULL,
	pk_gndr								INT				NULL,
	cd_race_census						INT				NULL,
	census_hispanic_latino_origin_cd	INT				NULL,
	init_cd_plcm_setng					INT				NULL,
	long_cd_plcm_setng					INT				NULL,
	exit_county_cd						INT				NULL,
	int_match_param_key					INT				NOT NULL,
	bin_dep_cd							INT				NOT NULL,
	max_bin_los_cd						INT				NOT NULL,
	bin_placement_cd					INT				NOT NULL,
	cd_reporter_type					INT				NOT NULL,
	bin_ihs_svc_cd						INT				NOT NULL,
	filter_access_type					INT				NOT NULL,
	filter_allegation					INT				NOT NULL,
	filter_finding						INT				NOT NULL,
	mnth								INT				NOT NULL,
	discharge_count						INT				NULL,
	cohort_count						INT				NOT NULL,
	CONSTRAINT pk_prtl_pbcp5 PRIMARY KEY (cohort_exit_year, qry_type, cd_discharge_type, int_match_param_key, bin_dep_cd, max_bin_los_cd, bin_placement_cd, cd_reporter_type, bin_ihs_svc_cd, filter_access_type, filter_allegation, filter_finding, mnth),
	CONSTRAINT prtl_pbcp5_bin_dep_cd_fk FOREIGN KEY (bin_dep_cd) REFERENCES portal_redux.ref_filter_dependency(bin_dep_cd),
	CONSTRAINT prtl_pbcp5_bin_ihs_svc_cd_fk FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_pbcp5_bin_placement_cd_fk FOREIGN KEY (bin_placement_cd) REFERENCES portal_redux.ref_filter_nbr_placement(bin_placement_cd),
	CONSTRAINT prtl_pbcp5_cd_race_fk FOREIGN KEY (cd_race_census) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_pbcp5_cd_reporter_type_fk FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_pbcp5_county_cd_fk FOREIGN KEY (exit_county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_pbcp5_init_cd_plcm_setng_fk FOREIGN KEY (init_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_pbcp5_long_cd_plcm_setng_fk FOREIGN KEY (long_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_pbcp5_max_bin_los_cd_fk FOREIGN KEY (max_bin_los_cd) REFERENCES portal_redux.ref_filter_los(bin_los_cd),
	CONSTRAINT prtl_pbcp5_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd),
	CONSTRAINT prtl_pbcp5_pk_gndr_fk FOREIGN KEY (pk_gndr) REFERENCES portal_redux.ref_lookup_gender(pk_gndr)
);
CREATE NONCLUSTERED INDEX idx_fl_include_in_cohort_count ON portal_redux.prtl_pbcp5 (cohort_count ASC)
	INCLUDE (bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, cd_reporter_type, cohort_exit_year, date_type, discharge_count, filter_access_type, filter_allegation, filter_finding, int_match_param_key, max_bin_los_cd, qry_type
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_qryt ON portal_redux.prtl_pbcp5 (qry_type ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_year_params ON portal_redux.prtl_pbcp5 (cohort_exit_year ASC, date_type ASC, qry_type ASC, int_match_param_key ASC)
	INCLUDE (bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, cd_discharge_type, cd_reporter_type, discharge_count, filter_access_type, filter_allegation, filter_finding, max_bin_los_cd, mnth)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
