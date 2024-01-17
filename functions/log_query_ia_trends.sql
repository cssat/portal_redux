-- create ia_trends_params table

DROP TABLE IF EXISTS portal_redux.ia_trends_params
CREATE TABLE [portal_redux].[ia_trends_params] (
    [qry_id] INT NOT NULL IDENTITY(1,1) 
        CONSTRAINT [pk_ia_trends_params] PRIMARY KEY, 
    [age_sib_group_cd] VARCHAR(20) NOT NULL, 
    [cd_race_census] VARCHAR(30) NOT NULL, 
    [cd_county] VARCHAR(250) NOT NULL, 
    [cd_reporter_type] VARCHAR(100) NOT NULL, 
    [cd_access_type] VARCHAR(30) NOT NULL, 
    [cd_allegation] VARCHAR(30) NOT NULL, 
    [cd_finding] VARCHAR(30) NOT NULL, 
    [min_start_date] DATETIME NOT NULL, 
    [max_start_date] DATETIME NOT NULL, 
    [cnt_qry_counts] INT NOT NULL, 
    [cnt_qry_rates] INT NOT NULL, 
    [last_run_date] DATETIME NOT NULL, 
    CONSTRAINT [idx_ia_trends_params] UNIQUE NONCLUSTERED (
        [age_sib_group_cd], 
        [cd_race_census], 
        [cd_county], 
        [cd_reporter_type], 
        [cd_access_type], 
        [cd_allegation], 
        [cd_finding]
    )
)


CREATE PROCEDURE [portal_redux].[log_query_ia_trends]
	@age_sib_group_cd VARCHAR(20)
	,@cd_race_census VARCHAR(30)
	,@cd_county VARCHAR(250)
	,@cd_reporter_type VARCHAR(100)
	,@cd_access_type VARCHAR(30)
	,@cd_allegation VARCHAR(30)
	,@cd_finding VARCHAR(30)
	,@is_counts BIT
AS
DECLARE @qry_id INT
	,@max_month_start DATETIME
	,@min_month_start DATETIME

DECLARE @tblqryid TABLE (qry_id INT);

SELECT @min_month_start = min_date_any
	,@max_month_start = max_date_any
FROM portal_redux.ref_lookup_max_date
WHERE id = IIF(@is_counts = 1, 18, 17); -- sp_ia_trends_counts, sp_ia_trends_rates

SET @qry_id = (
		SELECT TOP 1 qry_id
		FROM portal_redux.ia_trends_params
		WHERE age_sib_group_cd = @age_sib_group_cd
			AND cd_race_census = @cd_race_census
			AND cd_county = @cd_county
			AND cd_reporter_type = @cd_reporter_type
			AND cd_access_type = @cd_access_type
			AND cd_allegation = @cd_allegation
			AND cd_finding = @cd_finding
		ORDER BY qry_ID DESC
		);

IF @qry_Id IS NULL
BEGIN
	INSERT INTO portal_redux.ia_trends_params (
		age_sib_group_cd
		,cd_race_census
		,cd_county
		,cd_reporter_type
		,cd_access_type
		,cd_allegation
		,cd_finding
		,min_start_date
		,max_start_date
		,cnt_qry_counts
		,cnt_qry_rates
		,last_run_date
		)
	OUTPUT inserted.qry_id
	INTO @tblqryid
	SELECT @age_sib_group_cd
		,@cd_race_census
		,@cd_county
		,@cd_reporter_type
		,@cd_access_type
		,@cd_allegation
		,@cd_finding
		,@min_month_start
		,@max_month_start
		,IIF(@is_counts = 1, 1, 0) [cnt_qry_counts]
		,IIF(@is_counts = 0, 1, 0) [cnt_qry_counts]
		,GETDATE();

	SELECT TOP 1 @qry_id = qry_id
	FROM @tblqryid;
END
ELSE
BEGIN
	UPDATE portal_redux.ia_trends_params
	SET cnt_qry_counts = IIF(@is_counts = 1, cnt_qry_counts + 1, cnt_qry_counts)
		,cnt_qry_rates = IIF(@is_counts = 0, cnt_qry_rates + 1, cnt_qry_rates) 
		,last_run_date = GETDATE()
	WHERE qry_id = @qry_id;
END;