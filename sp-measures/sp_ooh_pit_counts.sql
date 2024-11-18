-- exec statement


CREATE PROCEDURE [portal_redux].[sp_ooh_pit_counts] (
	@date VARCHAR(3000)
	,@age_grouping_cd VARCHAR(30)
	,@race_cd VARCHAR(30)
	,@gender_cd VARCHAR(10)
	,@init_cd_plcm_setng VARCHAR(30)
	,@long_cd_plcm_setng VARCHAR(30)
	,@county_cd VARCHAR(200)
	,@bin_los_cd VARCHAR(30)
	,@bin_placement_cd VARCHAR(30)
	,@bin_ihs_svc_cd VARCHAR(30)
	,@cd_reporter_type VARCHAR(100)
	,@filter_access_type VARCHAR(30)
	,@filter_allegation VARCHAR(30)
	,@filter_finding VARCHAR(30)
	,@bin_dep_cd VARCHAR(20)
	,@fl_return_results VARCHAR(30) = '1' -- 1 = yes; 0 = no (for loading cache tables set to 0)
	,@debug VARCHAR(30) = 0
	)
AS
SET NOCOUNT ON

 /*  --  for qa only
 declare  @date varchar(3000)='2000-01-01,2013-01-01'
declare  @age_grouping_cd varchar(30)='0'
declare  @race_cd varchar(30)='1'
declare  @gender_cd varchar(10)='0'
declare  @init_cd_plcm_setng varchar(30)='0'
declare  @long_cd_plcm_setng varchar(30)= '0'
declare  @county_cd varchar(200)= '0'
declare  @bin_los_cd varchar(30)= '0'
declare  @bin_placement_cd varchar(30)= '0'
declare  @bin_ihs_svc_cd varchar(30)= '0'
declare  @cd_reporter_type varchar(100)= '0'
declare  @filter_access_type varchar(30)= '0'
declare  @filter_allegation  varchar(30)= '0'
declare @filter_finding varchar(30)= '0'
declare @bin_dep_cd varchar(20)= '0'
DECLARE @fl_return_results SMALLINT = 1
-- exec statement */


-- declare  @date varchar(3000)
--declare @age_grouping_cd varchar(30)
--declare @race_cd varchar(30)
--declare @gender_cd varchar(10)
--declare @init_cd_plcm_setng varchar(30)
--declare @long_cd_plcm_setng varchar(30) 
--declare @county_cd varchar(200) 
--declare @bin_los_cd varchar(30) 
--declare @bin_placement_cd varchar(30) 
--declare @bin_ihs_svc_cd varchar(30) 
--declare @cd_reporter_type varchar(100) 
--declare @filter_access_type varchar(30) 
--declare @filter_allegation  varchar(30)
--declare @filter_finding varchar(30)
--declare @bin_dep_cd varchar(20)
--declare @fl_return_results smallint  -- 1 = yes; 0 = no (for loading cache tables set to 0)
--set @date = '2000-01-01,2014-04-01'
--set @age_grouping_cd='1'
--set @race_cd='8'
--set @gender_cd='0'
--set @init_cd_plcm_setng='0'
--set @long_cd_plcm_setng='0'
--set @county_cd='0'
--set @bin_los_cd='0'
--set @bin_placement_cd='0'
--set @bin_ihs_svc_cd='0'
--set @cd_reporter_type='0'
--set @filter_access_type='0'
--set @filter_allegation='0'
--set @filter_finding='0'
--set @bin_dep_cd='0'
--set @fl_return_results=0
DECLARE @qry_id BIGINT;
DECLARE @mindate DATETIME;
DECLARE @maxdate DATETIME;
DECLARE @tblqryid TABLE (qry_id VARCHAR(30))
DECLARE @var_row_cnt_param VARCHAR(30);
DECLARE @var_row_cnt_cache VARCHAR(30);
DECLARE @minfilterdate DATETIME;

IF OBJECT_ID('tempDB..#age') IS NOT NULL
	DROP TABLE #age;

CREATE TABLE #age (
	age_grouping_cd VARCHAR(30)
	,match_code VARCHAR(30)
	);

CREATE INDEX idx_age_match_code ON #age (match_code);

IF OBJECT_ID('tempDB..#eth') IS NOT NULL
	DROP TABLE #eth;

CREATE TABLE #eth (
	cd_race VARCHAR(30)
	,cd_origin VARCHAR(30)
	,match_code VARCHAR(30)
	);

CREATE INDEX idx_eth_match ON #eth (
	match_code
	,cd_origin
	);

IF OBJECT_ID('tempDB..#gdr') IS NOT NULL
	DROP TABLE #gdr;

CREATE TABLE #gdr (
	pk_gndr VARCHAR(30)
	,match_code VARCHAR(30)
	);

CREATE INDEX idx_gdr_match_code ON #gdr (match_code);

--alter table #gdr add primary key(match_code);
--create index idx_gndr_match on #gdr(pk_gndr,match_code,cd_gndr);
IF OBJECT_ID('tempDB..#fpl') IS NOT NULL
	DROP TABLE #fpl;

