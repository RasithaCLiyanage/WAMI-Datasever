-- getting tables information in T-sql

select schema_name(t.schema_id) as schema_name,
       t.name as table_name,
       t.create_date,
       t.modify_date
from sys.tables t
order by schema_name,
         table_name;
         
         
-- this is stored procedure query to rename table name in T-sql
EXEC sp_rename '[dbo].[order_line_Legacy]', 'order_line_96586'

-- this is used by Ashen to see the number of rows available in the table orderline
begin
    declare @from datetime2;
    set @from = dateadd(day, -120, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));
    declare @to datetime2;
    set @to = dateadd(day, -1, cast(concat(cast(getdate() as date), ' 00:00:00.000000') as datetime2));
    select count(*)
    from [dbo].[order_line_96586]
    where [dbo].[order_line_96586].timestamp > @from
      and [dbo].[order_line_96586].timestamp <= @to;
end
go;
