-- create prtl_poc1ab_entries table

DROP TABLE IF EXISTS portal_redux.prtl_poc1ab_entries;
CREATE TABLE portal_redux.prtl_poc1ab_entries (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	bin_dep_cd int NOT NULL,
	max_bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	age_grouping_cd int NULL,
	cd_race int NULL,
	census_hispanic_latino_origin_cd int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NULL,
	long_cd_plcm_setng int NULL,
	county_cd int NULL,
	int_match_param_key bigint NULL,
	cnt_entries int NULL,
	filter_allegation int NOT NULL,
	filter_finding int NOT NULL,
	filter_access_type int NOT NULL,
	start_year int NULL,
	CONSTRAINT PK_prtl_poc1ab_entries PRIMARY KEY (qry_type,date_type,start_date,bin_dep_cd,max_bin_los_cd,bin_placement_cd,bin_ihs_svc_cd,cd_reporter_type,filter_allegation,filter_finding,filter_access_type) WITH (IGNORE_DUP_KEY = ON) ON [PRIMARY],
	CONSTRAINT prtl_ooh_entries_age_grouping_cd_FK FOREIGN KEY (age_grouping_cd) REFERENCES portal_redux.ref_age_groupings_census(age_grouping_cd),
	CONSTRAINT prtl_ooh_entries_bin_dep_cd_FK FOREIGN KEY (bin_dep_cd) REFERENCES portal_redux.ref_filter_dependency(bin_dep_cd),
	CONSTRAINT prtl_ooh_entries_bin_ihs_svc_cd_FK FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_ooh_entries_bin_placement_cd_FK FOREIGN KEY (bin_placement_cd) REFERENCES portal_redux.ref_filter_nbr_placement(bin_placement_cd),
	CONSTRAINT prtl_ooh_entries_cd_race_FK FOREIGN KEY (cd_race) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_ooh_entries_cd_reporter_type_FK FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_ooh_entries_county_cd_FK FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_ooh_entries_init_cd_plcm_setng_FK FOREIGN KEY (init_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_entries_long_cd_plcm_setng_FK FOREIGN KEY (long_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_entries_max_bin_los_cd_FK FOREIGN KEY (max_bin_los_cd) REFERENCES portal_redux.ref_filter_los(bin_los_cd),
	CONSTRAINT prtl_ooh_entries_origin_cd_FK FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd),
	CONSTRAINT prtl_ooh_entries_pk_gndr_FK FOREIGN KEY (pk_gndr) REFERENCES portal_redux.ref_lookup_gender(pk_gndr)
);


-- create prtl_poc1ab_exits table

DROP TABLE IF EXISTS portal_redux.prtl_poc1ab_exits;
CREATE TABLE portal_redux.prtl_poc1ab_exits (
	qry_type int NOT NULL,
	date_type int NOT NULL,
	start_date datetime NOT NULL,
	bin_dep_cd int NOT NULL,
	max_bin_los_cd int NOT NULL,
	bin_placement_cd int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	cd_reporter_type int NOT NULL,
	age_grouping_cd int NULL,
	cd_race int NULL,
	census_hispanic_latino_origin_cd int NOT NULL,
	pk_gndr int NOT NULL,
	init_cd_plcm_setng int NULL,
	long_cd_plcm_setng int NULL,
	county_cd int NULL,
	int_match_param_key bigint NULL,
	cd_discharge_type int NOT NULL,
	cnt_exits int NOT NULL,
	filter_allegation int NOT NULL,
	filter_finding int NOT NULL,
	filter_access_type int NOT NULL,
	start_year int NULL,
	CONSTRAINT prtl_ooh_exits_bin_dep_cd_FK FOREIGN KEY (bin_dep_cd) REFERENCES portal_redux.ref_filter_dependency(bin_dep_cd),
	CONSTRAINT prtl_ooh_exits_bin_ihs_svc_cd_FK FOREIGN KEY (bin_ihs_svc_cd) REFERENCES portal_redux.ref_filter_ihs_services(bin_ihs_svc_cd),
	CONSTRAINT prtl_ooh_exits_bin_placement_cd_FK FOREIGN KEY (bin_placement_cd) REFERENCES portal_redux.ref_filter_nbr_placement(bin_placement_cd),
	CONSTRAINT prtl_ooh_exits_cd_race_FK FOREIGN KEY (cd_race) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_ooh_exits_cd_reporter_type_FK FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_ooh_exits_county_cd_FK FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_ooh_exits_init_cd_plcm_setng_FK FOREIGN KEY (init_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_exits_long_cd_plcm_setng_FK FOREIGN KEY (long_cd_plcm_setng) REFERENCES portal_redux.ref_lookup_plcmnt(cd_plcm_setng),
	CONSTRAINT prtl_ooh_exits_max_bin_los_cd_FK FOREIGN KEY (max_bin_los_cd) REFERENCES portal_redux.ref_filter_los(bin_los_cd),
	CONSTRAINT prtl_ooh_exits_origin_cd_FK FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd),
	CONSTRAINT prtl_ooh_exits_pk_gndr_FK FOREIGN KEY (pk_gndr) REFERENCES portal_redux.ref_lookup_gender(pk_gndr)
);



-- populate prtl_poc1ab_entries & prtl_poc1ab_exits tables

begin

		declare @startDate datetime
		declare @endDate datetime

		declare @cutoff_date datetime

		declare @last_month_end datetime
		declare @last_year_end datetime

		-- initialize variables
		set @startDate='2000-01-01'
		select @cutoff_date=cutoff_date from portal_redux.ref_Last_DW_Transfer
		set @endDate=(select dateadd(dd,-1,[month]) from portal_redux.CALENDAR_DIM where TRY_CONVERT(DATE, calendar_date) = TRY_CONVERT(DATE, @cutoff_date))	
		set @last_month_end=(select dateadd(mm,-1,[month]) from portal_redux.CALENDAR_DIM where TRY_CONVERT(DATE, calendar_date) = TRY_CONVERT(DATE, @cutoff_date))	
		set @last_year_end=(select dateadd(yy,-1,[year]) from portal_redux.CALENDAR_DIM where TRY_CONVERT(DATE, calendar_date) = TRY_CONVERT(DATE, @cutoff_date))	
		
		
	--if object_id('tempDB..#date') is not null drop table #date
    DROP TABLE IF EXISTS #date;
		
		select distinct [quarter] begin_date,dateadd(dd,-1,dateadd(mm,3,[quarter])) end_date,1 [date_type]  
		into #date
		from portal_redux.CALENDAR_DIM where CALENDAR_DATE between @startDate and @endDate
		union
		select distinct [year] begin_date,dateadd(dd,-1,dateadd(yy,1,[year])),2 [date_type]  from portal_redux.CALENDAR_DIM where CALENDAR_DATE between @startDate and @endDate

		delete from #date  where end_date > @cutoff_date 


								  
/***********************************************************                        ENTRIES    ENTRIES  **************************/					
		-- create entries table
						--if OBJECT_ID('tempDB..#entries') is not null drop table #entries
						DROP TABLE IF EXISTS #entries
							CREATE TABLE #entries(
								[qry_type] [int] NOT NULL,
									[date_type] [int] NULL,
									[start_date] [datetime] NULL,
									[bin_dep_cd] [int] NOT NULL,
									[max_bin_los_cd] [int] NULL,
									[bin_placement_cd] [int] NULL,
									[bin_ihs_svc_cd] [int] NULL,
									[cd_reporter_type] [int] NOT NULL,
									[fl_cps_invs] [int] NOT NULL,
									[fl_cfws] [int] NOT NULL,
									[fl_risk_only] [int] NOT NULL,
									[fl_alternate_intervention] [int] NOT NULL,
									[fl_frs] [int] NOT NULL,
									fl_far int not null,
									[fl_phys_abuse] [int] NOT NULL,
									[fl_sexual_abuse] [int] NOT NULL,
									[fl_neglect] [int] NOT NULL,
									[fl_any_legal] [int] NOT NULL,
									[fl_founded_phys_abuse] [int] NOT NULL,
									[fl_founded_sexual_abuse] [int] NOT NULL,
									[fl_founded_neglect] [int] NOT NULL,
									[fl_found_any_legal] [int] NOT NULL,
									age_grouping_cd int  NULL,
									[cd_race] [int] NULL,
									[census_hispanic_latino_origin_cd] [int] NULL,
									[pk_gndr] [int] NOT NULL,
									[init_cd_plcm_setng] [int] NULL,
									[long_cd_plcm_setng] [int] NULL,
									county_cd [int] NULL,
									[int_match_param_key] [bigint] NULL,
									--cnt_episodes int,
									cnt_entries int,
									);
							
							insert into #entries (qry_type,date_type,	[start_date]
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  , age_grouping_cd
								  ,[cd_race]
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[county_cd]
								  ,[int_match_param_key]
								  ,cnt_entries)
