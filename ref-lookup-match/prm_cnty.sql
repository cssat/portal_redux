-- create prm_cnty view

CREATE VIEW [portal_redux].[prm_cnty] AS 
select portal_redux.ref_lookup_county.County_Cd AS cd_cnty,ref_lookup_county.County_Cd AS match_code 
from portal_redux.ref_lookup_county where (ref_lookup_county.County_Cd between 1 and 39) 
union select zr.County_Cd AS county_cd,mtch.County_Cd AS match_code from portal_redux.ref_lookup_county mtch , portal_redux.ref_lookup_county zr
where ((mtch.County_Cd not in (0,40,999)) and (zr.County_Cd = 0));