-- portal_redux.prm_los_max_bin_los_cd source

CREATE VIEW portal_redux.prm_los_max_bin_los_cd
AS
SELECT DISTINCT los.bin_los_cd, mtch.bin_los_cd AS match_code
FROM portal_redux.ref_filter_los AS mtch
INNER JOIN portal_redux.ref_filter_los AS los ON mtch.bin_los_cd >= los.bin_los_cd;