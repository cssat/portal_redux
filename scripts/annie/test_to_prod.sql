-- copies test_annie tables into annie

TRUNCATE annie.ref_last_dw_transfer;
INSERT INTO annie.ref_last_dw_transfer
SELECT * FROM test_annie.ref_last_dw_transfer;

TRUNCATE annie.ref_lookup_max_date;
INSERT INTO annie.ref_lookup_max_date
SELECT * FROM test_annie.ref_lookup_max_date;

TRUNCATE annie.ooh_point_in_time_measures;
INSERT INTO annie.ooh_point_in_time_measures
SELECT * FROM test_annie.ooh_point_in_time_measures;

TRUNCATE annie.prtl_outcomes;
INSERT INTO annie.prtl_outcomes
SELECT * FROM test_annie.prtl_outcomes;

TRUNCATE annie.prtl_poc1ab_entries;
INSERT INTO annie.prtl_poc1ab_entries
SELECT * FROM test_annie.prtl_poc1ab_entries;

TRUNCATE annie.prtl_poc1ab_exits;
INSERT INTO annie.prtl_poc1ab_exits
SELECT * FROM test_annie.prtl_poc1ab_exits;

TRUNCATE annie.prtl_poc2ab;
INSERT INTO annie.prtl_poc2ab
SELECT * FROM test_annie.prtl_poc2ab;

TRUNCATE annie.prtl_pbcs2;
INSERT INTO annie.prtl_pbcs2
SELECT * FROM test_annie.prtl_pbcs2;

TRUNCATE annie.prtl_pbcp5;
INSERT INTO annie.prtl_pbcp5
SELECT * FROM test_annie.prtl_pbcp5;

TRUNCATE annie.cache_outcomes_params;
INSERT INTO annie.cache_outcomes_params
SELECT * FROM test_annie.cache_outcomes_params;

TRUNCATE annie.cache_poc1ab_params;
INSERT INTO annie.cache_poc1ab_params
SELECT * FROM test_annie.cache_poc1ab_params;

TRUNCATE annie.cache_poc1ab_entries_params;
INSERT INTO annie.cache_poc1ab_entries_params
SELECT * FROM test_annie.cache_poc1ab_entries_params;

TRUNCATE annie.cache_poc1ab_exits_params;
INSERT INTO annie.cache_poc1ab_exits_params
SELECT * FROM test_annie.cache_poc1ab_exits_params;

TRUNCATE annie.cache_poc2ab_params;
INSERT INTO annie.cache_poc2ab_params
SELECT * FROM test_annie.cache_poc2ab_params;

TRUNCATE annie.cache_pbcs2_params;
INSERT INTO annie.cache_pbcs2_params
SELECT * FROM test_annie.cache_pbcs2_params;

TRUNCATE annie.cache_pbcw3_params;
INSERT INTO annie.cache_pbcw3_params
SELECT * FROM test_annie.cache_pbcw3_params;

TRUNCATE annie.cache_pbcw4_params;
INSERT INTO annie.cache_pbcw4_params
SELECT * FROM test_annie.cache_pbcw4_params;

TRUNCATE annie.cache_pcbp5_params;
INSERT INTO annie.cache_pcbp5_params
SELECT * FROM test_annie.cache_pcbp5_params;

TRUNCATE annie.cache_qry_param_outcomes;
INSERT INTO annie.cache_qry_param_outcomes
SELECT * FROM test_annie.cache_qry_param_outcomes;

TRUNCATE annie.cache_qry_param_poc1ab;
INSERT INTO annie.cache_qry_param_poc1ab
SELECT * FROM test_annie.cache_qry_param_poc1ab;

TRUNCATE annie.cache_qry_param_poc1ab_entries;
INSERT INTO annie.cache_qry_param_poc1ab_entries
SELECT * FROM test_annie.cache_qry_param_poc1ab_entries;

TRUNCATE annie.cache_qry_param_poc1ab_exits;
INSERT INTO annie.cache_qry_param_poc1ab_exits
SELECT * FROM test_annie.cache_qry_param_poc1ab_exits;

TRUNCATE annie.cache_qry_param_poc2ab;
INSERT INTO annie.cache_qry_param_poc2ab
SELECT * FROM test_annie.cache_qry_param_poc2ab;

TRUNCATE annie.cache_qry_param_pbcs2;
INSERT INTO annie.cache_qry_param_pbcs2
SELECT * FROM test_annie.cache_qry_param_pbcs2;

TRUNCATE annie.cache_qry_param_pbcw3;
INSERT INTO annie.cache_qry_param_pbcw3
SELECT * FROM test_annie.cache_qry_param_pbcw3;

TRUNCATE annie.cache_qry_param_pbcw4;
INSERT INTO annie.cache_qry_param_pbcw4
SELECT * FROM test_annie.cache_qry_param_pbcw4;

TRUNCATE annie.cache_qry_param_pcbp5;
INSERT INTO annie.cache_qry_param_pcbp5
SELECT * FROM test_annie.cache_qry_param_pcbp5;

TRUNCATE annie.cache_outcomes_aggr;
INSERT INTO annie.cache_outcomes_aggr
SELECT * FROM test_annie.cache_outcomes_aggr;

TRUNCATE annie.cache_poc1ab_aggr;
INSERT INTO annie.cache_poc1ab_aggr
SELECT * FROM test_annie.cache_poc1ab_aggr;

TRUNCATE annie.cache_poc1ab_entries_aggr;
INSERT INTO annie.cache_poc1ab_entries_aggr
SELECT * FROM test_annie.cache_poc1ab_entries_aggr;

TRUNCATE annie.cache_poc1ab_exits_aggr;
INSERT INTO annie.cache_poc1ab_exits_aggr
SELECT * FROM test_annie.cache_poc1ab_exits_aggr;

TRUNCATE annie.cache_poc2ab_aggr;
INSERT INTO annie.cache_poc2ab_aggr
SELECT * FROM test_annie.cache_poc2ab_aggr;

TRUNCATE annie.cache_pbcs2_aggr;
INSERT INTO annie.cache_pbcs2_aggr
SELECT * FROM test_annie.cache_pbcs2_aggr;

TRUNCATE annie.cache_pbcw3_aggr;
INSERT INTO annie.cache_pbcw3_aggr
SELECT * FROM test_annie.cache_pbcw3_aggr;

TRUNCATE annie.cache_pbcw4_aggr;
INSERT INTO annie.cache_pbcw4_aggr
SELECT * FROM test_annie.cache_pbcw4_aggr;

TRUNCATE annie.cache_pbcp5_aggr;
INSERT INTO annie.cache_pbcp5_aggr
SELECT * FROM test_annie.cache_pbcp5_aggr;
