with source as (
      select * from {{ source('sfa', 'dbo_OrganizationalStructureGeographyLinksActive') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OrgStructureID") }},
        {{ adapter.quote("GeographyID") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  