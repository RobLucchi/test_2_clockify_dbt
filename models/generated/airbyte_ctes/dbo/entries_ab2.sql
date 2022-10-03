{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('entries_ab1') }}
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    tagids,
    cast(taskid as {{ dbt_utils.type_string() }}) as taskid,
    cast(userid as {{ dbt_utils.type_string() }}) as userid,
    kioskid,
    {{ cast_to_boolean('billable') }} as billable,
    {{ cast_to_boolean('islocked') }} as islocked,
    cast(projectid as {{ dbt_utils.type_string() }}) as projectid,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(workspaceid as {{ dbt_utils.type_string() }}) as workspaceid,
    cast(timeinterval as {{ type_json() }}) as timeinterval,
    customfieldvalues,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('entries_ab1') }}
-- entries
where 1 = 1