CREATE TABLE #fpl (
	cd_plcm_setng VARCHAR(30)
	,match_code VARCHAR(30)
	);

--alter table #fpl add primary key(match_code);
--create index idx_fpl_match on #fpl(cd_plcm_setng,tx_plcm_setng);
CREATE INDEX idx_fpl_match_code ON #fpl (match_code);

IF OBJECT_ID('tempDB..#lpl') IS NOT NULL
	DROP TABLE #lpl;

CREATE TABLE #lpl (
	cd_plcm_setng VARCHAR(30)
	,match_code VARCHAR(30)
	);

--alter table #lpl add primary key (match_code);
--create index idx_lpl_match on #lpl(cd_plcm_setng,tx_plcm_setng);
CREATE INDEX idx_lpl_match_code ON #lpl (match_code);

IF OBJECT_ID('tempDB..#cnty') IS NOT NULL
	DROP TABLE #cnty;

CREATE TABLE #cnty (
	cd_cnty VARCHAR(30)
	,match_code VARCHAR(30)
	);

--alter table #cnty add primary key(match_code);
--create index #cnty on idx_cnty_match(cd_cnty,tx_cnty);
CREATE INDEX idx_cnty_match_code ON #cnty (match_code);

--- new filters
IF OBJECT_ID('tempDB..#los') IS NOT NULL
	DROP TABLE #los;

CREATE TABLE #los (
	bin_los_cd VARCHAR(30)
	,match_code VARCHAR(30)
	,PRIMARY KEY (
		bin_los_cd
		,match_code
		)
	);

CREATE INDEX idx_los_match_code ON #los (match_code)

CREATE INDEX idx_los_match_code2 ON #los (bin_los_cd)

IF OBJECT_ID('tempDB..#nbrplc') IS NOT NULL
	DROP TABLE #nbrplc;

CREATE TABLE #nbrplc (
	bin_placement_cd VARCHAR(30)
	,match_code VARCHAR(30)
	,PRIMARY KEY (
		bin_placement_cd
		,match_code
		)
	);

CREATE INDEX idx_nbrplcm_match_code ON #nbrplc (match_code)

IF OBJECT_ID('tempDB..#ihs') IS NOT NULL
	DROP TABLE #ihs;

CREATE TABLE #ihs (
	bin_ihs_svc_cd VARCHAR(30)
	,match_code VARCHAR(30)
	,PRIMARY KEY (
		bin_ihs_svc_cd
		,match_code
		)
	);

CREATE INDEX idx_ihs_match_code ON #ihs (match_code)

IF OBJECT_ID('tempDB..#rpt') IS NOT NULL
	DROP TABLE #rpt;

CREATE TABLE #rpt (
	cd_reporter_type VARCHAR(30)
	,match_code VARCHAR(30)
	,PRIMARY KEY (
		cd_reporter_type
		,match_code
		)
	);

CREATE INDEX idx_reporter_match_code ON #rpt (match_code)

IF OBJECT_ID('tempDB..#access_type') IS NOT NULL
	DROP TABLE #access_type;

CREATE TABLE #access_type (
	cd_access_type VARCHAR(30)
	,filter_access_type DECIMAL(18, 0)
	,match_code VARCHAR(30)
	);

CREATE INDEX idx_cd_access_type ON #access_type (
	cd_access_type
	,match_code
	)

-- allegation tables
IF OBJECT_ID('tempDB..#algtn') IS NOT NULL
	DROP TABLE #algtn;

CREATE TABLE #algtn (
	cd_allegation VARCHAR(30)
	,filter_allegation DECIMAL(18, 0)
	,match_code DECIMAL(18, 0)
	,PRIMARY KEY (
		cd_allegation
		,match_code
		)
	);

CREATE INDEX idx_algtn ON #algtn (match_code)

-- finding tables
IF OBJECT_ID('tempDB..#find') IS NOT NULL
	DROP TABLE #find

CREATE TABLE #find (
	cd_finding VARCHAR(30)
	,filter_finding DECIMAL(18, 0)
	,match_code DECIMAL(18, 0)
	,PRIMARY KEY (
		cd_finding
		,match_code
		)
	);

CREATE INDEX idx_finding ON #find (match_code)

IF object_ID('tempDB..#dep') IS NOT NULL
	DROP TABLE #dep

CREATE TABLE #dep (
	bin_dep_cd VARCHAR(30)
	,match_code DECIMAL(18, 0)
	,PRIMARY KEY (
		bin_dep_cd
		,match_code
		)
	)

CREATE INDEX idx_dep ON #dep (match_code)

------------------------------------------------  AGE
INSERT INTO #age (
	age_grouping_cd
	,match_code
	)
SELECT age_grouping_cd
	,match_code
FROM prm_age_census
JOIN [portal_redux].[fn_ReturnStrTableFromList](@age_grouping_cd, 0) ON cast(arrValue AS VARCHAR(30)) = age_grouping_cd;

