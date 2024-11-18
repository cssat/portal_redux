-- load_update_people_dim_cd_race_census definition 

-- EXEC portal_redux.load_update_people_dim_cd_race_census;
-- DROP PROCEDURE IF EXISTS portal_redux.load_update_people_dim_cd_race_census;
CREATE PROCEDURE portal_redux.load_update_people_dim_cd_race_census
AS

BEGIN
    UPDATE portal_redux.people_dim
    SET cd_race_census=cd_race
        ,tx_race_census=tx_race
    WHERE (
        (cd_race_two is null 
            and cd_race_three is null 
            and cd_race_four is null 
            and cd_race_five is null)
        OR
        (isnull(cd_race_two,cd_race)=cd_race and isnull(cd_race_three,cd_race)=cd_race
            and isnull(cd_race_four,cd_race)=cd_race
            and isnull(cd_race_five,cd_race)=cd_race))
    and isnull(cd_race,10) between 1 and 5;


    --hispanic counting as some other for census
    UPDATE portal_redux.people_dim
    SET cd_race_census=6,census_Hispanic_Latino_Origin_cd=1
    WHERE (isnull(cd_race,10)=8 ) and ISNULL(CD_HSPNC,'N')='Y';


    UPDATE portal_redux.people_dim
    SET cd_race_census=8
    WHERE isnull(cd_race,10)<>isnull(cd_race_two,10)
    and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
    and isnull(cd_race_two,10) between 1 and 5;


    UPDATE portal_redux.people_dim
    SET cd_race_census=8
    WHERE  isnull(cd_race_three,10)<>isnull(cd_race,10)
    and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
    and isnull(cd_race_three,10) between 1 and 5;


    UPDATE portal_redux.people_dim
    SET cd_race_census=8
    WHERE  isnull(cd_race_four,10)<>isnull(cd_race,10)
    and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
    and isnull(cd_race_four,10) between 1 and 5;


    UPDATE portal_redux.people_dim
    SET cd_race_census=8
    WHERE  isnull(cd_race_five,10)<>isnull(cd_race,10)
    and (isnull(cd_race,10) between 1 and 5 ) and cd_race_census is null
    and isnull(cd_race_five,10) between 1 and 5;


    UPDATE portal_redux.people_dim
    SET cd_race_census=7
    WHERE cd_race_census is null;

    UPDATE portal_redux.people_dim
    SET census_Hispanic_Latino_Origin_cd=1
    WHERE rtrim(ltrim(isnull(CD_HSPNC,'N')))='Y';

    UPDATE portal_redux.people_dim
    SET census_Hispanic_Latino_Origin_cd=2
    WHERE isnull(CD_RACE,10) in (1,2,3,4,5) and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);


    UPDATE portal_redux.people_dim
    SET census_Hispanic_Latino_Origin_cd=3
    WHERE isnull(CD_RACE_CENSUS,10)=5 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);

    UPDATE portal_redux.people_dim
    SET census_Hispanic_Latino_Origin_cd=4
    WHERE isnull(CD_RACE_CENSUS,10)=3 and  (charindex('Y',rtrim(ltrim(isnull(CD_HSPNC,'N'))),1)=0);

    UPDATE portal_redux.people_dim
    SET census_Hispanic_Latino_Origin_cd=2
    WHERE census_Hispanic_Latino_Origin_cd is null;

    UPDATE portal_redux.people_dim
    SET tx_race_census=lu.tx_race_census
    from portal_redux.ref_lookup_ethnicity_census lu
    WHERE  lu.cd_race_census=people_dim.cd_race_census;


    UPDATE statistics portal_redux.people_dim;
END;