--  ALL ENTRIES 
	--  ALL DCFS ENTRIES 
							SELECT 2 [qry_type]
								  ,dt.date_type [date_type]
								  ,dt.begin_date as [start_date]
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.entry_census_child_group_cd
								  ,cd_race_census
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[removal_county_cd]
								  ,entry_int_match_param_key_census_child_group
								  ,count(distinct id_removal_episode_fact)
						  from portal_redux.ooh_dcfs_eps eps
						  join #date dt on eps.removal_dt between dt.begin_date and dt.end_date
						  group by   dt.date_type
								 ,dt.begin_date
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.entry_census_child_group_cd
								  ,cd_race_census
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[removal_county_cd]
								  ,entry_int_match_param_key_census_child_group
				
----  first DCFS entries
	UNION ALL
							SELECT 1 [qry_type]
								  ,dt.date_type [date_type]
								  ,dt.begin_date
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.entry_census_child_group_cd
								  ,cd_race_census
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[removal_county_cd]
								  ,entry_int_match_param_key_census_child_group
								  ,count(distinct id_removal_episode_fact)
						  from portal_redux.ooh_dcfs_eps eps
						   join #date dt on eps.removal_dt between dt.begin_date and dt.end_date
						  where  removal_dt=first_removal_dt
						  group by   dt.date_type
								,dt.begin_date
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.entry_census_child_group_cd
								  ,cd_race_census
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[removal_county_cd]
								  ,entry_int_match_param_key_census_child_group
