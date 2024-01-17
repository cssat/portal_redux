
begin



		declare @cutoff_date datetime
		declare @max_date_Qtr datetime
		declare @max_date_yr datetime
		declare @max_date_qtr_pit datetime
		declare @max_date_yr_pit datetime
		select @cutoff_date=dateadd(mm,-1,[month]) ,@max_date_Qtr=dateadd(mm,-3,[Quarter]),@max_date_yr=dateadd(yy,-1,[Year])
			,@max_date_qtr_pit=[quarter],@max_date_yr_pit=[Year]
		from portal_redux.ref_last_DW_transfer join portal_redux.calendar_dim cd on cd.calendar_date=cutoff_date;






		--select * from ref_lookup_max_date

		update portal_redux.ref_lookup_max_date
		set  max_date_any=@max_date_yr
		, max_date_yr=@max_date_yr
		, max_date_qtr=dateadd(mm,-9,@max_date_Qtr)
		,max_date_all=dateadd(yy,-4,DATEFROMPARTS(year(@max_date_Qtr),1,1))
		where  [procedure_name] in ('sp_ooh_outcomes','sp_ooh_reentry','sp_ia_safety','sp_ihs_safety');
										

	
								
		update portal_redux.ref_lookup_max_date
		set max_date_all=@max_date_qtr_pit
		, max_date_any=@max_date_qtr_pit
		, max_date_qtr=@max_date_qtr_pit
		, max_date_yr=@max_date_yr_pit
		where [procedure_name] in ('sp_ooh_wb_familysettings','sp_ooh_wb_siblings','sp_ooh_pit_counts','sp_ooh_pit_rates','sp_ooh_wb_siblings_pvt');
		
										
		update portal_redux.ref_lookup_max_date
		set max_date_all=@max_date_Qtr
		, max_date_any=@max_date_Qtr
		, max_date_qtr=@max_date_Qtr
		, max_date_yr=@max_date_yr
		where [procedure_name] in ('sp_ihs_trends_counts','sp_ihs_trends_rates','sp_ooh_flow_entries_counts','sp_ooh_flow_exits','sp_ooh_flow_entries_rates','sp_ia_trends_counts','sp_ia_trends_rates');	

		
		--update ref_lookup_max_date
		--set max_date_all=dateadd(mm,-3,@max_date_Qtr)
		--, max_date_any=dateadd(mm,-3,@max_date_Qtr)
		--, max_date_qtr=dateadd(mm,-3,@max_date_Qtr)
		--, max_date_yr=dateadd(yy,-1,datefromparts(year(@max_date_yr),1,1))
		--where [procedure_name] in ('sp_ia_trends_counts','sp_ia_trends_rates');

		
		


		/**

		declare @cutoff_date datetime
		declare @max_date_Qtr datetime
		declare @max_date_yr datetime
		select @cutoff_date=dateadd(mm,-1,[month]) ,@max_date_Qtr=dateadd(mm,-3,[Quarter]),@max_date_yr=dateadd(yy,-1,[Year])
		from portal_redux.ref_last_DW_transfer join calendar_dim cd on cd.calendar_date=cutoff_date;

		print @cutoff_date
		print @max_date_qtr
		print @max_date_yr
		print dateadd(mm,3,dateadd(yy,-4,@max_date_qtr))
		print dateadd(mm,3,dateadd(yy,-3,@max_date_qtr))

		SELECT TOP 1000 [id]
			  ,[procedure_name]
			  ,[max_date_all]
			  ,[max_date_any]
			  ,[max_date_qtr]
			  ,[max_date_yr]
			  ,[min_date_any]
		  FROM [dbCoreAdministrativeTables].[portal_redux].[ref_lookup_max_date]
		where  (id > = 15)
			**/
			
		--select 'old' as v,* from #ref
		--union all
		--select 'new',* from portal_redux.ref_lookup_max_date
		--order by [procedure_name],max_date_all

end;