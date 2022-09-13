/* Get all projects per component name */   


set search_path=reporting;  

select distinct comp.component_name, proj.project_name, pv.version_name  
from component comp inner join project_version pv on comp.project_version_id = pv.version_id  
inner join project proj on proj.project_id = pv.project_id  
where comp.component_name like **'%Log4j%'**  
order by comp.component_name, proj.project_name, pv.version_name  
