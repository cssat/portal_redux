-- create prm_rpt view

CREATE VIEW portal_redux.prm_rpt AS select flt.cd_reporter_type AS cd_reporter_type,flt.cd_reporter_type AS match_code from portal_redux.ref_filter_reporter_type flt where (flt.cd_reporter_type > 0) union select zr.cd_reporter_type AS cd_reporter_type,flt.cd_reporter_type AS cd_reporter_type from portal_redux.ref_filter_reporter_type flt , ref_filter_reporter_type zr
where ((flt.cd_reporter_type <> 0) and (zr.cd_reporter_type = 0));