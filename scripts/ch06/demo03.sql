-- Showing services

select service_id, name, network_name,
to_char(creation_date,'dd-mon-yy hh24:mi') create_date
from dba_services
order by service_id;
