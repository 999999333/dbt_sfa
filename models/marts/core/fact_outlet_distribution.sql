with outlet_distribution as (
    select * from {{ ref('stg_sfa__outlet_distributions')}}
),

product as (
    select * from {{ ref('stg_sfa__products')}}
),

final as (
    select 
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
    left join
        product
    on outlet_distribution.product_id = product.product_id

    
)

select * from final