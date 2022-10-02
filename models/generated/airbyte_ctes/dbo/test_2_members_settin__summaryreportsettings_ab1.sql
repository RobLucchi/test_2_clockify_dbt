{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('test_2_members_settings') }}
select
    _airbyte_settings_hashid,
    {{ json_extract_scalar('summaryreportsettings', ['group'], ['group']) }} as {{ adapter.quote('group') }},
    {{ json_extract_scalar('summaryreportsettings', ['subgroup'], ['subgroup']) }} as subgroup,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_members_settings') }} as table_alias
-- summaryreportsettings at test_2_members/settings/summaryReportSettings
where 1 = 1
and summaryreportsettings is not null

