/* Get all components that have any license risk and were discovered in a specified timeframe */   


SET search_path=reporting;

SELECT 
proj.project_name,
pv.version_name,
comp.component_name, 
comp.component_version_name, 
comp.origin_id, 
comp.component_id,
comp.component_version_id,
comp.created_at,
comp.license_high_count,
comp.license_medium_count,
comp.license_low_count

FROM component comp
INNER JOIN project_version pv
ON comp.project_version_id = pv.version_id
INNER JOIN project proj ON proj.project_id = pv.project_id

WHERE comp.created_at >= '2023-01-01' AND comp.created_at <= '2023-01-31'
AND (license_high_count + license_medium_count + license_low_count) > 0

ORDER BY proj.project_name, pv.version_name, comp.component_name;
