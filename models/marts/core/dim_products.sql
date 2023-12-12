{{
    config(
        materialized = 'table'
    )
}}


with product as (
    select * from {{ ref('stg_sfa__products_v')}}
),

final as (
    select
                
        ----------  ids
        product_id,
        product_type_id,

        ----------  strings
        product_name,
        product_name_short,
        product_sap_code,
        unit_weight,

        ----------  numerics
        package_quantity,
        ean_code,
        status,

        ----------  booleans
        is_pos_material

        ----------  timestamps
    
        ----------  omited


    from
        product
)

select * from final