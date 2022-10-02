{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_members_settin__summaryreportsettings_ab3') }}
select
    _airbyte_settings_hashid,
    {{ adapter.quote('group') }},
    subgroup,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_summaryreportsettings_hashid
from {{ ref('test_2_members_settin__summaryreportsettings_ab3') }}
-- summaryreportsettings at test_2_members/settings/summaryReportSettings from {{ ref('test_2_members_settings') }}
where 1 = 1

