{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('members_ab3') }}
select
    id,
    name,
    email,
    status,
    settings,
    memberships,
    customfields,
    profilepicture,
    activeworkspace,
    defaultworkspace,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_members_hashid
from {{ ref('members_ab3') }}
-- members from {{ source('dbo', '_airbyte_raw_members') }}
where 1 = 1

