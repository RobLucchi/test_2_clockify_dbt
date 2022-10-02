{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_projects_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'id',
        'name',
        'note',
        'color',
        boolean_to_string(adapter.quote('public')),
        boolean_to_string('archived'),
        boolean_to_string('billable'),
        'clientid',
        'costrate',
        'duration',
        object_to_string('estimate'),
        boolean_to_string('template'),
        'clientname',
        object_to_string('hourlyrate'),
        array_to_string('memberships'),
        'workspaceid',
        object_to_string('timeestimate'),
        'budgetestimate',
    ]) }} as _airbyte_test_2_projects_hashid,
    tmp.*
from {{ ref('test_2_projects_ab2') }} tmp
-- test_2_projects
where 1 = 1

