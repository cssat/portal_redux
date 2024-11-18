
CREATE function [portal_redux].[last_complete_month]()
returns datetime
as 
begin
declare @max_mo datetime

set @max_mo= (select (max([Month])) from portal_redux.calendar_dim where dateadd(mm,1,[Month]) < portal_redux.cutoff_date())

return @max_mo
end;