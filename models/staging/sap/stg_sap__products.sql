with source as (
      select * from {{ source('sap', 'product_now_dvt_c_hv') }}
),
renamed as (
    select
        {{ adapter.quote("Product_ID") }} as product_id,
        {{ adapter.quote("Local_SKU_ID") }} as local_sku_id,
        {{ adapter.quote("Material_Type_Code") }} as material_type_code

    from source
)
select * from renamed
  