-- create ref_filter_ihs_services table

-- DROP TABLE portal_redux.ref_filter_ihs_services;
CREATE TABLE portal_redux.ref_filter_ihs_services (
	bin_ihs_svc_cd int NOT NULL,
	bin_ihs_svc_tx varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	min_display_date datetime NULL,
	CONSTRAINT PK_ref_filter_ihs_services PRIMARY KEY (bin_ihs_svc_cd)
);