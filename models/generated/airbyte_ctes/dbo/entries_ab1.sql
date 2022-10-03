{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('dbo', '_airbyte_raw_entries') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['type'], ['type']) }} as type,
    {{ json_extract_array('_airbyte_data', ['tagIds'], ['tagIds']) }} as tagids,
    {{ json_extract_scalar('_airbyte_data', ['taskId'], ['taskId']) }} as taskid,
    {{ json_extract_scalar('_airbyte_data', ['userId'], ['userId']) }} as userid,
    {{ json_extract('table_alias', '_airbyte_data', ['kioskId']) }} as kioskid,
    {{ json_extract_scalar('_airbyte_data', ['billable'], ['billable']) }} as billable,
    {{ json_extract_scalar('_airbyte_data', ['isLocked'], ['isLocked']) }} as islocked,
    {{ json_extract_scalar('_airbyte_data', ['projectId'], ['projectId']) }} as projectid,
    {{ json_extract_scalar('_airbyte_data', ['description'], ['description']) }} as description,
    {{ json_extract_scalar('_airbyte_data', ['workspaceId'], ['workspaceId']) }} as workspaceid,
    {{ json_extract('table_alias', '_airbyte_data', ['timeInterval'], ['timeInterval']) }} as timeinterval,
    {{ json_extract_array('_airbyte_data', ['customFieldValues'], ['customFieldValues']) }} as customfieldvalues,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('dbo', '_airbyte_raw_entries') }} as table_alias
-- entries
where 1 = 1

