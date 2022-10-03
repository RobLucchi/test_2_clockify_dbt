{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('projects_hourlyrate_ab3') }}
select
    _airbyte_projects_hashid,
    amount,
    currency,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_hourlyrate_hashid
from {{ ref('projects_hourlyrate_ab3') }}
-- hourlyrate at projects/hourlyRate from {{ ref('projects') }}
where 1 = 1

