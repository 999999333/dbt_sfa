with source as (
      select * from {{ source('sfa', 'dbo_OutletCardSteps') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OlCard_Id") }},
        {{ adapter.quote("Step_No") }},
        {{ adapter.quote("Step_ID") }},
        {{ adapter.quote("Step_Detail") }},
        {{ adapter.quote("Step_Begin_DateTime") }},
        {{ adapter.quote("Step_End_DateTime") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  