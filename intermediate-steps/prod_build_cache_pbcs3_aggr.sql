-- create cache_pbcs3_aggr table

DROP TABLE IF EXISTS portal_redux.cache_pbcs3_aggr;
CREATE TABLE portal_redux.cache_pbcs3_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	cd_service_type int NOT NULL,
	cd_budget_type int NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race_census int NOT NULL,
	cd_county int NOT NULL,
	[month] int NOT NULL,
	placed decimal(9,2) NULL,
	not_placed decimal(9,2) NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	int_hash_key decimal(22,0) NULL
);


-- create cache_pbcs3_params table

DROP TABLE IF EXISTS portal_redux.cache_pbcs3_params;
CREATE TABLE portal_redux.cache_pbcs3_params (
	qry_ID bigint NOT NULL,
	cd_sib_age_grp varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_county varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_srvc_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_budget varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_pbcs3 table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_pbcs3;
CREATE TABLE portal_redux.cache_qry_param_pbcs3 (
	int_param_key bigint NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	cd_subctgry_poc_frc int NOT NULL,
	cd_budget_poc_frc int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);



-- populate cache_pbcs3_aggr, cache_qry_param_pbcs3, & cache_pbcs3_params

begin
		declare @loop int
		declare @starttime datetime=getdate();
			declare @qry_id bigint
			declare @age_grouping_cd varchar(100)
			declare @cd_race_census varchar(30)
			declare @cd_county  varchar(250)
			declare  @cd_reporter_type varchar(100) 
			declare @bin_ihs_svc_cd varchar(30) 
			declare  @filter_access_type varchar(30) 
			declare  @filter_allegation  varchar(100)
			declare @filter_finding varchar(30)
			declare @max_qry_id int

		select @max_qry_id=max(qry_id) from prtl.ihs_params_backup
		
				
		truncate table portal_redux.cache_pbcs3_aggr;
		truncate table portal_redux.cache_qry_param_pbcs3;
		truncate table portal_redux.cache_pbcs3_params;
		

		--if OBJECT_ID('tempDB..#params') is not null drop table #params
		DROP TABLE IF EXISTS #params;
		select *
		into #params
		from prtl.ihs_params_backup	 where qry_id <= @max_qry_id 

		set @loop =1 

		while @loop <=@max_qry_id
		BEGIN
			

				SELECT @qry_id=[qry_ID]
					  ,@age_grouping_cd=cd_sib_age_grp
					  ,@cd_race_census=[cd_race_census]
					  ,@cd_county=cd_county
					  ,@cd_reporter_type=[cd_reporter_type]
					  ,@bin_ihs_svc_cd=[bin_ihs_svc_cd]
					  ,@filter_access_type=[filter_access_type]
					  ,@filter_allegation=[filter_allegation]
					  ,@filter_finding=[filter_finding]
				FROM #params
				where qry_ID=@loop


 
				exec portal_redux.sp_cache_pbcs3_insert_only
					@age_grouping_cd
					,@cd_race_census
					,@cd_county
					,@bin_ihs_svc_cd
					,@cd_reporter_type
					,@filter_access_type
					,@filter_allegation
					,@filter_finding

				set @loop=@loop + 1;
			end ;
	declare @endtime datetime =getdate()
	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_pbcs3_aggr)
	  ,load_time_mins=dbo.fnc_datediff_mis(@starttime,@endtime)
	  where tbl_id=31;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_pbcs3_params)
	   ,load_time_mins=0
	  where tbl_id=32;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_qry_param_pbcs3)
	   ,load_time_mins=1
	  where tbl_id=33;


	  update statistics portal_redux.cache_pbcs3_params;
	  update statistics portal_redux.cache_pbcs3_aggr;

-- loh inserted above
--select * from portal_redux.cache_pbcs3_params order by qry_id

end;