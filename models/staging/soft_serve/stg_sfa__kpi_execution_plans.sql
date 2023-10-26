with source as (
      select * from {{ source('sfa', 'ps_KPIExecutionPlan') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("KpiId") }},
        {{ adapter.quote("DateFrom") }},
        {{ adapter.quote("DateTo") }},
        {{ adapter.quote("OL_ID") }},
        {{ adapter.quote("PlanValue") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  