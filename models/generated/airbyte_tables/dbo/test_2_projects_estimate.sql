{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_projects_estimate_ab3') }}
select
    _airbyte_test_2_projects_hashid,
    type,
    estimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_estimate_hashid
from {{ ref('test_2_projects_estimate_ab3') }}
-- estimate at test_2_projects/estimate from {{ ref('test_2_projects') }}
where 1 = 1

