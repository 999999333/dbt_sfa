with source as (
      select * from {{ source('sfa', 'dbo_OutletCardStartEndImages') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OLCard_ID") }},
        {{ adapter.quote("ImageID") }},
        {{ adapter.quote("ImageName") }},
        {{ adapter.quote("Image") }},
        {{ adapter.quote("IsStartImage") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("PhotoTypeId") }},
        {{ adapter.quote("Comment") }},
        {{ adapter.quote("IsChecked") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  