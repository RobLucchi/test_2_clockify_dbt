{{ config(
    schema = "_airbyte_dbo",
    tags = [ "nested-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('projects_hourlyrate_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_projects_hashid',
        'amount',
        'currency',
    ]) }} as _airbyte_hourlyrate_hashid,
    tmp.*
from {{ ref('projects_hourlyrate_ab2') }} tmp
-- hourlyrate at projects/hourlyRate
where 1 = 1

