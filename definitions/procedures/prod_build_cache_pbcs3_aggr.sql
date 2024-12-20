-- prod_build_cache_pbcs3_aggr definition

-- EXEC portal_redux.prod_build_cache_pbcs3_aggr;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_cache_pbcs3_aggr;
CREATE PROCEDURE portal_redux.prod_build_cache_pbcs3_aggr
AS

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

end;
