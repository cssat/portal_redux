CREATE PROCEDURE [portal_redux].[build_ooh_wb_family_settings_cache]
	@age_grouping_cd VARCHAR(20)
	,@pk_gender VARCHAR(10)
	,@cd_race_census VARCHAR(30)
	,@initial_cd_placement_setting VARCHAR(50)
	,@longest_cd_placement_setting VARCHAR(50)
	,@cd_county VARCHAR(200)
	,@bin_los_cd VARCHAR(30)
	,@bin_placement_cd VARCHAR(30)
	,@bin_ihs_service_cd VARCHAR(30)
	,@cd_reporter_type VARCHAR(100)
	,@cd_access_type VARCHAR(30)
	,@cd_allegation VARCHAR(30)
	,@cd_finding VARCHAR(30)
	,@bin_dependency_cd VARCHAR(20)
AS
/*
DECLARE @age_grouping_cd VARCHAR(20) = '0'
	,@pk_gender VARCHAR(10) = '0'
	,@cd_race_census VARCHAR(30) = '0'
	,@initial_cd_placement_setting VARCHAR(50) = '0'
	,@longest_cd_placement_setting VARCHAR(50) = '0'
	,@cd_county VARCHAR(200) = '0'
	,@bin_los_cd VARCHAR(30) = '0'
	,@bin_placement_cd VARCHAR(30) = '0'
	,@bin_ihs_service_cd VARCHAR(30) = '0'
	,@cd_reporter_type VARCHAR(100) = '0'
	,@cd_access_type VARCHAR(30) = '0'
	,@cd_allegation VARCHAR(30) = '0'
	,@cd_finding VARCHAR(30) = '0'
	,@bin_dependency_cd VARCHAR(20) = '0'
--*/
DECLARE @row_id INT
DECLARE @age TABLE (age_grouping_cd TINYINT)
DECLARE @gender TABLE (pk_gender TINYINT)
DECLARE @race_census TABLE (cd_race_census TINYINT)
DECLARE @initial_placement_setting TABLE (cd_placement_setting TINYINT)
DECLARE @longest_placement_setting TABLE (cd_placement_setting TINYINT)
DECLARE @county TABLE (cd_county TINYINT)
DECLARE @bin_los TABLE (bin_los_cd TINYINT)
DECLARE @bin_placement TABLE (bin_placement_cd TINYINT)
DECLARE @bin_ihs_service TABLE (bin_ihs_service_cd TINYINT)
DECLARE @reporter_type TABLE (cd_reporter_type TINYINT)
DECLARE @access_type TABLE (cd_access_type TINYINT)
DECLARE @allegation TABLE (cd_allegation TINYINT)
DECLARE @finding TABLE (cd_finding TINYINT)
DECLARE @bin_dependency TABLE (bin_dependency_cd TINYINT)
DECLARE @parameters TABLE (
	row_id INT NOT NULL PRIMARY KEY
	,age_grouping_cd TINYINT
	,pk_gender TINYINT
	,cd_race_census TINYINT
	,initial_cd_placement_setting TINYINT
	,longest_cd_placement_setting TINYINT
	,cd_county TINYINT
	,bin_los_cd TINYINT
	,bin_placement_cd TINYINT
	,bin_ihs_service_cd TINYINT
	,cd_reporter_type TINYINT
	,cd_access_type TINYINT
	,cd_allegation TINYINT
	,cd_finding TINYINT
	,bin_dependency_cd TINYINT
	,UNIQUE(
		age_grouping_cd
		,pk_gender
		,cd_race_census
		,initial_cd_placement_setting
		,longest_cd_placement_setting
		,cd_county
		,bin_los_cd
		,bin_placement_cd
		,bin_ihs_service_cd
		,cd_reporter_type
		,cd_access_type
		,cd_allegation
		,cd_finding
		,bin_dependency_cd
		)
	)

INSERT @age (age_grouping_cd)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@age_grouping_cd, 0)

INSERT @gender (pk_gender)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@pk_gender, 0)

INSERT @race_census (cd_race_census)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_race_census, 0)

INSERT @initial_placement_setting (cd_placement_setting)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@initial_cd_placement_setting, 0)

INSERT @longest_placement_setting (cd_placement_setting)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@longest_cd_placement_setting, 0)

INSERT @county (cd_county)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_county, 0)

INSERT @bin_los (bin_los_cd)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@bin_los_cd, 0)

INSERT @bin_placement (bin_placement_cd)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@bin_placement_cd, 0)

INSERT @bin_ihs_service (bin_ihs_service_cd)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@bin_ihs_service_cd, 0)

INSERT @reporter_type (cd_reporter_type)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_reporter_type, 0)

INSERT @access_type (cd_access_type)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_access_type, 0)

INSERT @allegation (cd_allegation)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_allegation, 0)

INSERT @finding (cd_finding)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@cd_finding, 0)

