with source as (
      select * from {{ source('sfa', 'ps_KPI') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("KpiId") }},
        {{ adapter.quote("ParentId") }},
        {{ adapter.quote("ActivityType") }},
        {{ adapter.quote("Name") }},
        {{ adapter.quote("Comment") }},
        {{ adapter.quote("ExternalCode") }},
        {{ adapter.quote("Type") }},
        {{ adapter.quote("Level") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  