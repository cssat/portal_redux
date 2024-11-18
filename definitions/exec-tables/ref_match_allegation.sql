-- recreate ref_match_allegation table
DROP TABLE IF EXISTS portal_redux.ref_match_allegation;
CREATE TABLE portal_redux.ref_match_allegation (
	cd_allegation			INT			NOT NULL,
	filter_allegation		INT			NOT NULL,
	fl_phys_abuse			INT			NULL,
	fl_sexual_abuse			INT			NULL,
	fl_neglect				INT			NULL,
	fl_any_legal			INT			NULL,
	CONSTRAINT pk_ref_match_allegation PRIMARY KEY (filter_allegation, cd_allegation)
);
