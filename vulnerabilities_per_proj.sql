/* Get all vulnerabilities in all the project version BOMs with component names */

SET search_path=reporting;  

SELECT DISTINCT proj.project_name AS "Project Name",  
                pv.version_name AS "Version Name",  
                comp.component_name AS "Component Name",  
                cv.vuln_id AS "Vulnerability ID",  
                cv.severity AS "Severity CVSS v2",  
                cv.base_score AS "Base CVSS v2",  
                cv.exploit_score AS "Exploit CVSS v2",  
                cv.impact_score AS "Impact CVSS v2",  
                cv.temporal_score AS "Overall (Temporal) CVSS v2",  
                cv.severity_cvss3 AS "Severity CVSS v3.x",  
                cv.base_score_cvss3 AS "Base CVSS v3.x",  
                cv.exploit_score_cvss3 AS "Exploit CVSS v3.x",  
                cv.impact_score_cvss3 AS "Impact CVSS v3.x",  
                cv.temporal_score_cvss3 AS "Overall (Temporal) CVSS v3.x"  
FROM component_vulnerability cv  
INNER JOIN project_version pv ON cv.project_version_id = pv.version_id  
INNER JOIN project proj ON proj.project_id = pv.project_id  
INNER JOIN component comp ON comp.id = cv.component_table_id  
ORDER BY proj.project_name, pv.version_name, comp.component_name, cv.vuln_id;  
