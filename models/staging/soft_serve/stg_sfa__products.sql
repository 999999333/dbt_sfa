with source as (
      select * from {{ source('sfa', 'dbo_Products') }}
),
renamed as (
    select
        {{ adapter.quote("ProductType_Id") }},
        {{ adapter.quote("Unit_Id") }},
        {{ adapter.quote("UnitWeight") }},
        {{ adapter.quote("Package_QTY") }},
        {{ adapter.quote("SortOrder") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
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
        {{ adapter.quote("EANCode") }},
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
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Product_id"]) }} as product_id,
        {{ adapter.quote("Product_Id") }} as product_key,

        {{ adapter.quote("ProductCode") }} as product_code,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  strings
        {{ adapter.quote("ProductName") }} as product_name,
        {{ adapter.quote("ProductShortName") }} as product_name_short,

        ----------  numerics

        ----------  booleans
        {{ adapter.quote("IsPosm") }} as is_pos_material,

        ----------  timestamps
    
        ----------  omited
        {{ adapter.quote("ULM") }},


    from source
)
select * from renamed
  