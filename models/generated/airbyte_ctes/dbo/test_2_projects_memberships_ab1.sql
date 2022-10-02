{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ ref('test_2_projects') }}
{{ unnest_cte(ref('test_2_projects'), 'test_2_projects', 'memberships') }}
select
    _airbyte_test_2_projects_hashid,
    {{ json_extract_scalar(unnested_column_value('memberships'), ['userId'], ['userId']) }} as userid,
    {{ json_extract('', unnested_column_value('memberships'), ['costRate']) }} as costrate,
    {{ json_extract_scalar(unnested_column_value('memberships'), ['targetId'], ['targetId']) }} as targetid,
    {{ json_extract('', unnested_column_value('memberships'), ['hourlyRate']) }} as hourlyrate,
    {{ json_extract_scalar(unnested_column_value('memberships'), ['membershipType'], ['membershipType']) }} as membershiptype,
    {{ json_extract_scalar(unnested_column_value('memberships'), ['membershipStatus'], ['membershipStatus']) }} as membershipstatus,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_2_projects') }} as table_alias
-- memberships at test_2_projects/memberships
{{ cross_join_unnest('test_2_projects', 'memberships') }}
where 1 = 1
and memberships is not null

