{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('members_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'id',
        'name',
        'email',
        'status',
        object_to_string('settings'),
        array_to_string('memberships'),
        array_to_string('customfields'),
        'profilepicture',
        'activeworkspace',
        'defaultworkspace',
    ]) }} as _airbyte_members_hashid,
    tmp.*
from {{ ref('members_ab2') }} tmp
-- members
where 1 = 1

