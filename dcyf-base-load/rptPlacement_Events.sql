-- create rptPlacement_Events table

-- DROP TABLE portal_redux.rptPlacement_Events;
CREATE TABLE portal_redux.rptPlacement_Events (
	[row] int NOT NULL,
	id_removal_episode_fact int NULL,
	rmvl_seq int NULL,
	child int NOT NULL,
	birthdate datetime NULL,
	tx_gndr varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bday int NULL,
	tx_braam_race varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_multirace varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_case int NULL,
	tx_region varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	worker_region varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	worker_office varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	worker_unit varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	episode_los int NULL,
	episode_los_grp varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	removal_dt datetime NULL,
	removal_year datetime NULL,
	removal_sfy_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	removal_cy_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	discharge_dt datetime NULL,
	discharge_year datetime NULL,
	discharge_sfy_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	discharge_cy_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	exit_reason varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	last_pca varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	last_lgl_stat varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_epsd int NOT NULL,
	id_prvd_org_caregiver int NULL,
	id_bsns int NULL,
	tx_provider_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	current_prvd_status varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	id_ssps int NULL,
	id_calendar_dim_begin int NULL,
	id_calendar_dim_end int NULL,
	age_plcm_begin int NULL,
	begin_date datetime NOT NULL,
	begin_year datetime NULL,
	begin_year_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	begin_state_fiscal_year_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	begin_month datetime NULL,
	begin_month_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	end_date datetime NULL,
	end_year datetime NULL,
	end_year_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	end_state_fiscal_year_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	end_month datetime NULL,
	end_month_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	age_plcm_end int NULL,
	plcmnt_days int NULL,
	tx_plcm_setng varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_srvc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_srvc_ctgry varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_subctgry varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_end_rsn varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	plcmnt_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	post_brs int NULL,
	brs_id int NULL,
	brs_nm varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_bsns varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_srvc varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_srvc_ctgry varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_subctgry varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_plcm_setng varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	brs_plcmnt_days int NULL,
	days_from_rmvl int NULL,
	days_to_dsch int NULL,
	plcmnt_seq int NULL,
	days_to_dsch_grp varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	days_from_rmvl_grp varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_plcm_setng int NULL,
	rundate datetime NULL,
	primary_plan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	alt_plan varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tx_multi_race_ethnicity varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cd_multi_race_ethnicity int NULL,
	removal_qtr datetime NULL,
	discharge_qtr datetime NULL
);
CREATE NONCLUSTERED INDEX id_removal_episode_fact_id_placement_fact_Incl_begin_date_end_date ON portal_redux.rptPlacement_Events (  id_removal_episode_fact ASC  , id_placement_fact ASC  , begin_date ASC  )  
	INCLUDE ( end_date ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_BGDKSO2 ON portal_redux.rptPlacement_Events (  id_removal_episode_fact ASC  )  
	INCLUDE ( begin_date , cd_plcm_setng , cd_plcmnt_evnt , end_date , id_calendar_dim_end , id_placement_fact , id_plcmnt_evnt , id_provider_dim_caregiver , tx_plcm_setng ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_cd_end_rsn_rptPlacement_Events ON portal_redux.rptPlacement_Events (  cd_end_rsn ASC  )  
	INCLUDE ( birthdate , discharge_dt , id_placement_fact , id_removal_episode_fact , removal_dt ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_child_id_epsd_begin_date ON portal_redux.rptPlacement_Events (  child ASC  , id_epsd ASC  , begin_date ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_for_trh_rptPlacement_Events ON portal_redux.rptPlacement_Events (  cd_epsd_type ASC  , id_prvd_org_caregiver ASC  )  
	INCLUDE ( begin_date , cd_end_rsn , end_date , id_case , id_placement_fact , id_removal_episode_fact , tx_end_rsn ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_removal_episode_fact_begin_Date_incl_cnty ON portal_redux.rptPlacement_Events (  id_removal_episode_fact ASC  , begin_date ASC  )  
	INCLUDE ( derived_county , id_placement_fact ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_removal_episode_fact_incl_6 ON portal_redux.rptPlacement_Events (  id_removal_episode_fact ASC  )  
	INCLUDE ( begin_date , cd_plcm_setng , cd_plcmnt_evnt , end_date , id_plcmnt_evnt , id_provider_dim_caregiver , tx_plcm_setng ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_poc1ab_1 ON portal_redux.rptPlacement_Events (  id_removal_episode_fact ASC  , begin_date ASC  , end_date ASC  )  
	INCLUDE ( derived_county , id_placement_fact ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_poc1ab_2 ON portal_redux.rptPlacement_Events (  id_placement_fact ASC  )  
	INCLUDE ( derived_county ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];

-- load table data

BULK INSERT portal_redux.rptPlacement_Events
FROM 'D:\S3\fldw-in\rptPlacement_Events.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);
