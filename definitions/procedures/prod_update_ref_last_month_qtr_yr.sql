-- prod_update_ref_last_month_qtr_yr definition

-- EXEC portal_redux.prod_update_ref_last_month_qtr_yr;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_update_ref_last_month_qtr_yr;
CREATE PROCEDURE portal_redux.prod_update_ref_last_month_qtr_yr
AS

BEGIN
	truncate table portal_redux.ref_last_month_qtr_yr
	insert into portal_redux.ref_last_month_qtr_yr
	select 0,eomonth(portal_redux.last_complete_month())
	union
	select 1,dateadd(dd,-1,dateadd(mm,3,portal_redux.last_complete_qtr()))
	union
	select 2,cast(cast(year(portal_redux.last_complete_yr()) as char(4)) + '-12-31' as datetime)

	update portal_redux.procedure_flow
	set last_run_date=getdate()
	where procedure_nm='prod_update_ref_last_month_qtr_yr' 		
END;
