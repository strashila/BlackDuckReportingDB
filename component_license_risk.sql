/* Get all projects per component name "python" where license risk is medium or high */  

SET search_path=reporting;  

SELECT project.project_name,  
       project_version.version_name,  
       component.component_name,  
       component.component_version_name,  
       component.origin_id,  
       component_match_types.match_type,  
       component.license_high_count,  
       component.license_medium_count  

FROM component  
INNER JOIN project_version ON component.project_version_id = project_version.version_id  
INNER JOIN project ON project_version.project_id = project.project_id  
INNER JOIN component_match_types ON component_match_types.project_version_id = project_version.version_id AND component_match_types.component_id = component.id  

WHERE (component.license_high_count > 0 OR component.license_medium_count > 0)  
AND project.project_name LIKE '%python%'  
ORDER BY project_name, version_name, component_name, component_version_name;  
