{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('entries_ab3') }}
select
    id,
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
    _airbyte_entries_hashid
from {{ ref('entries_ab3') }}
-- entries from {{ source('dbo', '_airbyte_raw_entries') }}
where 1 = 1

