{{ config(
    tags = [ "top-level" ],
    materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'
) }}
-- Final base SQL model
-- depends_on: {{ ref('members') }}
select
    id,
    name,
    email,
    status,
    memberships,
    customfields,
    profilepicture,
    activeworkspace,
    defaultworkspace,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_members_hashid
from {{ ref('members') }}
-- users from {{ source('dbo', '_airbyte_raw_members') }}
where 1 = 1

