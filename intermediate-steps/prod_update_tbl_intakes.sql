-- update tbl_intakes table

begin

    update portal_redux.tbl_intakes
    set [fl_ooh_after_this_referral] = 1 
    from portal_redux.tbl_intakes intk 
    where exists (select *
	    from portal_redux.rptPlacement rpt
		where intk.id_intake_fact= rpt.id_intake_fact
		and rpt.id_intake_fact is not null);


	update tbl_intakes
	set id_prsn_hh=mom_id,id_people_dim_hh=pd.ID_PEOPLE_DIM,tbl_intakes.cd_race_census=pd.cd_race
		,tbl_intakes.census_hispanic_latino_origin_cd= CASE
			WHEN pd.CD_HSPNC = 'Y' THEN 1
			WHEN pd.CD_HSPNC = 'N' THEN 2
			ELSE 5
			END
		,tbl_intakes.fl_hh_is_mother=1
	--select mom_id,ID_PEOPLE_DIM,cd_race_census
	from portal_redux.tbl_intakes tbl_intakes
	join (select distinct id_intake_fact,mom_id from portal_redux.rptPlacement where mom_id is not null and id_intake_fact is 	not null) rpt on tbl_intakes.id_intake_fact= rpt.id_intake_fact
	join portal_redux.PEOPLE_DIM pd on pd.id_prsn=rpt.mom_id and pd.IS_CURRENT=1
	WHERE tbl_intakes.id_prsn_hh !=mom_id
	and rpt.mom_id is not null;


update portal_redux.procedure_flow
set last_run_date=getdate()
where procedure_nm='prod_update_tbl_intakes'

end;