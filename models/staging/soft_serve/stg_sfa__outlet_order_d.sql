with source as (
      select * from {{ source('sfa', 'dbo_OutletOrderD') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OrderNo") }},
        {{ adapter.quote("Product_id") }},
        {{ adapter.quote("Price") }},
        {{ adapter.quote("Product_qty") }},
        {{ adapter.quote("Discount") }},
        {{ adapter.quote("IsReturnable") }},
        {{ adapter.quote("VAT") }},
        {{ adapter.quote("Recommend_qty") }},
        {{ adapter.quote("BasePrice") }},
        {{ adapter.quote("ConsumerUnitId") }},
        {{ adapter.quote("InitialProductId") }},
        {{ adapter.quote("PromoActivities_ID") }},
        {{ adapter.quote("ReturnReasonId") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  