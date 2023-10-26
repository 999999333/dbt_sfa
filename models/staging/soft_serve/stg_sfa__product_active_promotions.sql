with source as (
      select * from {{ source('sfa', 'dbo_ProductPromotionActive') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Product_Id") }},
        {{ adapter.quote("ComponentId") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  