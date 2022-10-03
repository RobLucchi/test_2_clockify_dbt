{{ config(
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('projects_memberships') }}
select
    _airbyte_projects_hashid,
    userid,
    costrate,
    targetid,
    hourlyrate,
    membershiptype,
    membershipstatus
from {{ ref('projects_memberships') }}
-- clockify_projects_members at projects/memberships from {{ ref('projects') }}
where 1 = 1
