{{
    config(
        materialized = 'table'
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

        ----------  booleans
        is_quick_order,

        ----------  timestamps
        visit_date,
        visit_start_time,
        visit_end_time
    







    from visit

    where
    dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)

)

select * from final