UPDATE STATISTICS #age;

------------- race -----------------------------------------------------------------------------
INSERT INTO #eth (
	cd_race
	,cd_origin
	,match_code
	)
SELECT eth.cd_race
	,eth.cd_origin
	,eth.match_code
FROM prm_eth_census eth
JOIN [portal_redux].[fn_ReturnStrTableFromList](@race_cd, 0) ON cast(arrValue AS VARCHAR(30)) = eth.cd_race

UPDATE STATISTICS #eth

---------------------------------------  GENDER ---------------------------------------  
INSERT INTO #gdr (
	PK_GNDR
	,match_code
	)
SELECT pk_gndr
	,match_code
FROM prm_gndr gdr
JOIN portal_redux.fn_ReturnStrTableFromList(@gender_cd, 0) ON cast(arrValue AS VARCHAR(30)) = gdr.pk_gndr

UPDATE STATISTICS #gdr

----------------------------------  FIRST PLACEMENT ------------------------------------------------------------
INSERT INTO #fpl (
	cd_plcm_setng
	,match_code
	)
SELECT fpl.init_cd_plcm_setng
	,fpl.match_code
FROM prm_fpl fpl
JOIN portal_redux.fn_ReturnStrTableFromList(@init_cd_plcm_setng, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = fpl.init_cd_plcm_setng

UPDATE STATISTICS #fpl

----------------------------------  LONGEST PLACEMENT ------------------------------------------------------------
INSERT INTO #lpl (
	cd_plcm_setng
	,match_code
	)
SELECT lpl.long_cd_plcm_setng
	,lpl.match_code
FROM prm_lpl lpl
JOIN portal_redux.fn_ReturnStrTableFromList(@long_cd_plcm_setng, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = lpl.long_cd_plcm_setng

UPDATE STATISTICS #lpl

---------------------------------------  County -------------------------
INSERT INTO #cnty (
	cd_cnty
	,match_code
	)
SELECT cnty.cd_cnty
	,cnty.match_code
FROM prm_cnty cnty
JOIN portal_redux.fn_ReturnStrTableFromList(@County_Cd, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = cnty.cd_cnty

UPDATE STATISTICS #cnty

--------------------------------------------  LOS CODE --------------------------------------------------
INSERT INTO #los (
	bin_los_cd
	,match_code
	)
SELECT los.bin_los_cd
	,los.match_code
FROM [portal_redux].[fn_ReturnStrTableFromList](@bin_los_cd, 0)
JOIN [prm_los_max_bin_los_cd] los ON los.bin_los_cd = cast(arrValue AS VARCHAR(30));

UPDATE STATISTICS #los

-------------------------------------- PLACEMENT CODE ------------------------------
INSERT INTO #nbrplc (
	bin_placement_cd
	,match_code
	)
SELECT plc.bin_placement_cd
	,plc.match_code
FROM prm_plc plc
JOIN portal_redux.fn_ReturnStrTableFromList(@bin_placement_cd, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = plc.bin_placement_cd

UPDATE STATISTICS #nbrplc

-------------------------------------- IHS SRVC ------------------------------
INSERT INTO #ihs (
	bin_ihs_svc_cd
	,match_code
	)
SELECT ihs.bin_ihs_svc_cd
	,ihs.match_code
FROM prm_ihs ihs
JOIN portal_redux.fn_ReturnStrTableFromList(@bin_ihs_svc_cd, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = ihs.bin_ihs_svc_cd

UPDATE STATISTICS #ihs

------------------------------------  REPORTER FILTER ------------------------------
INSERT INTO #rpt (
	cd_reporter_type
	,match_code
	)
SELECT rpt.cd_reporter_type
	,rpt.match_code
FROM prm_rpt rpt
JOIN portal_redux.fn_ReturnStrTableFromList(@cd_reporter_type, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = rpt.cd_reporter_type

UPDATE STATISTICS #rpt

-----------------------------------   access_type --------------------------------------
INSERT INTO #access_type (
	cd_access_type
	,filter_access_type
	,match_code
	)
SELECT acc.cd_access_type
	,acc.match_code
	,acc.match_code
FROM prm_acc acc
JOIN portal_redux.fn_ReturnStrTableFromList(@filter_access_type, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = acc.cd_access_type

UPDATE STATISTICS #access_type;

----------------------------------   ALLEGATIONS ---------------------------------------
--  @filter_allegation	;
INSERT INTO #algtn (
	cd_allegation
	,filter_allegation
	,match_code
	)
SELECT alg.cd_allegation
	,alg.match_code
	,alg.match_code
FROM prm_alg alg
JOIN portal_redux.fn_ReturnStrTableFromList(@filter_allegation, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = alg.cd_allegation

UPDATE STATISTICS #algtn

------------------------------------  FINDINGS --------------------------------------
--  	prm_fnd   @filter_finding
INSERT INTO #find (
	cd_finding
	,filter_finding
	,match_code
	)
SELECT fnd.cd_finding
	,fnd.match_code
	,fnd.match_code
