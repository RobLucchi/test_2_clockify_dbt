{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_2_projects_ab1') }}
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(name as {{ dbt_utils.type_string() }}) as name,
    cast(note as {{ dbt_utils.type_string() }}) as note,
    cast(color as {{ dbt_utils.type_string() }}) as color,
    {{ cast_to_boolean(adapter.quote('public')) }} as {{ adapter.quote('public') }},
    {{ cast_to_boolean('archived') }} as archived,
    {{ cast_to_boolean('billable') }} as billable,
    cast(clientid as {{ dbt_utils.type_string() }}) as clientid,
    costrate,
    cast(duration as {{ dbt_utils.type_string() }}) as duration,
    cast(estimate as {{ type_json() }}) as estimate,
    {{ cast_to_boolean('template') }} as template,
    cast(clientname as {{ dbt_utils.type_string() }}) as clientname,
    cast(hourlyrate as {{ type_json() }}) as hourlyrate,
    memberships,
    cast(workspaceid as {{ dbt_utils.type_string() }}) as workspaceid,
    cast(timeestimate as {{ type_json() }}) as timeestimate,
    budgetestimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_projects_ab1') }}
-- test_2_projects
where 1 = 1

