-- create prm_alg view

CREATE VIEW portal_redux.prm_alg AS select ref_match_allegation.cd_allegation AS cd_allegation,ref_match_allegation.filter_allegation AS match_code 
from portal_redux.ref_match_allegation where (ref_match_allegation.cd_allegation <> 0) 
union select 0 ,flt.filter_allegation AS match_code 
from portal_redux.ref_match_allegation flt where (flt.cd_allegation <> 0) 
union select distinct 0 ,power(10,4);