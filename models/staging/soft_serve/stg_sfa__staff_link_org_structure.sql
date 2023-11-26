with source as (
      select * from {{ source('sfa', 'dbo_StaffOrganizationalStructureLinksActive') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Staff_id") }} as staff_key,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,
        {{ adapter.quote("StartDate") }},
        {{ adapter.quote("EndDate") }},
        {{ adapter.quote("IsMain") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("RecordNumber") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  