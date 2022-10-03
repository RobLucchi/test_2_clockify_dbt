{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('entries_timeinterval_ab3') }}
select
    _airbyte_entries_hashid,
    {{ adapter.quote('end') }},
    {{ adapter.quote('start') }},
    duration,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_timeinterval_hashid
from {{ ref('entries_timeinterval_ab3') }}
-- timeinterval at entries/timeInterval from {{ ref('entries') }}
where 1 = 1

