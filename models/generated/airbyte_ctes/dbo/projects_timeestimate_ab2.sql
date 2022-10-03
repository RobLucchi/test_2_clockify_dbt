{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('projects_timeestimate_ab1') }}
select
    _airbyte_projects_hashid,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    {{ cast_to_boolean('active') }} as active,
    cast(estimate as {{ dbt_utils.type_string() }}) as estimate,
    resetoption,
    {{ cast_to_boolean('includenonbillable') }} as includenonbillable,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('projects_timeestimate_ab1') }}
-- timeestimate at projects/timeEstimate
where 1 = 1

