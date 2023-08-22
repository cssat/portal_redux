-- create match_age_sib_group_cd view

-- DROP VIEW portal_redux.match_age_sib_group_cd;
CREATE VIEW portal_redux.match_age_sib_group_cd
AS
SELECT cd_sib_age_grp AS age_sib_group_cd
	,cd_sib_age_grp AS [age_sib_group_match_code]
FROM portal_redux.ref_lookup_sib_age_grp age
WHERE cd_sib_age_grp != 0
UNION ALL
SELECT 0
	,cd_sib_age_grp
FROM portal_redux.ref_lookup_sib_age_grp age
WHERE cd_sib_age_grp != 0