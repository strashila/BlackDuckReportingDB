set search_path=reporting;  

select distinct  
proj.project_name as "Project Name",  
pv.version_name as "Version Name",  
comp.component_name as "Component Name",  
cv.vuln_id as "Vulnerability ID",  
cv.severity as "Severity CVSS v2",  
cv.base_score as "Base CVSS v2",  
cv.exploit_score as "Exploit CVSS v2",  
cv.impact_score as "Impact CVSS v2",  
cv.temporal_score as "Overall (Temporal) CVSS v2",  
cv.severity_cvss3 as "Severity CVSS v3.x",  
cv.base_score_cvss3 as "Base CVSS v3.x",  
cv.exploit_score_cvss3 as "Exploit CVSS v3.x",  
cv.impact_score_cvss3 as "Impact CVSS v3.x",  
cv.temporal_score_cvss3 as "Overall (Temporal) CVSS v3.x"  
from component_vulnerability cv  
inner join project_version pv on cv.project_version_id = pv.version_id  
inner join project proj on proj.project_id = pv.project_id  
inner join component comp on comp.id = cv.component_table_id  
order by proj.project_name, pv.version_name, comp.component_name, cv.vuln_id;  
