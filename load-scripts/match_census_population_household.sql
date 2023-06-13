-- create match_census_population_household table

-- DROP TABLE portal_redux.match_census_population_household;
CREATE TABLE portal_redux.match_census_population_household (
    [measurement_year]    INT        NOT NULL,
    [age_sib_group_cd]    INT        NOT NULL,
    [cd_race_census]      INT        NOT NULL,
    [cd_county]           INT        NOT NULL,
    [population_count]    INT        NOT NULL,
    [perCapita_threshold] FLOAT(53) NOT NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX idx_match_census_population_household ON portal_redux.match_census_population_household (
    measurement_year, 
    age_sib_group_cd, 
    cd_race_census, 
    cd_county
	) INCLUDE (
	population_count,
    perCapita_threshold
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

-- populate match_census_population_household table

TRUNCATE TABLE portal_redux.match_census_population_household;

INSERT portal_redux.match_census_population_household (
	measurement_year,
    age_sib_group_cd,
    cd_race_census,
    cd_county,
    population_count,
    perCapita_threshold
)
SELECT
    measurement_year,
    cd_sib_age_grp,
    cd_race,
    county_cd,
    pop_cnt,
    pop_cnt * .35 AS perCapita_threshold
FROM portal_redux.census_population_household
UNION ALL
SELECT measurement_year
	,0 [cd_sib_age_grp]
	,cd_race
	,county_cd
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 AS [perCapita_threshold]
FROM portal_redux.census_population_household
GROUP BY measurement_year
	,cd_race
	,county_cd
UNION ALL
SELECT measurement_year
	,cd_sib_age_grp
	,0 [cd_race]
	,county_cd
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
WHERE cd_race <= 8
GROUP BY measurement_year
	,cd_sib_age_grp
	,county_cd
UNION ALL
SELECT measurement_year
	,cd_sib_age_grp
	,cd_race
	,0 [county_cd]
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
GROUP BY measurement_year
	,cd_sib_age_grp
	,cd_race
UNION ALL
SELECT measurement_year
	,0 [cd_sib_age_grp]
	,0 [cd_race]
	,county_cd
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
WHERE cd_race <= 8
GROUP BY measurement_year
	,county_cd
UNION ALL
SELECT measurement_year
	,0 [cd_sib_age_grp]
	,cd_race
	,0 [county_cd]
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
GROUP BY measurement_year
	,cd_race
UNION ALL
SELECT measurement_year
	,cd_sib_age_grp
	,0 [cd_race]
	,0 [county_cd]
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
WHERE cd_race <= 8
GROUP BY measurement_year
	,cd_sib_age_grp
UNION ALL
SELECT measurement_year
	,0 [cd_sib_age_grp]
	,0 [cd_race]
	,0 [county_cd]
	,SUM(pop_cnt) [pop_cnt]
	,SUM(pop_cnt) * .35 [perCapita_threshold]
FROM portal_redux.census_population_household
WHERE cd_race <= 8
GROUP BY measurement_year
GO