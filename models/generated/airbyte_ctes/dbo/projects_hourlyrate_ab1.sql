{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('projects') }}
select
    _airbyte_projects_hashid,
    {{ json_extract_scalar('hourlyrate', ['amount'], ['amount']) }} as amount,
    {{ json_extract_scalar('hourlyrate', ['currency'], ['currency']) }} as currency,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('projects') }} as table_alias
-- hourlyrate at projects/hourlyRate
where 1 = 1
and hourlyrate is not null

