-- create ref_service_category_flag_xwalk table

-- DROP TABLE portal_redux.ref_service_category_flag_xwalk;
CREATE TABLE portal_redux.ref_service_category_flag_xwalk (
	filter_service_category numeric(21,0) NULL,
	fl_family_focused_services smallint NOT NULL,
	fl_child_care smallint NOT NULL,
	fl_therapeutic_services smallint NOT NULL,
	fl_mh_services smallint NOT NULL,
	fl_receiving_care smallint NOT NULL,
	fl_family_home_placements smallint NOT NULL,
	fl_behavioral_rehabiliation_services smallint NOT NULL,
	fl_other_therapeutic_living_situations smallint NOT NULL,
	fl_specialty_adolescent_services smallint NOT NULL,
	fl_respite smallint NOT NULL,
	fl_transportation smallint NOT NULL,
	fl_clothing_incidentals smallint NOT NULL,
	fl_sexually_aggressive_youth smallint NOT NULL,
	fl_adoption_support smallint NOT NULL,
	fl_various smallint NOT NULL,
	fl_medical smallint NOT NULL,
	fl_ihs_reun smallint NOT NULL,
	fl_concrete_goods smallint NOT NULL,
	int_filter_service_category int NOT NULL,
	CONSTRAINT PK_ref_service_category_flag_xwalk PRIMARY KEY (int_filter_service_category)
);