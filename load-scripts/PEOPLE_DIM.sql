-- create PEOPLE_DIM table

-- DROP TABLE portal_redux.PEOPLE_DIM;
CREATE TABLE portal_redux.PEOPLE_DIM (
	ID_PEOPLE_DIM int NOT NULL,
	ID_PRSN int NULL,
	ID_ACES int NULL,
	ID_WORKER_DIM_SSI_SSA_UPDATE int NULL,
	TX_BRAAM_RACE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CMBN_ETHN int NULL,
	TX_CMBN_ETHN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_CTZN int NULL,
	TX_CTZN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_GNDR char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_GNDR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_HSPNC char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_HSPNC varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INDN int NULL,
	TX_INDN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_INDN2 int NULL,
	TX_INDN2 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LICWAC int NULL,
	TX_LICWAC varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LNG_PRFR int NULL,
	TX_LNG_PRFR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LNG_SECONDARY int NULL,
	TX_LNG_SECONDARY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_LTD_ENGLISH int NULL,
	TX_LTD_ENGLISH varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MRTL_STAT int NULL,
	TX_MRTL_STAT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_MULTIRACE varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_PRNTL_RLTNSHP int NULL,
	TX_PRNTL_RLTNSHP varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RACE int NULL,
	TX_RACE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RACE_FIVE int NULL,
	TX_RACE_FIVE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RACE_FOUR int NULL,
	TX_RACE_FOUR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RACE_THREE int NULL,
	TX_RACE_THREE varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RACE_TWO int NULL,
	TX_RACE_TWO varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RLGN int NULL,
	TX_RLGN varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SSI_SSA_STATUS int NULL,
	TX_SSI_SSA_STATUS varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_STATE_RSDNT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TX_STATE_RSDNT varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_ADOPTION_MATCH char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_DANGER_TO_WORKER char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_DECEASED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_DT_BIRTH_ESTIMATED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_ICW_INVOLVEMENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PHYS_DISABLED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PRSN_MALTREATER char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_SEX_AGGRESIVE_YOUTH char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_TEEN_PARENT char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_VIS_HEARING_IMPR char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_BIRTH datetime NULL,
	DT_DEATH datetime NULL,
	DT_LICWAC_DETERMINATION datetime NULL,
	MULTI_RACE_MASK int NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	FL_DELETED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_MNTAL_RETARDATN char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_EMOTION_DSTRBD char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_OTHR_SPC_CARE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PHYSICAL_AGGRSVE_YOUTH char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_REG_SEX_OFFENDER_LEVEL int NULL,
	TX_REG_SEX_OFFENDER_LEVEL varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_SEXUAL_BEHAVIOR int NULL,
	TX_SEXUAL_BEHAVIOR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_RISKY_BEHAVIOR int NULL,
	TX_RISKY_BEHAVIOR varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_LITIGATION_HOLD char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FL_PUBLIC_DISCLOSURE char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_PRSN_MOM int NULL,
	ID_PRSN_DAD int NULL,
	ID_PEOPLE_DIM_MOM int NULL,
	ID_PEOPLE_DIM_DAD int NULL,
	FL_PATERNITY_STATUS_KNOWN char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CD_MULTI_RACE_ETHNICITY int NULL,
	TX_MULTI_RACE_ETHNICITY varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT pk_ID_PEOPLE_DIM PRIMARY KEY (ID_PEOPLE_DIM),
	CONSTRAINT fk_PEOPLE_DIM_ID_WORKER_DIM_SSI_SSA_UPDATE FOREIGN KEY (ID_WORKER_DIM_SSI_SSA_UPDATE) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM)
);
CREATE NONCLUSTERED INDEX idx_dt_birth ON portal_redux.PEOPLE_DIM (  DT_BIRTH ASC  )  
	INCLUDE ( CD_MRTL_STAT , ID_PRSN , TX_MRTL_STAT ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_people_dim_dad ON portal_redux.PEOPLE_DIM (  ID_PEOPLE_DIM_DAD ASC  )  
	INCLUDE ( ID_PEOPLE_DIM , ID_PRSN , ID_PRSN_DAD ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_people_dim_mom ON portal_redux.PEOPLE_DIM (  ID_PEOPLE_DIM_MOM ASC  )  
	INCLUDE ( ID_PEOPLE_DIM , ID_PRSN , ID_PRSN_MOM ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_prsn ON portal_redux.PEOPLE_DIM (  ID_PRSN ASC  , CD_GNDR ASC  , IS_CURRENT ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];

-- load table data

BULK INSERT portal_redux.PEOPLE_DIM
FROM 'D:\S3\fldw-in\PEOPLE_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);