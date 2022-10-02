{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_projects_hourlyrate_ab3') }}
select
    _airbyte_test_2_projects_hashid,
    amount,
    currency,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_hourlyrate_hashid
from {{ ref('test_2_projects_hourlyrate_ab3') }}
-- hourlyrate at test_2_projects/hourlyRate from {{ ref('test_2_projects') }}
where 1 = 1

