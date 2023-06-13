-- create match_cd_county view

-- DROP VIEW portal_redux.match_cd_county;
CREATE VIEW portal_redux.match_cd_county
WITH SCHEMABINDING
AS
SELECT county_cd AS cd_county,
	county_cd AS county_match_code
FROM portal_redux.ref_lookup_county
WHERE county_cd > 0
UNION ALL
SELECT 0,
	county_cd
FROM portal_redux.ref_lookup_county
WHERE county_cd > 0


CREATE NONCLUSTERED INDEX [idx_match_cd_county_code] ON portal_redux.[match_cd_county] (
	[cd_county]
	) INCLUDE (
	[county_match_code]
	)
GO

CREATE NONCLUSTERED INDEX [idx_match_cd_county_match] ON portal_redux.[match_cd_county] (
	[county_match_code]
	) INCLUDE (
	[cd_county]
	)
GO