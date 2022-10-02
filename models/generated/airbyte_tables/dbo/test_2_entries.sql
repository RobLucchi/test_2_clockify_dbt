{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_2_entries_ab3') }}
select
    id as id_test,
    type,
    tagids,
    taskid,
    userid,
    kioskid,
    billable,
    islocked,
    projectid,
    description,
    workspaceid,
    timeinterval,
    customfieldvalues,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_test_2_entries_hashid
from {{ ref('test_2_entries_ab3') }}
-- test_2_entries from {{ source('dbo', '_airbyte_raw_test_2_entries') }}
where 1 = 1

