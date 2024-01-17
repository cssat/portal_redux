-- create cache_poc3ab_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc3ab_aggr;
CREATE TABLE portal_redux.cache_poc3ab_aggr (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	int_param_key bigint NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race_census int NOT NULL,
	cd_county int NOT NULL,
	cnt_start_date int NOT NULL,
	cnt_opened int NOT NULL,
	cnt_closed int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	int_hash_key decimal(22,0) NOT NULL,
	fl_include_perCapita smallint DEFAULT '1' NOT NULL
);
 CREATE NONCLUSTERED INDEX idx_qry_id ON portal_redux.cache_poc3ab_aggr (  qry_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- create cache_poc3ab_params table

DROP TABLE IF EXISTS portal_redux.cache_poc3ab_params;
CREATE TABLE portal_redux.cache_poc3ab_params (
	qry_ID bigint NOT NULL,
	cd_sib_age_grp varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_race_census varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_county varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cd_reporter_type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	bin_ihs_svc_cd varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_access_type varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_allegation varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	filter_finding varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	cnt_qry int NOT NULL,
	last_run_date datetime NOT NULL
);


-- create cache_qry_param_poc3ab table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc3ab;
CREATE TABLE portal_redux.cache_qry_param_poc3ab (
	int_param_key bigint NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	age_grouping_cd int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	qry_id int NOT NULL,
	int_hash_key numeric(22,0) NOT NULL
);


-- populate cache_poc3ab_aggr, cache_qry_param_poc3ab, & cache_poc3ab_params

begin
declare @starttime datetime=getdate()
		declare @loop int
		declare @date varchar(50)
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

		select @max_qry_id =max(qry_id) from prtl.ihs_params_backup
		
			
		truncate table portal_redux.cache_poc3ab_aggr;
		truncate table portal_redux.cache_qry_param_poc3ab;
		truncate table portal_redux.cache_poc3ab_params;
		

		if OBJECT_ID('tempDB..#params') is not null drop table #params
		select *
		into #params
		from portal_redux.ihs_params	 where qry_id <= @max_qry_id 

		--  select * from  portal_redux.ihs_params

		

		set @loop =1 

		while @loop <=@max_qry_id
		begin


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


 
				exec portal_redux.sp_cache_poc3ab_counts_insert_only
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

	declare @endtime datetime=getdate()
	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_poc3ab_aggr)
	  ,load_time_mins=portal_redux.fnc_datediff_mis(@starttime,@endtime)
	  where tbl_id=16;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_poc3ab_params)
	  ,load_time_mins=0
	  where tbl_id=17;

	  update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.cache_qry_param_poc3ab)
	  	  ,load_time_mins=2
	  where tbl_id=18;


	  update statistics portal_redux.cache_poc3ab_params;
	  update statistics portal_redux.cache_poc3ab_aggr;

end;