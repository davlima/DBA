Este documento apresenta um conjunto de queries SQL que auxiliam no monitoramento de estatísticas, execuções de coleta e jobs agendados no Oracle Database.

1. Verificar estatísticas desatualizadas em tabelas
SELECT owner, table_name, last_analyzed
FROM dba_tables
WHERE last_analyzed IS NULL OR last_analyzed < SYSDATE - 30
ORDER BY last_analyzed;

2. Consultar histórico de coleta de estatísticas
SELECT *
FROM dba_optstat_operations
ORDER BY start_time DESC;

3. Verificar estatísticas de colunas
SELECT owner, table_name, column_name, num_distinct, density, num_nulls, last_analyzed
FROM dba_tab_col_statistics
WHERE owner NOT IN ('SYS', 'SYSTEM')
ORDER BY last_analyzed;

4. Verificar estatísticas de índices
SELECT owner, index_name, table_name, blevel, leaf_blocks, distinct_keys, last_analyzed
FROM dba_indexes
WHERE last_analyzed IS NULL OR last_analyzed < SYSDATE - 30
ORDER BY last_analyzed;

5. Verificar estatísticas de histógrafos
SELECT table_name, column_name, histogram, num_buckets, last_analyzed
FROM dba_tab_col_statistics
WHERE histogram != 'NONE';

6. Jobs de estatísticas automáticos
Verificação do job padrão do Oracle
SELECT job_name, enabled, repeat_interval, state, last_start_date
FROM dba_scheduler_jobs
WHERE job_name LIKE 'GATHER_STATS_JOB';

7. Consultar status do job de estatística
SELECT *
FROM dba_scheduler_job_run_details
WHERE job_name = 'GATHER_STATS_JOB'
ORDER BY log_date DESC;

8. Consultar todos os jobs agendados
SELECT owner, job_name, enabled, repeat_interval, state, job_type, comments
FROM dba_scheduler_jobs
ORDER BY owner, job_name;

09. Checar estatísticas de objetos em esquema específico
SELECT table_name, last_analyzed
FROM dba_tables
WHERE owner = 'NOME_DO_ESQUEMA'
ORDER BY last_analyzed;

Estas consultas são úteis para auditar e validar o estado atual das estatísticas, ajudando no planejamento e diagnóstico de desempenho no Oracle Database. Ajuste os filtros conforme seu ambiente e necessidades.
