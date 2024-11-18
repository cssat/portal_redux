-- recreate episode_care_days table
DROP TABLE IF EXISTS portal_redux.episode_care_days;
CREATE TABLE portal_redux.episode_care_days (
	fiscal_yr			INT				NOT NULL,
	years_in_care		INT				NOT NULL,
	age_yrs_removal		INT				NOT NULL,
	age_yrs_exit		INT				NOT NULL,
	cd_race				INT				NOT NULL,
	county_cd			INT				NOT NULL,
	exclude_7day		SMALLINT		NOT NULL,
	exclude_nondcfs		SMALLINT		NOT NULL,
	care_days			INT				NULL,
	CONSTRAINT pk_episode_care_days_mobility PRIMARY KEY (fiscal_yr, years_in_care, age_yrs_removal, age_yrs_exit, cd_race, county_cd, exclude_7day, exclude_nondcfs)
);
