-- create prm_nondcfs_custody view

create view [portal_redux].prm_nondcfs_custody
as 
select 0 match_code,1 excludes_nondcfs
union
select 0,0
union
select 1,0;