INSERT @bin_dependency (bin_dependency_cd)
SELECT CONVERT(TINYINT, arrValue)
FROM portal_redux.fn_ReturnStrTableFromList(@bin_dependency_cd, 0)

INSERT @parameters (
	row_id
	,age_grouping_cd
	,pk_gender
	,cd_race_census
	,initial_cd_placement_setting
	,longest_cd_placement_setting
	,cd_county
	,bin_los_cd
	,bin_placement_cd
	,bin_ihs_service_cd
	,cd_reporter_type
	,cd_access_type
	,cd_allegation
	,cd_finding
	,bin_dependency_cd
	)
SELECT ROW_NUMBER() OVER(ORDER BY a.age_grouping_cd
		,g.pk_gender
		,rc.cd_race_census
		,ips.cd_placement_setting
		,lps.cd_placement_setting
		,c.cd_county
		,los.bin_los_cd
		,bp.bin_placement_cd
		,ihs.bin_ihs_service_cd
		,rt.cd_reporter_type
		,at.cd_access_type
		,al.cd_allegation
		,f.cd_finding
		,bd.bin_dependency_cd
	) [row_id]
	,a.age_grouping_cd
	,g.pk_gender
	,rc.cd_race_census
	,ips.cd_placement_setting
	,lps.cd_placement_setting
	,c.cd_county
	,los.bin_los_cd
	,bp.bin_placement_cd
	,ihs.bin_ihs_service_cd
	,rt.cd_reporter_type
	,at.cd_access_type
	,al.cd_allegation
	,f.cd_finding
	,bd.bin_dependency_cd
FROM @age a
CROSS JOIN @gender g
CROSS JOIN @race_census rc
CROSS JOIN @initial_placement_setting ips
CROSS JOIN @longest_placement_setting lps
CROSS JOIN @county c
CROSS JOIN @bin_los los
CROSS JOIN @bin_placement bp
CROSS JOIN @bin_ihs_service ihs
CROSS JOIN @reporter_type rt
CROSS JOIN @access_type at
CROSS JOIN @allegation al
CROSS JOIN @finding f
CROSS JOIN @bin_dependency bd
WHERE NOT EXISTS (
		SELECT *
		FROM portal_redux.ooh_wb_family_settings_cache_query cq
		WHERE cq.age_grouping_cd = a.age_grouping_cd
			AND cq.pk_gender = g.pk_gender
			AND cq.cd_race_census = rc.cd_race_census
			AND cq.initial_cd_placement_setting = ips.cd_placement_setting
			AND cq.longest_cd_placement_setting = lps.cd_placement_setting
			AND cq.cd_county = c.cd_county
			AND cq.bin_los_cd = los.bin_los_cd
			AND cq.bin_placement_cd = bp.bin_placement_cd
			AND cq.bin_ihs_service_cd = ihs.bin_ihs_service_cd
			AND cq.cd_reporter_type = rt.cd_reporter_type
			AND cq.cd_access_type = at.cd_access_type
			AND cq.cd_allegation = al.cd_allegation
			AND cq.cd_finding = f.cd_finding
			AND cq.bin_dependency_cd = bd.bin_dependency_cd
		)

SET @row_id = (SELECT TOP 1 row_id FROM @parameters ORDER BY row_id)

