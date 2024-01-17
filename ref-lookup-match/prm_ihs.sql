CREATE  VIEW portal_redux.prm_ihs AS 
select distinct flt.bin_ihs_svc_cd AS bin_ihs_svc_cd,flt.bin_ihs_svc_cd AS match_code
from portal_redux.ref_filter_ihs_services flt 
    where (flt.bin_ihs_svc_cd <> 0) 
union all 
select distinct zr.bin_ihs_svc_cd AS bin_ihs_svc_cd,flt.bin_ihs_svc_cd AS bin_ihs_svc_cd 
from portal_redux.ref_filter_ihs_services flt ,ref_filter_ihs_services zr
    where ((flt.bin_ihs_svc_cd <> 0) and (zr.bin_ihs_svc_cd = 0));