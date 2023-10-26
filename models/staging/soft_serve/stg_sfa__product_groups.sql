with source as (
      select * from {{ source('sfa', 'dbo_ProductGroups') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("ProdGroup_ID") }},
        {{ adapter.quote("ProdGroupName") }},
        {{ adapter.quote("ProdGroupShortName") }},
        {{ adapter.quote("SortOrder") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("IsConcurrent") }},
        {{ adapter.quote("ProdCategory_ID") }},
        {{ adapter.quote("ProdGroupCode") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  