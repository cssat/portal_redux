-- prod_build_rate_referrals_screened_in definition

-- EXEC portal_redux.prod_build_rate_referrals_screened_in;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_rate_referrals_screened_in;
CREATE PROCEDURE portal_redux.prod_build_rate_referrals_screened_in
AS

BEGIN

declare @startdate datetime=getdate()
alter table portal_redux.rate_referrals_scrn_in NOCHECK CONSTRAINT ALL
truncate table portal_redux.rate_referrals_scrn_in
insert into portal_redux.rate_referrals_scrn_in(qry_type,date_type,start_date,county_cd,entry_point,cnt_referrals)
SELECT tce.qry_type
		,tce.[date_type]
		,cohort_entry_date as [start_date]
		,cnty.cd_cnty county_cd
		,ep.entry_point
		,count( distinct intake_grouper) as cnt_ref
from [portal_redux].[vw_referrals_grp] tce
--   this table is used for aggregating ALL as well as individual counties
join portal_redux.prm_cnty cnty on cnty.match_code=intake_county_cd
--  this table is used for aggregating the entry points as well as individual entry point
join portal_redux.prm_entry_point ep on ep.match_code=tce.entry_point  
where   tce.entry_point!=7 -- exclude dlr
and hh_with_children_under_18=1  -- must have child under 18 associated with  intake group
and tce.cd_final_decision=1 --must be screened in
and cohort_entry_date >='2000-01-01'
group by   tce.qry_type
		,tce.[date_type]
		,cohort_entry_date 
		,cnty.cd_cnty 
		,ep.entry_point
--					  ,ref.cnt_referrals
order by cnty.cd_cnty,cohort_entry_date,ep.entry_point

-- denominator is all referrals for that month
update scr
set scr.tot_pop=ref.cnt_referrals,
referral_rate=IIF(ref.cnt_referrals>0,scr.cnt_referrals /(ref.cnt_referrals * 1.0000) *1000 ,null)
from portal_redux.rate_referrals_scrn_in scr
join portal_redux.rate_referrals ref on ref.start_date=scr.start_date and ref.county_cd=scr.county_cd and ref.entry_point=scr.entry_point

								  


alter table portal_redux.rate_referrals_scrn_in CHECK CONSTRAINT ALL

declare @enddate datetime=getdate();
update tbl
set tbl.last_build_date=getdate()
		,tbl.row_count=(select count(*) from portal_redux.rate_referrals_scrn_in)
		,tbl.load_time_mins=portal_redux.fnc_datediff_mis(@startdate,@enddate)
from portal_redux.prtl_tables_last_update tbl
where tbl_id=56


END;

--select * from portal_redux.rate_referrals_scrn_in where county_cd=0 and entry_point=0 order by start_date
--select *  from  portal_redux.rate_referrals  where county_cd=0 and entry_point=0  order by start_date