FROM prm_fnd fnd
JOIN portal_redux.fn_ReturnStrTableFromList(@filter_finding, 0) sel ON cast(sel.arrValue AS VARCHAR(30)) = fnd.cd_finding

UPDATE STATISTICS #find

-- dependency
INSERT INTO #dep (
	bin_dep_cd
	,match_code
	)
SELECT dep.bin_dep_cd
	,dep.match_code
FROM [portal_redux].[fn_ReturnStrTableFromList](@bin_dep_cd, 0)
JOIN prm_dep dep ON dep.bin_dep_cd = cast(arrValue AS VARCHAR(30));

UPDATE STATISTICS #dep;

SELECT @minfilterdate = max(a.db_min_filter_date)
FROM (
	SELECT max(d.min_filter_date) AS 'db_min_filter_date'
	FROM portal_redux.ref_filter_dependency d
	INNER JOIN #dep td ON td.bin_dep_cd = d.bin_dep_cd
	
	UNION
	
	SELECT max(a.min_filter_date) AS 'db_min_filter_date'
	FROM portal_redux.ref_filter_allegation a
	INNER JOIN #algtn at ON at.cd_allegation = a.cd_allegation
	
	UNION
	
	SELECT max(f.min_filter_date) AS 'db_min_filter_date'
	FROM portal_redux.ref_filter_finding f
	INNER JOIN #find ft ON ft.cd_finding = f.cd_finding
	
	UNION
	
	SELECT max(e.min_filter_date) AS 'db_min_filter_date'
	FROM portal_redux.ref_filter_access_type e
	INNER JOIN #access_type et ON et.cd_access_type = e.cd_access_type
	
	UNION
	
	SELECT cast('2000-01-01' AS DATETIME) AS 'db_min_filter_date'
	) AS a;

IF object_ID('tempDB..#prmlocdem') IS NOT NULL
	DROP TABLE #prmlocdem

CREATE TABLE #prmlocdem (
	int_param_key VARCHAR(30) NOT NULL
	,int_match_param_key VARCHAR(30) NOT NULL
	,age_grouping_cd VARCHAR(30) NOT NULL
	,pk_gndr VARCHAR(30) NOT NULL
	,cd_race_census VARCHAR(30) NOT NULL
	--	,cd_hispanic_latino_origin int not null
	,init_cd_plcm_setng VARCHAR(30) NOT NULL
	,long_cd_plcm_setng VARCHAR(30) NOT NULL
	,county_cd VARCHAR(30) NOT NULL
	,match_age_grouping_cd VARCHAR(30) NOT NULL
	,match_pk_gdnr VARCHAR(30) NOT NULL
	,match_cd_race_census VARCHAR(30) NOT NULL
	,match_cd_hispanic_latino_origin VARCHAR(30) NOT NULL
	,match_init_cd_plcm_setng VARCHAR(30) NOT NULL
	,match_long_cd_plcm_setng VARCHAR(30) NOT NULL
	,match_county_cd VARCHAR(30) NOT NULL
	--,ooh_filter_in_cache_table tinyint not null default 0
	,PRIMARY KEY (
		int_param_key
		,int_match_param_key
		)
	);

INSERT INTO #prmlocdem (
	int_param_key
	,int_match_param_key
	,age_grouping_cd
	,pk_gndr
	,cd_race_census
	,init_cd_plcm_setng
	,long_cd_plcm_setng
	,county_cd
	,match_age_grouping_cd
	,match_pk_gdnr
	,match_cd_race_census
	,match_cd_hispanic_latino_origin
	,match_init_cd_plcm_setng
	,match_long_cd_plcm_setng
	,match_county_cd
	)
SELECT cast(power(10.0, 8) + (power(10.0, 7) * coalesce(age.age_grouping_cd, 0)) + (power(10.0, 5) * coalesce(eth.cd_race, 7)) + (power(10.0, 4) * coalesce(gdr.pk_gndr, 5)) + (power(10.0, 3) * fpl.cd_plcm_setng) + (power(10.0, 2) * lpl.cd_plcm_setng) + (power(10.0, 0) * cnty.cd_cnty) AS DECIMAL(9, 0)) AS int_param_key
	,cast(power(10.0, 8) + (power(10.0, 7) * coalesce(age.match_code, 0)) + (power(10.0, 6) * coalesce(eth.match_code, 7)) + (power(10.0, 5) * coalesce(eth.cd_origin, 5)) + (power(10.0, 4) * coalesce(gdr.match_code, 3)) + (power(10.0, 3) * fpl.match_code) + (power(10.0, 2) * lpl.match_code) + (
			power(10.0, 0) * (
				CASE 
					WHEN coalesce(cnty.match_code, - 99) NOT BETWEEN 1
							AND 39
						THEN 99
					ELSE cnty.match_code
					END
				)
			) AS DECIMAL(9, 0)) AS int_match_param_key
	,age.age_grouping_cd
	,gdr.pk_gndr
	,eth.cd_race AS cd_race_census
	,fpl.cd_plcm_setng AS init_cd_plcm_setng
	,lpl.cd_plcm_setng AS longest_cd_plcm_setng
	,cnty.cd_cnty AS county_cd
	,age.match_code AS match_age_grouping_cd
	,gdr.match_code AS match_pk_gndr
	,eth.match_code AS match_cd_race_census
	,eth.cd_origin AS match_census_hispanic_latino_origin_cd
	,fpl.match_code AS match_init_cd_plcm_setng
	,lpl.match_code AS match_longest_cd_plcm_setng
	,cnty.match_code AS match_county_cd
