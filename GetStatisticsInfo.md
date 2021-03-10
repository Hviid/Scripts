```SQL
SELECT 
  stats.name AS StatisticsName,
  OBJECT_SCHEMA_NAME(stats.object_id) AS SchemaName,
  OBJECT_NAME(stats.object_id) AS TableName,
  last_updated AS LastUpdated, [rows] AS [Rows],
  rows_sampled, steps, modification_counter AS ModCounter,
  persisted_sample_percent PersistedSamplePercent,
  (rows_sampled * 100)/rows AS SamplePercent
FROM sys.stats
INNER JOIN sys.stats_columns sc
ON stats.stats_id = sc.stats_id AND stats.object_id = sc.object_id
INNER JOIN sys.all_columns ac
ON ac.column_id = sc.column_id AND ac.object_id = sc.object_id
CROSS APPLY sys.dm_db_stats_properties(stats.object_id, stats.stats_id) shr
WHERE OBJECT_SCHEMA_NAME(stats.object_id) &amp;amp;lt;&amp;amp;gt; 'sys'
```
