/* Get all projects per component name and version, for example Spring Boot version 2.7.x */   

SET search_path=reporting;  

SELECT DISTINCT comp.component_name, 
                comp.component_version_name,  
                proj.project_name, 
                pv.version_name      
FROM component comp
INNER JOIN project_version pv ON comp.project_version_id = pv.version_id  
INNER JOIN project proj ON proj.project_id = pv.project_id  
WHERE comp.component_name LIKE '%Spring Boot%'  
AND comp.component_version_name LIKE '2.7%'  
ORDER BY comp.component_name, proj.project_name, pv.version_name  