WHILE @row_id IS NOT NULL
BEGIN
	INSERT portal_redux.ooh_wb_family_settings_cache (
		qry_type
		,date_type
		,cohort_entry_date
		,age_grouping_cd
		,pk_gender
		,cd_race_census
		,initial_cd_placement_setting
		,longest_cd_placement_setting
		,cd_county
		,bin_dependency_cd
		,bin_los_cd
		,bin_placement_cd
		,bin_ihs_service_cd
		,cd_reporter_type
		,cd_access_type
		,cd_allegation
		,cd_finding
		,family_setting_dcfs_percentage
		,family_setting_private_agency_percentage
		,relative_percentage
		,group_inst_care_percentage
		)
	SELECT ooh.qry_type
		,ooh.date_type
		,ooh.start_date [cohort_entry_date]
		,p.age_grouping_cd
		,p.pk_gender
		,p.cd_race_census
		,p.initial_cd_placement_setting
		,p.longest_cd_placement_setting
		,p.cd_county
		,p.bin_dependency_cd
		,p.bin_los_cd
		,p.bin_placement_cd
		,p.bin_ihs_service_cd
		,p.cd_reporter_type
		,p.cd_access_type
		,p.cd_allegation
		,p.cd_finding
		,ROUND((SUM(ooh.family_setting_dcfs_cnt) * 1.00) / (SUM(ooh.cnt_child) * 1.00) * 100, 2) [family_setting_cdfs_percentage]
		,ROUND((SUM(ooh.family_setting_private_agency_cnt) * 1.00) / (SUM(ooh.cnt_child) * 1.00) * 100, 2) [family_setting_private_agency_percentage]
		,ROUND((SUM(ooh.relative_care) * 1.00) / (SUM(ooh.cnt_child) * 1.00) * 100, 2) [relative_percentage]
		,ROUND((SUM(ooh.group_inst_care_cnt) * 1.00) / (SUM(ooh.cnt_child) * 1.00) * 100, 2) [group_inst_care_percentage]
	FROM @parameters p
	INNER JOIN ref.match_age_grouping_cd mag ON mag.age_grouping_cd = p.age_grouping_cd
	INNER JOIN ref.match_pk_gender mg ON mg.pk_gender = p.pk_gender
	INNER JOIN ref.match_cd_race_census mrc ON mrc.cd_race_census = p.cd_race_census
	INNER JOIN ref.match_cd_placement_setting ips ON ips.cd_placement_setting = p.initial_cd_placement_setting
	INNER JOIN ref.match_cd_placement_setting lps ON lps.cd_placement_setting = p.longest_cd_placement_setting
	INNER JOIN ref.match_cd_county mc ON mc.cd_county = p.cd_county
	INNER JOIN ref.match_bin_dependency_cd md ON md.bin_dependency_cd = p.bin_dependency_cd
	INNER JOIN ref.match_bin_los_cd ml ON ml.bin_los_cd = p.bin_los_cd
	INNER JOIN ref.match_bin_placement_cd bp ON bp.bin_placement_cd = p.bin_placement_cd
	INNER JOIN ref.match_bin_ihs_service_cd ihs ON ihs.bin_ihs_service_cd = p.bin_ihs_service_cd
	INNER JOIN ref.match_cd_reporter_type mrt ON mrt.cd_reporter_type = p.cd_reporter_type
	INNER JOIN ref.match_cd_access_type mat ON mat.cd_access_type = p.cd_access_type
	INNER JOIN ref.match_allegation ma ON ma.cd_allegation = p.cd_allegation
	INNER JOIN ref.match_finding mf ON mf.cd_finding = p.cd_finding
	INNER JOIN portal_redux.ooh_pit_measures ooh ON ooh.age_grouping_cd_mix = mag.age_grouping_match_code
		AND ooh.pk_gndr = mg.pk_gender_match_code
		AND ooh.cd_race = mrc.race_census_match_code
		AND ooh.init_cd_plcm_setng = ips.placement_setting_match_code
		AND ooh.long_cd_plcm_setng = lps.placement_setting_match_code
		AND ooh.county_cd = mc.county_match_code
		AND ooh.bin_dep_cd = md.bin_dependency_match_code
		AND ooh.max_bin_los_cd = ml.bin_los_match_code
		AND ooh.bin_placement_cd = bp.bin_placement_match_code
		AND ooh.bin_ihs_svc_cd = ihs.bin_ihs_service_match_code
		AND ooh.cd_reporter_type = mrt.reporter_type_match_code
		AND ooh.filter_access_type = mat.filter_access_type
		AND ooh.filter_allegation = ma.filter_allegation
		AND ooh.filter_finding = mf.filter_finding
		AND ooh.fl_ooh_wb_family_settings = 1
	WHERE p.row_id = @row_id
	GROUP BY ooh.qry_type
		,ooh.date_type
		,ooh.start_date
		,p.age_grouping_cd
		,p.pk_gender
		,p.cd_race_census
		,p.initial_cd_placement_setting
		,p.longest_cd_placement_setting
		,p.cd_county
		,p.bin_dependency_cd
		,p.bin_los_cd
		,p.bin_placement_cd
		,p.bin_ihs_service_cd
		,p.cd_reporter_type
		,p.cd_access_type
		,p.cd_allegation
		,p.cd_finding

	UPDATE STATISTICS portal_redux.ooh_wb_family_settings_cache

	INSERT portal_redux.ooh_wb_family_settings_cache_query (
		age_grouping_cd
		,pk_gender
		,cd_race_census
		,initial_cd_placement_setting
		,longest_cd_placement_setting
		,cd_county
		,bin_dependency_cd
		,bin_los_cd
		,bin_placement_cd
		,bin_ihs_service_cd
		,cd_reporter_type
		,cd_access_type
		,cd_allegation
		,cd_finding
	)
	SELECT
		age_grouping_cd
		,pk_gender
		,cd_race_census
		,initial_cd_placement_setting
		,longest_cd_placement_setting
		,cd_county
		,bin_dependency_cd
		,bin_los_cd
		,bin_placement_cd
		,bin_ihs_service_cd
		,cd_reporter_type
		,cd_access_type
		,cd_allegation
		,cd_finding
	FROM @parameters
	WHERE row_id = @row_id

	UPDATE STATISTICS portal_redux.ooh_wb_family_settings_cache_query

	SET @row_id = (SELECT TOP 1 row_id FROM @parameters WHERE row_id > @row_id ORDER BY row_id)
END;