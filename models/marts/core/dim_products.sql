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
        product_id,
        product_type_id,
        product_sap_code,
        product_name,
        product_name_short,
        unit_weight,
        package_quantity,
        ean_code,
        status,
        is_pos_material

    from
        product
)

select * from final