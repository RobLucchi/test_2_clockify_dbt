{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_projects_timeestimate_ab3') }}
select
    _airbyte_test_2_projects_hashid,
    type,
    active,
    estimate,
    resetoption,
    includenonbillable,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_timeestimate_hashid
from {{ ref('test_2_projects_timeestimate_ab3') }}
-- timeestimate at test_2_projects/timeEstimate from {{ ref('test_2_projects') }}
where 1 = 1

