-- Create database command
CREATE CONTROLFILE REUSE SET DATABASE "DUP" RESETLOGS ARCHIVELOG
    MAXLOGFILES 16
    MAXLOGMEMBERS 4
    MAXDATAFILES 1024
    MAXINSTANCES 1
    MAXLOGHISTORY 876
LOGFILE
  GROUP 1 '/u01/oraredo/DUP/redo01a.rdo'  SIZE 50M BLOCKSIZE 512,
  GROUP 2 '/u01/oraredo/DUP/redo02a.rdo'  SIZE 50M BLOCKSIZE 512
DATAFILE
  '/u01/dbfile/DUP/system01.dbf',
  '/u01/dbfile/DUP/sysaux01.dbf',
  '/u01/dbfile/DUP/undotbs01.dbf',
  '/u01/dbfile/DUP/users01.dbf',
  '/u01/dbfile/DUP/repdata.dbf',
  '/u01/dbfile/DUP/repidx.dbf'
CHARACTER SET AL32UTF8;
