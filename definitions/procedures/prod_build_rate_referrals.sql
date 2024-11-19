
-- prod_build_rate_referrals definition

-- EXEC portal_redux.prod_build_rate_referrals;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_rate_referrals;
CREATE PROCEDURE portal_redux.prod_build_rate_referrals
AS

BEGIN

		declare @startdate datetime=getdate()
		alter table portal_redux.rate_referrals NOCHECK CONSTRAINT ALL
		truncate table portal_redux.rate_referrals
		insert into portal_redux.rate_referrals(qry_type,date_type,start_date,county_cd,entry_point,cnt_referrals,tot_pop,referral_rate)
		SELECT qry_type
				,[date_type]
				,cohort_entry_date as [start_date]
				,cnty.cd_cnty county_cd
				,ep.entry_point
				,count( distinct intake_grouper) as cnt_ref
				,pop.tot_pop
				, count( distinct intake_grouper) /(pop.tot_pop * 1.0000) *1000 "referral_rate"
		from [portal_redux].[vw_referrals_grp] tce
		--   this table is used for aggregating ALL as well as individual counties
		join portal_redux.prm_cnty cnty on cnty.match_code=intake_county_cd
		--  this table is used for aggregating the entry points as well as individual entry point
		join portal_redux.prm_entry_point ep on ep.match_code=tce.entry_point
		join (select measurement_year,county_cd,sum(pop_cnt) tot_pop
					from public_data.census_population_household where cd_race<9
					group by measurement_year,county_cd
					union all
					select measurement_year,0,sum(pop_cnt) tot_pop
					from public_data.census_population_household where cd_race<9
					group by measurement_year
				) pop on measurement_year=year(cohort_entry_date) and pop.county_cd=cnty.cd_cnty 
				where  ep.entry_point<> 7 -- exclude DLR
				 and hh_with_children_under_18=1  -- must have child under 18 associated with  intake group
		group by   qry_type
				,[date_type]
				,cohort_entry_date 
				,cnty.cd_cnty 
				,ep.entry_point
				,pop.tot_pop
		order by ep.entry_point,cnty.cd_cnty,cohort_entry_date


alter table portal_redux.rate_referrals CHECK CONSTRAINT ALL

declare @enddate datetime=getdate();
update tbl
set tbl.last_build_date=getdate()
		,tbl.row_count=(select count(*) from portal_redux.rate_referrals)
		,tbl.load_time_mins=portal_redux.fnc_datediff_mis(@startdate,@enddate)
from portal_redux.prtl_tables_last_update tbl
where tbl_id=55

END;

----  select * from portal_redux.rate_referrals where  county_cd=0 and start_date='2010-01-01'  order by entry_point,start_date
--select start_date,sum(cnt_referrals)  from portal_redux.rate_referrals  
--where  county_cd=0 and start_date='2010-01-01'  and entry_point>0  group by start_date order by start_date