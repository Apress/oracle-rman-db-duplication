-- Monitoring

SET LINES 132
COL opname        FORM A30 HEAD "Oper."
COL pct_complete  FORM 99.99 HEAD "% Comp."
COL start_time    FORM A15 HEAD "Start|Time"
COL hours_running FORM 9999.99 HEAD "Hours|Running"
COL minutes_left  FORM 999999 HEAD "Minutes|Left"
COL est_comp_time FORM A15 HEAD "Est. Comp.|Time"
--
SELECT sid, serial#, opname,
ROUND(sofar/totalwork*100,2) AS pct_complete,
TO_CHAR(start_time,'dd-mon-yy hh24:mi') start_time,
(sysdate-start_time)*24 hours_running,
((sysdate-start_time)*24*60)/(sofar/totalwork) - (sysdate-start_time)*24*60 minutes_left,
TO_CHAR((sysdate-start_time)/(sofar/totalwork) + start_time,'dd-mon-yy hh24:mi') est_comp_time
FROM  v$session_longops
WHERE opname LIKE 'RMAN%'
AND   opname NOT LIKE '%aggregate%'
AND   totalwork != 0
AND   sofar <> totalwork;

