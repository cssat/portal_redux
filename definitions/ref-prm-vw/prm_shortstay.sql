-- create prm_shortstay view

create view portal_redux.prm_shortstay
as 
select 0 match_code,1 excludes_7day
union
select 0,0
union
select 1,0;