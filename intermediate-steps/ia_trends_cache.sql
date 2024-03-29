-- create ia_trends_cache table

 DROP TABLE portal_redux.ia_trends_cache;
CREATE TABLE portal_redux.ia_trends_cache (
    row_id INT NOT NULL,
    qry_type TINYINT NOT NULL,
    date_type TINYINT NOT NULL,
    start_date DATETIME NOT NULL,
    age_sib_group_cd TINYINT NOT NULL,
    cd_race_census TINYINT NOT NULL,
    cd_county TINYINT NOT NULL,
    cd_reporter_type TINYINT NOT NULL,
    cd_access_type TINYINT NOT NULL,
    cd_allegation TINYINT NOT NULL,
    cd_finding TINYINT NOT NULL,
    cnt_start_date INT NOT NULL,
    cnt_opened INT NOT NULL,
    x1 FLOAT (53) NOT NULL,
    x2 FLOAT (53) NOT NULL,
    jit_start_date INT NULL,
    jit_opened INT NULL,
    rate_opened DECIMAL (9, 2) NULL,
    fl_include_perCapita BIT DEFAULT ((1)) NOT NULL,
    CONSTRAINT pk_ia_trends_cache PRIMARY KEY CLUSTERED (row_id ASC)
);
GO


GO
CREATE NONCLUSTERED INDEX idx_ia_trends_cache
    ON portal_redux.ia_trends_cache (
        age_sib_group_cd ASC,
        cd_race_census ASC,
        cd_county ASC,
        cd_reporter_type ASC,
        cd_access_type ASC,
        cd_allegation ASC,
        cd_finding ASC
    )
INCLUDE (
    row_id,
    qry_type,
    date_type,
    start_date,
    jit_start_date,
    jit_opened,
    rate_opened,
    fl_include_perCapita
);
GO


-- populate ia_trends_cache table

TRUNCATE TABLE portal_redux.ia_trends_cache

IF EXISTS (
	SELECT *
	FROM sys.indexes i
	WHERE name = 'idx_ia_trends_cache'
		AND object_id = OBJECT_ID('portal_redux.ia_trends_cache'))
DROP INDEX idx_ia_trends_cache ON portal_redux.ia_trends_cache;

IF EXISTS (
	SELECT *
	FROM sys.indexes i
	WHERE name = 'idx_ia_trends_cache_builder'
		AND object_id = OBJECT_ID('portal_redux.ia_trends_cache'))
DROP INDEX idx_ia_trends_cache_builder ON portal_redux.ia_trends_cache

INSERT portal_redux.ia_trends_cache (
	row_id,
    qry_type,
    date_type,
    start_date,
    age_sib_group_cd,
    cd_race_census,
    cd_county,
    cd_reporter_type,
    cd_access_type,
    cd_allegation,
    cd_finding,
    cnt_start_date,
    cnt_opened,
    x1,
    x2,
    jit_start_date,
    jit_opened
) SELECT
	ROW_NUMBER() OVER (ORDER BY ia.qry_type,
        ia.date_type,
        ia.start_date,
        ia.age_sib_group_cd,
        ia.cd_race_census,
        ia.cd_county,
        ia.cd_reporter_type,
        ia.cd_access_type,
        ia.cd_allegation,
        ia.cd_finding) row_id,
    ia.qry_type,
    ia.date_type,
    ia.start_date,
    ia.age_sib_group_cd,
    ia.cd_race_census,
    ia.cd_county,
    ia.cd_reporter_type,
    ia.cd_access_type,
    ia.cd_allegation,
    ia.cd_finding,
    ia.cnt_start_date,
    ia.cnt_opened,
    ia.x1,
    ia.x2,
    portal_redux.fnc_jitter(ia.cnt_start_date, ia.x1, ia.x2) [jit_start_date],
    portal_redux.fnc_jitter(ia.cnt_opened, ia.x1, ia.x2) [jit_opened]
