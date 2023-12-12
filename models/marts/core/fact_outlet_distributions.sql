{{
    config(
        materialized='incremental',
        unique_key='distribution_id'
    )
}}



with outlet_distribution as (
    select * from {{ ref('stg_sfa__outlet_distributions_v')}}
),

product as (
    select * from {{ ref('stg_sfa__products_v')}}
),

visit as (
    select * from {{ ref('stg_sfa__visits')}}
),

final as (
    select 

        ----------  ids
        outlet_distribution.distribution_id,
        outlet_distribution.visit_id,
        outlet_distribution.product_id,
        visit.outlet_id,
        outlet_distribution.country_id,

        ----------  strings
        product.product_name,
        product.product_sap_code,

        ----------  numerics
        outlet_distribution.price,

        ----------  booleans
        product.is_pos_material,
        outlet_distribution.is_present,

        ----------  timestamps
        visit.visit_date
    
        ----------  omited

    from
        outlet_distribution
    left outer join
        product
        on outlet_distribution.product_id = product.product_id
    left outer join
        visit
        on outlet_distribution.visit_id = visit.visit_id

    where

    {% if is_incremental() %}
        visit.visit_date >= (select max(this.visit_date)from {{ this }} as this) 
        and

    {% endif %}

    visit.dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)
   
)

select * from final
