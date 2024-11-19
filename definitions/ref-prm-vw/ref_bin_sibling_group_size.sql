-- portal_redux.ref_bin_sibling_group_size source

create view portal_redux.ref_bin_sibling_group_size
  as 
  select distinct bin_sibling_group_size,nbr_sibling_desc from portal_redux.prm_sib;