{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('test_2_entries_timeinterval_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_test_2_entries_hashid',
        adapter.quote('end'),
        adapter.quote('start'),
        'duration',
    ]) }} as _airbyte_timeinterval_hashid,
    tmp.*
from {{ ref('test_2_entries_timeinterval_ab2') }} tmp
-- timeinterval at test_2_entries/timeInterval
where 1 = 1