FROM #age age
CROSS JOIN #eth eth
CROSS JOIN #gdr gdr
CROSS JOIN #fpl fpl
CROSS JOIN #lpl lpl
CROSS JOIN #cnty cnty

CREATE INDEX idx_int_match_param_key_demog_fields ON #prmlocdem (
	int_match_param_key
	,age_grouping_cd
	,pk_gndr
	,cd_race_census
	,init_cd_plcm_setng
	,long_cd_plcm_setng
	,county_cd
	)

CREATE INDEX idx_int_match_cd_race_census ON #prmlocdem (cd_race_census)

CREATE INDEX idx_age_grouping_cd ON #prmlocdem (age_grouping_cd)

UPDATE STATISTICS #prmlocdem

-----------------------------------  set dates  -------------------------------------  		
SELECT @mindate = min_date_any
	,@maxdate = max_date_any
FROM portal_redux.ref_lookup_max_date
WHERE id = 19;

SET @qry_id = (
		SELECT TOP 1 qry_id
		FROM portal_redux.cache_poc1ab_params
		WHERE age_grouping_cd = left(@age_grouping_cd, 20)
			AND cd_race_census = left(@race_cd, 30)
			AND pk_gndr = left(@gender_cd, 10)
			AND init_cd_plcm_setng = left(@init_cd_plcm_setng, 50)
			AND long_cd_plcm_setng = left(@long_cd_plcm_setng, 50)
			AND county_cd = left(@County_Cd, 200)
			AND bin_los_cd = left(@bin_los_cd, 30)
			AND bin_placement_cd = left(@bin_placement_cd, 30)
			AND bin_ihs_svc_cd = left(@bin_ihs_svc_cd, 30)
			AND cd_reporter_type = left(@cd_reporter_type, 100)
			AND filter_access_type = left(@filter_access_type, 30)
			AND filter_allegation = left(@filter_allegation, 30)
			AND filter_finding = left(@filter_finding, 30)
			AND bin_dep_cd = left(@bin_dep_cd, 20)
		ORDER BY qry_ID ASC
		);

IF @qry_Id IS NULL
BEGIN
	INSERT INTO [portal_redux].[cache_poc1ab_params] (
		qry_id
		,[age_grouping_cd]
		,[cd_race_census]
		,[pk_gndr]
		,[init_cd_plcm_setng]
		,[long_cd_plcm_setng]
		,[county_cd]
		,[bin_los_cd]
		,[bin_placement_cd]
		,[bin_ihs_svc_cd]
		,[cd_reporter_type]
		,[filter_access_type]
		,[filter_allegation]
		,[filter_finding]
		,bin_dep_cd
		,[min_start_date]
		,[max_start_date]
		,[cnt_qry]
		,[last_run_date]
		)
	OUTPUT inserted.qry_ID
	INTO @tblqryid
	SELECT isnull((
				SELECT max(qry_id) + 1
				FROM portal_redux.[cache_poc1ab_params]
				), 1)
		,@age_grouping_cd
		,@race_cd
		,@gender_cd
		,@init_cd_plcm_setng
		,@long_cd_plcm_setng
		,@county_cd
		,@bin_los_cd
		,@bin_placement_cd
		,@bin_ihs_svc_cd
		,@cd_reporter_type
		,@filter_access_type
		,@filter_allegation
		,@filter_finding
		,@bin_dep_cd
		,@mindate
		,@maxdate
		,1
		,getdate()

	SELECT @qry_id = qry_id
	FROM @tblqryid;
END
ELSE
BEGIN
	UPDATE portal_redux.cache_poc1ab_params
	SET cnt_qry = cnt_qry + 1
		,last_run_date = getdate()
	WHERE @qry_id = qry_id
END

-- see if results are in cache as a subset of previously run query
IF OBJECT_ID('tempDB..#cachekeys') IS NOT NULL
	DROP TABLE #cachekeys;

SELECT ([int_param_key] * power(10.0, 9)) + ([bin_dep_cd] * power(10.0, 8)) + ([bin_los_cd] * power(10.0, 7)) + ([bin_placement_cd] * power(10.0, 6)) + ([bin_ihs_svc_cd] * power(10.0, 5)) + ([cd_reporter_type] * power(10.0, 3)) + ([cd_access_type] * power(10.0, 2)) + ([cd_allegation] * 10.0) + [cd_finding] AS [int_hash_key]
	,int_param_key
	,bin_dep_cd
	,bin_los_cd
	,bin_placement_cd
	,bin_ihs_svc_cd
	,cd_reporter_type
	,cd_access_type
	,cd_allegation
	,cd_finding
	,0 AS in_cache
	,q.qry_id AS qry_id
