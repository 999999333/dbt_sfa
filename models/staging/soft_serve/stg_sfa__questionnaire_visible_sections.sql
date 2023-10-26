with source as (
      select * from {{ source('sfa', 'dbo_QuestionnaireVisibleSections') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Response_Id") }},
        {{ adapter.quote("Section_Id") }},
        {{ adapter.quote("StepNumber") }},
        {{ adapter.quote("IsVisible") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  