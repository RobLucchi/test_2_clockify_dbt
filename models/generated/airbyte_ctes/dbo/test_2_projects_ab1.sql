{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('dbo', '_airbyte_raw_test_2_projects') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('_airbyte_data', ['note'], ['note']) }} as note,
    {{ json_extract_scalar('_airbyte_data', ['color'], ['color']) }} as color,
    {{ json_extract_scalar('_airbyte_data', ['public'], ['public']) }} as {{ adapter.quote('public') }},
    {{ json_extract_scalar('_airbyte_data', ['archived'], ['archived']) }} as archived,
    {{ json_extract_scalar('_airbyte_data', ['billable'], ['billable']) }} as billable,
    {{ json_extract_scalar('_airbyte_data', ['clientId'], ['clientId']) }} as clientid,
    {{ json_extract('table_alias', '_airbyte_data', ['costRate']) }} as costrate,
    {{ json_extract_scalar('_airbyte_data', ['duration'], ['duration']) }} as duration,
    {{ json_extract('table_alias', '_airbyte_data', ['estimate'], ['estimate']) }} as estimate,
    {{ json_extract_scalar('_airbyte_data', ['template'], ['template']) }} as template,
    {{ json_extract_scalar('_airbyte_data', ['clientName'], ['clientName']) }} as clientname,
    {{ json_extract('table_alias', '_airbyte_data', ['hourlyRate'], ['hourlyRate']) }} as hourlyrate,
    {{ json_extract_array('_airbyte_data', ['memberships'], ['memberships']) }} as memberships,
    {{ json_extract_scalar('_airbyte_data', ['workspaceId'], ['workspaceId']) }} as workspaceid,
    {{ json_extract('table_alias', '_airbyte_data', ['timeEstimate'], ['timeEstimate']) }} as timeestimate,
    {{ json_extract('table_alias', '_airbyte_data', ['budgetEstimate']) }} as budgetestimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('dbo', '_airbyte_raw_test_2_projects') }} as table_alias
-- test_2_projects
where 1 = 1