INTO #cachekeys
FROM (
	SELECT @qry_id qry_id
	) q
CROSS JOIN (
	SELECT DISTINCT int_param_key
	FROM #prmlocdem
	) prm
CROSS JOIN (
	SELECT DISTINCT bin_los_cd
	FROM #los
	) los
CROSS JOIN (
	SELECT DISTINCT bin_placement_cd
	FROM #nbrplc
	) plc
CROSS JOIN (
	SELECT DISTINCT bin_ihs_svc_cd
	FROM #ihs
	) ihs
CROSS JOIN (
	SELECT DISTINCT cd_reporter_type
	FROM #rpt
	) rpt
CROSS JOIN (
	SELECT DISTINCT cd_access_type
	FROM #access_type
	) acc
CROSS JOIN (
	SELECT DISTINCT cd_allegation
	FROM #algtn
	) alg
CROSS JOIN (
	SELECT DISTINCT cd_finding
	FROM #find
	) fnd
CROSS JOIN (
	SELECT DISTINCT bin_dep_cd
	FROM #dep
	) dep

CREATE INDEX idx_int_hash_key ON #cachekeys (
	int_hash_key
	,in_cache
	);

CREATE INDEX idx_qryid_params ON #cachekeys (
	qry_id
	,int_hash_key
	);

CREATE INDEX idx_params ON #cachekeys (
	int_param_key
	,bin_dep_cd
	,bin_los_cd
	,bin_placement_cd
	,bin_ihs_svc_cd
	,cd_reporter_type
	,cd_access_type
	,cd_allegation
	,cd_finding
	,in_cache
	);

UPDATE cache
SET in_cache = 1
	,qry_id = poc1ab.qry_id
FROM #cachekeys cache
JOIN [portal_redux].[cache_qry_param_poc1ab] poc1ab ON poc1ab.int_hash_key = cache.int_hash_key

SELECT @var_row_cnt_param = count(*)
	,@var_row_cnt_cache = sum(in_cache)
FROM #cachekeys;

