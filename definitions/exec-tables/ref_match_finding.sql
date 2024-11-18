-- recreate ref_match_finding table
DROP TABLE IF EXISTS portal_redux.ref_match_finding;
CREATE TABLE portal_redux.ref_match_finding (
	filter_finding				DECIMAL(18,0)	NULL,
	fl_founded_phys_abuse		INT				NULL,
	fl_founded_sexual_abuse		INT				NULL,
	fl_founded_neglect			INT				NULL,
	fl_any_finding_legal		INT				NULL,
	cd_finding					INT				NULL
);
