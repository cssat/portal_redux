-- create ASSIGNMENT_FACT table

-- DROP TABLE portal_redux.ASSIGNMENT_FACT;
CREATE TABLE portal_redux.ASSIGNMENT_FACT (
	ID_ASSIGNMENT_FACT int NOT NULL,
	ID_ASGN int NULL,
	ID_INTAKE_FACT int NULL,
	ID_ASSIGNMENT_ATTRIBUTE_DIM int NULL,
	ID_CALENDAR_DIM_BEGIN int NULL,
	ID_CALENDAR_DIM_END int NULL,
	ID_CASE_DIM int NULL,
	ID_LOCATION_DIM int NULL,
	ID_PEOPLE_DIM int NULL,
	ID_PROVIDER_DIM int NULL,
	ID_WORKER_DIM int NULL,
	FL_EXPUNGED char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ID_CASE int NULL,
	ID_PRSN int NULL,
	ID_PRVD_ORG int NULL,
	CONSTRAINT PK_ID_ASSIGNMENT_FACT PRIMARY KEY (ID_ASSIGNMENT_FACT),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_ASSIGNMENT_ATTRIBUTE_DIM FOREIGN KEY (ID_ASSIGNMENT_ATTRIBUTE_DIM) REFERENCES portal_redux.ASSIGNMENT_ATTRIBUTE_DIM(ID_ASSIGNMENT_ATTRIBUTE_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_CALENDAR_DIM_BEGIN FOREIGN KEY (ID_CALENDAR_DIM_BEGIN) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_CALENDAR_DIM_END FOREIGN KEY (ID_CALENDAR_DIM_END) REFERENCES portal_redux.CALENDAR_DIM(ID_CALENDAR_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_CASE_DIM FOREIGN KEY (ID_CASE_DIM) REFERENCES portal_redux.CASE_DIM(ID_CASE_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_LOCATION_DIM FOREIGN KEY (ID_LOCATION_DIM) REFERENCES portal_redux.LOCATION_DIM(ID_LOCATION_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_PEOPLE_DIM FOREIGN KEY (ID_PEOPLE_DIM) REFERENCES portal_redux.PEOPLE_DIM(ID_PEOPLE_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_PROVIDER_DIM FOREIGN KEY (ID_PROVIDER_DIM) REFERENCES portal_redux.PROVIDER_DIM(ID_PROVIDER_DIM),
	CONSTRAINT fk_ASSIGNMENT_FACT_ID_WORKER_DIM FOREIGN KEY (ID_WORKER_DIM) REFERENCES portal_redux.WORKER_DIM(ID_WORKER_DIM)
);
CREATE NONCLUSTERED INDEX NonClusteredIndex_20140603_133409 ON portal_redux.ASSIGNMENT_FACT (  ID_CALENDAR_DIM_BEGIN ASC  , ID_CASE ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_asf_case_worker_begin_inc_fact_dim_end ON portal_redux.ASSIGNMENT_FACT (  ID_WORKER_DIM ASC  , ID_CASE ASC  , ID_CALENDAR_DIM_BEGIN ASC  )  
	INCLUDE ( ID_ASSIGNMENT_ATTRIBUTE_DIM , ID_ASSIGNMENT_FACT , ID_CALENDAR_DIM_END ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_id_case_id_calendar_dim_begin_aad ON portal_redux.ASSIGNMENT_FACT (  ID_CASE ASC  )  
	INCLUDE ( ID_ASSIGNMENT_ATTRIBUTE_DIM , ID_ASSIGNMENT_FACT , ID_CALENDAR_DIM_BEGIN ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_workder_dim_id_prsn_id_calendar_dim_begin ON portal_redux.ASSIGNMENT_FACT (  ID_PRSN ASC  )  
	INCLUDE ( ID_CALENDAR_DIM_BEGIN , ID_CALENDAR_DIM_END , ID_WORKER_DIM ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];

-- load table data

BULK INSERT portal_redux.ASSIGNMENT_FACT
FROM 'D:\S3\fldw-in\ASSIGNMENT_FACT.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);