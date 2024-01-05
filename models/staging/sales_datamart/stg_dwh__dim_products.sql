with source as (
      select * from {{ source('core', 'dim_Product') }}
),
renamed as (
    select
        {{ adapter.quote("Product_Id") }},
        {{ adapter.quote("SKU_Code") }},
        {{ adapter.quote("SKU_Label") }},
        {{ adapter.quote("Product_Planning_Base_Id") }},
        {{ adapter.quote("Product_Planning_Base_Label") }},
        {{ adapter.quote("Product_Planning_Base_Code") }},
        {{ adapter.quote("Product_Planning_Base_Order") }},
        {{ adapter.quote("Segment") }},
        {{ adapter.quote("Brand_Segment") }},
        {{ adapter.quote("Category") }},
        {{ adapter.quote("Category_Order") }},
        {{ adapter.quote("Subcategory") }},
        {{ adapter.quote("Subcategory_Order") }},
        {{ adapter.quote("Contract_Portfolio") }},
        {{ adapter.quote("Brand_Owner") }},
        {{ adapter.quote("Brand") }},
        {{ adapter.quote("Brand_Order") }},
        {{ adapter.quote("Brand_Full") }},
        {{ adapter.quote("Brand_Plan") }},
        {{ adapter.quote("Brand_Plan_Order") }},
        {{ adapter.quote("SubBrand") }},
        {{ adapter.quote("SubBrand_Order") }},
        {{ adapter.quote("BrandLine") }},
        {{ adapter.quote("Flavour_Name") }},
        {{ adapter.quote("Format") }},
        {{ adapter.quote("Format_Order") }},
        {{ adapter.quote("Size_Format") }},
        {{ adapter.quote("Case_Size_Name") }},
        {{ adapter.quote("Package_Format") }},
        {{ adapter.quote("Package_Size_Name") }},
        {{ adapter.quote("Package_Size") }},
        {{ adapter.quote("Package_Size_Unit") }},
        {{ adapter.quote("Sugar") }}

    from source
)
select * from renamed
  