-- recreate ref_last_month_qtr_yr table

DROP TABLE IF EXISTS portal_redux.ref_last_month_qtr_yr;
CREATE TABLE portal_redux.ref_last_month_qtr_yr (
	date_type int NOT NULL,
	end_date datetime NULL,
	CONSTRAINT pk_ref_last_month_qtr_yr PRIMARY KEY (date_type)
);
