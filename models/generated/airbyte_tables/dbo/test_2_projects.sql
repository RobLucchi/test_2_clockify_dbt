{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_projects_ab3') }}
select
    id,
    name,
    note,
    color,
    {{ adapter.quote('public') }},
    archived,
    billable,
    clientid,
    costrate,
    duration,
    estimate,
    template,
    clientname,
    hourlyrate,
    memberships,
    workspaceid,
    timeestimate,
    budgetestimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_test_2_projects_hashid
from {{ ref('test_2_projects_ab3') }}
-- test_2_projects from {{ source('dbo', '_airbyte_raw_test_2_projects') }}
where 1 = 1

