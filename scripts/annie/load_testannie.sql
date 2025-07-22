-- loads data into test_annie from local (currently, to be changed to s3)
-- replace all 'path-to-files' with local path before running this script

TRUNCATE test_annie.ref_last_dw_transfer;
LOAD DATA LOCAL INFILE 'path-to-files/ref_last_dw_transfer.csv' INTO TABLE test_annie.ref_last_dw_transfer FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.ref_lookup_max_date;
LOAD DATA LOCAL INFILE 'path-to-files/ref_lookup_max_date.csv' INTO TABLE test_annie.ref_lookup_max_date FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.ooh_point_in_time_measures;
LOAD DATA LOCAL INFILE 'path-to-files/ooh_point_in_time_measures.csv' INTO TABLE test_annie.ooh_point_in_time_measures FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_poc1ab_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_params.csv' INTO TABLE test_annie.cache_poc1ab_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_poc1ab;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_poc1ab.csv' INTO TABLE test_annie.cache_qry_param_poc1ab FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


TRUNCATE test_annie.cache_poc1ab_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_aggr.csv' INTO TABLE test_annie.cache_poc1ab_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcw3_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcw3_params.csv' INTO TABLE test_annie.cache_pbcw3_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_pbcw3;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_pbcw3.csv' INTO TABLE test_annie.cache_qry_param_pbcw3 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcw3_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcw3_aggr.csv' INTO TABLE test_annie.cache_pbcw3_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcw4_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcw4_params.csv' INTO TABLE test_annie.cache_pbcw4_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


TRUNCATE test_annie.cache_qry_param_pbcw4;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_pbcw4.csv' INTO TABLE test_annie.cache_qry_param_pbcw4 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcw4_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcw4_aggr.csv' INTO TABLE test_annie.cache_pbcw4_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.prtl_poc1ab_entries;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_poc1ab_entries.csv' INTO TABLE test_annie.prtl_poc1ab_entries FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_poc1ab_entries_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_entries_params.csv' INTO TABLE test_annie.cache_poc1ab_entries_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_poc1ab_entries;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_poc1ab_entries.csv' INTO TABLE test_annie.cache_qry_param_poc1ab_entries FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


TRUNCATE test_annie.cache_poc1ab_entries_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_entries_aggr.csv' INTO TABLE test_annie.cache_poc1ab_entries_aggr FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (qry_type,date_type,start_date,int_param_key,bin_dep_cd,bin_los_cd,bin_placement_cd,bin_ihs_svc_cd,cd_reporter_type,cd_access_type,cd_allegation,cd_finding,@custody_id,age_grouping_cd,cd_race,pk_gndr,init_cd_plcm_setng,long_cd_plcm_setng,county_cd,cnt_entries,min_start_date,max_start_date,x1,x2,insert_date,int_hash_key,qry_id,start_year,fl_include_perCapita);

TRUNCATE test_annie.prtl_poc1ab_exits;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_poc1ab_exits.csv' INTO TABLE test_annie.prtl_poc1ab_exits FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_poc1ab_exits_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_exits_params.csv' INTO TABLE test_annie.cache_poc1ab_exits_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_poc1ab_exits;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_poc1ab_exits.csv' INTO TABLE test_annie.cache_qry_param_poc1ab_exits FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_poc1ab_exits_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc1ab_exits_aggr.csv' INTO TABLE test_annie.cache_poc1ab_exits_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (qry_type,date_type,start_date,int_param_key,bin_dep_cd,bin_los_cd,bin_placement_cd,bin_ihs_svc_cd,cd_reporter_type,cd_access_type,cd_allegation,cd_finding,@custody_id,age_grouping_cd,cd_race,pk_gndr,init_cd_plcm_setng,long_cd_plcm_setng,county_cd,cd_discharge_type,cnt_exits,min_start_date,max_start_date,x1,x2,insert_date,int_hash_key,qry_id,start_year,fl_include_perCapita);


TRUNCATE test_annie.prtl_pbcp5;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_pbcp5.csv' INTO TABLE test_annie.prtl_pbcp5 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pcbp5_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pcbp5_params.csv' INTO TABLE test_annie.cache_pcbp5_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_pcbp5;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_pcbp5.csv' INTO TABLE test_annie.cache_qry_param_pcbp5 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcp5_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcp5_aggr.csv' INTO TABLE test_annie.cache_pbcp5_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (qry_type,date_type,cohort_entry_date,cd_discharge_type,int_param_key,bin_dep_cd,bin_los_cd,bin_placement_cd,bin_ihs_svc_cd,cd_reporter_type,cd_access_type,cd_allegation,cd_finding,reentry_within_month,reentry_rate,age_grouping_cd,cd_race,pk_gndr,init_cd_plcm_setng,long_cd_plcm_setng,county_cd,min_start_date,max_start_date,x1,x2,insert_date,int_hash_key,qry_id,start_year);

TRUNCATE test_annie.prtl_outcomes;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_outcomes.csv' INTO TABLE test_annie.prtl_outcomes FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_outcomes_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_outcomes_params.csv' INTO TABLE test_annie.cache_outcomes_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_outcomes;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_outcomes.csv' INTO TABLE test_annie.cache_qry_param_outcomes FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_outcomes_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_outcomes_aggr.csv' INTO TABLE test_annie.cache_outcomes_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.prtl_pbcs2;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_pbcs2.csv' INTO TABLE test_annie.prtl_pbcs2 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcs2_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcs2_params.csv' INTO TABLE test_annie.cache_pbcs2_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_pbcs2;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_pbcs2.csv' INTO TABLE test_annie.cache_qry_param_pbcs2 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_pbcs2_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_pbcs2_aggr.csv' INTO TABLE test_annie.cache_pbcs2_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.prtl_poc2ab;
LOAD DATA LOCAL INFILE 'path-to-files/prtl_poc2ab.csv' INTO TABLE test_annie.prtl_poc2ab FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_poc2ab_params;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc2ab_params.csv' INTO TABLE test_annie.cache_poc2ab_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

TRUNCATE test_annie.cache_qry_param_poc2ab;
LOAD DATA LOCAL INFILE 'path-to-files/cache_qry_param_poc2ab.csv' INTO TABLE test_annie.cache_qry_param_poc2ab FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


TRUNCATE test_annie.cache_poc2ab_aggr;
LOAD DATA LOCAL INFILE 'path-to-files/cache_poc2ab_aggr.csv' INTO TABLE test_annie.cache_poc2ab_aggr FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

