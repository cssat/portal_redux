CREATE VIEW portal_redux.[vw_dependency_lag]
    AS 
SELECT 
    dep.bin_dep_cd, 
    dep.bin_dep_desc, 
    dep.diff_days_from, 
    dep.diff_days_thru, 
    dep.fl_dep_exist, 
    dep.lag, 
    dep.min_filter_date, 
    1 [date_type], 
    IIF(dep.bin_dep_cd = 0, dw.cutoff_date, DATEADD(mm,-3,DATEADD(dd,(-1 * ABS(dep.lag)),dw.cutoff_date))) [max_filter_date], 
    IIF(dep.bin_dep_cd = 0, dw.cutoff_date, DATEADD(mm,-12,DATEADD(dd,(-1 * ABS(dep.lag)),dw.cutoff_date))) [cohort_max_filter_date]
FROM portal_redux.ref_filter_dependency dep 
CROSS JOIN portal_redux.ref_last_dw_transfer dw

UNION ALL

SELECT 
    dep.bin_dep_cd, 
    dep.bin_dep_desc, 
    dep.diff_days_from, 
    dep.diff_days_thru, 
    dep.fl_dep_exist, 
    dep.lag, 
    dep.min_filter_date, 
    2 [date_type], 
    IIF(dep.bin_dep_cd = 0, dw.cutoff_date, DATEADD(mm,-12,DATEADD(dd,(-1 * ABS(dep.lag)),dw.cutoff_date))) [max_filter_date], 
    IIF(dep.bin_dep_cd = 0, dw.cutoff_date, DATEADD(mm,-21,DATEADD(dd,(-1 * ABS(dep.lag)),dw.cutoff_date))) [cohort_max_filter_date] 
FROM portal_redux.ref_filter_dependency dep 
CROSS JOIN portal_redux.ref_last_dw_transfer dw;