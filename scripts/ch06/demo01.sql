-- Creating a database

CREATE DATABASE TRG
   MAXLOGFILES 16
   MAXLOGMEMBERS 4
   MAXDATAFILES 1024
   MAXINSTANCES 1
   MAXLOGHISTORY 680
   CHARACTER SET AL32UTF8
DATAFILE
'/u01/dbfile/TRG/system01.dbf' SIZE 500M REUSE
   EXTENT MANAGEMENT LOCAL
UNDO TABLESPACE undotbs1 DATAFILE
'/u01/dbfile/TRG/undotbs01.dbf' SIZE 800M
SYSAUX DATAFILE
'/u01/dbfile/TRG/sysaux01.dbf' SIZE 500M
DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE
'/u01/dbfile/TRG/temp01.dbf' SIZE 500M
DEFAULT TABLESPACE USERS DATAFILE
'/u01/dbfile/TRG/users01.dbf' SIZE 20M
LOGFILE GROUP 1 ('/u01/oraredo/TRG/redo01a.rdo') SIZE 50M,
        GROUP 2 ('/u01/oraredo/TRG/redo02a.rdo') SIZE 50M
USER sys    IDENTIFIED BY foo
USER system IDENTIFIED BY foo;
--
@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
conn system/foo
@?/sqlplus/admin/pupbld.sql

