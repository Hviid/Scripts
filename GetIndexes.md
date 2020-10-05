```SQL
SELECT
    OBJECT_NAME(ic.object_id) AS table_name,
    i.name AS index_name,
    COL_NAME(ic.object_id, ic.column_id) AS column_name,
    i.[fill_factor],
    ic.is_included_column
FROM sys.indexes AS i
INNER JOIN sys.index_columns AS ic
    ON i.object_id = ic.object_id
    AND i.index_id = ic.index_id
WHERE i.object_id NOT IN (SELECT
    [object_id]
FROM [frapp_ma].[sys].[objects]
WHERE [is_ms_shipped] = 1)
AND type_desc <> 'HEAP'
```
