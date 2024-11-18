
CREATE function [portal_redux].[last_complete_yr]()
returns datetime
as 
begin
declare @max_yr datetime

set @max_yr= (select max([Year]) from portal_redux.calendar_dim where dateadd(yy,1,[Year]) < portal_redux.cutoff_date())

return @max_yr
end;