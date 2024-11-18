-- prod_build_match_finding definition

-- EXEC portal_redux.prod_build_match_finding;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_match_finding;
CREATE PROCEDURE portal_redux.prod_build_match_finding
AS

BEGIN

set nocount on
if object_ID(N'portal_redux.ref_match_finding',N'U') is not null drop table portal_redux.ref_match_finding
create table portal_redux.ref_match_finding (filter_finding decimal(18,0),[fl_founded_phys_abuse] int
	  ,[fl_founded_sexual_abuse] int
	  ,[fl_founded_neglect] int
	  ,[fl_any_finding_legal] int
	  ,cd_finding int)

insert into portal_redux.ref_match_finding (filter_finding
							,fl_founded_phys_abuse
							,fl_founded_sexual_abuse
							,fl_founded_neglect
							,fl_any_finding_legal)
SELECT  distinct
      power(10,4) + ((fl_founded_phys_abuse * 1 ) + (fl_founded_sexual_abuse * 10) +  (fl_founded_neglect * 100)) + ((case when fl_founded_phys_abuse=1 or fl_founded_sexual_abuse=1 or fl_founded_neglect=1 then 1 else 0 end) * 1000) as filter_finding
      ,fl_founded_phys_abuse
	  ,fl_founded_sexual_abuse
	  ,fl_founded_neglect
	  ,case when fl_founded_phys_abuse=1 or fl_founded_sexual_abuse=1 or fl_founded_neglect=1 then 1 else 0 end 
  FROM portal_redux.vw_intakes_screened_in
  union
  SELECT  distinct
      power(10,4) + ((fl_founded_phys_abuse * 1 ) + (fl_founded_sexual_abuse * 10) +  (fl_founded_neglect * 100)) + ((case when fl_founded_phys_abuse=1 or fl_founded_sexual_abuse=1 or fl_founded_neglect=1 then 1 else 0 end) * 1000) as filter_finding
      ,fl_founded_phys_abuse
	  ,fl_founded_sexual_abuse
	  ,fl_founded_neglect
	  ,case when fl_founded_phys_abuse=1 or fl_founded_sexual_abuse=1 or fl_founded_neglect=1 then 1 else 0 end 
  FROM portal_redux.tbl_intakes

--if OBJECT_ID('tempDB..#temp') is not null drop table #temp
DROP TABLE IF EXISTS #temp;
select filter_finding,fl_any_finding_legal,fl_founded_neglect,fl_founded_sexual_abuse,fl_founded_phys_abuse,1 as cd_finding 
into #temp 
from portal_redux.ref_match_finding
where fl_founded_phys_abuse=1
union
select filter_finding,fl_any_finding_legal,fl_founded_neglect,fl_founded_sexual_abuse,fl_founded_phys_abuse,2 as cd_finding 
from portal_redux.ref_match_finding
where fl_founded_sexual_abuse=1
union
select filter_finding,fl_any_finding_legal,fl_founded_neglect,fl_founded_sexual_abuse,fl_founded_phys_abuse,3 as cd_finding 
from portal_redux.ref_match_finding
where fl_founded_neglect=1
union all
select filter_finding,fl_any_finding_legal,fl_founded_neglect,fl_founded_sexual_abuse,fl_founded_phys_abuse,4 as cd_finding 
from portal_redux.ref_match_finding
where fl_any_finding_legal=1	

truncate table portal_redux.ref_match_finding
insert into portal_redux.ref_match_finding(filter_finding
							,fl_founded_phys_abuse
							,fl_founded_sexual_abuse
							,fl_founded_neglect
							,fl_any_finding_legal
							,cd_finding)
select filter_finding
							,fl_founded_phys_abuse
							,fl_founded_sexual_abuse
							,fl_founded_neglect
							,fl_any_finding_legal
							,cd_finding from #temp


update portal_redux.prtl_tables_last_update
set last_build_date=getdate(),row_count=(select count(*) from portal_redux.ref_match_finding)
where tbl_id=47;

update portal_redux.procedure_flow
set last_run_date=getdate()
where procedure_nm='prod_build_match_finding'

END;
