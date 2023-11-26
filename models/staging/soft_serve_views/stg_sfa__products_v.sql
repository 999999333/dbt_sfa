with source as (
      select * from {{ source('sfa', 'dbo_Products_v') }}
),

renamed as (
    select
       
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Price") }},
        {{ adapter.quote("IsMix") }},
        {{ adapter.quote("IsTare") }},
        {{ adapter.quote("Tare_Id") }},
        {{ adapter.quote("TarePack_Qty") }},
        {{ adapter.quote("IsReturnable") }},
        {{ adapter.quote("IsConcurrent") }},
        {{ adapter.quote("ProductVolume") }},
        {{ adapter.quote("IsProductWeight") }},
        {{ adapter.quote("CertificateNo") }},
        {{ adapter.quote("CertificateBeginDate") }},
        {{ adapter.quote("CertificateEndDate") }},
        {{ adapter.quote("HLCode") }},
        {{ adapter.quote("IsBonuse") }},
        {{ adapter.quote("LicenseType_ID") }},
        {{ adapter.quote("ProductBrand_ID") }},
        {{ adapter.quote("Delisted") }},
        {{ adapter.quote("Quant_Qty") }},
        {{ adapter.quote("ProductCode2") }},
        {{ adapter.quote("SyncToDDB") }},
        {{ adapter.quote("ServiceBit") }},
        {{ adapter.quote("IsPromotional") }},
        {{ adapter.quote("IsLinkedToAllCustomers") }},
        {{ adapter.quote("FrontWidth") }},
        {{ adapter.quote("FrontHeight") }},
        {{ adapter.quote("HasActiveContentFile") }},
        {{ adapter.quote("IsSeasonal") }},
        {{ adapter.quote("IsBaseProduct") }},
        {{ adapter.quote("ForRecognition") }},
        {{ adapter.quote("IsExchangeBottle") }},


        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Product_Id"]) }} as product_id,
        {{ adapter.quote("Product_Id") }} as product_key,

        {{ adapter.quote("ProductCode") }} as product_sap_code,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ProductType_Id"]) }} as product_type_id,
        {{ adapter.quote("ProductType_Id") }} as product_type_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Unit_Id"]) }} as product_unit_id,
        {{ adapter.quote("Unit_Id") }} as product_unit_key,


        ----------  strings
        {{ adapter.quote("ProductName") }} as product_name,
        {{ adapter.quote("ProductShortName") }} as product_name_short,
        {{ adapter.quote("EANCode") }} as ean_code,

        ----------  numerics
  
        {{ adapter.quote("UnitWeight") }} as unit_weight,
        {{ adapter.quote("Package_QTY") }} as package_quantity,
        {{ adapter.quote("SortOrder") }} as sort_order,
        {{ adapter.quote("Status") }} as status,

        ----------  booleans
        {{ adapter.quote("IsPosm") }} as is_pos_material
        ----------  timestamps

        ----------  omited
        -- {{ adapter.quote("ULM") }}


    from source
)

select * from renamed
