{{
    config(
        materialized = 'table'
    )
}}

with outlet_distribution as (
    select
        visit_id,
        visit_date,
        outlet_id,
        product_id,
        country_id,
        product_name,
        is_pos_material,
        product_code,
        is_present,
        price,
        rank() over (partition by (outlet_id + product_id) order by visit_date desc) as visit_rank
    from
        {{ ref('fact_outlet_distribution')}}
    where
        visit_date >= dateadd(month, -2, getdate())
),

final as(
    select
        outlet_id,
        product_id,
        case
            when max(case when visit_rank <= 2 then is_present end) = '1' then 1
            else 0
        end as is_distributed
    from
        outlet_distribution
    group by
        outlet_id,
        product_id

)

select * from final