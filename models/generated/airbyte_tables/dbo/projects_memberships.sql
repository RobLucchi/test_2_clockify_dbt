{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('projects_memberships_ab3') }}
select
    _airbyte_projects_hashid,
    userid,
    costrate,
    targetid,
    hourlyrate,
    membershiptype,
    membershipstatus,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_memberships_hashid
from {{ ref('projects_memberships_ab3') }}
-- memberships at projects/memberships from {{ ref('projects') }}
where 1 = 1

