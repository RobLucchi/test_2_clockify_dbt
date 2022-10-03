{{ config(
    schema = "dbo",
    tags = [ "nested" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('members_settings_ab3') }}
select
    _airbyte_members_hashid,
    pto,
    lang,
    theme,
    alerts,
    approval,
    timezone,
    reminders,
    weekstart,
    dateformat,
    onboarding,
    scheduling,
    timeformat,
    longrunning,
    mystartofday,
    weeklyupdates,
    sendnewsletter,
    iscompactviewon,
    scheduledreports,
    dashboardpintotop,
    dashboardviewtype,
    dashboardselection,
    multifactorenabled,
    timetrackingmanual,
    projectlistcollapse,
    showonlyworkingdays,
    summaryreportsettings,
    collapseallprojectlists,
    projectpickertaskfilter,
    groupsimilarentriesdisabled,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_settings_hashid
from {{ ref('members_settings_ab3') }}
-- settings at members/settings from {{ ref('members') }}
where 1 = 1

