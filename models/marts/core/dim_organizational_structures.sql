{{
    config(
        materialized = 'table'
    )
}}

with org_structure as (
    select * from {{ ref('stg_sfa__organizational_structures') }}
),

staff_link_org_structure as (
    select * from {{ ref('stg_sfa__staff_link_org_structure') }}
),

staff as (
    select * from {{ ref('stg_sfa__staff') }}
),

final as (
    select
        structure_whole_node_tree

    from
        org_structure
        left join
            staff_link_org_structure
            on org_structure
)

select * from final