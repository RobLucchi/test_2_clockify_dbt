{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('projects') }}
select
    _airbyte_projects_hashid,
    {{ json_extract_scalar('estimate', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('estimate', ['estimate'], ['estimate']) }} as estimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('projects') }} as table_alias
-- estimate at projects/estimate
where 1 = 1
and estimate is not null

