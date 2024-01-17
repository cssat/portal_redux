-- create prm_acc view

CREATE VIEW portal_redux.[prm_acc] AS 
select flt.cd_access_type AS cd_access_type,flt.filter_access_type AS match_code from portal_redux.ref_filter_access_type flt where (flt.cd_access_type <> 0)
 union select zr.cd_access_type AS cd_access_type,flt.filter_access_type AS filter_access_type from portal_redux.ref_filter_access_type flt , ref_filter_access_type zr 
 where ((flt.cd_access_type <> 0) and (zr.cd_access_type = 0)) union select cd_access_type ,cd_multiplier from portal_redux.ref_filter_access_type where cd_access_type=0;