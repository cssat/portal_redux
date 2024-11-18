-- recreate prtl_poc3ab table

DROP TABLE IF EXISTS portal_redux.prtl_poc3ab;
CREATE TABLE portal_redux.prtl_poc3ab (
	qry_type INT NOT NULL,
	date_type INT NOT NULL,
	start_date							DATETIME		NOT NULL,
	start_year							INT				NOT NULL,
	int_match_param_key					BIGINT			NOT NULL,
	bin_ihs_svc_cd						INT				NOT NULL,
	cd_reporter_type					INT				NOT NULL,
	filter_access_type					INT				DEFAULT power((10),(5)) NOT NULL,
	filter_allegation					INT				DEFAULT power((10),(4)) NOT NULL,
	filter_finding						INT				DEFAULT power((10),(4)) NOT NULL,
	cd_sib_age_group					INT				NOT NULL,
	cd_race_census						INT				NOT NULL,
	census_hispanic_latino_origin_cd	INT				NOT NULL,
	county_cd							INT				NOT NULL,
	cnt_start_date						INT				NOT NULL,
	cnt_opened							INT				NOT NULL,
	cnt_closed							INT				NOT NULL,
	CONSTRAINT pk_prtl_poc3ab_1 PRIMARY KEY (qry_type, date_type, start_date, int_match_param_key, bin_ihs_svc_cd, cd_reporter_type, filter_access_type, filter_allegation, filter_finding),
	CONSTRAINT prtl_poc3ab_bin_ihs_svc_cd_fk FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_poc3ab_cd_race_fk FOREIGN KEY (cd_race_census) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_poc3ab_cd_reporter_type_fk FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_poc3ab_cd_sib_age_grpr_fk FOREIGN KEY (cd_sib_age_group) REFERENCES portal_redux.ref_lookup_sib_age_grp(cd_sib_age_grp),
	CONSTRAINT prtl_poc3ab_county_cd_fk FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_poc3ab_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd)
);
CREATE NONCLUSTERED INDEX idx_prtl_poc3ab ON portal_redux.prtl_poc3ab (qry_type ASC, date_type ASC, start_date ASC, int_match_param_key ASC, cd_reporter_type ASC, filter_access_type ASC, filter_allegation ASC, filter_finding ASC)
	INCLUDE (bin_ihs_svc_cd)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_qry_type_start_date ON portal_redux.prtl_poc3ab (qry_type ASC, start_date ASC)
	INCLUDE (bin_ihs_svc_cd, cd_reporter_type, cnt_closed, cnt_opened, cnt_start_date, county_cd, date_type, filter_access_type, filter_allegation, filter_finding, int_match_param_key, start_year)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
