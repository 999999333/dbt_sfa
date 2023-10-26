{{
    config(
        materialized = 'table'
    )
}}

with inaccessibility_reason as (
    select * from {{ ref('stg_sfa__visit_inaccessibility_reasons') }}

),

final as (
    select
        dbt_scd_id as inaccessibility_reason_id,
        inaccessibility_reason,
        country_id,
        country_code,
        inaccessibility_reason_external_code,
        dbt_valid_from,
        dbt_valid_to
    from
        inaccessibility_reason
)

select *
from final
