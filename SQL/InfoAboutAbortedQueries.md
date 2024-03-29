```SQL
SELECT TOP (1000) [runtime_stats_id]
	  ,query_id
      ,[runtime_stats_interval_id]
      ,[execution_type]
      ,[execution_type_desc]
      ,[first_execution_time]
      ,[query_store_plan].[last_execution_time]
      ,[count_executions]
      ,[avg_duration]
      ,[last_duration]
      ,[min_duration]
      ,[max_duration]
      ,[stdev_duration]
      ,[avg_cpu_time]
      ,[last_cpu_time]
      ,[min_cpu_time]
      ,[max_cpu_time]
      ,[stdev_cpu_time]
      ,[avg_logical_io_reads]
      ,[last_logical_io_reads]
      ,[min_logical_io_reads]
      ,[max_logical_io_reads]
      ,[stdev_logical_io_reads]
      ,[avg_logical_io_writes]
      ,[last_logical_io_writes]
      ,[min_logical_io_writes]
      ,[max_logical_io_writes]
      ,[stdev_logical_io_writes]
      ,[avg_physical_io_reads]
      ,[last_physical_io_reads]
      ,[min_physical_io_reads]
      ,[max_physical_io_reads]
      ,[stdev_physical_io_reads]
      ,[avg_clr_time]
      ,[last_clr_time]
      ,[min_clr_time]
      ,[max_clr_time]
      ,[stdev_clr_time]
      ,[avg_dop]
      ,[last_dop]
      ,[min_dop]
      ,[max_dop]
      ,[stdev_dop]
      ,[avg_query_max_used_memory]
      ,[last_query_max_used_memory]
      ,[min_query_max_used_memory]
      ,[max_query_max_used_memory]
      ,[stdev_query_max_used_memory]
      ,[avg_rowcount]
      ,[last_rowcount]
      ,[min_rowcount]
      ,[max_rowcount]
      ,[stdev_rowcount]
  FROM [sys].[query_store_runtime_stats] 
  LEFT JOIN [sys].[query_store_plan]
  ON [sys].[query_store_runtime_stats].plan_id = [sys].[query_store_plan].plan_id 
  WHERE [sys].[query_store_runtime_stats].last_execution_time > DATEADD(minute, -5, GETUTCDATE()) AND execution_type_desc = 'Aborted'
  order by [sys].[query_store_runtime_stats].last_execution_time desc
  ```
