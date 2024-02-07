ALTER TABLE portal_redux.PEOPLE_DIM
ADD cd_race_census INT,
	tx_race_census VARCHAR(200),
	census_hispanic_latino_origin_cd INT;


update portal_redux.people_dim
set cd_race_census=cd_race
	,tx_race_census=tx_race
where ((cd_race_two is null 
			and cd_race_three is null 
			and cd_race_four is null 
			and cd_race_five is null)
	OR
		(isnull(cd_race_two,cd_race)=cd_race and isnull(cd_race_three,cd_race)=cd_race
			and isnull(cd_race_four,cd_race)=cd_race
			and isnull(cd_race_five,cd_race)=cd_race))
and isnull(cd_race,10) between 1 and 5;


--Hispanic counting as some other for census
update portal_redux.people_dim
set cd_race_census=6,census_Hispanic_Latino_Origin_cd=1
where (isnull(cd_race,10)=8 ) and ISNULL(CD_HSPNC,'N')='Y';


update portal_redux.people_dim
set cd_race_census=8
--select * from people_dim
where isnull(cd_race,10)<>isnull(cd_race_two,10)
and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
and isnull(cd_race_two,10) between 1 and 5;


update portal_redux.people_dim
set cd_race_census=8
--select * from people_dim
where  isnull(cd_race_three,10)<>isnull(cd_race,10)
and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
and isnull(cd_race_three,10) between 1 and 5;


update portal_redux.people_dim
set cd_race_census=8
--select * from people_dim
where  isnull(cd_race_four,10)<>isnull(cd_race,10)
and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
and isnull(cd_race_four,10) between 1 and 5;


update portal_redux.people_dim
set cd_race_census=8
--select * from people_dim
where  isnull(cd_race_five,10)<>isnull(cd_race,10)
and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
and isnull(cd_race_five,10) between 1 and 5;


update portal_redux.people_dim
set cd_race_census=7
where cd_race_census is null;

update portal_redux.people_dim
set census_Hispanic_Latino_Origin_cd=1
where rtrim(ltrim(isnull(CD_HSPNC,'N')))='Y';

update portal_redux.people_dim
set census_Hispanic_Latino_Origin_cd=2
where isnull(CD_RACE,10) in (1,2,3,4,5) and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);


update portal_redux.people_dim
set census_Hispanic_Latino_Origin_cd=3
--where isnull(CD_RACE,10) = 5 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);
where isnull(CD_RACE_CENSUS,10)=5 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);

update portal_redux.people_dim
set census_Hispanic_Latino_Origin_cd=4
--where isnull(CD_RACE,10) = 5 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);
where isnull(CD_RACE_CENSUS,10)=3 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);

update portal_redux.people_dim
set census_Hispanic_Latino_Origin_cd=2
where census_Hispanic_Latino_Origin_cd is null;

update portal_redux.people_dim
set tx_race_census=lu.tx_race_census
from portal_redux.ref_lookup_ethnicity_census lu 
where  lu.cd_race_census=people_dim.cd_race_census;



--select pd.cd_race_census,pd.tx_race_census,count(distinct tce.id_removal_episode_fact) as tce_cnt
--from tbl_child_episodes tce join people_dim pd on tce.ID_PEOPLE_DIM_CHILD=pd.id_people_dim
--group by pd.cd_race_census,pd.tx_race_census



update statistics portal_redux.people_dim;