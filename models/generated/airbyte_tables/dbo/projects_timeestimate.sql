{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('projects_timeestimate_ab3') }}
select
    _airbyte_projects_hashid,
    type,
    active,
    estimate,
    resetoption,
    includenonbillable,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_timeestimate_hashid
from {{ ref('projects_timeestimate_ab3') }}
-- timeestimate at projects/timeEstimate from {{ ref('projects') }}
where 1 = 1

