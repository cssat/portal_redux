-- create match_finding table

-- DROP TABLE portal_redux.match_finding;
CREATE TABLE portal_redux.match_finding (
    filter_finding INT NOT NULL,
    fl_founded_phys_abuse INT NULL,
    fl_founded_sexual_abuse INT NULL,
    fl_founded_neglect INT NULL,
    fl_any_finding_legal INT NULL,
    cd_finding INT NOT NULL 
        CONSTRAINT fk_match_finding_cd_finding FOREIGN KEY REFERENCES portal_redux.ref_filter_finding(cd_finding),
)
GO

CREATE NONCLUSTERED INDEX [idx_match_finding_code] ON portal_redux.[match_finding] (
	[cd_finding]
	) INCLUDE (
	[filter_finding]
	)
GO

CREATE NONCLUSTERED INDEX [idx_match_finding_match] ON portal_redux.[match_finding] (
	[filter_finding]
	) INCLUDE (
	[cd_finding]
	)
GO