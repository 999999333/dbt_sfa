with source as (
      select * from {{ source('sfa', 'ps_KPIExecutionFact') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("KpiId") }},
        {{ adapter.quote("VersionId") }},
        {{ adapter.quote("OlCard_id") }},
        {{ adapter.quote("Date") }},
        {{ adapter.quote("OL_ID") }},
        {{ adapter.quote("OrgStructureID") }},
        {{ adapter.quote("Fact") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  