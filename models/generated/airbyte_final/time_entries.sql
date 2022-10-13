{{ config(
    tags = [ "top-level" ],
    materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'
) }}

-- Final base SQL model
-- depends_on: {{ ref('entries') }}
WITH
using_clause AS (
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
    a._airbyte_entries_hashid,
    a._airbyte_ab_id,
    a._airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_timeinterval_hashid
from {{ ref('entries') }} a
left join {{ ref('entries_timeinterval') }} b
on a._airbyte_entries_hashid = b._airbyte_entries_hashid
-- time_entries from {{ source('dbo', '_airbyte_raw_entries') }}

),


updates AS (

    SELECT
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
        _airbyte_entries_hashid,
        _airbyte_ab_id,
        _airbyte_emitted_at,
        _airbyte_normalized_at,
        _airbyte_timeinterval_hashid
    FROM using_clause
)

SELECT *
FROM updates

