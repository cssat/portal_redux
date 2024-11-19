-- portal_redux.prm_lpl source

CREATE  VIEW portal_redux.prm_lpl 
AS select ref_lookup_placement.cd_plcm_setng [long_cd_plcm_setng],ref_lookup_placement.cd_plcm_setng [match_code] 
from portal_redux.ref_lookup_plcmnt  ref_lookup_placement
where (ref_lookup_placement.cd_plcm_setng <> 0)
 union select zr.cd_plcm_setng [long_cd_plcm_setng],fpl.cd_plcm_setng [match_code]
 from portal_redux.ref_lookup_plcmnt fpl , ref_lookup_plcmnt zr where ((fpl.cd_plcm_setng <> 0) and (zr.cd_plcm_setng = 0));