{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('members_settings_ab1') }}
select
    _airbyte_members_hashid,
    {{ cast_to_boolean('pto') }} as pto,
    cast(lang as {{ dbt_utils.type_string() }}) as lang,
    cast(theme as {{ dbt_utils.type_string() }}) as theme,
    {{ cast_to_boolean('alerts') }} as alerts,
    {{ cast_to_boolean('approval') }} as approval,
    cast(timezone as {{ dbt_utils.type_string() }}) as timezone,
    {{ cast_to_boolean('reminders') }} as reminders,
    cast(weekstart as {{ dbt_utils.type_string() }}) as weekstart,
    cast(dateformat as {{ dbt_utils.type_string() }}) as dateformat,
    {{ cast_to_boolean('onboarding') }} as onboarding,
    {{ cast_to_boolean('scheduling') }} as scheduling,
    cast(timeformat as {{ dbt_utils.type_string() }}) as timeformat,
    {{ cast_to_boolean('longrunning') }} as longrunning,
    cast(mystartofday as {{ dbt_utils.type_string() }}) as mystartofday,
    {{ cast_to_boolean('weeklyupdates') }} as weeklyupdates,
    {{ cast_to_boolean('sendnewsletter') }} as sendnewsletter,
    {{ cast_to_boolean('iscompactviewon') }} as iscompactviewon,
    {{ cast_to_boolean('scheduledreports') }} as scheduledreports,
    {{ cast_to_boolean('dashboardpintotop') }} as dashboardpintotop,
    cast(dashboardviewtype as {{ dbt_utils.type_string() }}) as dashboardviewtype,
    cast(dashboardselection as {{ dbt_utils.type_string() }}) as dashboardselection,
    {{ cast_to_boolean('multifactorenabled') }} as multifactorenabled,
    {{ cast_to_boolean('timetrackingmanual') }} as timetrackingmanual,
    cast(projectlistcollapse as {{ dbt_utils.type_bigint() }}) as projectlistcollapse,
    {{ cast_to_boolean('showonlyworkingdays') }} as showonlyworkingdays,
    cast(summaryreportsettings as {{ type_json() }}) as summaryreportsettings,
    {{ cast_to_boolean('collapseallprojectlists') }} as collapseallprojectlists,
    {{ cast_to_boolean('projectpickertaskfilter') }} as projectpickertaskfilter,
    {{ cast_to_boolean('groupsimilarentriesdisabled') }} as groupsimilarentriesdisabled,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('members_settings_ab1') }}
-- settings at members/settings
where 1 = 1

