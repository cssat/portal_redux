-- create RandFn function

--DROP FUNCTION portal_redux.RandFn;
CREATE FUNCTION portal_redux.RandFn()
RETURNS DECIMAL(18,18)
AS 
BEGIN
    DECLARE @randval DECIMAL(18,18)
    SELECT @randVal = rndResult from get_random_nbr
    RETURN @randval
END;