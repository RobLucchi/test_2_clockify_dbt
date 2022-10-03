{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('members_settings_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_members_hashid',
        boolean_to_string('pto'),
        'lang',
        'theme',
        boolean_to_string('alerts'),
        boolean_to_string('approval'),
        'timezone',
        boolean_to_string('reminders'),
        'weekstart',
        'dateformat',
        boolean_to_string('onboarding'),
        boolean_to_string('scheduling'),
        'timeformat',
        boolean_to_string('longrunning'),
        'mystartofday',
        boolean_to_string('weeklyupdates'),
        boolean_to_string('sendnewsletter'),
        boolean_to_string('iscompactviewon'),
        boolean_to_string('scheduledreports'),
        boolean_to_string('dashboardpintotop'),
        'dashboardviewtype',
        'dashboardselection',
        boolean_to_string('multifactorenabled'),
        boolean_to_string('timetrackingmanual'),
        'projectlistcollapse',
        boolean_to_string('showonlyworkingdays'),
        object_to_string('summaryreportsettings'),
        boolean_to_string('collapseallprojectlists'),
        boolean_to_string('projectpickertaskfilter'),
        boolean_to_string('groupsimilarentriesdisabled'),
    ]) }} as _airbyte_settings_hashid,
    tmp.*
from {{ ref('members_settings_ab2') }} tmp
-- settings at members/settings
where 1 = 1

