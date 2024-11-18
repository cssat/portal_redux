# portal_redux

## background

Every quarter, DCYF tranfers data to CSSAT to use for analytics. Through the processing of this data, identifying information is filtered out to provide allow safe use of the data.

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
|	|	| -- process-data
|	|	| -- upload-data
|	| -- sp-measures
```

`base-tables` - tables that are provided by DCYF

`exec-tables` - tables that are used to process data

`functions` - functions essential to processing

`procedures` - procedures essential to processing

`ref-prm-vw` - referencial tables and views, including metadata

`process-data` - contains series of scripts that reference a number of procedures at once. use these scripts to process data

`upload-data` - contains scripts to add new datasets to database. also contains bulk loads to load tables with said data

`sp-measures` - contains procedures that produce measure results

## how to upload data

This database is hosted on AWS RDS **legacy-ca-ods** . RDS contains a D: drive to store files, and files can be uploaded to the D: drive by first uploading unzipped files to the AWS S3 that has access to CA_ODS: **dcyf-fldw-in**. There are also zipped datasets from past quarters stored in the S3 bucket **dcyf-data-extracts**, so be sure to upload zipped files there as well.

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
