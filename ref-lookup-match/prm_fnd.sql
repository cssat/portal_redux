-- create prm_fnd view

CREATE  VIEW portal_redux.prm_fnd AS 
select ref_match_finding.cd_finding AS cd_finding,ref_match_finding.filter_finding AS match_code 
from portal_redux.ref_match_finding 
    where (ref_match_finding.cd_finding <> 0) union select 0 ,ref_match_finding.filter_finding AS match_code 
from portal_redux.ref_match_finding 
    where (ref_match_finding.cd_finding <> 0) union select distinct 0 ,power(10,4);