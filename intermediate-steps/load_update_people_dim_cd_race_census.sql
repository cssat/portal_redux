-- update people_dim table after initial load


UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = cd_race,
	tx_race_census = tx_race
WHERE ((cd_race_two IS NULL
	AND cd_race_three IS NULL
	AND cd_race_four IS NULL 
	AND cd_race_five IS NULL)
	OR (isnull (cd_race_two, cd_race) = cd_race 
		AND isnull(cd_race_three,cd_race)=cd_race
		AND isnull(cd_race_four,cd_race)=cd_race
		AND isnull(cd_race_five,cd_race)=cd_race))
	AND isnull(cd_race,10) BETWEEN 1 AND 5;



--Hispanic counting as some other for census
UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = 6, census_Hispanic_Latino_Origin_cd = 1
WHERE (isnull(cd_race, 10) = 8) AND ISNULL(CD_HSPNC, 'N') = 'Y';



UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = 8
WHERE isnull(cd_race, 10) <> isnull(cd_race_two, 10)
AND (isnull(cd_race, 10) BETWEEN 1 AND 5) AND cd_race_census IS NULL
AND isnull(cd_race_two, 10) BETWEEN 1 AND 5;



UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = 8
WHERE isnull(cd_race_three, 10) <> isnull(cd_race, 10)
AND (isnull(cd_race, 10) BETWEEN 1 AND 5) AND cd_race_census IS NULL
AND isnull(cd_race_three, 10) BETWEEN 1 AND 5;



UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = 8
WHERE isnull(cd_race_four, 10) <> isnull(cd_race, 10)
AND (isnull(cd_race, 10) BETWEEN 1 AND 5) AND cd_race_census IS NULL
AND isnull(cd_race_four, 10) BETWEEN 1 AND 5;



UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census=8
WHERE isnull(cd_race_five, 10) <> isnull(cd_race, 10)
AND (isnull(cd_race, 10) BETWEEN 1 AND 5) AND cd_race_census IS NULL
AND isnull(cd_race_five, 10) BETWEEN 1 AND 5;



UPDATE portal_redux.PEOPLE_DIM
SET cd_race_census = 7
WHERE cd_race_census is null;

UPDATE portal_redux.PEOPLE_DIM
SET census_Hispanic_Latino_Origin_cd = 1
WHERE rtrim(ltrim(isnull(CD_HSPNC, 'N'))) = 'Y';

UPDATE portal_redux.PEOPLE_DIM
SET census_Hispanic_Latino_Origin_cd = 2
WHERE isnull(CD_RACE, 10) IN (1, 2, 3, 4, 5) AND (charindex('Y', rtrim(ltrim(isnull(CD_HSPNC, 'N'))), 1) = 0);

UPDATE portal_redux.PEOPLE_DIM
SET census_Hispanic_Latino_Origin_cd = 3
WHERE isnull(CD_RACE_CENSUS, 10) = 5 AND (charindex('Y', rtrim(ltrim(isnull(CD_HSPNC, 'N'))), 1) = 0);

UPDATE portal_redux.PEOPLE_DIM
SET census_Hispanic_Latino_Origin_cd=4
WHERE isnull(CD_RACE_CENSUS, 10) = 3 AND (charindex('Y', rtrim(ltrim(isnull(CD_HSPNC, 'N'))), 1) = 0);

UPDATE portal_redux.PEOPLE_DIM
SET census_Hispanic_Latino_Origin_cd = 2
WHERE census_Hispanic_Latino_Origin_cd IS NULL;

UPDATE portal_redux.PEOPLE_DIM
SET tx_race_census = lu.tx_race_census
FROM portal_redux.ref_lookup_ethnicity_census lu 
WHERE  lu.cd_race_census = people_dim.cd_race_census;



UPDATE STATISTICS portal_redux.PEOPLE_DIM;
