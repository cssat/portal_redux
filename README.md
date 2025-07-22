# portal_redux

## background

Every quarter, DCYF shares data with CSSAT to use for analytics. Through the processing of this data, identifying information is filtered out to provide allow safe use of the data.

## file structure

```
| -- root
|	| -- definitions
|	|	| -- base-tables
|	|	| -- exec-tables
|	|	| -- functions
|	|	| -- procedures
|	|	| -- ref-prm-vw
|	| -- scripts
|   |   | -- annie
|	|	| -- process-data
|	|	| -- upload-data
|	| -- sp-measures
```

`base-tables` - tables that are provided by DCYF

`exec-tables` - tables that are used to process data

`functions` - functions essential to processing

`procedures` - procedures essential to processing

`ref-prm-vw` - referencial tables and views, including metadata

`annie` - contains scripts to be run on the annie database. they load data into annie, copy tables to other schemas, populate cache tables

`process-data` - contains series of scripts that reference a number of procedures at once. use these scripts to process data

`upload-data` - contains scripts to add new datasets to database. also contains bulk loads to load tables with said data

`sp-measures` - contains procedures that produce measure results

## how to upload data

This database is hosted on AWS RDS **legacy-ca-ods** . RDS instances contain a D: drive to store files, and files can be uploaded to the D: drive by first uploading unzipped files to the AWS S3 that has access to CA_ODS: **dcyf-fldw-in**. There are also zipped datasets from past quarters stored in the S3 bucket **dcyf-data-extracts**, so be sure to upload zipped files there as well.

Here is the run order for files in `upload-data`:

1. `load_from_s3` - load data from S3 to D: drive (be sure to find all replace all to make sure the data is being pulled from the correct S3 folder)
1. `drop_constraints` - drops constraints and rows added during previous processing
1. `load_base_data` - bulk loads data from D: drive into base tables
1. `add-constraints` - adds constraints and rows to be filled during processing
1. `update_last_dw_transfer` use script to update the cutoff_date to the date of the last datawarehouse transfer (cutoff_date is used in most subsequent procedures, so this step is very important)

## how to process data

Once the data is loaded into their base tables, and the cuttoff_date has been adjusted, then the processing procedures are ready to run. There are 47 procedures grouped in six scripts. A few of these procedures may take a while to run (longer runtimes are noted).

Here is the run order for files in `process-data`:

1. `build_tbl_intake_ihs`
1. `build_placement_episode`
1. `build_match`
1. `build_prtl`
1. `build_cache`
1. `build_rate`

## important tables

Some tables are important when dealing with bugs or errors, and some monitor the progress processing data. Here are a few:

1. `ref_last_dw_transfer` - contains the manually set cutoff_date that is referenced in subsequent procedures
1. `procedure_flow` - contains execution order for procedures as well as datetime when the procedure was last ran (not all procedures are listed)
1. `prtl_tables_last_update` - contains metadata about tables like last build date
and row count (not all tables are listed)

## list of procedures

Here is a list of all procedures involved in sequential run order

| run order | procedure name |
| --------- | -------------- |
| 1 | load_update_people_dim_cd_race_census |
| 2 | prod_update_rptPlacement_after_CA_LOAD |
| 3 | prod_build_tbl_case_dim |
| 4 | prod_build_tbl_intakes |
| 5 | prod_update_rptPlacement_with_intakes |
| 6 | prod_update_tbl_intakes |
| 7 | prod_build_tbl_intake_grouper |
| 8 | prod_build_tbls_ihs_episode_services |
| 9 | prod_update_tbl_intakes_after_ihs |
| 10 | prod_update_rptPlacement_after_ihs |
| 11 | prod_build_WRK_NonDCFS |
| 12 | prod_build_WRK_TRHEvents |
| 13 | prod_build_placement_payment_services |
| 14 | prod_build_episode_payment_services |
| 15 | prod_build_placement_care_days_mobility |
| 16 | prod_build_episode_care_days |
| 17 | prod_update_rptPlacement_after_basetables |
| 18 | prod_update_ref_last_month_qtr_yr |
| 19 | prod_build_match_allegation |
| 20 | prod_build_match_finding |
| 21 | prod_build_match_srvc_type_category |
| 22 | prod_build_match_srvc_type_budget |
| 23 | prod_build_ooh_dcfs_eps |
| 24 | prod_build_ooh_point_in_time_child |
| 25 | prod_build_prtl_outcomes |
| 26 | prod_build_prtl_pbcp5 |
| 27 | prod_build_prtl_pbcs2 |
| 28 | prod_build_prtl_pbcs3 |
| 29 | prod_build_ooh_point_in_time_measures |
| 30 | prod_build_prtl_poc1ab_entries_exits |
| 31 | prod_build_prtl_poc2ab |
| 32 | prod_build_prtl_poc3ab |
| 33 | prod_sp_update_ref_lookup_max_date |
| 34 | prod_build_cache_ooh_tables |
| 35 | prod_build_cache_pbcs2_aggr |
| 36 | prod_build_cache_pbcs3_aggr |
| 37 | prod_build_cache_poc2ab_aggr |
| 38 | prod_build_cache_poc3ab_aggr |
| 39 | prod_build_rate_care_day_maltreatment |
| 40 | prod_build_rate_referrals |
| 41 | prod_build_rate_referrals_screened_in |
| 42 | prod_build_rate_placement |
| 43 | prod_build_rate_placement_order_specific |
| 44 | prod_build_rate_referrals_order_specific |
| 45 | prod_build_rate_referrals_screened_in_order_specific |
| 46 | insert_ref_service_category_flag_xwalk |

# annie

This repo also contains scripts for annie including load scripts, transfer scripts, and data population scripts.

Currently the data transfer between ca_ods and annie is handled locally, but it will be hosted through AWS after more development.

Below is a list of tables that are essential for the current measures:

| table name |
| ---------- |
| ref_last_dw_transfer |
| ref_lookup_max_date |
| ooh_point_in_time_measures |
| prtl_outcomes |
| prtl_poc1ab_entries | 
| prtl_poc1ab_exits | 
| prtl_poc2ab |
| prtl_pbcs2 |
| prtl_pbcp5 |
| cache_outcomes_params |
| cache_poc1ab_params |
| cache_poc1ab_entries_params |
| cache_poc1ab_exits_params |
| cache_poc2ab_params |
| cache_pbcs2_params |
| cache_pbcw3_params |
| cache_pbcw4_params |
| cache_pcbp5_params |
| cache_qry_param_outcomes |
| cache_qry_param_poc1ab |
| cache_qry_param_poc1ab_entries |
| cache_qry_param_poc1ab_exits |
| cache_qry_param_poc2ab |
| cache_qry_param_pbcs2 |
| cache_qry_param_pbcw3 |
| cache_qry_param_pbcw4 |
| cache_qry_param_pcbp5 |
| cache_outcomes_aggr |
| cache_poc1ab_aggr |
| cache_poc1ab_entries_aggr |
| cache_poc1ab_exits_aggr |
| cache_poc2ab_aggr |
| cache_pbcs2_aggr |
| cache_pbcw3_aggr |
| cache_pbcw4_aggr |
| cache_pbcp5_aggr |