----  UNIQUE DCFS ENTRIES
UNION ALL
							SELECT 0 [qry_type]
								  , unq.date_type [date_type]
								  ,unq.begin_date [start_date]
								   ,  unq.bin_dep_cd
								  ,  unq.max_bin_los_cd
								  ,  unq.bin_placement_cd
								  ,  unq.bin_ihs_svc_cd
								  ,  unq.cd_reporter_type
								  ,  unq.fl_cps_invs
								  ,  unq.fl_cfws
								  ,  unq.fl_risk_only
								  ,  unq.fl_alternate_intervention
								  ,  unq.fl_frs
								  ,  unq.fl_far
								  ,  unq.fl_phys_abuse
								  ,  unq.fl_sexual_abuse
								  ,  unq.fl_neglect
								  ,  unq.fl_any_legal
								  ,  unq.fl_founded_phys_abuse
								  ,  unq.fl_founded_sexual_abuse
								  ,  unq.fl_founded_neglect
								  ,  unq.fl_found_any_legal
								  ,  unq.entry_census_child_group_cd
								  ,  unq.cd_race_census
								  ,  unq.census_hispanic_latino_origin_cd
								  ,  unq.pk_gndr
								  ,  unq.init_cd_plcm_setng
								  ,  unq.long_cd_plcm_setng
								  ,  unq.removal_county_cd
								  ,  unq.entry_int_match_param_key_census_child_group
								  ,  count(distinct unq.id_prsn_child) as cnt_entries
						  from portal_redux.ooh_dcfs_eps ae
						   join #date dt on ae.removal_dt between dt.begin_date and dt.end_date
						  -- for demographic and flags we'll select first entry episode for information
						  join (select  portal_redux.ooh_dcfs_eps.*,dt.date_type,dt.begin_date
										,row_number() over (partition by dt.date_type,dt.begin_date,id_prsn_child  order by removal_dt asc,federal_discharge_date asc) as row_num
									from portal_redux.ooh_dcfs_eps 
									 join #date dt on ooh_dcfs_eps.removal_dt between dt.begin_date and dt.end_date
								)unq on ae.id_removal_episode_Fact=unq.id_removal_episode_fact 
										and unq.row_num=1 
										and dt.begin_date=unq.begin_date
										and dt.date_type=unq.date_type
						  group by   unq.begin_date
								  , unq.date_type
								  ,  unq.bin_dep_cd
								  ,  unq.max_bin_los_cd
								  ,  unq.bin_placement_cd
								  ,  unq.bin_ihs_svc_cd
								  ,  unq.cd_reporter_type
								  ,  unq.fl_cps_invs
								  ,  unq.fl_cfws
								  ,  unq.fl_risk_only
								  ,  unq.fl_alternate_intervention
								  ,  unq.fl_frs
								  , unq.fl_far
								  ,  unq.fl_phys_abuse
								  ,  unq.fl_sexual_abuse
								  ,  unq.fl_neglect
								  ,  unq.fl_any_legal
								  ,  unq.fl_founded_phys_abuse
								  ,  unq.fl_founded_sexual_abuse
								  ,  unq.fl_founded_neglect
								  ,  unq.fl_found_any_legal
								  ,  unq.entry_census_child_group_cd
								  ,  unq.cd_race_census
								  ,  unq.census_hispanic_latino_origin_cd
								  ,  unq.pk_gndr
								  ,  unq.init_cd_plcm_setng
								  ,  unq.long_cd_plcm_setng
								  ,  unq.removal_county_cd
								  ,  unq.entry_int_match_param_key_census_child_group
		

								 
		/*************************************************************************************  EXITS ******************* EXITS **/
					--if OBJECT_ID('tempDB..#exits') is not null drop table #exits
						DROP TABLE IF EXISTS #exits;
							CREATE TABLE #exits(
								[qry_type] [int] NOT NULL,
									[date_type] [int] NULL,
									[start_date] [datetime] NULL,
									[bin_dep_cd] [int] NOT NULL,
									[max_bin_los_cd] [int] NULL,
									[bin_placement_cd] [int] NULL,
									[bin_ihs_svc_cd] [int] NULL,
									[cd_reporter_type] [int] NOT NULL,
									[fl_cps_invs] [int] NOT NULL,
									[fl_cfws] [int] NOT NULL,
									[fl_risk_only] [int] NOT NULL,
									[fl_alternate_intervention] [int] NOT NULL,
									[fl_frs] [int] NOT NULL,
									fl_far int not null,
									[fl_phys_abuse] [int] NOT NULL,
									[fl_sexual_abuse] [int] NOT NULL,
									[fl_neglect] [int] NOT NULL,
									[fl_any_legal] [int] NOT NULL,
									[fl_founded_phys_abuse] [int] NOT NULL,
									[fl_founded_sexual_abuse] [int] NOT NULL,
									[fl_founded_neglect] [int] NOT NULL,
									[fl_found_any_legal] [int] NOT NULL,
									age_grouping_cd int  NULL,
									cd_race [int] NULL,
									[census_hispanic_latino_origin_cd] [int] NULL,
									[pk_gndr] [int] NOT NULL,
									[init_cd_plcm_setng] [int] NULL,
									[long_cd_plcm_setng] [int] NULL,
									county_cd [int] NULL,
									[int_match_param_key] [bigint] NULL,
									cd_discharge_type int,
									cnt_exits int
									);
						
								
							insert into #exits (qry_type,date_type,	[start_date]
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,age_grouping_cd
								  ,cd_race
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,[county_cd]
								  ,[int_match_param_key],cd_discharge_type,cnt_exits)
