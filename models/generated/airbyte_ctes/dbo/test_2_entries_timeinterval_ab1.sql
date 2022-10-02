{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('test_2_entries') }}
select
    _airbyte_test_2_entries_hashid,
    {{ json_extract_scalar('timeinterval', ['end'], ['end']) }} as {{ adapter.quote('end') }},
    {{ json_extract_scalar('timeinterval', ['start'], ['start']) }} as {{ adapter.quote('start') }},
    {{ json_extract_scalar('timeinterval', ['duration'], ['duration']) }} as duration,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_entries') }} as table_alias
-- timeinterval at test_2_entries/timeInterval
where 1 = 1
and timeinterval is not null

