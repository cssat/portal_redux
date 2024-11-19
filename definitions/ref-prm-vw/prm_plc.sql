-- portal_redux.prm_plc source

CREATE  VIEW portal_redux.prm_plc AS 
select distinct flt.bin_placement_cd AS bin_placement_cd,flt.bin_placement_cd AS match_code
    from portal_redux.ref_filter_nbr_placement flt where (flt.bin_placement_cd <> 0) 
union select distinct zr.bin_placement_cd AS bin_placement_cd,flt.bin_placement_cd AS bin_placement_cd
    from portal_redux.ref_filter_nbr_placement flt ,ref_filter_nbr_placement zr
    where ((flt.bin_placement_cd <> 0) and (zr.bin_placement_cd = 0));