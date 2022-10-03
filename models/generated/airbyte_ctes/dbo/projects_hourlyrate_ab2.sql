{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('projects_hourlyrate_ab1') }}
select
    _airbyte_projects_hashid,
    cast(amount as {{ dbt_utils.type_bigint() }}) as amount,
    cast(currency as {{ dbt_utils.type_string() }}) as currency,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('projects_hourlyrate_ab1') }}
-- hourlyrate at projects/hourlyRate
where 1 = 1