--  all EXITS
						SELECT 2 as [qry_type]
								  ,dt.date_type [date_type]
								  ,dt.begin_date as [start_date]
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.exit_census_child_group_cd
								  ,[cd_race_census]
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,exit_county_cd
								  ,eps.exit_int_match_param_key_census_child_group
								 , eps.cd_discharge_type
								  ,count(distinct id_removal_episode_fact)
						  from portal_redux.ooh_dcfs_eps eps
						  join #date dt on eps.federal_discharge_date between dt.begin_date and dt.end_date
						  where  exit_census_child_group_cd is not null
							  group by   dt.date_type
								,dt.begin_date
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.exit_census_child_group_cd
								  ,[cd_race_census]
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,exit_county_cd
								  ,exit_int_match_param_key_census_child_group
								 , eps.cd_discharge_type
					----  first entries -   EXITS
				UNION ALL
							SELECT 1 [qry_type]
								  ,dt.date_type [date_type]
								  ,dt.begin_date as [start_date]
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.exit_census_child_group_cd
								  ,[cd_race_census]
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,exit_county_cd
								  ,exit_int_match_param_key_census_child_group
								 , eps.cd_discharge_type
								  ,count(distinct id_removal_episode_fact)
						  from portal_redux.ooh_dcfs_eps eps
						  join #date dt on eps.federal_discharge_date between dt.begin_date and dt.end_date
						  where eps.removal_dt=eps.first_removal_dt
						  and exit_census_child_group_cd  is not null
						  group by   dt.begin_date
								  ,dt.date_type
								  ,[bin_dep_cd]
								  ,[max_bin_los_cd]
								  ,[bin_placement_cd]
								  ,[bin_ihs_svc_cd]
								  ,[cd_reporter_type]
								  ,[fl_cps_invs]
								  ,[fl_cfws]
								  ,[fl_risk_only]
								  ,[fl_alternate_intervention]
								  ,[fl_frs],fl_far
								  ,[fl_phys_abuse]
								  ,[fl_sexual_abuse]
								  ,[fl_neglect]
								  ,[fl_any_legal]
								  ,[fl_founded_phys_abuse]
								  ,[fl_founded_sexual_abuse]
								  ,[fl_founded_neglect]
								  ,[fl_found_any_legal]
								  ,eps.exit_census_child_group_cd
								  ,[cd_race_census]
								  ,[census_hispanic_latino_origin_cd]
								  ,[pk_gndr]
								  ,[init_cd_plcm_setng]
								  ,[long_cd_plcm_setng]
								  ,exit_county_cd
								  ,exit_int_match_param_key_census_child_group
								 , eps.cd_discharge_type
