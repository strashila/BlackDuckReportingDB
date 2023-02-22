set search_path=reporting;

select 
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

from component comp
inner join project_version pv
on comp.project_version_id = pv.version_id
inner join project proj on proj.project_id = pv.project_id

where comp.created_at >= '2023-01-01' and comp.created_at <= '2023-01-31'
and (license_high_count + license_medium_count + license_low_count) > 0

order by proj.project_name, pv.version_name, comp.component_name;
