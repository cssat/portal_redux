-- portal_redux.vw_ref_dependency_lag source

CREATE view [portal_redux].[vw_ref_dependency_lag]
as
select dep.bin_dep_cd AS bin_dep_cd
,dep.bin_dep_desc AS bin_dep_desc
,dep.diff_days_from AS diff_days_from
,dep.diff_days_thru AS diff_days_thru
,dep.fl_dep_exist AS fl_dep_exist
,dep.lag AS lag
,dep.min_filter_date AS min_filter_date
,1 AS date_type
,case 
    when dep.bin_dep_cd = 0
    then dateadd(mm,-3,dateadd(dd,(-1* abs(dep.lag)),dw.cutoff_date))
end [ max_filter_date]
,case 
    when dep.bin_dep_cd = 0
    then dateadd(mm,-3,dateadd(dd,(-1* abs(dep.lag)),dw.cutoff_date))
end [cohort_max_filter_date]
from (portal_redux.ref_filter_dependency dep 
join portal_redux.ref_last_dw_transfer dw on 1=1) 
union all
select dep.bin_dep_cd AS bin_dep_cd
,dep.bin_dep_desc AS bin_dep_desc
,dep.diff_days_from AS diff_days_from
,dep.diff_days_thru AS diff_days_thru
,dep.fl_dep_exist AS fl_dep_exist
,dep.lag AS lag
,dep.min_filter_date AS min_filter_date
,2 AS date_type
,case 
    when dep.bin_dep_cd = 0
    then dateadd(mm,-3,dateadd(dd,(-1* abs(dep.lag)),dw.cutoff_date))
end 
,case 
    when dep.bin_dep_cd = 0
    then dateadd(mm,-3,dateadd(dd,(-1* abs(dep.lag)),dw.cutoff_date))
end 
from (portal_redux.ref_filter_dependency dep 
join portal_redux.ref_last_dw_transfer dw on 1=1);
