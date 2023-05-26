-- create CALENDAR_DIM table

-- DROP TABLE portal_redux.CALENDAR_DIM;
CREATE TABLE portal_redux.CALENDAR_DIM (
	ID_CALENDAR_DIM int NOT NULL,
	CALENDAR_DATE datetime NULL,
	YEAR_YYYY int NULL,
	MONTH_MM int NULL,
	DAY_DD int NULL,
	DATE_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YEAR] datetime NULL,
	YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	QUARTER datetime NULL,
	QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MONTH] datetime NULL,
	MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WEEK datetime NULL,
	WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DAY_OF_YEAR int NULL,
	DAY_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DAY_OF_QUARTER int NULL,
	DAY_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DAY_OF_MONTH int NULL,
	DAY_OF_MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DAY_OF_WEEK int NULL,
	DAY_OF_WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WEEK_OF_YEAR int NULL,
	WEEK_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MONTH_OF_YEAR int NULL,
	MONTH_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MONTH_OF_QUARTER int NULL,
	MONTH_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	QUARTER_OF_YEAR int NULL,
	QUARTER_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_YEAR datetime NULL,
	FEDERAL_FISCAL_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_QUARTER datetime NULL,
	FEDERAL_FISCAL_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_MONTH datetime NULL,
	FEDERAL_FISCAL_MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_WEEK datetime NULL,
	FEDERAL_FISCAL_WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_DAY datetime NULL,
	FEDERAL_FISCAL_DAY_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_DAY_OF_YEAR int NULL,
	FEDERAL_FISCAL_DAY_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_DAY_OF_QUARTER int NULL,
	FEDERAL_FISCAL_DAY_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_DAY_OF_MONTH int NULL,
	FEDERAL_FISCAL_DAY_OF_MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_DAY_OF_WEEK int NULL,
	FEDERAL_FISCAL_DAY_OF_WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_WEEK_OF_YEAR int NULL,
	FEDERAL_FISCAL_WEEK_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_MONTH_OF_YEAR int NULL,
	FEDERAL_FISCAL_MONTH_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_MONTH_OF_QUARTER int NULL,
	FEDERAL_FISCAL_MONTH_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FEDERAL_FISCAL_QUARTER_OF_YEAR int NULL,
	FEDERAL_FISCAL_QUARTER_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_YEAR datetime NULL,
	STATE_FISCAL_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_QUARTER datetime NULL,
	STATE_FISCAL_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_MONTH datetime NULL,
	STATE_FISCAL_MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_WEEK datetime NULL,
	STATE_FISCAL_WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY datetime NULL,
	STATE_FISCAL_DAY_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY_OF_YEAR int NULL,
	STATE_FISCAL_DAY_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY_OF_QUARTER varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY_OF_MONTH int NULL,
	STATE_FISCAL_DAY_OF_MONTH_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_DAY_OF_WEEK int NULL,
	STATE_FISCAL_DAY_OF_WEEK_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_WEEK_OF_YEAR int NULL,
	STATE_FISCAL_WEEK_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_MONTH_OF_YEAR int NULL,
	STATE_FISCAL_MONTH_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_MONTH_OF_QUARTER int NULL,
	STATE_FISCAL_MONTH_OF_QUARTER_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_FISCAL_QUARTER_OF_YEAR int NULL,
	STATE_FISCAL_QUARTER_OF_YEAR_NAME varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	STATE_HOLIDAY_FLAG varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WORKDAY_FLAG varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DST_FLAG varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DT_ROW_BEGIN datetime NULL,
	DT_ROW_END datetime NULL,
	ID_CYCLE int NULL,
	IS_CURRENT int NULL,
	MONTH_END_FLAG char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CALENDAR_DATE_YYYY_MM_DD char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CALENDAR_DATE_MM_DD_YYYY char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	LASTOFMONTH datetime NULL,
	CASEMONTH int NULL,
	MONTH_TEXT varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MONTH_TEXT_ABBR char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	YEAR_MONTH int NULL,
	FIRST_OF_MONTH datetime NULL,
	FEDERAL_FISCAL_YYYY int NULL,
	STATE_FISCAL_YYYY int NULL,
	CONSTRAINT pk_ID_CALENDAR_DIM PRIMARY KEY (ID_CALENDAR_DIM)
);
CREATE NONCLUSTERED INDEX idx_1238hasd ON portal_redux.CALENDAR_DIM (  MONTH ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_calendar_dim ON portal_redux.CALENDAR_DIM (  CALENDAR_DATE ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_fy_calendar_date ON portal_redux.CALENDAR_DIM (  STATE_FISCAL_YYYY ASC  )  
	INCLUDE ( CALENDAR_DATE ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_month_calendar_date_calendar_dim ON portal_redux.CALENDAR_DIM (  CALENDAR_DATE ASC  )  
	INCLUDE ( MONTH ) 
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];
CREATE NONCLUSTERED INDEX idx_state_fiscal_year ON portal_redux.CALENDAR_DIM (  STATE_FISCAL_YEAR ASC  )  
	WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	ON [PRIMARY];

-- load table data

BULK INSERT portal_redux.CALENDAR_DIM
FROM 'D:\S3\fldw-in\CALENDAR_DIM.txt'
WITH (
    firstrow = 2,
    fieldterminator = '|',
    rowterminator = '\n'
);