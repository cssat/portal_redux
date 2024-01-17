-- create cache_pbcs2_aggr table

DROP TABLE IF EXISTS portal_redux.cache_pbcs2_aggr;
CREATE TABLE portal_redux.cache_pbcs2_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	[month] int NOT NULL,
	among_first_cmpt_rereferred decimal(9,2) NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_hash_key decimal(21,0) NULL,
	qry_id int NOT NULL,
	start_year int NULL
);


-- create cache_pbcs2_params table

DROP TABLE IF EXISTS portal_redux.cache_pbcs2_params;
CREATE TABLE portal_redux.cache_pbcs2_params (
	qry_ID bigint NOT NULL,
	age_grouping_cd varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_county varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_pbcs2 table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_pbcs2;
CREATE TABLE portal_redux.cache_qry_param_pbcs2 (
	int_param_key bigint NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	qry_id int NOT NULL,
	int_all_param_key numeric(12,0) NOT NULL
);


-- populate cache_pbcs2_params, cache_pbcs2_aggr, & cache_qry_param_pbcs2 tables

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


 
				 exec [portal_redux].[sp_cache_pbcs2_insert_only] 		
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
end;