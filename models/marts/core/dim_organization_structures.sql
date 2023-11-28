{{
    config(
        materialized = 'table'
    )
}}

with org_structure as (
    select * from {{ ref('stg_sfa__organization_structures_v') }}
),

final as (
    select
        org_structure.organizational_structure_id,
        org_structure.structure_node_key,
        org_structure.structure_node_level,
        org_structure.structure_node_tree_hierarchy,
        org_structure.country_id,
        org_structure.country_code,
        org_structure.structure_whole_node_tree,
        org_structure.structure_name,
        org_structure.structure_telephone,
        org_structure.structure_email,
        org_structure.structure_name_detail

    from
        org_structure
)

select * from final