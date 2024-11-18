-- recreate prtl_pbcs2 table

DROP TABLE IF EXISTS portal_redux.prtl_pbcs2;
CREATE TABLE portal_redux.prtl_pbcs2 (
	cohort_begin_date					DATETIME		NOT NULL,
	date_type							INT				NOT NULL,
	qry_type							INT				NOT NULL,
	int_match_param_key					BIGINT			NOT NULL,
	cd_sib_age_grp						INT				NOT NULL,
	cd_race_census						INT				NOT NULL,
	census_hispanic_latino_origin_cd	INT				NOT NULL,
	county_cd							INT				NOT NULL,
	filter_access_type					INT				NOT NULL,
	filter_allegation					INT				NOT NULL,
	filter_finding						INT				NOT NULL,
	cd_reporter_type					INT				NOT NULL,
	bin_ihs_svc_cd						INT				NOT NULL,
	initref								INT				NOT NULL,
	initfndref							INT				NOT NULL,
	cohortrefcount						INT				NOT NULL,
	cohortfndrefcount					INT				NOT NULL,
	case_founded_recurrence				INT				NOT NULL,
	case_repeat_referral				INT				NOT NULL,
	cnt_case							INT				NOT NULL,
	nxt_ref_within_min_month			INT				NOT NULL,
	CONSTRAINT pk_prtl_pbcs2_1 PRIMARY KEY (cohort_begin_date, date_type, qry_type, int_match_param_key, filter_access_type, filter_allegation, filter_finding, cd_reporter_type, bin_ihs_svc_cd, initref, initfndref, case_founded_recurrence, nxt_ref_within_min_month),
	CONSTRAINT prtl_pbcs2_cd_race_fk FOREIGN KEY (cd_race_census) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_pbcs2_cd_reporter_type_fk FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_pbcs2_cd_sib_age_grpr_fk FOREIGN KEY (cd_sib_age_grp) REFERENCES portal_redux.ref_lookup_sib_age_grp(cd_sib_age_grp),
	CONSTRAINT prtl_pbcs2_county_cd_fk FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_pbcs2_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd)
);
CREATE NONCLUSTERED INDEX idx_nxt_ref_within_min_month ON portal_redux.prtl_pbcs2 (nxt_ref_within_min_month ASC, cohort_begin_date ASC, int_match_param_key ASC, cohortrefcount ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_reporter_type_cohortrefcount ON portal_redux.prtl_pbcs2 (cd_reporter_type ASC, cohortrefcount ASC)
	INCLUDE (cnt_case, cohort_begin_date, filter_access_type, filter_allegation, filter_finding, int_match_param_key, qry_type)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_s2 ON portal_redux.prtl_pbcs2 (cd_sib_age_grp ASC, filter_finding ASC)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