----  UNIQUE DCFS exits
				union all
							SELECT 0 as qry_type
								  , unq.date_type as date_type
								  ,  unq.begin_date as start_date
								  ,  unq.bin_dep_cd
								  ,  unq.max_bin_los_cd
								  ,  unq.bin_placement_cd
								  ,  unq.bin_ihs_svc_cd
								  ,  unq.cd_reporter_type
								  ,  unq.fl_cps_invs
								  ,  unq.fl_cfws
								  ,  unq.fl_risk_only
								  ,  unq.fl_alternate_intervention
								  ,  unq.fl_frs
								  , unq.fl_far
								  ,  unq.fl_phys_abuse
								  ,  unq.fl_sexual_abuse
								  ,  unq.fl_neglect
								  ,  unq.fl_any_legal
								  ,  unq.fl_founded_phys_abuse
								  ,  unq.fl_founded_sexual_abuse
								  ,  unq.fl_founded_neglect
								  ,  unq.fl_found_any_legal
								  ,  unq.exit_census_child_group_cd
								  ,  unq.cd_race_census
								  ,  unq.census_hispanic_latino_origin_cd
								  ,  unq.pk_gndr
								  ,  unq.init_cd_plcm_setng
								  ,  unq.long_cd_plcm_setng
								  ,  unq.exit_county_cd
								  ,  unq.exit_int_match_param_key_census_child_group
								 , unq.cd_discharge_type
								  ,count(distinct ae.id_prsn_child) as cnt_exits
						  from portal_redux.ooh_dcfs_eps ae
						  join #date dt on ae.federal_discharge_date between dt.begin_date and dt.end_date
						  -- for demographic and flags we'll select first entry episode for information
						  join (select  portal_redux.ooh_dcfs_eps.*,dt.date_type,dt.begin_date
										,row_number() over (partition by dt.date_type,dt.begin_date,id_prsn_child  order by removal_dt asc,federal_discharge_date asc) as row_num
								from portal_redux.ooh_dcfs_eps 
								join #date dt on ooh_dcfs_eps.federal_discharge_date between dt.begin_date and dt.end_date
								)unq on ae.id_removal_episode_Fact=unq.id_removal_episode_fact 
										and unq.row_num=1 
										and dt.begin_date=unq.begin_date
										and dt.date_type=unq.date_type
						  where unq.exit_census_child_group_cd   is not null
						  group by   unq.date_type
									, unq.begin_date
								  ,  unq.bin_dep_cd
								  ,  unq.max_bin_los_cd
								  ,  unq.bin_placement_cd
								  ,  unq.bin_ihs_svc_cd
								  ,  unq.cd_reporter_type
								  ,  unq.fl_cps_invs
								  ,  unq.fl_cfws
								  ,  unq.fl_risk_only
								  ,  unq.fl_alternate_intervention
								  ,  unq.fl_frs
								  , unq.fl_far
								  ,  unq.fl_phys_abuse
								  ,  unq.fl_sexual_abuse
								  ,  unq.fl_neglect
								  ,  unq.fl_any_legal
								  ,  unq.fl_founded_phys_abuse
								  ,  unq.fl_founded_sexual_abuse
								  ,  unq.fl_founded_neglect
								  ,  unq.fl_found_any_legal
								  ,  unq.exit_census_child_group_cd
								  ,  unq.cd_race_census
								  ,  unq.census_hispanic_latino_origin_cd
								  ,  unq.pk_gndr
								  ,  unq.init_cd_plcm_setng
								  ,  unq.long_cd_plcm_setng
								  ,  unq.exit_county_cd
								  ,  unq.exit_int_match_param_key_census_child_group
								 , unq.cd_discharge_type
								  order by [start_date],exit_int_match_param_key_census_child_group
		



	alter table portal_redux.[prtl_poc1ab_entries]	NOCHECK CONSTRAINT ALL;
	alter table portal_redux.[prtl_poc1ab_exits]	NOCHECK CONSTRAINT ALL;
	if object_ID(N'portal_redux.prtl_poc1ab_entries',N'U') is not null truncate table portal_redux.prtl_poc1ab_entries
	if object_ID(N'portal_redux.prtl_poc1ab_exits',N'U') is not null truncate table portal_redux.prtl_poc1ab_exits	




			
			insert into portal_redux.[prtl_poc1ab_entries] ([qry_type]
					,[date_type]
					,[start_date]
					,[bin_dep_cd]
					,[max_bin_los_cd]
					,[bin_placement_cd]
					,[bin_ihs_svc_cd]
					,[cd_reporter_type]
					,filter_access_type
					, filter_allegation
					, filter_finding
					,age_grouping_cd
					,[cd_race]
					,[census_hispanic_latino_origin_cd]
					,[pk_gndr]
					,[init_cd_plcm_setng]
					,[long_cd_plcm_setng]
					,[county_cd]
					,[int_match_param_key]
					,[cnt_entries]
					,start_year
					--,[cnt_dcfs_start_date]
					--,[cnt_dcfs_entries]
					--,[cnt_dcfs_exits]
					)
		select [qry_type]
				   ,[date_type]
				   ,[start_date]
				   ,[bin_dep_cd]
				   ,[max_bin_los_cd]
				   ,[bin_placement_cd]
				   ,[bin_ihs_svc_cd]
				   ,[cd_reporter_type]
			, (select cd_multiplier from portal_redux.ref_filter_access_type where cd_access_type=0 )
						+  fl_far * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_far')
						+  fl_cps_invs * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_cps_invs')
						+ fl_alternate_intervention  * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_alternate_intervention')
						+ fl_frs * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_frs')
						+ fl_risk_only * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_risk_only')
						+ fl_cfws * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_cfws')   [filter_access_type]
						-- select * from ref_filter_finding
				, (select cd_multiplier from portal_redux.ref_filter_allegation where cd_allegation=0 )
				     + ((fl_phys_abuse *  (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_phys_abuse') )
					  + (fl_sexual_abuse *  (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_sexual_abuse')) 
					  +  (fl_neglect *   (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_neglect')) 
					  + (fl_any_legal * (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_any_legal')) ) [filter_allegation]
				   , (select cd_multiplier from portal_redux.ref_filter_finding where cd_finding=0 )
				     + ((fl_founded_phys_abuse *  (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_phys_abuse') )
					  + (fl_founded_sexual_abuse *  (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_sexual_abuse')) 
					  +  (fl_founded_neglect *   (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_neglect')) 
					  + (fl_found_any_legal * (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_any_finding_legal')) ) [filter_finding] 
				   ,age_grouping_cd
				   ,[cd_race]
				   ,[census_hispanic_latino_origin_cd]
				   ,[pk_gndr]
				   ,[init_cd_plcm_setng]
				   ,[long_cd_plcm_setng]
				   ,[county_cd]
				   ,[int_match_param_key]
				   ,[cnt_entries]
				   ,year(start_date)
			From #entries
			order by [qry_type]
				   ,[date_type]
				   ,[start_date]

					
			insert into portal_redux.prtl_poc1ab_exits (qry_type
					,date_type
					,start_date
					,bin_dep_cd
					,max_bin_los_cd
					,bin_placement_cd
					,bin_ihs_svc_cd
					,cd_reporter_type
					,filter_access_type
					, filter_allegation
					, filter_finding
					,age_grouping_cd
					,cd_race
					,census_hispanic_latino_origin_cd
					,pk_gndr
					,init_cd_plcm_setng
					,long_cd_plcm_setng
					,county_cd
					,int_match_param_key
					,cd_discharge_type
					,cnt_exits
					,start_year
					)
		select qry_type
				   ,date_type
				   ,start_date
				   ,bin_dep_cd
				   ,max_bin_los_cd
				   ,bin_placement_cd
				   ,bin_ihs_svc_cd
				   ,cd_reporter_type
			, (select cd_multiplier from portal_redux.ref_filter_access_type where cd_access_type=0 )
						+  fl_far * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_far')
						+  fl_cps_invs * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_cps_invs')
						+ fl_alternate_intervention  * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_alternate_intervention')
						+ fl_frs * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_frs')
						+ fl_risk_only * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_risk_only')
						+ fl_cfws * (select cd_multiplier from portal_redux.ref_filter_access_type where fl_name='fl_cfws')   [filter_access_type]
						-- select * from ref_filter_finding
				, (select cd_multiplier from portal_redux.ref_filter_allegation where cd_allegation=0 )
				     + ((fl_phys_abuse *  (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_phys_abuse') )
					  + (fl_sexual_abuse *  (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_sexual_abuse')) 
					  +  (fl_neglect *   (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_neglect')) 
					  + (fl_any_legal * (select cd_multiplier from portal_redux.ref_filter_allegation where fl_name='fl_any_legal')) ) [filter_allegation]
				   , (select cd_multiplier from portal_redux.ref_filter_finding where cd_finding=0 )
				     + ((fl_founded_phys_abuse *  (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_phys_abuse') )
					  + (fl_founded_sexual_abuse *  (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_sexual_abuse')) 
					  +  (fl_founded_neglect *   (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_founded_neglect')) 
					  + (fl_found_any_legal * (select cd_multiplier from portal_redux.ref_filter_finding where fl_name='fl_any_finding_legal')) ) [filter_finding] 
				   ,age_grouping_cd
				   ,cd_race
				   ,census_hispanic_latino_origin_cd
				   ,pk_gndr
				   ,init_cd_plcm_setng
				   ,long_cd_plcm_setng
				   ,county_cd
				   ,int_match_param_key
				   ,cd_discharge_type
				   ,cnt_exits
				   ,year(start_date)
			FROM #exits


	alter TABLE portal_redux.[prtl_poc1ab_entries]	CHECK CONSTRAINT ALL;
	alter table portal_redux.[prtl_poc1ab_exits]	CHECK CONSTRAINT ALL;


		update statistics portal_redux.prtl_poc1ab_entries;
	  	update statistics portal_redux.prtl_poc1ab_exits;
	
	    update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.prtl_poc1ab_entries)
	  where tbl_id=37;
	
	    update portal_redux.prtl_tables_last_update		
	  set last_build_date=getdate()
	  ,row_count=(select count(*) from portal_redux.prtl_poc1ab_exits)
	  where tbl_id=38;

end;