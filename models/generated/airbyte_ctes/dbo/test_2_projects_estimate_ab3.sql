{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_projects_estimate_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_test_2_projects_hashid',
        'type',
        'estimate',
    ]) }} as _airbyte_estimate_hashid,
    tmp.*
from {{ ref('test_2_projects_estimate_ab2') }} tmp
-- estimate at test_2_projects/estimate
where 1 = 1

