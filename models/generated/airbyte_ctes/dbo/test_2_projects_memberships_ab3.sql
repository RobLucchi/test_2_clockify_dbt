{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_projects_memberships_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_test_2_projects_hashid',
        'userid',
        'costrate',
        'targetid',
        'hourlyrate',
        'membershiptype',
        'membershipstatus',
    ]) }} as _airbyte_memberships_hashid,
    tmp.*
from {{ ref('test_2_projects_memberships_ab2') }} tmp
-- memberships at test_2_projects/memberships
where 1 = 1

