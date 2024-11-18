-- build_cache
-- fifth set of procedures

EXEC portal_redux.prod_build_cache_pbcs2_aggr;
EXEC portal_redux.prod_build_cache_pbcs3_aggr;
EXEC portal_redux.prod_build_cache_poc2ab_aggr;
EXEC portal_redux.prod_build_cache_poc3ab_aggr;
-- when running all (param = 0) may take up to ~14 hours to complete
EXEC portal_redux.prod_build_cache_ooh_tables 0;
