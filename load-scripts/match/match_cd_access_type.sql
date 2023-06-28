-- create match_cd_access_type view

-- DROP VIEW portal_redux.match_cd_access_type;
CREATE VIEW portal_redux.match_cd_access_type
WITH SCHEMABINDING
AS
SELECT cd_access_type,
	cd_access_type AS filter_access_type
FROM portal_redux.ref_filter_access_type
WHERE cd_access_type != 0
UNION ALL
SELECT 0,
	cd_access_type
FROM portal_redux.ref_filter_access_type
WHERE cd_access_type != 0

CREATE NONCLUSTERED INDEX [idx_match_cd_access_type_code] ON portal_redux.[match_cd_access_type] (
	[cd_access_type]
	) INCLUDE (
	[filter_access_type]
	)
GO

CREATE NONCLUSTERED INDEX [idx_match_cd_access_type_match] ON portal_redux.[match_cd_access_type] (
	[filter_access_type]
	) INCLUDE (
	[cd_access_type]
	)
GO