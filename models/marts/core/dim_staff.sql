{{
    config(
        materialized = 'table'
    )
}}

with staff as (
    select * from {{ ref('stg_sfa__staff') }}
    where
    dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)
),

staff_link_org_structure as (
    select * from {{ ref('stg_sfa__staff_link_org_structures_v') }}
),

org_structure as (
    select * from {{ ref('stg_sfa__organization_structures_v') }}
),

final as (
    select


        staff.staff_position,
        staff.staff_comment,
        staff.staff_sap_code,



        ----------  ids
        staff.staff_id,
        staff.staff_key,

        staff.country_id,
        staff.country_code,

        staff_link_org_structure.organizational_structure_id,

        ----------  strings
        staff.staff_name_whole,
        staff.staff_name_first,
        staff.staff_name_last,
        staff.staff_email,
        staff.staff_telephone,        

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited



    from
    staff
    left join
    staff_link_org_structure
    on staff.staff_id = staff_link_org_structure.staff_id
)

select * from final