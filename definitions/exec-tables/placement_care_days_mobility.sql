-- recreate placement_care_days_mobility table
DROP TABLE IF EXISTS portal_redux.placement_care_days_mobility;
CREATE TABLE portal_redux.placement_care_days_mobility (
	fiscal_yr			INT			NOT NULL,
	age_yrs_removal		INT			NOT NULL,
	age_yrs_exit		INT			NOT NULL,
	county_cd			INT			NOT NULL,
	cd_race				INT			NOT NULL,
	years_in_care		INT			NOT NULL,
	exclude_7day		INT			NOT NULL,
	exclude_trh			INT			NOT NULL,
	exclude_nondcfs		INT			NOT NULL,
	care_days			INT			NULL,
	placement_moves		INT			NULL,
	kin_cnt				INT			NULL,
	foster_cnt			INT			NULL,
	group_cnt			INT			NULL,
	CONSTRAINT pk_placement_care_days_mobility PRIMARY KEY (fiscal_yr, age_yrs_removal, age_yrs_exit, county_cd, cd_race, years_in_care, exclude_7day, exclude_trh, exclude_nondcfs)
);
