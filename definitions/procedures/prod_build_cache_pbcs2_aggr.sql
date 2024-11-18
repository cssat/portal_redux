-- prod_build_cache_pbcs2_aggr definition

-- EXEC portal_redux.prod_build_cache_pbcs2_aggr;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_cache_pbcs2_aggr;
CREATE PROCEDURE portal_redux.prod_build_cache_pbcs2_aggr
AS

begin
		declare @loop int
		declare @date varchar(50)
		declare @qry_id bigint
		declare @age_grouping_cd varchar(30)
		declare @race_cd varchar(30)
		declare @cd_county  varchar(200)
		declare  @cd_reporter_type varchar(100) 
		declare  @filter_access_type varchar(30) 
		declare  @filter_allegation  varchar(100)
		declare @filter_finding varchar(100)
		declare @max_qry_id int
				declare @rc int
		set @max_qry_id = (select max(qry_id) from portal_redux.ia_params where qry_id <=36 )

		
		--set @date= (select  concat(char(39),convert(varchar(10),min_date_any,121) ,',',convert(varchar(10),max_date_yr,121) ,char(39))
		--						from ref_lookup_max_date where procedure_name='sp_ia_safety')

		truncate table portal_redux.cache_pbcs2_params;
		truncate table portal_redux.cache_pbcs2_aggr;
		truncate table portal_redux.cache_qry_param_pbcs2;
		--truncate table portal_redux.cache_pbcs2_params;
		

		if OBJECT_ID('tempDB..#params') is not null drop table #params
		select *
		into #params
		from prtl.ia_params_backup	where qry_id <=@max_qry_id;

		create index idx_params on #params(qry_id) include (age_grouping_cd,cd_race_census,cd_county,cd_reporter_type,filter_access_type,filter_allegation,filter_finding);


		set @loop =1 

		while @loop <=@max_qry_id
		begin


				SELECT @qry_id=[qry_ID]
					  ,@age_grouping_cd=[age_grouping_cd]
					  ,@race_cd=[cd_race_census]
					  ,@cd_county=cd_county
					  ,@cd_reporter_type=[cd_reporter_type]
					  ,@filter_access_type=[filter_access_type]
					  ,@filter_allegation=[filter_allegation]
					  ,@filter_finding=[filter_finding]
				FROM #params
				where qry_ID=@loop


 
				 exec portal_redux.[sp_cache_pbcs2_insert_only] 		
					@age_grouping_cd
					,@race_cd
					,@cd_county
					,@cd_reporter_type
					,@filter_access_type
					,@filter_allegation
					,@filter_finding;
			

				set @loop=@loop + 1;
			end ;



	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_pbcs2_aggr)
	  where tbl_id=34;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_pbcs2_params)
	  where tbl_id=35;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_qry_param_pbcs2)
	  where tbl_id=36;


	  update statistics portal_redux.cache_pbcs2_params;
	  update statistics portal_redux.cache_pbcs2_aggr;

	  DROP TABLE #params;

end;