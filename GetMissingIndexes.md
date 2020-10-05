```SQL
SELECT 
	  (SELECT OBJECT_NAME([sys].[dm_db_missing_index_details].object_id, [sys].[dm_db_missing_index_details].database_id)) as table_name
	  ,[sys].[dm_db_missing_index_details].equality_columns
	  ,[sys].[dm_db_missing_index_details].inequality_columns
	  ,[sys].[dm_db_missing_index_details].included_columns
      ,[user_seeks]
      ,[user_scans]
	  ,[last_user_seek]
      ,[last_user_scan]
      ,[avg_total_user_cost]
      ,[avg_user_impact]
      ,[system_seeks]
      ,[system_scans]
      ,[last_system_seek]
      ,[last_system_scan]
      ,[avg_total_system_cost]
      ,[avg_system_impact]
  FROM [sys].[dm_db_missing_index_group_stats]
  INNER JOIN [sys].[dm_db_missing_index_groups]
  ON [sys].[dm_db_missing_index_group_stats].group_handle = [sys].[dm_db_missing_index_groups].index_group_handle
  INNER JOIN [sys].[dm_db_missing_index_details]
  ON [sys].[dm_db_missing_index_groups].index_handle = [sys].[dm_db_missing_index_details].index_handle
  WHERE [sys].[dm_db_missing_index_details].database_id = DB_ID()
  ```
