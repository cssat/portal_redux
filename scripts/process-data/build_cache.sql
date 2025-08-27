-- build_cache
-- fifth set of procedures

EXEC portal_redux.prod_build_cache_pbcs2_aggr;
--EXEC portal_redux.prod_build_cache_pbcs3_aggr;
EXEC portal_redux.prod_build_cache_poc2ab_aggr;
--EXEC portal_redux.prod_build_cache_poc3ab_aggr;

/* For prod_build_cache_ooh_tables
when running all (param = 0) may take up to ~15 hours to complete
parameters and corresponding tables/procedures:
9 - pbcp5 - sp_ooh_reentry
12 - pbcw3 - sp_ooh_wb_familysettings
13 - pbcw4 - sp_ooh_wb_siblings
19 - poc1ab - sp_ooh_pit_counts  **takes ~13 hours?
23 - outcomes - sp_ooh_outcomes
24 - poc1ab_entries - sp_ooh_flow_entries_counts
25 - poc1ab_exits - sp_ooh_flow_exits
*/
EXEC portal_redux.prod_build_cache_ooh_tables 0;

