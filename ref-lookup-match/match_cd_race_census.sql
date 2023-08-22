-- create match_cd_race_census view

-- DROP VIEW portal_redux.match_cd_race_census;
CREATE VIEW portal_redux.match_cd_race_census
WITH SCHEMABINDING
AS
SELECT cd_race_census,
	cd_race_census AS race_census_match_code
FROM portal_redux.ref_lookup_ethnicity_census
WHERE cd_race_census != 0
UNION ALL
SELECT 0,
	cd_race_census
FROM portal_redux.ref_lookup_ethnicity_census
WHERE cd_race_census != 0


CREATE NONCLUSTERED INDEX [idx_match_cd_race_census_code] ON portal_redux.match_cd_race_census (
	[cd_race_census]
	) INCLUDE (
	[race_census_match_code]
	)
GO

CREATE NONCLUSTERED INDEX [idx_match_cd_race_census_match] ON portal_redux.match_cd_race_census (
	[race_census_match_code]
	) INCLUDE (
	[cd_race_census]
	)
GO