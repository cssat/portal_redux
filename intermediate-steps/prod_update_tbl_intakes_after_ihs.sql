
update portal_redux.tbl_intakes
set fl_ihs_90_day=0
where fl_ihs_90_day <>0;

	

update intk
set fl_ihs_90_day=1
from portal_redux.tbl_ihs_episodes eps
join portal_redux.tbl_intakes intk
on eps.id_intake_fact=intk.id_intake_fact
where  days_from_rfrd_date <=90
and intk.id_case>0;


update portal_redux.procedure_flow
set last_run_date=getdate()
where procedure_nm='prod_update_tbl_intakes_after_ihs';