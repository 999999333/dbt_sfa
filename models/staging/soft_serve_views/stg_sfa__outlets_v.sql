with source as (
      select * from {{ source('sfa', 'dbo_OutLets_v') }}
),
renamed as (
    select


        {{ adapter.quote("Status") }},
        {{ adapter.quote("OLCode") }},
        {{ adapter.quote("Proximity") }},
        {{ adapter.quote("Location") }},
        {{ adapter.quote("VisitFrequency") }},
        {{ adapter.quote("OL_Code") }}  as outlet_sap_code,
        {{ adapter.quote("BankCode") }},
        {{ adapter.quote("BankName") }},
        {{ adapter.quote("BankAddress") }},
        {{ adapter.quote("ContractNumber") }},
        {{ adapter.quote("ContractDate") }},
        {{ adapter.quote("CreationDate") }},
        {{ adapter.quote("Cust_id") }},
        {{ adapter.quote("CPCode") }},
        {{ adapter.quote("DC_Allow") }},
        {{ adapter.quote("OLDistributionCentre") }},
        {{ adapter.quote("OlDistributionShare") }},
        {{ adapter.quote("DC_Delivery") }},
        {{ adapter.quote("DC_Payer") }},
        {{ adapter.quote("LicenseUsage") }},
        {{ adapter.quote("Appartments") }},
        {{ adapter.quote("KLADR_ID") }},
        {{ adapter.quote("ContractDateFinish") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("SaleType") }},
        {{ adapter.quote("DeliveryDelay") }},
        {{ adapter.quote("DeactivateDate") }},
        {{ adapter.quote("InactivationCandidate") }},

        {{ adapter.quote("PrevOL_Code") }},
        {{ adapter.quote("PostalCode") }},
        {{ adapter.quote("KOATUU") }},
        {{ adapter.quote("OutletParsingAddressId") }},
        {{ adapter.quote("ReturnOrderOnly") }},

        ----------  ids
        
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OL_id"]) }} as outlet_id,
        {{ adapter.quote("OL_id") }} as outlet_key,

        {{ adapter.quote("OLSubType_id") }} as outlet_subtype_id,
        {{ adapter.quote("Area_id") }} as area_id,
        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Network_ID") }} as network_id,
        {{ adapter.quote("VisitRate_id") }} as visit_rate_id,
        {{ adapter.quote("Owner_id") }} as owner_id,
        {{ adapter.quote("ParentComp_id") }} as parent_company_id,
        {{ adapter.quote("Cust_id") }} as customer_id,
        {{ adapter.quote("AT_ID") }} as at_id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as organizational_structure_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,

        {{ adapter.quote("GeographyID") }} as geography_id,
        {{ adapter.quote("ExternalFormat_ID") }} as external_format_id,
        {{ adapter.quote("HouseId") }} as house_id,

        ----------  strings
        {{ adapter.quote("OLName") }} as outlet_name,
        {{ adapter.quote("OLTradingName") }} as outlet_trading_name,
        {{ adapter.quote("OLDirector") }} as outlet_director,
        {{ adapter.quote("OLAddress") }} as outlet_adress,
        {{ adapter.quote("OLDeliveryAddress") }} as outlet_delivery_adress,
        {{ adapter.quote("OLTelephone") }} as outlet_telephone,
        {{ adapter.quote("OLFax") }} as outlet_fax,
        {{ adapter.quote("OLEMail") }} as outlet_email,
        {{ adapter.quote("OLAccountant") }} as outlet_accountant,
        {{ adapter.quote("OLAccountantPhone") }} as outlet_accountant_phone,
        {{ adapter.quote("OLMarkManager") }} as outlet_marketing,
        {{ adapter.quote("OLMarkManagerPhone") }} as outlet_marketing_phone,
        {{ adapter.quote("OLPurchManager") }} as outlet_purchasing,
        {{ adapter.quote("ZKPO") }},
        {{ adapter.quote("IPN") }},
        {{ adapter.quote("VATN") }},
        {{ adapter.quote("Block") }},
        {{ adapter.quote("BlockLetter") }},
        {{ adapter.quote("HouseLetter") }},
        {{ adapter.quote("Place") }},
        {{ adapter.quote("Comment") }} as outlet_comment,
        {{ adapter.quote("CloseReason") }},


        ----------  numerics

        ----------  booleans
        {{ adapter.quote("HasCoordinates") }} as has_coordinates,


        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm
        
        ----------  omited
        -- {{ adapter.quote("OLOpenTime") }},
        -- {{ adapter.quote("OLCloseTime") }},
        -- {{ adapter.quote("OLBreakTimeFrom") }},
        -- {{ adapter.quote("OLBreakTimeTo") }},
        -- {{ adapter.quote("RR") }},
        -- {{ adapter.quote("OLSize") }},
        -- {{ adapter.quote("OLWHSize") }},
        -- {{ adapter.quote("OLStockCoverDays") }},
        -- {{ adapter.quote("CashFlow_id") }},


    from source
)
select * from renamed
  