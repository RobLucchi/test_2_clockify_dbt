{{ config(
    unique_key = '_airbyte_ab_id',
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('entries') }}
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
    customfieldvalues,
    duration,
    {{ adapter.quote('end') }},
    {{ adapter.quote('start') }},
    {{ adapter.quote('end' )}} - {{adapter.quote('start')}},
    a._airbyte_entries_hashid,
    a._airbyte_ab_id,
    a._airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_timeinterval_hashid
from {{ ref('entries') }} a
left join {{ ref('entries_timeinterval') }} b
on a._airbyte_entries_hashid = b._airbyte_entries_hashid
-- time_entries from {{ source('dbo', '_airbyte_raw_entries') }}