-- create procedure_flow table

-- DROP TABLE portal_redux.procedure_flow;
CREATE TABLE portal_redux.procedure_flow (
	ikey int IDENTITY(1,1) NOT NULL,
	execute_order int NULL,
	procedure_nm varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	last_run_date datetime NULL
);