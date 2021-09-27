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
