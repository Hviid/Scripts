```SQL
SELECT 
	   (SELECT OBJECT_NAME([object_id], [database_id])) as table_name
	  ,(SELECT TOP 1 name from sys.indexes WHERE sys.indexes.index_id = [sys].[dm_db_index_usage_stats].[index_id] and sys.indexes.object_id = [sys].[dm_db_index_usage_stats].[object_id]) as index_name
	  ,(SELECT DB_NAME([database_id])) as dbname
      ,[user_seeks]
      ,[user_scans]
      ,[user_lookups]
      ,[user_updates]
      ,[last_user_seek]
      ,[last_user_scan]
      ,[last_user_lookup]
      ,[last_user_update]
      ,[system_seeks]
      ,[system_scans]
      ,[system_lookups]
      ,[system_updates]
      ,[last_system_seek]
      ,[last_system_scan]
      ,[last_system_lookup]
      ,[last_system_update]
  FROM [sys].[dm_db_index_usage_stats] where database_id = DB_ID()
  ```
