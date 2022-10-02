{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_2_projects_estimate_ab1') }}
select
    _airbyte_test_2_projects_hashid,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(estimate as {{ dbt_utils.type_string() }}) as estimate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_projects_estimate_ab1') }}
-- estimate at test_2_projects/estimate
where 1 = 1

