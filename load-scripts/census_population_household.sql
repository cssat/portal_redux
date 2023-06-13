
-- create census_population_household table

-- DROP TABLE portal_redux.census_population_household;
CREATE TABLE portal_redux.census_population_household (
	source_census int NULL,
	county_cd int NULL,
	cd_race int NULL,
	cd_sib_age_grp int NULL,
	measurement_year int NULL,
	pop_cnt int NULL
);

CREATE NONCLUSTERED INDEX idx_county_measurement_year ON portal_redux.census_population_household (  measurement_year ASC  , county_cd ASC  )  
	INCLUDE ( pop_cnt ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];