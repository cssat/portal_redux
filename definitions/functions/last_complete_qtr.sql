
create function [portal_redux].[last_complete_qtr]()
returns datetime
as 
begin
declare @max_qtr datetime

set @max_qtr= (select max([Quarter]) from portal_redux.calendar_dim where dateadd(mm,3,[Quarter]) < portal_redux.cutoff_date())

return @max_qtr
end;