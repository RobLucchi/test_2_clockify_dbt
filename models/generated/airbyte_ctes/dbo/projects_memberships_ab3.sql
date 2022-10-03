{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('projects_memberships_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_projects_hashid',
        'userid',
        'costrate',
        'targetid',
        'hourlyrate',
        'membershiptype',
        'membershipstatus',
    ]) }} as _airbyte_memberships_hashid,
    tmp.*
from {{ ref('projects_memberships_ab2') }} tmp
-- memberships at projects/memberships
where 1 = 1

