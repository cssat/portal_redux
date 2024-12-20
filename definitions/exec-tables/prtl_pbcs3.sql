-- recreate prtl_pbcs3 table

DROP TABLE IF EXISTS portal_redux.prtl_pbcs3;
CREATE TABLE portal_redux.prtl_pbcs3 (
	cohort_begin_date					DATETIME	NOT NULL,
	date_type							INT			NOT NULL,
	qry_type							INT			NOT NULL,
	cd_race_census						INT			NULL,
	census_hispanic_latino_origin_cd	INT			NULL,
	county_cd							INT			NULL,
	cd_sib_age_grp						INT			NULL,
	int_match_param_key					BIGINT		NOT NULL,
	cd_reporter							INT			NOT NULL,
	bin_ihs_svc_cd						INT			NOT NULL,
	filter_access_type					INT			NOT NULL,
	filter_allegation					INT			NOT NULL,
	filter_finding						INT			NOT NULL,
	min_placed_within_month				INT			NOT NULL,
	cnt_case							INT			NULL,
	CONSTRAINT pk_prtl_pbcs3 PRIMARY KEY (cohort_begin_date, date_type, qry_type, int_match_param_key, cd_reporter, bin_ihs_svc_cd, filter_access_type, filter_allegation, filter_finding, min_placed_within_month),
	CONSTRAINT prtl_pbcs3_bin_ihs_svc_cd_fk FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_pbcs3_cd_race_fk FOREIGN KEY (cd_race_census) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_pbcs3_cd_reporter_type_fk FOREIGN KEY (cd_reporter) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_pbcs3_cd_sib_age_grpr_fk FOREIGN KEY (cd_sib_age_grp) REFERENCES portal_redux.ref_lookup_sib_age_grp(cd_sib_age_grp),
	CONSTRAINT prtl_pbcs3_county_cd_fk FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_pbcs3_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd)
);
