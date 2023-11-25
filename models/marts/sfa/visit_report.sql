{{
    config(
        materialized = 'table'
    )
}}


with visit as (
    select * from {{ ref('stg_sfa__visits') }}

),

visit_with_db_ids as (
    select * from {{ ref('fact_visit') }}

),

organizational_structure as (
    select * from {{ ref('stg_sfa__organization_structures') }}
),

inaccessibility_reason as (
    select * from {{ ref('stg_sfa__visit_inaccessibility_reasons') }}

),

outlet as (
    select * from {{ ref('stg_sfa__outlets') }}

),

final as (
    select
        visit.country_id,
        visit.visit_id,
        visit.visit_key,
        visit.visit_date,
        organizational_structure.structure_whole_node_tree,
        organizational_structure.structure_name_detail,
        -- outlet.outlet_name,
        -- outlet.outlet_sap_code,
        visit.visit_start_time,
        visit.visit_end_time,
        visit.visit_start_distance,
        visit.visit_end_distance,
        visit.is_quick_order,
        -- inaccessibility_reason.inaccessibility_reason,
        -- inaccessibility_reason.inaccessibility_reason_key,
        visit.route_id


        -- visit_with_db_ids.organizational_structure_key as org_struct_key,      
        -- visit.visit_key,
        -- organizational_structure.dbt_scd_id as organizational_structure_key,
        -- outlet.dbt_scd_id as outlet_key,
        -- inaccessibility_reason.dbt_scd_id as inaccessibility_reason_key,
        -- organizational_structure.structure_name,
        -- visit.outlet_id,



    from

    visit_with_db_ids
    left join visit
    on visit_with_db_ids.visit_id = visit.visit_id
    left join organizational_structure
    on visit_with_db_ids.organizational_structure_key = organizational_structure.dbt_scd_id
    -- left join inaccessibility_reason
    -- on visit_with_db_ids.inaccessibility_reason_key = inaccessibility_reason.dbt_scd_id
    -- left join outlet
    -- on visit_with_db_ids.outlet_key = outlet.dbt_scd_id

)

select * from final