IF @var_row_cnt_param <> @var_row_cnt_cache
BEGIN
	INSERT INTO portal_redux.cache_poc1ab_aggr (
		[qry_type]
		,[date_type]
		,[start_date]
		,[int_param_key]
		,[bin_dep_cd]
		,[bin_los_cd]
		,[bin_placement_cd]
		,[bin_ihs_svc_cd]
		,[cd_reporter_type]
		,[cd_access_type]
		,[cd_allegation]
		,[cd_finding]
		,[age_grouping_cd]
		,[cd_race]
		,[pk_gndr]
		,[init_cd_plcm_setng]
		,[long_cd_plcm_setng]
		,[county_cd]
		,[cnt_start_date]
		,[min_start_date]
		,[max_start_date]
		,[x1]
		,[x2]
		,[insert_date]
		,int_hash_key
		,qry_id
		,start_year
		,fl_include_perCapita
		)
	SELECT poc1ab.qry_type
		,poc1ab.date_type
		,poc1ab.[start_date]
		,che.int_param_key
		,dep.bin_dep_cd
		,los.bin_los_cd
		,plc.bin_placement_cd
		,ihs.bin_ihs_svc_cd
		,rpt.cd_reporter_type
		,acc.cd_access_type
		,alg.cd_allegation
		,fnd.cd_finding
		,mtch.age_grouping_cd
		,mtch.cd_race_census
		,mtch.pk_gndr
		,mtch.init_cd_plcm_setng
		,mtch.long_cd_plcm_setng
		,cnty.cd_cnty
		,isnull(sum(poc1ab.cnt_child_unique), 0) AS cnt_start_date
		,@mindate AS minmonthstart
		,@maxdate AS maxmonthstart
		,rand(convert(VARBINARY, newid())) [x1]
		,rand(convert(VARBINARY, newid())) [x2]
		,getdate() AS insert_date
		,che.int_hash_key
		,che.qry_id
		,year(poc1ab.[start_date])
		,1
	FROM portal_redux.ooh_point_in_time_measures poc1ab
	JOIN #prmlocdem mtch ON mtch.int_match_param_key = poc1ab.int_match_param_key_census
	JOIN #cnty cnty ON cnty.match_code = poc1ab.county_cd
	JOIN #los los ON los.match_code = poc1ab.max_bin_los_cd
	JOIN #nbrplc plc ON plc.match_code = poc1ab.bin_placement_cd
	JOIN #ihs ihs ON ihs.match_code = poc1ab.bin_ihs_svc_cd
	JOIN #rpt rpt ON rpt.match_code = poc1ab.cd_reporter_type
	JOIN #access_type acc ON acc.match_code = poc1ab.filter_access_type
	JOIN #algtn alg ON alg.match_code = poc1ab.filter_allegation
	JOIN #find fnd ON fnd.match_code = poc1ab.filter_finding
	JOIN #dep dep ON dep.match_code = poc1ab.bin_dep_cd
	JOIN #cachekeys che ON che.int_hash_key = ((mtch.int_param_key * power(10.0, 9)) + (dep.[bin_dep_cd] * power(10.0, 8)) + (los.[bin_los_cd] * power(10.0, 7)) + (plc.[bin_placement_cd] * power(10.0, 6)) + (ihs.[bin_ihs_svc_cd] * power(10.0, 5)) + (rpt.[cd_reporter_type] * power(10.0, 3)) + (acc.[cd_access_type] * power(10.0, 2)) + (alg.[cd_allegation] * 10.0) + fnd.[cd_finding])
		AND che.in_cache = 0
	WHERE fl_poc1ab = 1
	GROUP BY poc1ab.qry_type
		,poc1ab.date_type
		,poc1ab.[start_date]
		,year(poc1ab.[start_date])
		,che.int_hash_key
		,che.int_param_key
		,che.qry_id
		,dep.bin_dep_cd
		,los.bin_los_cd
		,plc.bin_placement_cd
		,ihs.bin_ihs_svc_cd
		,rpt.cd_reporter_type
		,acc.cd_access_type
		,alg.cd_allegation
		,fnd.cd_finding
		,mtch.age_grouping_cd
		,mtch.cd_race_census
		,mtch.pk_gndr
		,mtch.init_cd_plcm_setng
		,mtch.long_cd_plcm_setng
		,cnty.cd_cnty

	UPDATE portal_redux.cache_poc1ab_aggr
	SET cache_poc1ab_aggr.fl_include_perCapita = 0
	-- select pop_cnt, cache_poc1ab_aggr.*
	FROM portal_redux.cache_poc1ab_aggr
		,prm_ooh_census_population
	WHERE EXISTS (
			SELECT *
			FROM #cachekeys ck
			WHERE cache_poc1ab_aggr.qry_id = ck.qry_id
			)
		AND prm_ooh_census_population.measurement_year = start_year
		AND prm_ooh_census_population.county_cd = cache_poc1ab_aggr.county_cd
		AND prm_ooh_census_population.pk_gndr = cache_poc1ab_aggr.pk_gndr
		AND prm_ooh_census_population.cd_race = cache_poc1ab_aggr.cd_race
		AND prm_ooh_census_population.age_grouping_cd = cache_poc1ab_aggr.age_grouping_cd
		AND (cache_poc1ab_aggr.cnt_start_date * 1.00 > pop_cnt * .35);

	UPDATE STATISTICS portal_redux.cache_poc1ab_aggr

	INSERT INTO portal_redux.cache_qry_param_poc1ab (
		[int_param_key]
		,bin_dep_cd
		,[bin_los_cd]
		,[bin_placement_cd]
		,[bin_ihs_svc_cd]
		,[cd_reporter_type]
		,[cd_access_type]
		,[cd_allegation]
		,[cd_finding]
		,[age_grouping_cd]
		,[cd_race]
		,[pk_gndr]
		,[init_cd_plcm_setng]
		,[long_cd_plcm_setng]
		,[county_cd]
		,[qry_id]
		,[int_hash_key]
		)
	SELECT ck.[int_param_key]
		,bin_dep_cd
		,[bin_los_cd]
		,[bin_placement_cd]
		,[bin_ihs_svc_cd]
		,[cd_reporter_type]
		,[cd_access_type]
		,[cd_allegation]
		,[cd_finding]
		,q.[age_grouping_cd]
		,q.[cd_race_census]
		,q.[pk_gndr]
		,q.[init_cd_plcm_setng]
		,q.[long_cd_plcm_setng]
		,q.[county_cd]
		,qry_id
		,[int_hash_key]
	FROM #cachekeys ck
	JOIN (
		SELECT DISTINCT int_param_key
			,age_grouping_cd
			,cd_race_census
			,pk_gndr
			,init_cd_plcm_setng
			,long_cd_plcm_setng
			,county_cd
		FROM #prmlocdem
		) q ON q.int_param_key = ck.int_param_key
	WHERE ck.in_cache = 0;

	UPDATE STATISTICS portal_redux.cache_qry_param_poc1ab;
END