FROM (SELECT
    CONVERT(TINYINT, ia.qry_type) [qry_type],
    CONVERT(TINYINT, ia.date_type) [date_type],
    ia.start_date,
    ia.start_year,
    CONVERT(TINYINT, masg.age_sib_group_cd) [age_sib_group_cd],
    CONVERT(TINYINT, mrc.cd_race_census) [cd_race_census],
    CONVERT(TINYINT, mc.cd_county) [cd_county],
    CONVERT(TINYINT, mrt.cd_reporter_type) [cd_reporter_type],
    CONVERT(TINYINT, mat.cd_access_type) [cd_access_type],
    CONVERT(TINYINT, ma.cd_allegation) [cd_allegation],
    CONVERT(TINYINT, mf.cd_finding) [cd_finding],
    ISNULL(SUM(ia.cnt_start_date), 0) [cnt_start_date],
    ISNULL(SUM(ia.cnt_opened), 0) [cnt_opened],
    RAND() [x1],
    RAND() [x2]
FROM portal_redux.ia_trends ia
INNER JOIN portal_redux.match_age_sib_group_cd masg ON masg.age_sib_group_match_code = ia.cd_sib_age_group
INNER JOIN portal_redux.match_cd_race_census mrc ON mrc.race_census_match_code = ia.cd_race_census
INNER JOIN portal_redux.match_cd_county mc ON mc.county_match_code = ia.county_cd
INNER JOIN portal_redux.match_cd_reporter_type mrt ON mrt.reporter_type_match_code = ia.cd_reporter_type
INNER JOIN portal_redux.match_cd_access_type mat ON mat.filter_access_type = ia.filter_access_type
INNER JOIN portal_redux.match_allegation ma ON ma.filter_allegation = ia.filter_allegation
INNER JOIN portal_redux.match_finding mf ON mf.filter_finding = ia.filter_finding
GROUP BY ia.qry_type,
        ia.date_type,
        ia.start_date,
        ia.start_year,
        masg.age_sib_group_cd,
        mrc.cd_race_census,
        mc.cd_county,
        mrt.cd_reporter_type,
        mat.cd_access_type,
        ma.cd_allegation,
        mf.cd_finding
	) ia
INNER JOIN portal_redux.ref_lookup_max_date lmd ON ia.start_date BETWEEN lmd.min_date_any AND lmd.max_date_any
	AND lmd.id = 18 -- sp_ia_trends_counts

UPDATE STATISTICS portal_redux.ia_trends_cache;

CREATE NONCLUSTERED INDEX [idx_ia_trends_cache_builder] ON portal_redux.[ia_trends_cache] (
	[age_sib_group_cd],
    [cd_race_census],
    [cd_county],
    [start_date]
) INCLUDE (
	[cnt_start_date],
    [cnt_opened],
    [jit_opened]
);

UPDATE ia
SET ia.rate_opened = ROUND(ia.jit_opened / (p.population_count * 1.00) * 1000, 2),
    ia.fl_include_perCapita = CONVERT(BIT, CASE
	    WHEN ia.cnt_start_date > p.perCapita_threshold
		THEN 0
	    WHEN ia.cnt_opened > p.perCapita_threshold
		THEN 0
	    ELSE 1
		END)
    FROM portal_redux.ia_trends_cache ia
    INNER JOIN portal_redux.match_census_population_household p ON p.measurement_year = YEAR(ia.start_date)
	    AND p.age_sib_group_cd = ia.age_sib_group_cd
	    AND p.cd_race_census = ia.cd_race_census
	    AND p.cd_county = ia.cd_county
	    AND p.population_count != 0;

UPDATE STATISTICS portal_redux.ia_trends_cache;

DROP INDEX idx_ia_trends_cache_builder ON portal_redux.ia_trends_cache;

CREATE NONCLUSTERED INDEX idx_ia_trends_cache ON portal_redux.ia_trends_cache (
	age_sib_group_cd,
    cd_race_census,
    cd_county,
    cd_reporter_type,
    cd_access_type,
    cd_allegation,
    cd_finding
) INCLUDE (
	row_id,
    qry_type,
    date_type,
    start_date,
    jit_start_date,
    jit_opened,
    rate_opened,
    fl_include_perCapita
);
