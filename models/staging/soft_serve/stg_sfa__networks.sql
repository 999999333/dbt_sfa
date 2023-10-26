with source as (
      select * from {{ source('sfa', 'dbo_Networks') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Network_id") }},
        {{ adapter.quote("Network_Name") }},
        {{ adapter.quote("Notes") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("AppliesToAllCities") }},
        {{ adapter.quote("NetworkType_ID") }},
        {{ adapter.quote("NetworkCode") }},
        {{ adapter.quote("JuridicalName") }},
        {{ adapter.quote("JuridicalAddress") }},
        {{ adapter.quote("GrdCode") }},
        {{ adapter.quote("NetworkLevel") }},
        {{ adapter.quote("OrgStructureID") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  