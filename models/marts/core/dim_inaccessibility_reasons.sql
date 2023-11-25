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
        --dbt_scd_id,
        inaccessibility_reason_id,
        inaccessibility_reason,
        country_id,
        country_code,
        inaccessibility_reason_external_code
    from
        inaccessibility_reason
    where
        dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)
)

select *
from final
