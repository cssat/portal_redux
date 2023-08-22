-- create match_cd_reporter_type view

-- DROP VIEW portal_redux.match_cd_reporter_type;
CREATE VIEW portal_redux.match_cd_reporter_type
WITH SCHEMABINDING
AS
SELECT cd_reporter_type,
    cd_reporter_type AS reporter_type_match_code
FROM portal_redux.ref_filter_reporter_type
WHERE cd_reporter_type != 0
UNION ALL
SELECT 0,
    cd_reporter_type
FROM portal_redux.ref_filter_reporter_type
WHERE cd_reporter_type != 0;


CREATE NONCLUSTERED INDEX [idx_match_cd_reporter_type_code] ON portal_redux.[match_cd_reporter_type] (
	[cd_reporter_type]
	) INCLUDE (
	[reporter_type_match_code]
	)
GO

CREATE NONCLUSTERED INDEX [idx_match_cd_reporter_type_match] ON portal_redux.[match_cd_reporter_type] (
	[reporter_type_match_code]
	) INCLUDE (
	[cd_reporter_type]
	)
GO