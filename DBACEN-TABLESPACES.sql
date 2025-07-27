-- Tablespace Oracle - Parte 1 

--> Ambiente 

S.O: Oracle Linux Server release 7.5
Oracle: 19c 
Onde se aplica:
	- versão 10g e superiores
	- Single Instance e RAC
	- NonCDB e CDB


--> Gerenciando Tablespaces e Datafiles
	- Obtendo informaçoes sobre tablespaces e datafiles
	- Tipos de tablespaces
		Tablespace permanente default 
			- permanente smalltablespace
			- permanente bigtablespace
			- permanente undo 
		Tablespace temporaria default
	- Criando tablespaces
	- Dropando tablespaces
	- Gerando comando para criação de tablespaces

		
1 - Obtendo informaçoes sobre tablespaces e datafiles

- tablespaces
SET pagesize 5000;
SELECT tablespace_name
	,STATUS
	,contents
	,bigfile
FROM dba_tablespaces
ORDER BY 3
	,1;
	
-

SET pagesize 5000;
SELECT ts#
	,name
	,bigfile
FROM v$tablespace
ORDER BY 1;


- datafiles/tempfiles
set linesize 500;
set pagesize 5000;
column file_name format a45
column tablespace_name format a15
SELECT file_id
	,tablespace_name
	,STATUS
	,online_status
	,file_name
	,autoextensible
	,increment_by
	,round(maxbytes / 1024 / 1024) tamanho_maximo_mb
FROM dba_data_files
ORDER BY 3;

-

set linesize 500;
set pagesize 5000;
column file_name format a50
column tablespace_name format a15
SELECT file_id
	,tablespace_name
	,STATUS
	,file_name
	,autoextensible
	,increment_by
	,round(maxbytes / 1024 / 1024) tamanho_maximo_mb
FROM dba_temp_files
ORDER BY 2;

-

set linesize 500;
set pagesize 5000;
column name format a50
SELECT file#
	,name
	,ts#
	,STATUS
	,enabled
FROM v$datafile
ORDER BY 1;

-

set linesize 500;
set pagesize 5000;
column name format a50
SELECT file#
	,name
	,ts#
	,STATUS
	,enabled
FROM v$tempfile
ORDER BY 1;

-

set linesize 500;
set pagesize 5000;
column namet format a10
column named format a50
SELECT d.file#
	,d.name named
	,t.name namet
	,d.STATUS
	,d.enabled
FROM v$datafile d
	,v$tablespace t
WHERE d.ts# = t.ts#
UNION
SELECT d.file#
	,d.name named
	,t.name namet
	,d.STATUS
	,d.enabled
FROM v$tempfile d
	,v$tablespace t
WHERE d.ts# = t.ts#
ORDER BY 3;


2 - Tipos de tablespaces

set linesize 500;
set pagesize 5000;	
column property_name format a30
column property_value format a20
column description format a50
SELECT property_name
	,property_value
	,description
FROM database_properties
WHERE property_name LIKE 'DEFAULT%TABLESPACE';


- Tablespace permanente default 
alter database default tablespace "nome tablespace";

- Tablespace temporaria default
alter database default temporary tablespace "nome tablespace temporaria";
		
		
3 - Criando tablespaces

- permanente smalltablespace
create tablespace TS_PERMANENTE datafile '/u01/app/oracle/oradata/ORCL19C/ts_permanente01.dbf' size 100m autoextend on next 100m maxsize unlimited;
--RAC
create tablespace TS_PERMANENTE datafile '+DATA' size 100m autoextend on next 100m maxsize unlimited;

- permanente bigtablespace
create bigfile tablespace TS_BIGFILE datafile '/u01/app/oracle/oradata/ORCL19C/ts_bigfile01.dbf' size 100m autoextend on next 100m maxsize unlimited;
--RAC 
create bigfile tablespace TS_BIGFILE datafile '+DATA' size 100m autoextend on next 100m maxsize unlimited;

- temporaria 
create temporary tablespace TS_TEMPORARIA tempfile '/u01/app/oracle/oradata/ORCL19C/ts_temporaria01.dbf' size 100m reuse autoextend on next 100m maxsize unlimited;
--RAC 
create temporary tablespace TS_TEMPORARIA tempfile '+DATA' size 100m reuse autoextend on next 100m maxsize unlimited;

- undo 
create undo tablespace UNDOTBS2 datafile '/u01/app/oracle/oradata/ORCL19C/undotbs2_01.dbf' size 100m autoextend on next 100m maxsize unlimited;
--RAC 
create undo tablespace UNDOTBS2 datafile '+DATA' size 100m autoextend on next 100m maxsize unlimited;


4 - Dropando tablespaces

drop tablespace "nome tablespace";
-
drop tablespace "nome tablespace" including contents;
-
drop tablespace "nome tablespace" including contents and datafiles;


5 - Gerando comando para criação de tablespaces
