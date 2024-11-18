-- prod_build_tbl_intake_grouper definition

-- EXEC portal_redux.prod_build_tbl_intake_grouper;
-- DROP PROCEDURE IF EXISTS portal_redux.prod_build_tbl_intake_grouper;
CREATE PROCEDURE portal_redux.prod_build_tbl_intake_grouper
AS

BEGIN
	set nocount on
	--if object_ID('tempDB..#intakes') is not null drop table #intakes
	DROP TABLE IF EXISTS #intakes;
	select row_number() over (partition by id_case order by id_case,rfrd_date,intake_rank,id_intake_fact) as case_sort
	,row_number() over ( order by id_case,rfrd_date,intake_rank,id_intake_fact) as intake_grouper
	,0 as fl_group_with_prior,*
	into #intakes
	from portal_redux.tbl_intakes where cd_final_decision = 1 
	and id_case > 0 and fl_dlr=0
	order by id_case,inv_ass_start,intake_rank



	update intk
	set fl_group_with_prior=1
	from #intakes intk
	join #intakes pr_intk on pr_intk.case_sort=intk.case_sort-1 
			and intk.id_case=pr_intk.id_case
	where abs(datediff(dd,intk.inv_ass_start,pr_intk.inv_ass_start))<=2

		
		

	--alter table #intakes
	--alter column case_sort bigint not null
	--go
	--alter table #intakes
	--add primary key(id_case,case_sort)
	--go

	declare @rowcount int
	set @rowcount=10
	while @rowcount > 0
	begin
		update intk
		set intk.intake_grouper=pr_intk.intake_grouper
		from #intakes intk
		join #intakes pr_intk on intk.id_case=pr_intk.id_case
				and pr_intk.case_sort=  intk.case_sort-1 and intk.fl_group_with_prior=1
		where intk.intake_grouper <> pr_intk.intake_grouper and pr_intk.fl_ooh_after_this_referral <> 1
		
		set @rowcount=@@ROWCOUNT
	end 


	alter table portal_redux.tbl_intake_grouper NOCHECK CONSTRAINT ALL;

	truncate table portal_redux.tbl_intake_grouper
	insert into portal_redux.tbl_intake_grouper(id_intake_fact,intake_grouper,id_case,intk_grp_seq_nbr)
	select distinct id_intake_fact,intake_grouper,id_case ,row_number() over (partition by intake_grouper order by rfrd_date)
	from #intakes

	insert into portal_redux.tbl_intake_grouper(id_intake_fact,intake_grouper,id_case,intk_grp_seq_nbr)
	select distinct id_intake_fact,row_number() over ( order by id_intake_fact,id_case) + s.seed  intake_grouper
	,id_case ,row_number() over (partition by id_intake_fact order by rfrd_date)
	from portal_redux.tbl_intakes
	join (select max(intake_grouper)  seed from portal_redux.tbl_intake_grouper ) s on s.seed=s.seed
	where id_case>0
	and not exists (select id_intake_fact from #intakes intk where intk.id_intake_fact=tbl_intakes.id_intake_fact)

	alter table portal_redux.tbl_intake_grouper CHECK CONSTRAINT ALL;

	update statistics portal_redux.tbl_intake_grouper

	update portal_redux.procedure_flow
	set last_run_date=getdate()
	where procedure_nm='prod_build_tbl_intake_grouper';
END;