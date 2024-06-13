-- *** MUST BE RUN BEFORE process-data scripts


UPDATE portal_redux.ref_last_dw_transfer
SET cutoff_date = '2024-05-09 00:00:00.000';
-- change cutoff date to date data was taken off of the MFT site

-- use to check update
SELECT * FROM portal_redux.ref_last_dw_transfer rldt;

