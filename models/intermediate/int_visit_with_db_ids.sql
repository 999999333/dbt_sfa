{{
    config(
        materialized = 'table'
    )
}}

with visit as (
    select * from {{ ref('stg_sfa__visits') }}

),

organizational_structure as (
    select * from {{ ref('stg_sfa__organization_structures') }}
),

staff as (
    select * from {{ ref('stg_sfa__staff') }}
),

outlet as (
    select * from {{ ref('stg_sfa__outlets') }}
),

customer as (
    select * from {{ ref('stg_sfa__customers') }}
),

inaccessibility_reason as (
    select * from {{ ref('stg_sfa__visit_inaccessibility_reasons') }}

),



final as (
    select
        visit.visit_id, -- PRIDAT LOGIKU AT VYBERY JEN NEJNOVEJSI
        visit.visit_key,
        visit.visit_date,
        visit.country_id,
        organizational_structure.dbt_scd_id as organizational_structure_id,
        outlet.dbt_scd_id as outlet_id,
        inaccessibility_reason.dbt_scd_id as inaccessibility_reason_id,
        customer.dbt_scd_id as customer_id

        -- organizational_structure.structure_name,
        -- organizational_structure.structure_whole_node_tree,
        -- organizational_structure.structure_name_detail,
        -- visit.outlet_id,
        -- outlet.outlet_name,
        -- outlet.outlet_sap_code,
        -- visit.visit_start_time,
        -- visit.visit_end_time,
        -- visit.visit_start_distance,
        -- visit.visit_end_distance,
        -- visit.is_quick_order,
        -- inaccessibility_reason.inaccessibility_reason,
        -- visit.route_id



    from
        visit
        {{left_join_date_to_validity(
            "visit", 
            "organizational_structure_id",
            "visit_date",
            "organizational_structure",
            "organizational_structure_id",
            "dbt_valid_from",
            "dbt_valid_to"
        )}}

        {{left_join_date_to_validity(
            "visit",
            "outlet_id",
            "visit_date",
            "outlet",
            "outlet_id",
            "dbt_valid_from",
            "dbt_valid_to"
        )}}

        {{left_join_date_to_validity(
            "visit",
            "inaccessibility_reason_id",
            "visit_date",
            "inaccessibility_reason",
            "inaccessibility_reason_id",
            "dbt_valid_from",
            "dbt_valid_to"
        )}}

        {{left_join_date_to_validity(
            "visit",
            "customer_id",
            "visit_date",
            "customer",
            "customer_id",
            "dbt_valid_from",
            "dbt_valid_to"
        )}}

)

select * from final