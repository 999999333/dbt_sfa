{{
    config(
        materialized='incremental',
        unique_key='visit_id'
    )
}}

with visit as (
    select * from {{ ref('stg_sfa__visits') }}
),

final as (
    select 
        ----------  ids
        visit_id,
        visit_key,
        country_id,
        country_code,
        inaccessibility_reason_id,
        outlet_id,
        route_id,
        organizational_structure_id,
        customer_id,

        ----------  strings
        visit_comment,

        ----------  numerics
        visit_start_distance,
        visit_end_distance,
        visit_duration_sec,

        ----------  booleans
        is_quick_order,

        ----------  timestamps
        visit_date,
        visit_start_time,
        visit_end_time
    

    from visit

    where

    {% if is_incremental() %}
        visit_date >= (select max(this.visit_date)from {{ this }} as this) 
        and

    {% endif %}

    dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)

)

select * from final