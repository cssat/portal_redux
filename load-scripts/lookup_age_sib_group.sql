-- create lookup_age_sib_group table

-- DROP TABLE portal_redux.lookup_age_sib_group;
CREATE TABLE portal_redux.lookup_age_sib_group
(
    [age_sib_group_cd] INT NOT NULL 
        CONSTRAINT [pk_lookup_age_sib_group] PRIMARY KEY, 
    [age_sib_group] VARCHAR(100) NOT NULL
);