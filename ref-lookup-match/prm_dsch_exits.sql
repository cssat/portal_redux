-- portal_redux.prm_dsch_exits source

create  view  portal_redux.prm_dsch_exits
as
	select distinct cd_discharge_type,cd_discharge_type [match_code]
	from portal_redux.ref_state_discharge_xwalk
	where cd_discharge_type <> 0
	union 
	select distinct 0,cd_discharge_type
	from portal_redux.ref_state_discharge_xwalk
	where cd_discharge_type <> 0;
