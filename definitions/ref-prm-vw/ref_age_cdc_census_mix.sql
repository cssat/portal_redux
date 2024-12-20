-- create ref_age_cdc_census_mix view

create view portal_redux.ref_age_cdc_census_mix
as 
select distinct [cdc_census_mix_age_cd] [age_grouping_cd],[cdc_census_mix_age_tx] [age_grouping]
from portal_redux.age_dim
    where age_mo between 0 and 18 * 12
		and [cdc_census_mix_age_cd] <> -99
union select age_grouping_cd,age_grouping  
from portal_redux.ref_age_groupings_census 
    where age_grouping_cd=0;