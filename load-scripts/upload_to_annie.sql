LOAD DATA LOCAL INFILE 'C:\\Users\\Administrator\\Documents\\data-in\\cache_outcomes_params.csv' INTO TABLE test_annie.cache_outcomes_params FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (qry_ID,age_grouping_cd,cd_race_census,pk_gndr,init_cd_plcm_setng,long_cd_plcm_setng,county_cd,bin_los_cd,bin_placement_cd,bin_ihs_svc_cd,cd_reporter_type,filter_access_type,filter_allegation,filter_finding,bin_dep_cd,min_start_date,max_start_date,cnt_qry,last_run_date);