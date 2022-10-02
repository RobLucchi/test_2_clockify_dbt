{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_2_members_settin__summaryreportsettings_ab1') }}
select
    _airbyte_settings_hashid,
    cast({{ adapter.quote('group') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('group') }},
    cast(subgroup as {{ dbt_utils.type_string() }}) as subgroup,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_members_settin__summaryreportsettings_ab1') }}
-- summaryreportsettings at test_2_members/settings/summaryReportSettings
where 1 = 1

