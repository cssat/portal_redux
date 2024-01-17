-- create cache_poc2ab_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc2ab_aggr;
CREATE TABLE portal_redux.cache_poc2ab_aggr (
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
	cnt_start_date int NOT NULL,
	cnt_opened int NOT NULL,
	cnt_closed int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_all_param_key decimal(21,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	fl_include_perCapita smallint DEFAULT 1 NOT NULL
);


-- create cache_poc2ab_params table

DROP TABLE IF EXISTS portal_redux.cache_poc2ab_params;
CREATE TABLE portal_redux.cache_poc2ab_params (
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


-- create cache_qry_param_poc2ab table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc2ab;
CREATE TABLE portal_redux.cache_qry_param_poc2ab (
	int_param_key bigint NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	qry_id int NULL,
	int_all_param_key numeric(12,0) NOT NULL
);



-- populate cache_poc2ab_aggr, cache_poc2ab_params, & cache_qry_param_poc2ab tables

		set nocount on
		
		truncate table portal_redux.cache_poc2ab_aggr;
		truncate table portal_redux.cache_poc2ab_params;
		truncate table portal_redux.cache_qry_param_poc2ab;



		declare @age_grouping_cd  varchar(30) = N'1,2,3,4,0'
		declare @race_cd  varchar(30) = N'1,2,3,4,5,6,8,0,9,10,11,12'
		declare @cd_county varchar(1000) = N'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,0'
		declare @cd_reporter_type varchar(100)= N'1,2,5,6,7,8,9,10,11,12,13,14,0'
		declare @filter_access_type varchar(30) = N'1,2,3,4,5,6,0'
		declare @filter_allegation varchar(30) = N'1,2,3,4,0'
		declare @filter_finding varchar(30) = N'1,2,3,4,0'

		declare @qry_id bigint;
		declare @mindate datetime;
		declare @maxdate datetime;
		declare @tblqryid table(qry_id int);



		declare @var_row_cnt_param int;
		declare @var_row_cnt_cache int;



		if OBJECT_ID('tempDB..#dates') is not null drop table #dates
		select  min_date_any mindate,max_date_any maxdate
		into #dates
		from  portal_redux.ref_lookup_max_date where id=18

		select @mindate=mindate,@maxdate=maxdate from #dates;
	    SET @maxdate = '2023-04-01 00:00:00.000'; -- setting max date manuallly
  
   
			if OBJECT_ID('tempDB..#age') is not null drop table #age;
			create table #age(age_grouping_cd int,match_code int);
			create index idx_age_match_code on #age(match_code);

    
			IF OBJECT_ID('tempDB..#eth') is not null drop table #eth;  
			CREATE TABLE #eth(cd_race int,cd_origin int,tx_race varchar(200),match_code int);
			create index idx_eth_match on  #eth(match_code,cd_origin);
    
	     
			if OBJECT_ID('tempDB..#cnty') is not null drop table #cnty;
			create table #cnty(cd_cnty int,match_code int );
			create index idx_cnty_match_code on #cnty(match_code);
     

			--- new filters
		
   
			if OBJECT_ID('tempDB..#rpt') is not null drop table #rpt;
			create table #rpt(cd_reporter_type int,match_code int  ,primary key(cd_reporter_type,match_code));
			create index idx_reporter_match_code on #rpt(match_code)

			if OBJECT_ID('tempDB..#access_type') is not null drop table #access_type;
			create table #access_type(cd_access_type int,match_code int  );
			create index idx_cd_access_type on #access_type(cd_access_type,match_code)


	

			-- allegation tables
			if OBJECT_ID('tempDB..#algtn') is not null drop table #algtn;
			create table #algtn(cd_allegation  int,match_code decimal(18,0) ,primary key(cd_allegation,match_code));
			create index idx_algtn on #algtn(match_code)

			-- finding tables
			if OBJECT_ID('tempDB..#find') is not null drop table #find
			create table #find(cd_finding int,match_code decimal(18,0) ,primary key(cd_finding,match_code));
			create index idx_finding on #find(match_code)

	

		------------------------------------------------  AGE

		insert into #age(age_grouping_cd,match_code)
		select cd_sib_age_grp,match_code
		from portal_redux.prm_cd_sib_age_grp age
		join portal_redux.fn_ReturnStrTableFromList(@age_grouping_cd,1) tmp on age.cd_sib_age_grp=cast(tmp.arrValue as int);


		update statistics #age

		

		------------- race -----------------------------------------------------------------------------
	insert into #eth(cd_race,cd_origin,match_code)

	select eth.cd_race,eth.cd_origin,eth.match_code
	from portal_redux.prm_eth_census eth
	join [portal_redux].[fn_ReturnStrTableFromList](@race_cd,1) 
	on cast(arrValue as int)=eth.cd_race

	update statistics #eth
	
	
		---------------------------------------  County -------------------------
    
			insert into #cnty(cd_cnty,match_code)
			select  cnty.cd_cnty,cnty.match_code
			from portal_redux.prm_cnty cnty
			join portal_redux.fn_ReturnStrTableFromList(@cd_county,0) sel on cast(sel.arrValue as int)=cnty.cd_cnty

			
		update statistics #cnty

		------------------------------------  REPORTER FILTER ------------------------------

	insert into #rpt(cd_reporter_type,match_code)
	select rpt.cd_reporter_type,rpt.match_code
	from portal_redux.prm_rpt rpt
	join portal_redux.fn_ReturnStrTableFromList(@cd_reporter_type,0) sel
	on cast(sel.arrValue as int)=rpt.cd_reporter_type

			
					
	update statistics #rpt		
		-----------------------------------   access_type --------------------------------------
	insert into #access_type(cd_access_type,match_code)
	select  acc.cd_access_type,acc.match_code
	from portal_redux.prm_acc acc			
	join portal_redux.fn_ReturnStrTableFromList(@filter_access_type,1) sel
	on cast(sel.arrValue as int)=acc.cd_access_type


	update statistics #access_type		;
	----------------------------------   ALLEGATIONS ---------------------------------------
	--  @filter_allegation	;
	insert into #algtn(cd_allegation,match_code)
	select alg.cd_allegation,alg.match_code
	from portal_redux.prm_alg alg
	join portal_redux.fn_ReturnStrTableFromList(@filter_allegation,0) sel
	on cast(sel.arrValue as int)=alg.cd_allegation

	update statistics #algtn
	------------------------------------  FINDINGS --------------------------------------
	--  	prm_fnd   @filter_finding
	
	insert into #find(cd_finding,match_code)
	select fnd.cd_finding,fnd.match_code
	from portal_redux.prm_fnd fnd
	join portal_redux.fn_ReturnStrTableFromList(@filter_finding,1) sel
	on cast(sel.arrValue as int)= fnd.cd_finding
				
	update statistics #find			

					

 					if object_ID('tempDB..#prmlocdem') is not null drop table #prmlocdem
		
					create table #prmlocdem(int_param_key int not null
									,int_match_param_key int not null
								,age_grouping_cd int not null
								,cd_race_census int not null
								,cd_cnty int not null
								,match_age_grouping_cd int not null
								,match_cd_race_census int not null
								,match_cd_hispanic_latino_origin int not null
								,match_cd_cnty int not null
								,primary key (int_param_key,int_match_param_key));

					insert  into #prmlocdem(int_param_key,int_match_param_key,age_grouping_cd
										,cd_race_census
							,cd_cnty							
							,match_age_grouping_cd
							,match_cd_race_census
							,match_cd_hispanic_latino_origin
							,match_cd_cnty)

					select distinct
						 power(10,6) 
              + (age_grouping_cd *  power(10,5))
              + (cd_race *  power(10,3))
              + (abs(cd_cnty)) int_param_key 
						,power(10,6) 
              + (age.match_code *  power(10,5))
              + (eth.match_code *  power(10,4))
              + (eth.cd_origin * power(10,3))
              + (abs(cnty.match_code))int_match_param_key
						,age.age_grouping_cd cd_sib_age_grp
						,eth.cd_race cd_race_census
						,cnty.cd_cnty
						,age.match_code match_cd_sib_age_grp
						,eth.match_code match_cd_race_census
						,eth.cd_origin match_cd_hispanic_latino_origin
						,cnty.match_code match_cd_cnty
					from  #age age 
            cross join  #eth eth 
            cross join #cnty cnty

        
	
					create index idx_int_match_param_key_demog_fields on #prmlocdem(
						int_match_param_key
						,age_grouping_cd
						,cd_race_census
						,cd_cnty)

					create index idx_int_match_cd_race_census on #prmlocdem(
						cd_race_census
						)

					create index idx_age_grouping_cd on #prmlocdem(
						age_grouping_cd
						)
 
					update statistics #prmlocdem

        
	

		set @qry_id=(
		select top 1 qry_id from portal_redux.cache_poc2ab_params
		where age_grouping_cd=left(@age_grouping_cd,20)
-- create cache_poc2ab_aggr table

DROP TABLE IF EXISTS portal_redux.cache_poc2ab_aggr;
CREATE TABLE portal_redux.cache_poc2ab_aggr (
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
	cnt_start_date int NOT NULL,
	cnt_opened int NOT NULL,
	cnt_closed int NOT NULL,
	min_start_date datetime NOT NULL,
	max_start_date datetime NOT NULL,
	x1 float NOT NULL,
	x2 float NOT NULL,
	insert_date datetime NOT NULL,
	int_all_param_key decimal(21,0) NOT NULL,
	qry_id int NOT NULL,
	start_year int NULL,
	fl_include_perCapita smallint DEFAULT 1 NOT NULL
);


-- create cache_poc2ab_params table

DROP TABLE IF EXISTS portal_redux.cache_poc2ab_params;
CREATE TABLE portal_redux.cache_poc2ab_params (
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


-- create cache_qry_param_poc2ab table

DROP TABLE IF EXISTS portal_redux.cache_qry_param_poc2ab;
CREATE TABLE portal_redux.cache_qry_param_poc2ab (
	int_param_key bigint NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race int NOT NULL,
	cd_county int NOT NULL,
	cd_reporter_type int NOT NULL,
	cd_access_type int NOT NULL,
	cd_allegation int NOT NULL,
	cd_finding int NOT NULL,
	qry_id int NULL,
	int_all_param_key numeric(12,0) NOT NULL
);



-- populate cache_poc2ab_aggr, cache_poc2ab_params, & cache_qry_param_poc2ab tables

		set nocount on
		
		truncate table portal_redux.cache_poc2ab_aggr;
		truncate table portal_redux.cache_poc2ab_params;
		truncate table portal_redux.cache_qry_param_poc2ab;



		declare @age_grouping_cd  varchar(30) = N'1,2,3,4,0'
		declare @race_cd  varchar(30) = N'1,2,3,4,5,6,8,0,9,10,11,12'
		declare @cd_county varchar(1000) = N'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,0'
		declare @cd_reporter_type varchar(100)= N'1,2,5,6,7,8,9,10,11,12,13,14,0'
		declare @filter_access_type varchar(30) = N'1,2,3,4,5,6,0'
		declare @filter_allegation varchar(30) = N'1,2,3,4,0'
		declare @filter_finding varchar(30) = N'1,2,3,4,0'

		declare @qry_id bigint;
		declare @mindate datetime;
		declare @maxdate datetime;
		declare @tblqryid table(qry_id int);



		declare @var_row_cnt_param int;
		declare @var_row_cnt_cache int;



		if OBJECT_ID('tempDB..#dates') is not null drop table #dates
		select  min_date_any mindate,max_date_any maxdate
		into #dates
		from  portal_redux.ref_lookup_max_date where id=18

		select @mindate=mindate,@maxdate=maxdate from #dates;
	    SET @maxdate = '2023-04-01 00:00:00.000'; -- setting max date manuallly
  
   
			if OBJECT_ID('tempDB..#age') is not null drop table #age;
			create table #age(age_grouping_cd int,match_code int);
			create index idx_age_match_code on #age(match_code);

    
			IF OBJECT_ID('tempDB..#eth') is not null drop table #eth;  
			CREATE TABLE #eth(cd_race int,cd_origin int,tx_race varchar(200),match_code int);
			create index idx_eth_match on  #eth(match_code,cd_origin);
    
	     
			if OBJECT_ID('tempDB..#cnty') is not null drop table #cnty;
			create table #cnty(cd_cnty int,match_code int );
			create index idx_cnty_match_code on #cnty(match_code);
     

			--- new filters
		
   
			if OBJECT_ID('tempDB..#rpt') is not null drop table #rpt;
			create table #rpt(cd_reporter_type int,match_code int  ,primary key(cd_reporter_type,match_code));
			create index idx_reporter_match_code on #rpt(match_code)

			if OBJECT_ID('tempDB..#access_type') is not null drop table #access_type;
			create table #access_type(cd_access_type int,match_code int  );
			create index idx_cd_access_type on #access_type(cd_access_type,match_code)


	

			-- allegation tables
			if OBJECT_ID('tempDB..#algtn') is not null drop table #algtn;
			create table #algtn(cd_allegation  int,match_code decimal(18,0) ,primary key(cd_allegation,match_code));
			create index idx_algtn on #algtn(match_code)

			-- finding tables
			if OBJECT_ID('tempDB..#find') is not null drop table #find
			create table #find(cd_finding int,match_code decimal(18,0) ,primary key(cd_finding,match_code));
			create index idx_finding on #find(match_code)

	

		------------------------------------------------  AGE

		insert into #age(age_grouping_cd,match_code)
		select cd_sib_age_grp,match_code
		from portal_redux.prm_cd_sib_age_grp age
		join portal_redux.fn_ReturnStrTableFromList(@age_grouping_cd,1) tmp on age.cd_sib_age_grp=cast(tmp.arrValue as int);


		update statistics #age

		

		------------- race -----------------------------------------------------------------------------
	insert into #eth(cd_race,cd_origin,match_code)

	select eth.cd_race,eth.cd_origin,eth.match_code
	from portal_redux.prm_eth_census eth
	join [portal_redux].[fn_ReturnStrTableFromList](@race_cd,1) 
	on cast(arrValue as int)=eth.cd_race

	update statistics #eth
	
	
		---------------------------------------  County -------------------------
    
			insert into #cnty(cd_cnty,match_code)
			select  cnty.cd_cnty,cnty.match_code
			from portal_redux.prm_cnty cnty
			join portal_redux.fn_ReturnStrTableFromList(@cd_county,0) sel on cast(sel.arrValue as int)=cnty.cd_cnty

			
		update statistics #cnty

		------------------------------------  REPORTER FILTER ------------------------------

	insert into #rpt(cd_reporter_type,match_code)
	select rpt.cd_reporter_type,rpt.match_code
	from portal_redux.prm_rpt rpt
	join portal_redux.fn_ReturnStrTableFromList(@cd_reporter_type,0) sel
	on cast(sel.arrValue as int)=rpt.cd_reporter_type

			
					
	update statistics #rpt		
		-----------------------------------   access_type --------------------------------------
	insert into #access_type(cd_access_type,match_code)
	select  acc.cd_access_type,acc.match_code
	from portal_redux.prm_acc acc			
	join portal_redux.fn_ReturnStrTableFromList(@filter_access_type,1) sel
	on cast(sel.arrValue as int)=acc.cd_access_type


	update statistics #access_type		;
	----------------------------------   ALLEGATIONS ---------------------------------------
	--  @filter_allegation	;
	insert into #algtn(cd_allegation,match_code)
	select alg.cd_allegation,alg.match_code
	from portal_redux.prm_alg alg
	join portal_redux.fn_ReturnStrTableFromList(@filter_allegation,0) sel
	on cast(sel.arrValue as int)=alg.cd_allegation

	update statistics #algtn
	------------------------------------  FINDINGS --------------------------------------
	--  	prm_fnd   @filter_finding
	
	insert into #find(cd_finding,match_code)
	select fnd.cd_finding,fnd.match_code
	from portal_redux.prm_fnd fnd
	join portal_redux.fn_ReturnStrTableFromList(@filter_finding,1) sel
	on cast(sel.arrValue as int)= fnd.cd_finding
				
	update statistics #find			

					

 					if object_ID('tempDB..#prmlocdem') is not null drop table #prmlocdem
		
					create table #prmlocdem(int_param_key int not null
									,int_match_param_key int not null
								,age_grouping_cd int not null
								,cd_race_census int not null
								,cd_cnty int not null
								,match_age_grouping_cd int not null
								,match_cd_race_census int not null
								,match_cd_hispanic_latino_origin int not null
								,match_cd_cnty int not null
								,primary key (int_param_key,int_match_param_key));

					insert  into #prmlocdem(int_param_key,int_match_param_key,age_grouping_cd
										,cd_race_census
							,cd_cnty							
							,match_age_grouping_cd
							,match_cd_race_census
							,match_cd_hispanic_latino_origin
							,match_cd_cnty)

					select distinct
						 power(10,6) 
              + (age_grouping_cd *  power(10,5))
              + (cd_race *  power(10,3))
              + (abs(cd_cnty)) int_param_key 
						,power(10,6) 
              + (age.match_code *  power(10,5))
              + (eth.match_code *  power(10,4))
              + (eth.cd_origin * power(10,3))
              + (abs(cnty.match_code))int_match_param_key
						,age.age_grouping_cd cd_sib_age_grp
						,eth.cd_race cd_race_census
						,cnty.cd_cnty
						,age.match_code match_cd_sib_age_grp
						,eth.match_code match_cd_race_census
						,eth.cd_origin match_cd_hispanic_latino_origin
						,cnty.match_code match_cd_cnty
					from  #age age 
            cross join  #eth eth 
            cross join #cnty cnty

        
	
					create index idx_int_match_param_key_demog_fields on #prmlocdem(
						int_match_param_key
						,age_grouping_cd
						,cd_race_census
						,cd_cnty)

					create index idx_int_match_cd_race_census on #prmlocdem(
						cd_race_census
						)

					create index idx_age_grouping_cd on #prmlocdem(
						age_grouping_cd
						)
 
					update statistics #prmlocdem

        
	

		set @qry_id=(
		select top 1 qry_id from portal_redux.cache_poc2ab_params
		where age_grouping_cd=left(@age_grouping_cd,20);