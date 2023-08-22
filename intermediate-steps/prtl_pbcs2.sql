-- create prtl_pbcs2 table

-- DROP TABLE portal_redux.prtl_pbcs2;
CREATE TABLE portal_redux.prtl_pbcs2 (
	cohort_begin_date datetime NOT NULL,
	date_type int NOT NULL,
	qry_type int NOT NULL,
	int_match_param_key bigint NOT NULL,
	cd_sib_age_grp int NOT NULL,
	cd_race_census int NOT NULL,
	census_hispanic_latino_origin_cd int NOT NULL,
	county_cd int NOT NULL,
	filter_access_type int NOT NULL,
	filter_allegation int NOT NULL,
	filter_finding int NOT NULL,
	cd_reporter_type int NOT NULL,
	bin_ihs_svc_cd int NOT NULL,
	initref int NOT NULL,
	initfndref int NOT NULL,
	cohortrefcount int NOT NULL,
	cohortfndrefcount int NOT NULL,
	case_founded_recurrence int NOT NULL,
	case_repeat_referral int NOT NULL,
	cnt_case int NOT NULL,
	nxt_ref_within_min_month int NOT NULL,
	CONSTRAINT PK_prtl_pbcs2_1 PRIMARY KEY (cohort_begin_date,date_type,qry_type,int_match_param_key,filter_access_type,filter_allegation,filter_finding,cd_reporter_type,bin_ihs_svc_cd,initref,initfndref,case_founded_recurrence,nxt_ref_within_min_month),
	CONSTRAINT prtl_pbcs2_cd_race_FK FOREIGN KEY (cd_race_census) REFERENCES portal_redux.ref_lookup_ethnicity_census(cd_race_census),
	CONSTRAINT prtl_pbcs2_cd_reporter_type_FK FOREIGN KEY (cd_reporter_type) REFERENCES portal_redux.ref_filter_reporter_type(cd_reporter_type),
	CONSTRAINT prtl_pbcs2_cd_sib_age_grpr_FK FOREIGN KEY (cd_sib_age_grp) REFERENCES portal_redux.ref_lookup_sib_age_grp(cd_sib_age_grp),
	CONSTRAINT prtl_pbcs2_county_cd_FK FOREIGN KEY (county_cd) REFERENCES portal_redux.ref_lookup_county(county_cd),
	CONSTRAINT prtl_pbcs2_origin_cd_FK FOREIGN KEY (census_hispanic_latino_origin_cd) REFERENCES portal_redux.ref_lookup_hispanic_latino_census(census_hispanic_latino_origin_cd)
);
CREATE NONCLUSTERED INDEX idx_nxt_ref_within_min_month ON portal_redux.prtl_pbcs2 (  nxt_ref_within_min_month ASC  , cohort_begin_date ASC  , int_match_param_key ASC  , cohortrefcount ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY] ;
CREATE NONCLUSTERED INDEX idx_reporter_type_cohortrefcount ON portal_redux.prtl_pbcs2 (  cd_reporter_type ASC  , cohortrefcount ASC  )  
	INCLUDE ( cnt_case , cohort_begin_date , filter_access_type , filter_allegation , filter_finding , int_match_param_key , qry_type ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_s2 ON portal_redux.prtl_pbcs2 (  cd_sib_age_grp ASC  , filter_finding ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];


-- populate prtl_pbcs2 table

--  exec [prod_build_prtl_pbcs2] '2014-08-08'
-- DROP PROCEDURE portal_redux.prod_build_prtl_pbcs2;
CREATE procedure [portal_redux].[prod_build_prtl_pbcs2]
as 
begin
		set nocount on

		declare @chstart datetime
		declare @chend datetime
		declare @cutoff_date datetime
		set @cutoff_date=(select max(cutoff_date) from portal_redux.ref_Last_DW_Transfer);
	--	set @chstart = (select min_date_any  from ref_lookup_max_date where id=6)

		select @chstart=min_date_any,@chend=dateadd(dd,-1,dateadd(yy,1,max_date_yr)) from portal_redux.ref_lookup_max_date where id=6;

		if object_id('tempdb..#intakes') is not null drop table #intakes;

		-- get closest ihs episode
		with cte_ihs(id_ihs_episode,ihs_begin_date,id_intake_fact,id_case,days_to_ihs,row_num,bin_ihs_svc_cd)
		as ( select id_ihs_episode,ihs_begin_date,intk.id_intake_fact,intk.id_case
			,datediff(dd,cast(convert(varchar(10),intk.rfrd_date ,121) as datetime),eps.ihs_begin_date) days_to_ihs
			,ROW_NUMBER() over (partition by intk.id_case,intk.rfrd_date order by datediff(dd,cast(convert(varchar(10),intk.rfrd_date ,121) as datetime)
			,eps.ihs_begin_date)  asc) row_num
			,case when eps.total_amt_paid > 0  then 1 else 2 end as bin_ihs_svc_cd
			from portal_redux.tbl_intakes intk
			join  portal_redux.tbl_ihs_episodes eps on intk.id_intake_fact=eps.id_intake_fact
			where fl_ihs_90_day=1 and fl_dlr=0
			and intk.id_case>0
			)


		select distinct 
			cd.[Year] as cohort_begin_date
			, 0 as qry_type
			,intk.id_case
			,intk.id_intake_fact
			,intk.inv_ass_start
			,intk.inv_ass_stop
			,intk.rfrd_date
			,intk.first_intake_date
			, 0 as refcount
			, 0 as fndrefcount
			, 0 as cohortrefcount
			, 0 as cohortfndrefcount
			, 0 as initref
			, 0 as initfndref
			, 0 as case_founded_recurrence
			, 0 as case_repeat_referral
			, cast(null as int) as days_to_next_referral
			, cast(null as int) as days_to_next_founded_referral
			, cast(null as int)  as nxt_ref_within_min_month
			, cast(null as int)  as nxt_fnd_ref_within_min_month
			, 0 as age_grouping_cd
			, max(intk.cd_sib_age_grp) as cd_sib_age_grp
			, max(intk.[CD_RACE_Census])  as cd_race_census
			, max(intk.census_hispanic_latino_origin_cd) as census_hispanic_latino_origin_cd
			, max(abs(intake_county_cd) )  as intake_county_cd
			, power(10.0,6) 
					+ (power(10.0,5) * max(intk.cd_sib_age_grp))
					+ (power(10.0,4) * max(intk.cd_race_census))
					+ (power(10.0,3) * max(intk.census_hispanic_latino_origin_cd))
					+ max(abs(intake_county_cd) ) as int_match_param_key
			, max(xwr.collapsed_cd_reporter_type) as cd_reporter_type
			, max(isnull(ihs.bin_ihs_svc_cd,3)) as bin_ihs_svc_cd
			, cast(null as int) as age_at_referral_mos  
			, max(fl_cps_invs) as fl_cps_invs
			, max(fl_cfws) as fl_cfws
			, max(fl_dlr) as fl_dlr
			, max(fl_frs) as fl_frs
			,max(fl_far) as fl_far
			, max(fl_alternate_intervention) as fl_alternate_intervention
			, max(fl_risk_only) as fl_risk_only
			, max(fl_phys_abuse) as fl_phys_abuse
			, max(fl_sexual_abuse) as fl_sexual_abuse
			, max(fl_neglect) as fl_neglect
			, max(fl_allegation_any) as fl_any_legal
			, max(fl_founded_phys_abuse) as fl_founded_phys_abuse
			, max(fl_founded_sexual_abuse) as fl_founded_sexual_abuse
			, max(fl_founded_neglect) as fl_founded_neglect
			, max(fl_founded_any_legal) as fl_founded_any_legal
		into #intakes 
		from portal_redux.tbl_intakes intk
		join portal_redux.CALENDAR_DIM cd on cd.CALENDAR_DATE=intk.inv_ass_start
		left join cte_ihs ihs on ihs.id_intake_fact=intk.id_intake_fact and ihs.row_num=1
		left join ref_xwlk_reporter_type xwr on xwr.cd_reporter_type=intk.cd_reporter
		where 	intk.id_case>0
		and intk.inv_ass_start  between @chstart and @chend
				and intk.cd_final_decision=1 
					and intk.fl_reopen_case=0
					and intk.fl_dlr=0 
					and (intk.fl_cfws = 1 or intk.fl_frs=1 or intk.fl_risk_only=1 or intk.fl_alternate_intervention=1
							or intk.fl_cps_invs=1 or intk.fl_far=1)
					and intk.cd_spvr_rsn in (1,2,3)
					and intk.cd_access_type in (1,2,4)
		group by cd.[Year]
		,intk.id_case
			,intk.id_intake_fact
			,intk.inv_ass_start
			,intk.inv_ass_stop
			,intk.rfrd_date
			,intk.first_intake_date

			
		create nonclustered index idx_prsn_intake on #intakes(id_intake_fact);
		create nonclustered index idx_prsn_rfrd on #intakes(id_case,rfrd_date);


		update #intakes
		set		cohortrefcount=q.case_cohort_refcount
					,refcount=q.case_refcount
		from (select intk.* 
							, row_number() over( 
								partition by cohort_begin_date
														,id_case 
								order by rfrd_date asc,id_intake_fact asc
									) as case_cohort_refcount
							, row_number() over( 
									partition by id_case 
									order by rfrd_date asc
									,id_intake_fact asc) as case_refcount
				from #intakes intk 
				)  q
		where #intakes.id_intake_fact=q.id_intake_fact



		--  mark initial and initial founded referrals for each victim
		update intk
		set initref=1
		from  #intakes intk
		where refcount=1 and rfrd_date=first_intake_date

		--select cohort_begin_date,sum(initref),count(distinct id_case) from #intakes
		----where fl_cps_invs=1
		--group by cohort_begin_date
		--order by cohort_begin_date

		-- mark intitial and founded referrals for each cohort
		update #intakes
		set		cohortfndrefcount=q.case_cohort_refcount
					,fndrefcount=q.case_refcount
		from (select intk.* 
					, row_number() over( partition by cohort_begin_date,id_case 
							order by rfrd_date asc,refcount asc) as case_cohort_refcount
					, row_number() over( partition by id_case order by rfrd_date asc,refcount asc) as case_refcount
					from #intakes intk  where fl_founded_any_legal=1
				)  q
		where #intakes.id_intake_fact=q.id_intake_fact

		--select start_date,sum(p2.cnt_opened) from portal_redux.prtl_poc2ab p2 where date_type=2 and qry_type=0  group by start_date

		update #intakes
		set initfndref=1
		where 	fndrefcount=1 


		update intk
		set days_to_next_referral=  datediff(dd,intk.rfrd_date,q.next_rfrd_date)
		from #intakes intk
		join (select id_case
							, rfrd_date
							, id_intake_fact 
							, LAG(rfrd_date) OVER (partition by id_case order by rfrd_date desc,refcount desc)  as next_rfrd_date
				from #intakes
				) q on q.id_intake_fact=intk.id_intake_fact 
					and q.id_case=intk.id_case
					and q.rfrd_date=intk.rfrd_date
		where q.next_rfrd_date is not null 


		update intk
		set days_to_next_founded_referral=datediff(dd,intk.rfrd_date,q.next_rfrd_date)
		from #intakes intk
		join (select id_case
							, rfrd_date
							, id_intake_fact 
							, LAG(rfrd_date) OVER (partition by id_case order by rfrd_date desc,refcount desc)  as next_rfrd_date
					from #intakes
					where fndrefcount>0
					) q on q.id_intake_fact=intk.id_intake_fact 
					and q.id_case=intk.id_case
					and q.rfrd_date=intk.rfrd_date
		where q.next_rfrd_date is not null and fndrefcount >1


		-- mark victim recurrences (subsequent foundeds after initial founded)	
		-- variable vicrecur in David's code
		update intk
		set case_founded_recurrence=1
		from  #intakes intk
		join #intakes more on intk.id_case=more.id_case
			and intk.fndrefcount = more.fndrefcount-1
			and intk.days_to_next_founded_referral<=1461


		-- mark repeat referrals (subsequent referral, any finding, after initial referral)
		update intk
		set case_repeat_referral=1
		from  #intakes intk
		join #intakes more on intk.id_case=more.id_case
			and intk.refcount = more.refcount-1
			and intk.days_to_next_referral <=1461

		update intk
		set	nxt_ref_within_min_month = 
		case when days_to_next_referral<=92 then 3
				when days_to_next_referral<=183 then  6                 
				when days_to_next_referral<=274 then 9                  
				when days_to_next_referral<=366 then 12	                  
				when days_to_next_referral<=457 then 15	                  
				when days_to_next_referral<=548 then 18                  
				when days_to_next_referral<=639 then 21	                  
				when days_to_next_referral<=731 then 24	                  
				when days_to_next_referral<=822 then 27	                  
				when days_to_next_referral<=913 then 30	                  
				when days_to_next_referral<=1004 then 33	                  
				when days_to_next_referral<=1097 then 36	                  
				when days_to_next_referral<=1187 then 39	                  
				when days_to_next_referral<=1278 then 42	                  
				when days_to_next_referral<=1370 then 45	                  
				when days_to_next_referral<=1461 then 48  end  	
		from #intakes intk
		where days_to_next_referral is not null

		delete from #intakes where NOT (cohortrefcount=1 or cohortfndrefcount=1 or initref=1 or initfndref=1)

		alter table portal_redux.prtl_pbcs2 NOCHECK CONSTRAINT ALL;
		truncate table portal_redux.prtl_pbcs2
		--  first import first ever referrals
		insert into portal_redux.prtl_pbcs2
		select cohort_begin_date,2 as date_type,1 as qry_type
			,int_match_param_key
			,cd_sib_age_grp
			,cd_race_census
			,census_hispanic_latino_origin_cd
			,iif(intake_county_cd=99,-99,intake_county_cd) [intake_county_cd]
		, (select cd_multiplier from ref_filter_access_type where cd_access_type=0 )
			+  fl_far * (select cd_multiplier from ref_filter_access_type where fl_name='fl_far')
			+  fl_cps_invs * (select cd_multiplier from ref_filter_access_type where fl_name='fl_cps_invs')
			+ fl_alternate_intervention  * (select cd_multiplier from ref_filter_access_type where fl_name='fl_alternate_intervention')
			+ fl_frs * (select cd_multiplier from ref_filter_access_type where fl_name='fl_frs')
			+ fl_risk_only * (select cd_multiplier from ref_filter_access_type where fl_name='fl_risk_only')
			+ fl_cfws * (select cd_multiplier from ref_filter_access_type where fl_name='fl_cfws')   [filter_access_type]
		,(select cd_multiplier from ref_filter_allegation where cd_allegation=0)
				+ ( [fl_phys_abuse] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_phys_abuse'))
				+ ([fl_sexual_abuse] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_sexual_abuse'))
				+ ([fl_neglect] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_neglect'))
				+ ([fl_any_legal] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_any_legal')) [filter_allegation]
		,(select cd_multiplier from ref_filter_finding where cd_finding=0)
				+ ([fl_founded_phys_abuse] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_phys_abuse'))
				+ ([fl_founded_sexual_abuse] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_sexual_abuse'))
				+ ([fl_founded_neglect] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_neglect'))
				+ (fl_founded_any_legal * (select cd_multiplier from ref_filter_finding where fl_name='fl_any_finding_legal')) [filter_finding]			
			,cd_reporter_type
			,bin_ihs_svc_cd
			,initref
			,initfndref
			,cohortrefcount
			,cohortfndrefcount
			,case_founded_recurrence
			,case_repeat_referral
			,count(distinct id_case) as cnt_case
	, coalesce(nxt_ref_within_min_month,99999)
		from #intakes where initref=1
        AND int_match_param_key IS NOT NULL
		group by cohort_begin_date
			,int_match_param_key
			,cd_sib_age_grp
			,cd_race_census
			,census_hispanic_latino_origin_cd
			,intake_county_cd
			, fl_cps_invs
			, fl_alternate_intervention
			, fl_frs
			, fl_far
			, fl_risk_only
			, fl_cfws
			,[fl_phys_abuse]
			,[fl_sexual_abuse]
			,[fl_neglect]
			,[fl_any_legal]
			,[fl_founded_phys_abuse]
			,[fl_founded_sexual_abuse]
			,[fl_founded_neglect]
			,[fl_founded_any_legal]
			,cd_reporter_type
			,bin_ihs_svc_cd
			,initref
			,initfndref
			,cohortrefcount
			,cohortfndrefcount
			,case_founded_recurrence
			,case_repeat_referral
	, coalesce(nxt_ref_within_min_month,99999)
	union
	select cohort_begin_date,2 as date_type,0 as qry_type
			,int_match_param_key
			,cd_sib_age_grp
			,cd_race_census
			,census_hispanic_latino_origin_cd
			,iif(intake_county_cd=99,-99,intake_county_cd) [intake_county_cd]
		, (select cd_multiplier from ref_filter_access_type where cd_access_type=0 )
			+  fl_far * (select cd_multiplier from ref_filter_access_type where fl_name='fl_far')
			+  fl_cps_invs * (select cd_multiplier from ref_filter_access_type where fl_name='fl_cps_invs')
			+ fl_alternate_intervention  * (select cd_multiplier from ref_filter_access_type where fl_name='fl_alternate_intervention')
			+ fl_frs * (select cd_multiplier from ref_filter_access_type where fl_name='fl_frs')
			+ fl_risk_only * (select cd_multiplier from ref_filter_access_type where fl_name='fl_risk_only')
			+ fl_cfws * (select cd_multiplier from ref_filter_access_type where fl_name='fl_cfws')   [filter_access_type]
		,(select cd_multiplier from ref_filter_allegation where cd_allegation=0)
				+ ( [fl_phys_abuse] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_phys_abuse'))
				+ ([fl_sexual_abuse] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_sexual_abuse'))
				+ ([fl_neglect] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_neglect'))
				+ ([fl_any_legal] * (select cd_multiplier from ref_filter_allegation where fl_name='fl_any_legal')) [filter_allegation]
		,(select cd_multiplier from ref_filter_finding where cd_finding=0)
				+ ([fl_founded_phys_abuse] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_phys_abuse'))
				+ ([fl_founded_sexual_abuse] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_sexual_abuse'))
				+ ([fl_founded_neglect] * (select cd_multiplier from ref_filter_finding where fl_name='fl_founded_neglect'))
				+ (fl_founded_any_legal * (select cd_multiplier from ref_filter_finding where fl_name='fl_any_finding_legal')) [filter_finding]		
			,cd_reporter_type
			,bin_ihs_svc_cd
			,initref
			,initfndref
			,cohortrefcount
			,cohortfndrefcount
			,case_founded_recurrence
			,case_repeat_referral
			,count(distinct id_case) as cnt_case
			, coalesce(nxt_ref_within_min_month,99999)
		from #intakes  where  cohortrefcount=1
        AND int_match_param_key IS NOT NULL
		group by cohort_begin_date
			,int_match_param_key
			,cd_sib_age_grp
			,cd_race_census
			,census_hispanic_latino_origin_cd
			,intake_county_cd
			, fl_cps_invs
			, fl_alternate_intervention
			, fl_frs
			, fl_risk_only
			, fl_cfws
			, fl_far
			,[fl_phys_abuse]
			,[fl_sexual_abuse]
			,[fl_neglect]
			,[fl_any_legal]
			,[fl_founded_phys_abuse]
			,[fl_founded_sexual_abuse]
			,[fl_founded_neglect]
			,[fl_founded_any_legal]
			,cd_reporter_type
			,bin_ihs_svc_cd
			,initref
			,initfndref
			,cohortrefcount
			,cohortfndrefcount
			,case_founded_recurrence
			,case_repeat_referral
			, nxt_ref_within_min_month

	ALTER TABLE portal_redux.prtl_pbcs2 CHECK CONSTRAINT ALL;
	UPDATE STATISTICS portal_redux.prtl_pbcs2;

END;