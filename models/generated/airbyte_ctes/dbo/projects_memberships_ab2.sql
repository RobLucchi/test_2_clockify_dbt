{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('projects_memberships_ab1') }}
select
    _airbyte_projects_hashid,
    cast(userid as {{ dbt_utils.type_string() }}) as userid,
    costrate,
    cast(targetid as {{ dbt_utils.type_string() }}) as targetid,
    hourlyrate,
    cast(membershiptype as {{ dbt_utils.type_string() }}) as membershiptype,
    cast(membershipstatus as {{ dbt_utils.type_string() }}) as membershipstatus,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('projects_memberships_ab1') }}
-- memberships at projects/memberships
where 1 = 1

