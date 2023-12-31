{{
    config(
        materialized='incremental',
        unique_key='outlet_id'
    )
}}


with outlet as (
    select * from {{ ref('stg_sfa__outlets') }}
),

custom_field as (
    select * from {{ ref('stg_sfa__outlet_custom_fields_v')}}
),

organizational_structure as (
    select * from {{ ref('stg_sfa__organization_structures_v') }}
),

final as (
    select
        
        ----------  ids
        outlet.outlet_id,
        outlet.organizational_structure_id,
        custom_field.pricelist_id,

        outlet.country_id,
        outlet.country_code,

        ----------  strings
        outlet.outlet_name,
        outlet.outlet_adress,
        outlet.outlet_sap_code,
        outlet.outlet_email,
        outlet.outlet_director,
        outlet.outlet_trading_name,
        outlet.outlet_delivery_adress,
        custom_field.sortiment_type,
        custom_field.additional_name,
        custom_field.payer,
        organizational_structure.structure_whole_node_tree,
        organizational_structure.structure_name_detail,

        ----------  numerics
        custom_field.visit_cycle,
        custom_field.visit_frequency,
        custom_field.visit_days,

        ----------  booleans

        ----------  timestamps
        outlet.dlm
    
        ----------  omited


        






    from 
        outlet
    left join
        custom_field
        on outlet.outlet_id = custom_field.outlet_id
    left join 
        organizational_structure
        on outlet.organizational_structure_id = organizational_structure.organizational_structure_id
    
    where

    {% if is_incremental() %}
        outlet.dlm >= (select max(this.dlm) from {{ this }} as this) 
        and

    {% endif %}

    outlet.dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)
)

select * from final
