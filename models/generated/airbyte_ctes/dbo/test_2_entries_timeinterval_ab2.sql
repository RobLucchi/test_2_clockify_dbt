{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_2_entries_timeinterval_ab1') }}
select
    _airbyte_test_2_entries_hashid,
    cast({{ adapter.quote('end') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('end') }},
    cast({{ adapter.quote('start') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('start') }},
    cast(duration as {{ dbt_utils.type_string() }}) as duration,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_entries_timeinterval_ab1') }}
-- timeinterval at test_2_entries/timeInterval
where 1 = 1

