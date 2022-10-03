{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('entries_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'id',
        'type',
        array_to_string('tagids'),
        'taskid',
        'userid',
        'kioskid',
        boolean_to_string('billable'),
        boolean_to_string('islocked'),
        'projectid',
        'description',
        'workspaceid',
        object_to_string('timeinterval'),
        array_to_string('customfieldvalues'),
    ]) }} as _airbyte_entries_hashid,
    tmp.*
from {{ ref('entries_ab2') }} tmp
-- entries
where 1 = 1

