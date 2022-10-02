{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_projects_memberships_ab3') }}
select
    _airbyte_test_2_projects_hashid,
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
from {{ ref('test_2_projects_memberships_ab3') }}
-- memberships at test_2_projects/memberships from {{ ref('test_2_projects') }}
where 1 = 1

