{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_projects_timeestimate_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_test_2_projects_hashid',
        'type',
        boolean_to_string('active'),
        'estimate',
        'resetoption',
        boolean_to_string('includenonbillable'),
    ]) }} as _airbyte_timeestimate_hashid,
    tmp.*
from {{ ref('test_2_projects_timeestimate_ab2') }} tmp
-- timeestimate at test_2_projects/timeEstimate
where 1 = 1