IF @fl_return_results = 1
	SELECT poc1ab.qry_type AS "qry_type_poc1"
		,poc1ab.date_type
		,poc1ab.start_date AS "Month"
		,poc1ab.age_grouping_cd AS "Age_Grouping_Cd"
		,ref_age.age_grouping AS "Age Grouping"
		,poc1ab.pk_gndr AS "Gender_Cd"
		,ref_gdr.tx_gndr AS "Gender"
		,poc1ab.cd_race AS "Ethnicity_Cd"
		,ref_eth.tx_race_census AS "Race/Ethnicity"
		,poc1ab.init_cd_plcm_setng AS "InitPlacementCd"
		,ref_fpl.tx_plcm_setng AS "First Placement Setting"
		,poc1ab.long_cd_plcm_setng AS "LongPlacementCd"
		,ref_lpl.tx_plcm_setng AS "Longest Placement Setting"
		,poc1ab.county_cd AS "Removal_County_Cd"
		,ref_cnty.county_desc AS "County"
		,poc1ab.bin_dep_cd AS [Dependency Cd]
		,ref_dep.bin_dep_desc AS [Dependency]
		,poc1ab.bin_los_cd
		,ref_los.bin_los_desc AS [Length of Service Desc]
		,poc1ab.bin_placement_cd
		,ref_plc.bin_placement_desc AS [Placement Count Desc]
		,poc1ab.bin_ihs_svc_cd
		,ref_ihs.bin_ihs_svc_tx AS [In-Home Service Desc]
		,poc1ab.cd_reporter_type
		,ref_rpt.tx_reporter_type AS [Reporter Desc]
		,poc1ab.cd_access_type
		,ref_acc.tx_access_type AS [Access type desc]
		,poc1ab.cd_allegation
		,ref_alg.tx_allegation AS [Allegation]
		,poc1ab.cd_finding
		,ref_fnd.tx_finding AS [Finding]
		,CASE 
			WHEN (cnt_start_date) > 0 /* jitter all above 0 */
				THEN CASE 
						WHEN (round(cnt_start_date + 2 * sqrt(- 2 * log(poc1ab.x1)) * cos(2 * pi() * poc1ab.x2), 0)) < 1
							THEN 1
						ELSE round(cnt_start_date + 2 * sqrt(- 2 * log(poc1ab.x1)) * cos(2 * pi() * poc1ab.x2), 0)
						END
			ELSE (cnt_start_date)
			END AS "Total In Care First Day"
	FROM portal_redux.cache_poc1ab_aggr poc1ab
	JOIN #cachekeys ck ON poc1ab.qry_id = ck.qry_id
		AND poc1ab.int_hash_key = ck.int_hash_key
	JOIN portal_redux.ref_age_groupings_census ref_age ON ref_age.age_grouping_cd = poc1ab.age_grouping_cd
	JOIN portal_redux.ref_lookup_ethnicity_census ref_eth ON ref_eth.cd_race_census = poc1ab.cd_race
	JOIN portal_redux.ref_lookup_gender ref_gdr ON ref_gdr.pk_gndr = poc1ab.pk_gndr
	JOIN portal_redux.ref_lookup_plcmnt ref_fpl ON ref_fpl.cd_plcm_setng = poc1ab.init_cd_plcm_setng
	JOIN portal_redux.ref_lookup_plcmnt ref_lpl ON ref_lpl.cd_plcm_setng = poc1ab.long_cd_plcm_setng
	JOIN portal_redux.ref_lookup_county ref_cnty ON ref_cnty.county_cd = poc1ab.county_cd
	JOIN portal_redux.vw_ref_dependency_lag ref_dep ON ref_dep.bin_dep_cd = poc1ab.bin_dep_cd
		AND poc1ab.date_type = ref_dep.date_type
		AND poc1ab.start_date BETWEEN @minfilterdate
			AND cohort_max_filter_date
	JOIN portal_redux.ref_filter_los ref_los ON ref_los.bin_los_cd = poc1ab.bin_los_cd
	JOIN portal_redux.ref_filter_nbr_placement ref_plc ON ref_plc.bin_placement_cd = poc1ab.bin_placement_cd
	JOIN portal_redux.ref_filter_ihs_services ref_ihs ON ref_ihs.bin_ihs_svc_cd = poc1ab.bin_ihs_svc_cd
	JOIN portal_redux.ref_filter_reporter_type ref_rpt ON ref_rpt.cd_reporter_type = poc1ab.cd_reporter_type
	JOIN portal_redux.ref_filter_access_type ref_acc ON ref_acc.cd_access_type = poc1ab.cd_access_type
	JOIN portal_redux.ref_filter_allegation ref_alg ON ref_alg.cd_allegation = poc1ab.cd_allegation
	JOIN portal_redux.ref_filter_finding ref_fnd ON ref_fnd.cd_finding = poc1ab.cd_finding
	WHERE poc1ab.start_date BETWEEN @mindate
			AND @maxdate
	ORDER BY poc1ab.qry_type
		,poc1ab.date_type
		,poc1ab.start_date
		,poc1ab.age_grouping_cd
		,poc1ab.pk_gndr
		,poc1ab.cd_race
		,poc1ab.init_cd_plcm_setng
		,poc1ab.long_cd_plcm_setng
		,poc1ab.county_cd
		,poc1ab.bin_dep_cd
		,poc1ab.bin_los_cd
		,poc1ab.bin_placement_cd
		,poc1ab.bin_ihs_svc_cd
		,poc1ab.cd_reporter_type
		,poc1ab.cd_access_type
		,poc1ab.cd_allegation
		,poc1ab.cd_finding;
