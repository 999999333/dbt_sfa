with source as (
      select * from {{ source('sfa', 'dbo_ProductCategory') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("ProdCategory_ID") }},
        {{ adapter.quote("ProdCategoryName") }},
        {{ adapter.quote("ProdCategoryShortName") }},
        {{ adapter.quote("SortOrder") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("IsConcurrent") }},
        {{ adapter.quote("ProdCategoryCode") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  