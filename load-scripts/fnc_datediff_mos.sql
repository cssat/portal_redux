-- create fnc_datediff_mos function

-- DROP FUNCTION portal_redux.fnc_datediff_mos;
CREATE function portal_redux.fnc_datediff_mos(@BEGIN_DATE datetime,@END_DATE datetime)
returns int
begin

DECLARE @diff int
if (@BEGIN_DATE<=@END_DATE)
begin
IF day(@END_DATE) < day(@BEGIN_DATE)

	SET @diff = datediff(mm,@BEGIN_DATE,@END_DATE) - 1

ELSE

	SET @diff = datediff(mm,@BEGIN_DATE,@END_DATE)
end
RETURN @diff

end
