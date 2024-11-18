-- recreate prtl_poc1ab_entries table

DROP TABLE IF EXISTS portal_redux.prtl_poc1ab_entries;
CREATE TABLE portal_redux.prtl_poc1ab_entries (
	qry_type							INT			NOT NULL,
	date_type							INT			NOT NULL,
	start_date							DATETIME	NOT NULL,
	bin_dep_cd							INT			NOT NULL,
	max_bin_los_cd						INT			NOT NULL,
	bin_placement_cd					INT			NOT NULL,
	bin_ihs_svc_cd						INT			NOT NULL,
	cd_reporter_type					INT			NOT NULL,
	age_grouping_cd						INT			NULL,
	cd_race								INT			NULL,
	census_hispanic_latino_origin_cd	INT			NOT NULL,
	pk_gndr								INT			NOT NULL,
	init_cd_plcm_setng					INT			NULL,
	long_cd_plcm_setng					INT			NULL,
	county_cd							INT			NULL,
	int_match_param_key					BIGINT		NOT NULL,
	cnt_entries							INT			NULL,
	filter_allegation					INT			NOT NULL,
	filter_finding						INT			NOT NULL,
	filter_access_type					INT			NOT NULL,
	start_year							INT			NULL,
	CONSTRAINT pk_prtl_poc1ab_entries PRIMARY KEY (qry_type, date_type, start_date, bin_dep_cd, max_bin_los_cd, bin_placement_cd, bin_ihs_svc_cd, cd_reporter_type, int_match_param_key, filter_allegation, filter_finding, filter_access_type),
	CONSTRAINT prtl_ooh_entries_age_grouping_cd_fk FOREIGN KEY (age_grouping_cd) REFERENCES portal_redux.ref_age_groupings_census(age_grouping_cd),
	CONSTRAINT prtl_ooh_entries_bin_dep_cd_fk FOREIGN KEY (bin_dep_cd) REFERENCES portal_redux.ref_filter_dependency(bin_dep_cd),
	CONSTRAINT prtl_ooh_entries_bin_ihs_svc_cd_fk FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_ooh_entries_bin_placement_cd_fk FOREIGN KEY (bin_placement_cd) REFERENCES portal_redux.ref_filter_nbr_placement(bin_placement_cd),
	CONSTRAINT prtl_ooh_entries_cd_race_fk FOREIGN KEY (cd_race) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_ooh_entries_cd_reporter_type_fk FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_ooh_entries_county_cd_fk FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_ooh_entries_init_cd_plcm_setng_fk FOREIGN KEY (init_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_entries_long_cd_plcm_setng_fk FOREIGN KEY (long_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_entries_max_bin_los_cd_fk FOREIGN KEY (max_bin_los_cd) REFERENCES portal_redux.ref_filter_los(bin_los_cd),
	CONSTRAINT prtl_ooh_entries_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd),
	CONSTRAINT prtl_ooh_entries_pk_gndr_fk FOREIGN KEY (pk_gndr) REFERENCES portal_redux.ref_lookup_gender(pk_gndr)
);
