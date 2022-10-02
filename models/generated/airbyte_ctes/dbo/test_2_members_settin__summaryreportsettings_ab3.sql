{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_members_settin__summaryreportsettings_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_settings_hashid',
        adapter.quote('group'),
        'subgroup',
    ]) }} as _airbyte_summaryreportsettings_hashid,
    tmp.*
from {{ ref('test_2_members_settin__summaryreportsettings_ab2') }} tmp
-- summaryreportsettings at test_2_members/settings/summaryReportSettings
where 1 = 1

