```SQL
select 
	qsq.query_id,
	qp.query_plan,
	qst.query_sql_text,
	'select plan_id, query_id, cast(query_plan as xml) as query_plan, last_compile_start_time from sys.query_store_plan qsp where qsp.query_id='+cast(qsq.query_id as varchar)+' order by qsp.last_compile_start_time desc;' as 'get query store plans'
from
	sys.dm_exec_requests re
	cross apply sys.dm_exec_sql_text(re.sql_handle) st	 
	cross apply sys.dm_exec_query_plan(re.plan_handle) qp
	inner join sys.query_store_query_text qst on st.text=qst.query_sql_text
	inner join sys.query_store_query qsq on qst.query_text_id=qsq.query_text_id
where 
	re.session_id <> @@SPID
	and re.session_id > 54
```
