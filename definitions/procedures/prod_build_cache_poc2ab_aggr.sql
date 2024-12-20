-- prod_build_cache_poc2ab_aggr definition

-- EXEC portal_redux.prod_build_cache_poc2ab_aggr;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_cache_poc2ab_aggr;
CREATE PROCEDURE portal_redux.prod_build_cache_poc2ab_aggr
AS

BEGIN

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
		from portal_redux.ref_lookup_max_date where id=18

		select @mindate=mindate,@maxdate=maxdate from #dates;
  
  
   
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
		and cd_race_census=left(@race_cd,30) 
		and cd_county=	left(@cd_county,250)   
		and cd_reporter_type=left(@cd_reporter_type,100)
		and filter_access_type=left(@filter_access_type,30)
		and filter_allegation=left(@filter_allegation,30)
		and filter_finding=left(@filter_finding,30)
		order by qry_ID desc
		);  


		if @qry_Id is null
			begin


			INSERT INTO [portal_redux].[cache_poc2ab_params]
					(qry_id
					, [age_grouping_cd]
					,[cd_race_census]
					,cd_county
					,[cd_reporter_type]
					,[filter_access_type]
					,[filter_allegation]
					,[filter_finding]
					,[min_start_date]
					,[max_start_date]
					,[cnt_qry]
					,[last_run_date])
					OUTPUT inserted.qry_ID into @tblqryid
				select 
					isnull((select max(qry_id) +1
						from portal_redux.cache_poc2ab_params),1)
					,@age_grouping_cd
					,@race_cd
					,@cd_county
					,@cd_reporter_type
					,@filter_access_type
					,@filter_allegation
					,@filter_finding
					,@mindate
					,@maxdate
					,1
					,getdate()

					select @qry_id=qry_id from @tblqryid;
			end
		else
			begin
				update [portal_redux].[cache_poc2ab_params]
				set cnt_qry=cnt_qry + 1
				where qry_id= @qry_id;
			end
			
						

	

				-- see if results are in cache as a subset of previously run query
		if OBJECT_ID('tempDB..#cachekeys') is not null drop table #cachekeys;

		   select cast((int_param_key  * power(10.0,5)) as decimal(12,0))
			+ cast((rpt.cd_reporter_type  * power(10.0,3)) as decimal(12,0))
			+  cast((acc.cd_access_type  * power(10.0,2)) as decimal(12,0))
			+  cast((alg.cd_allegation  * power(10.0,1)) as decimal(12,0))
			+ fnd.cd_finding  as int_hash_key
					 ,int_param_key
					 ,cd_reporter_type
					 ,cd_access_type
					 ,cd_allegation
					 ,cd_finding
					 ,0 as in_cache
					 ,@qry_id as qry_id
					 ,rand(cast(newid() as varbinary)) x1
					 ,rand(cast(newid() as varbinary)) x2
				into #cachekeys
				from (select distinct int_param_key from #prmlocdem) prm
				cross join (select distinct cd_reporter_type from #rpt) rpt
				cross join (select distinct cd_access_type from #access_type) acc
				cross join (select distinct cd_allegation from #algtn) alg
				cross join (select distinct cd_finding from #find) fnd


			create index idx_int_hash_key on #cachekeys(int_hash_key,in_cache);
			create index idx_qryid_params on #cachekeys(qry_id,int_hash_key);
			create index  idx_params on #cachekeys(int_param_key,cd_reporter_type,cd_access_type,cd_allegation	,cd_finding,in_cache);                   

				
			update cache
			set in_cache=1,qry_id=poc2ab.qry_id
			from #cachekeys cache
			join [portal_redux].[cache_qry_param_poc2ab] poc2ab
			on poc2ab.[int_all_param_key]=cache.int_hash_key
			
			declare @i int =0
			declare @stop int = (select count(distinct cd.QUARTER) -1 from portal_redux.CALENDAR_DIM cd where cd.QUARTER>=(select  min_date_any from portal_redux.ref_lookup_max_date where id=18) and cd.quarter <=(select  max_date_any from portal_redux.ref_lookup_max_date where id=18))
			declare @start_date datetime
			declare @qry_type int =0
		while @qry_type<=2
		begin
		set @i=0
			while @i <= @stop
			begin
				set @start_date=dateadd(mm,3*@i,((select  mindate from  #dates)))
				insert into portal_redux.cache_poc2ab_aggr( 
								[qry_type]
								,[date_type]
								,[start_date]
								,[int_param_key]
								,[cd_reporter_type]
								,[cd_access_type]
								,[cd_allegation]
								,[cd_finding]
								,cd_sib_age_grp
								,[cd_race]
								,cd_county
								,[cnt_start_date]
								,[cnt_opened]
								,[cnt_closed]
								,[min_start_date]
								,[max_start_date]
								,[x1]
								,[x2]
								,[insert_date]
								,int_all_param_key
								,qry_id
								,start_year)
						SELECT    prtl_poc2ab.qry_type
								, prtl_poc2ab.date_type 
								, prtl_poc2ab.[start_date]
								, mtch.int_param_key
								, rpt.cd_reporter_type
								, acc.cd_access_type
								, alg.cd_allegation
								, fnd.cd_finding
								, mtch.age_grouping_cd 
								, mtch.cd_race_census
								, mtch.cd_cnty
								, isnull(sum(prtl_poc2ab.cnt_start_date),0) as cnt_start_date
								, isnull(sum(prtl_poc2ab.cnt_opened),0) as cnt_opened
								, isnull(sum(prtl_poc2ab.cnt_closed),0) as cnt_closed
								, (select  mindate from #dates) as mindate 
								, (select  maxdate from #dates)  as maxdate
								, ck.x1  
								, ck.x2
								, getdate() as insert_date
								, cast((mtch.int_param_key  * power(10.0,5)) as decimal(12,0))
									+ cast((rpt.cd_reporter_type  * power(10.0,3)) as decimal(12,0))
									+  cast((acc.cd_access_type  * power(10.0,2)) as decimal(12,0))
									+  cast((alg.cd_allegation  * power(10.0,1)) as decimal(12,0))
									+ fnd.cd_finding int_all_param_key
								, @qry_id
								, prtl_poc2ab.[start_year]
							FROM portal_redux.prtl_poc2ab   
								join #prmlocdem mtch on mtch.int_match_param_key=prtl_poc2ab.int_match_param_key 
								join (select distinct cd_race from #eth ) rc on rc.cd_race=mtch.cd_race_census 
								join #rpt rpt on rpt.match_code=prtl_poc2ab.cd_reporter_type
								join #access_type acc on acc.match_code=prtl_poc2ab.filter_access_type
								join #algtn alg on alg.match_code=prtl_poc2ab.filter_allegation
								join #find fnd on fnd.match_code=prtl_poc2ab.filter_finding
								join #cachekeys ck on ck.int_hash_key=cast((mtch.int_param_key  * power(10.0,5)) as decimal(12,0))
									+ cast((rpt.cd_reporter_type  * power(10.0,3)) as decimal(12,0))
									+  cast((acc.cd_access_type  * power(10.0,2)) as decimal(12,0))
									+  cast((alg.cd_allegation  * power(10.0,1)) as decimal(12,0))
									+ fnd.cd_finding and ck.in_cache=0
						--	where prtl_poc2ab.start_date between @mindate and @maxdate
								where qry_type=@qry_type and @start_date=prtl_poc2ab.start_date
							group by  prtl_poc2ab.qry_type
									,prtl_poc2ab.date_type 
									,prtl_poc2ab.[start_date]
									,prtl_poc2ab.[start_year]
									,mtch.int_param_key
									,mtch.age_grouping_cd 
									,mtch.cd_race_census
									,mtch.cd_cnty
									, rpt.cd_reporter_type
									, acc.cd_access_type
									, alg.cd_allegation
									, fnd.cd_finding
									,ck.x1
									,ck.x2
							set @i+=1;
						end		
					set @qry_type+=1
				end	



						update portal_redux.cache_poc2ab_aggr
						set cache_poc2ab_aggr.fl_include_perCapita=0
						-- select pop_cnt, cache_poc1ab_aggr.*
						from portal_redux.cache_poc2ab_aggr,prm_household_census_population   
						where exists(select * from #cachekeys ck where cache_poc2ab_aggr.qry_id=ck.qry_id)
						and prm_household_census_population.measurement_year=start_year
						and prm_household_census_population.county_cd=cache_poc2ab_aggr.cd_county 
						and prm_household_census_population.cd_race=cache_poc2ab_aggr.cd_race
						and prm_household_census_population.cd_sib_age_grp=cache_poc2ab_aggr.cd_sib_age_grp
  						and  (cache_poc2ab_aggr.cnt_start_date *1.00 >   pop_cnt * .35  			
							or cache_poc2ab_aggr.cnt_opened *1.00 >   pop_cnt * .35  	
							or cache_poc2ab_aggr.cnt_closed * 1.00 > pop_cnt*.35)				;
							

						update statistics portal_redux.cache_poc2ab_aggr;


		
						insert into portal_redux.cache_qry_param_poc2ab
						([int_param_key]
						,[cd_sib_age_grp]
						,[cd_race]
						,cd_county
						,[cd_reporter_type]
						,[cd_access_type]
						,[cd_allegation]
						,[cd_finding]
						,[qry_id]
						,[int_all_param_key])
		
						select 
						ck.[int_param_key]
						,[age_grouping_cd]
						,cd_race_census
						,cd_cnty
						,[cd_reporter_type]
						,[cd_access_type]
						,[cd_allegation]
						,[cd_finding]
						,ck.qry_id
						,ck.int_hash_key
						from #cachekeys ck
						join (select distinct int_param_key
											, [age_grouping_cd] 
											, cd_race_census
											, cd_cnty
											from #prmlocdem) q on q.int_param_key=ck.int_param_key
						where ck.in_cache=0;
						
						
						update statistics portal_redux.cache_qry_param_poc2ab;


						update portal_redux.prtl_tables_last_update
						set last_build_date=getdate()
						,row_count=(select count(*)  from portal_redux.cache_poc2ab_aggr )
						where tbl_name='cache_poc2ab_aggr'

						
						update portal_redux.prtl_tables_last_update
						set last_build_date=getdate()
						,row_count=(select count(*)  from portal_redux.cache_poc2ab_params )
						where tbl_name='cache_poc2ab_params'			
						
						
						update portal_redux.prtl_tables_last_update
						set last_build_date=getdate()
						,row_count=(select count(*)  from portal_redux.cache_qry_param_poc2ab )
						where tbl_name='cache_qry_param_poc2ab'			

END;
