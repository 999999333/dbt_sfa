with source as (
      select * from {{ source('sfa', 'dbo_HReports_v') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("HReport_ID") }},
        {{ adapter.quote("Name") }},
        {{ adapter.quote("Comment") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("IsPrintForm") }},
        {{ adapter.quote("IsRecalculated") }},
        {{ adapter.quote("Segment") }},
        {{ adapter.quote("ReportType") }},
        {{ adapter.quote("StoredProcText") }},
        {{ adapter.quote("DepthCalculation") }},
        {{ adapter.quote("ReportScript") }},
        {{ adapter.quote("IsWebPage") }},
        {{ adapter.quote("Url") }}

    from source
)
select * from renamed
  