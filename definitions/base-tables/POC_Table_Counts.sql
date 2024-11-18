-- create POC_Table_Counts table

DROP TABLE IF EXISTS portal_redux.POC_Table_Counts;
CREATE TABLE portal_redux.POC_Table_Counts (
	TableName varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TableCount int NULL
);