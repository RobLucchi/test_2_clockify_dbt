{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_members_ab2') }}
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
    ]) }} as _airbyte_test_2_members_hashid,
    tmp.*
from {{ ref('test_2_members_ab2') }} tmp
-- test_2_members
where 1 = 1

