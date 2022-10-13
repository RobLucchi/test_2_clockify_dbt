{{ config(
    tags = [ "top-level" ],
    materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'
) }}
-- Final base SQL model
-- depends_on: {{ ref('projects') }}

WITH 
using_clause AS(
    select
    id,
    name,
    note,
    color,
    {{ adapter.quote('public') }},
    archived,
    billable,
    clientid,
    costrate,
    duration,
    template,
    clientname,
    workspaceid,
    budgetestimate,

    b.type estimate_type,
    b.estimate,

    c.amount hourly_rate_amount,
    c.currency hourly_rate_currency,

    a._airbyte_ab_id,
    a._airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    a._airbyte_projects_hashid

from {{ ref('projects') }} a

LEFT JOIN {{ ref('projects_estimate')}} b
ON a._airbyte_ab_id = b._airbyte_ab_id

LEFT JOIN {{ ref('projects_hourlyrate')}} c
ON a._airbyte_ab_id = b._airbyte_ab_id

-- clockify_projects from {{ source('dbo', '_airbyte_raw_projects') }}
),

updates AS(

select
    id,
    name,
    note,
    color,
    {{ adapter.quote('public') }},
    archived,
    billable,
    clientid,
    costrate,
    duration,
    template,
    clientname,
    workspaceid,
    budgetestimate,

    estimate_type,
    estimate,

    hourly_rate_amount,
    hourly_rate_currency,

    _airbyte_ab_id,
    _airbyte_emitted_at,
    _airbyte_normalized_at,
    _airbyte_projects_hashid
FROM using_clause
)


SELECT *
FROM updates