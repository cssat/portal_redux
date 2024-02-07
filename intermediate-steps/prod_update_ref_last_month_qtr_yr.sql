-- create ref_last_month_qtr_yr table

DROP TABLE IF EXISTS portal_redux.ref_last_month_qtr_yr;
CREATE TABLE portal_redux.ref_last_month_qtr_yr (
	date_type int NOT NULL,
	end_date datetime NULL,
	CONSTRAINT PK__ref_last__6ECB627C59236111 PRIMARY KEY (date_type)
);

begin
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

end;
