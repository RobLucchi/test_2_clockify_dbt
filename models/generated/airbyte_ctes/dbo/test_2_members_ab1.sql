{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('dbo', '_airbyte_raw_test_2_members') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('_airbyte_data', ['email'], ['email']) }} as email,
    {{ json_extract_scalar('_airbyte_data', ['status'], ['status']) }} as status,
    {{ json_extract('table_alias', '_airbyte_data', ['settings'], ['settings']) }} as settings,
    {{ json_extract_array('_airbyte_data', ['memberships'], ['memberships']) }} as memberships,
    {{ json_extract_array('_airbyte_data', ['customFields'], ['customFields']) }} as customfields,
    {{ json_extract_scalar('_airbyte_data', ['profilePicture'], ['profilePicture']) }} as profilepicture,
    {{ json_extract_scalar('_airbyte_data', ['activeWorkspace'], ['activeWorkspace']) }} as activeworkspace,
    {{ json_extract_scalar('_airbyte_data', ['defaultWorkspace'], ['defaultWorkspace']) }} as defaultworkspace,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('dbo', '_airbyte_raw_test_2_members') }} as table_alias
-- test_2_members
where 1 = 1

