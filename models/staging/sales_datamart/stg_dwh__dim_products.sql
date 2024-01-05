with source as (
      select * from {{ source('pbi', 'dim_Product') }}
),
renamed as (
    select
        {{ adapter.quote("Product_Id") }} as product_id,
        {{ adapter.quote("SKU_Code") }} as sku_code

    from source
)
select * from renamed
  