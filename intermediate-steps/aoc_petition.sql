-- create aoc_petition table

-- DROP TABLE portal_redux.aoc_petition;
CREATE TABLE portal_redux.aoc_petition (
	FAMLINKID float NULL,
	Court_Name varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Petition_date datetime NULL,
	Petition varchar(244) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);