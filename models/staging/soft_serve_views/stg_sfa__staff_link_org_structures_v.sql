with source as (
      select * from {{ source('sfa', 'dbo_StaffOrganizationalStructureLinksActive_v') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as organizational_structure_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,
        
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Staff_id"]) }} as staff_id,
        {{ adapter.quote("Staff_id") }} as staff_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,
     
        {{ adapter.quote("StartDate") }} as link_start_date,
        {{ adapter.quote("EndDate") }} as link_end_date,
        {{ adapter.quote("IsMain") }} as is_main,
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("RecordNumber") }} as record_number

    from source
)

select * from renamed