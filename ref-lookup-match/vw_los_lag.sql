-- create vw_los_lag view

CREATE  VIEW [portal_redux].[vw_los_lag] AS 
	select los.bin_los_cd [bin_los_cd]
		,los.bin_los_desc [bin_los_desc]
		,los.dur_days_from [dur_days_from]
				,los.dur_days_thru [dur_days_thru]
				,los.lag [lag]
				,1 [date_type]
            ,case 
                when los.bin_los_cd = 0
                then dw.cutoff_date
                else dateadd(mm,-3,dateadd(dd,(-1 *  abs(los.lag)),dw.cutoff_date) )
            end max_filter_date
            ,case 
                when los.bin_los_cd = 0
                then dw.cutoff_date
                else dateadd(mm,-12,dateadd(dd,(-1 *  abs(los.lag)),dw.cutoff_date) )
            end cohort_max_filter_date
from portal_redux.ref_filter_los los , ref_last_dw_transfer dw
union
	select los.bin_los_cd AS bin_los_cd
		,los.bin_los_desc AS bin_los_desc
		,los.dur_days_from AS dur_days_from
				,los.dur_days_thru AS dur_days_thru
				,los.lag AS lag
				,2  date_type
,case 
                when los.bin_los_cd = 0
                then dw.cutoff_date
                else dateadd(mm,-3,dateadd(dd,(-1 *  abs(los.lag)),dw.cutoff_date) )
            end 
            ,case 
                when los.bin_los_cd = 0
                then dw.cutoff_date
                else dateadd(mm,-12,dateadd(dd,(-1 *  abs(los.lag)),dw.cutoff_date) )
            end 
from portal_redux.ref_filter_los los , ref_last_dw_transfer dw;
