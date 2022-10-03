{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('members_ab1') }}
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(name as {{ dbt_utils.type_string() }}) as name,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(settings as {{ type_json() }}) as settings,
    memberships,
    customfields,
    cast(profilepicture as {{ dbt_utils.type_string() }}) as profilepicture,
    cast(activeworkspace as {{ dbt_utils.type_string() }}) as activeworkspace,
    cast(defaultworkspace as {{ dbt_utils.type_string() }}) as defaultworkspace,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('members_ab1') }}
-- members
where 1 = 1

