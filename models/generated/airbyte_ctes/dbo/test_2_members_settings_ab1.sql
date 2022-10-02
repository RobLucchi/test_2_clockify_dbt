{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('test_2_members') }}
select
    _airbyte_test_2_members_hashid,
    {{ json_extract_scalar('settings', ['pto'], ['pto']) }} as pto,
    {{ json_extract_scalar('settings', ['lang'], ['lang']) }} as lang,
    {{ json_extract_scalar('settings', ['theme'], ['theme']) }} as theme,
    {{ json_extract_scalar('settings', ['alerts'], ['alerts']) }} as alerts,
    {{ json_extract_scalar('settings', ['approval'], ['approval']) }} as approval,
    {{ json_extract_scalar('settings', ['timeZone'], ['timeZone']) }} as timezone,
    {{ json_extract_scalar('settings', ['reminders'], ['reminders']) }} as reminders,
    {{ json_extract_scalar('settings', ['weekStart'], ['weekStart']) }} as weekstart,
    {{ json_extract_scalar('settings', ['dateFormat'], ['dateFormat']) }} as dateformat,
    {{ json_extract_scalar('settings', ['onboarding'], ['onboarding']) }} as onboarding,
    {{ json_extract_scalar('settings', ['scheduling'], ['scheduling']) }} as scheduling,
    {{ json_extract_scalar('settings', ['timeFormat'], ['timeFormat']) }} as timeformat,
    {{ json_extract_scalar('settings', ['longRunning'], ['longRunning']) }} as longrunning,
    {{ json_extract_scalar('settings', ['myStartOfDay'], ['myStartOfDay']) }} as mystartofday,
    {{ json_extract_scalar('settings', ['weeklyUpdates'], ['weeklyUpdates']) }} as weeklyupdates,
    {{ json_extract_scalar('settings', ['sendNewsletter'], ['sendNewsletter']) }} as sendnewsletter,
    {{ json_extract_scalar('settings', ['isCompactViewOn'], ['isCompactViewOn']) }} as iscompactviewon,
    {{ json_extract_scalar('settings', ['scheduledReports'], ['scheduledReports']) }} as scheduledreports,
    {{ json_extract_scalar('settings', ['dashboardPinToTop'], ['dashboardPinToTop']) }} as dashboardpintotop,
    {{ json_extract_scalar('settings', ['dashboardViewType'], ['dashboardViewType']) }} as dashboardviewtype,
    {{ json_extract_scalar('settings', ['dashboardSelection'], ['dashboardSelection']) }} as dashboardselection,
    {{ json_extract_scalar('settings', ['multiFactorEnabled'], ['multiFactorEnabled']) }} as multifactorenabled,
    {{ json_extract_scalar('settings', ['timeTrackingManual'], ['timeTrackingManual']) }} as timetrackingmanual,
    {{ json_extract_scalar('settings', ['projectListCollapse'], ['projectListCollapse']) }} as projectlistcollapse,
    {{ json_extract_scalar('settings', ['showOnlyWorkingDays'], ['showOnlyWorkingDays']) }} as showonlyworkingdays,
    {{ json_extract('table_alias', 'settings', ['summaryReportSettings'], ['summaryReportSettings']) }} as summaryreportsettings,
    {{ json_extract_scalar('settings', ['collapseAllProjectLists'], ['collapseAllProjectLists']) }} as collapseallprojectlists,
    {{ json_extract_scalar('settings', ['projectPickerTaskFilter'], ['projectPickerTaskFilter']) }} as projectpickertaskfilter,
    {{ json_extract_scalar('settings', ['groupSimilarEntriesDisabled'], ['groupSimilarEntriesDisabled']) }} as groupsimilarentriesdisabled,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_members') }} as table_alias
-- settings at test_2_members/settings
where 1 = 1
and settings is not null

