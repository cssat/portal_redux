-- recreate ooh_point_in_time_measures table

DROP TABLE IF EXISTS portal_redux.ooh_point_in_time_measures;
CREATE TABLE portal_redux.ooh_point_in_time_measures (
	start_date							DATETIME	NOT NULL,
	date_type							INT			NOT NULL,
	qry_type							INT			NOT NULL,
	age_grouping_cd_mix					INT			NOT NULL,
	age_grouping_cd_census				INT			NOT NULL,
	pk_gndr								INT			NOT NULL,
	cd_race								INT			NOT NULL,
	census_hispanic_latino_origin_cd	INT			NOT NULL,
	init_cd_plcm_setng					INT			NOT NULL,
	long_cd_plcm_setng					INT			NOT NULL,
	county_cd							INT			NOT NULL,
	int_match_param_key_mix				INT			NOT NULL,
	int_match_param_key_census			INT			NOT NULL,
	bin_dep_cd							INT			NOT NULL,
	max_bin_los_cd						INT			NOT NULL,
	bin_placement_cd					INT			NOT NULL,
	cd_reporter_type					INT			NOT NULL,
	bin_ihs_svc_cd						INT			NOT NULL,
	filter_access_type					INT			NOT NULL,
	filter_allegation					INT			NOT NULL,
	filter_finding						INT			NOT NULL,
	kincare								INT			NULL,
	bin_sibling_group_size				INT			NULL,
	family_setting_cnt					INT			NULL,
	family_setting_DCFS_cnt				INT			NULL,
	family_setting_private_agency_cnt	INT			NULL,
	relative_care						INT			NULL,
	group_inst_care_cnt					INT			NULL,
	all_sib_together					INT			NULL,
	some_sib_together					INT			NULL,
	no_sib_together						INT			NULL,
	cnt_child_unique					INT			NULL,
	cnt_child							INT			NULL,
	fl_w3								INT			NOT NULL,
	fl_w4								INT			NOT NULL,
	fl_poc1ab							INT			NOT NULL,
	CONSTRAINT ooh_point_in_time_measures_age_grouping_cd_census_fk FOREIGN KEY (age_grouping_cd_census) REFERENCES portal_redux.ref_age_groupings_census(age_grouping_cd),
	CONSTRAINT ooh_point_in_time_measures_bin_dep_cd_fk FOREIGN KEY (bin_dep_cd) REFERENCES portal_redux.ref_filter_dependency(bin_dep_cd),
	CONSTRAINT ooh_point_in_time_measures_bin_ihs_svc_cd_fk FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT ooh_point_in_time_measures_bin_placement_cd_fk FOREIGN KEY (bin_placement_cd) REFERENCES portal_redux.ref_filter_nbr_placement(bin_placement_cd),
	CONSTRAINT ooh_point_in_time_measures_cd_race_fk FOREIGN KEY (cd_race) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT ooh_point_in_time_measures_cd_reporter_type_fk FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT ooh_point_in_time_measures_county_cd_fk FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT ooh_point_in_time_measures_init_cd_plcm_setng_fk FOREIGN KEY (init_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT ooh_point_in_time_measures_long_cd_plcm_setng_fk FOREIGN KEY (long_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT ooh_point_in_time_measures_max_bin_los_cd_fk FOREIGN KEY (max_bin_los_cd) REFERENCES portal_redux.ref_filter_los(bin_los_cd),
	CONSTRAINT ooh_point_in_time_measures_origin_cd_fk FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd),
	CONSTRAINT ooh_point_in_time_measures_pk_gndr_fk FOREIGN KEY (pk_gndr) REFERENCES portal_redux.ref_lookup_gender(pk_gndr)
);
CREATE NONCLUSTERED INDEX idx_fl_poc1ab ON portal_redux.ooh_point_in_time_measures (fl_poc1ab ASC)
	INCLUDE (age_grouping_cd_census, age_grouping_cd_mix, bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, cd_race, cd_reporter_type, census_hispanic_latino_origin_cd, cnt_child, cnt_child_unique, county_cd, date_type, filter_access_type, filter_allegation, filter_finding, init_cd_plcm_setng, int_match_param_key_census, int_match_param_key_mix, long_cd_plcm_setng, max_bin_los_cd, pk_gndr, qry_type, start_date)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_fl_w3 ON portal_redux.ooh_point_in_time_measures (fl_w3 ASC)
	INCLUDE (age_grouping_cd_census, age_grouping_cd_mix, bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, cd_race, cd_reporter_type, census_hispanic_latino_origin_cd, cnt_child, cnt_child_unique, county_cd, date_type, family_setting_cnt, family_setting_DCFS_cnt, family_setting_private_agency_cnt, filter_access_type, filter_allegation, filter_finding, group_inst_care_cnt, init_cd_plcm_setng, int_match_param_key_census, int_match_param_key_mix, long_cd_plcm_setng, max_bin_los_cd, pk_gndr, qry_type, relative_care, start_date)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_fl_w4 ON portal_redux.ooh_point_in_time_measures (fl_w4 ASC)
	INCLUDE (age_grouping_cd_census, age_grouping_cd_mix, all_sib_together, bin_dep_cd, bin_ihs_svc_cd, bin_placement_cd, bin_sibling_group_size, cd_race, cd_reporter_type, census_hispanic_latino_origin_cd, cnt_child, cnt_child_unique, county_cd, date_type, filter_access_type, filter_allegation, filter_finding, init_cd_plcm_setng, int_match_param_key_census, int_match_param_key_mix, kincare, long_cd_plcm_setng, max_bin_los_cd, no_sib_together, pk_gndr, qry_type, some_sib_together, start_date)
	WITH (PAD_INDEX = OFF, FILLFACTOR = 100, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
