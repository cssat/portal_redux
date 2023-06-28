-- create fnc_jitter function

-- DROP FUNCTION portal_redux.fnc_jitter;
CREATE FUNCTION portal_redux.fnc_jitter (
    @VALUE INT,
    @TOP FLOAT,
    @BOTTOM FLOAT
)
RETURNS INT
AS
BEGIN
    DECLARE @RESULT INT

    SET @RESULT = CASE
        WHEN @VALUE > 0 AND ROUND(@VALUE + 2 * SQRT(-2 * LOG(@TOP)) * COS(2* PI() * @BOTTOM), 0) < 1
        THEN 1
        WHEN @VALUE > 0
        THEN ROUND(@VALUE + 2 * SQRT(-2 * LOG(@TOP)) * COS(2 * PI() * @BOTTOM), 0)
        ELSE @VALUE
    RETURN @RESULT
END