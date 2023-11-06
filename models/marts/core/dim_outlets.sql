{{
    config(
        materialized = 'table'
    )
}}


with outlet as (
    select * from {{ ref('stg_sfa__outlets_v') }}
),

custom_field as (
    select * from {{ ref('stg_sfa__outlet_custom_fields_v')}}
),

organizational_structure as (
    select * from {{ ref('stg_sfa__organization_structures_v') }}
),

final as (
    select
        outlet.outlet_name,
        outlet.outlet_id,
        outlet.outlet_adress,
        outlet.outlet_email,
        outlet.country_id,
        outlet.outlet_sap_code,
        outlet.outlet_director, 
        outlet.outlet_trading_name,
        outlet.outlet_delivery_adress,
        custom_field.sortiment_type,
        custom_field.visit_cycle,
        custom_field.visit_frequency,
        custom_field.visit_days,
        custom_field.pricelist_id,
        custom_field.additional_name,
        custom_field.payer

    from 
        outlet
    left join
        custom_field
        on outlet.outlet_id = custom_field.outlet_id

    -- Pridat org. structure
)

select * from final
