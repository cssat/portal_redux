-- portal_redux.ref_lookup_census_population source

CREATE view [portal_redux].[ref_lookup_census_population]
as 
select * from public_data.ofm_population;