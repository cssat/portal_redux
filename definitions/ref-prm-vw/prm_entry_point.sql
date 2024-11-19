-- create prm_entry_point view

CREATE VIEW portal_redux.prm_entry_point
AS
SELECT DISTINCT cd_access_type entry_point, cd_access_type match_code
FROM            portal_redux.ref_filter_access_type
WHERE        cd_access_type between 1 and 6
UNION ALL
SELECT DISTINCT 0 entry_point, cd_access_type match_code
FROM            portal_redux.ref_filter_access_type
WHERE        cd_access_type between 1 and 6;