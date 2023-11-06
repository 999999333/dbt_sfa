{{
    config(
        materialized = 'table'
    )
}}


with outlet_distribution as (
    select * from {{ ref('stg_sfa__outlet_distributions')}}
),

product as (
    select * from {{ ref('stg_sfa__products')}}
),

visit as (
    select * from {{ ref('stg_sfa__visits_v')}}
),

final as (
    select 
        visit.visit_date,
        visit.outlet_id,
        outlet_distribution.visit_id,
        outlet_distribution.product_id,
        outlet_distribution.country_id,
        product.product_name,
        product.is_pos_material,
        product.product_code,
        outlet_distribution.is_present,
        outlet_distribution.price

    from
        outlet_distribution
    left outer join
        product
        on outlet_distribution.product_id = product.product_id
    left outer join
        visit
        on outlet_distribution.visit_id = visit.visit_id

    
)

select * from final