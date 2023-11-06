{{ config(
    materialized = "view"
) }}

with source as (

    select * from {{ ref('sfa__customers_snapshot') }}
),

renamed as (
    select


        {{ adapter.quote("ULM") }} as ulm,
        {{ adapter.quote("DesktopOutletMinValue") }},
        {{ adapter.quote("DesktopOutletCurrentValue") }},
        {{ adapter.quote("DesktopOutletMaxValue") }},
        {{ adapter.quote("DesktopOrderMinValue") }},
        {{ adapter.quote("DesktopOrderCurrentValue") }},
        {{ adapter.quote("DesktopOrderMaxValue") }},



        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Cust_Id", "dbt_valid_from"]) }} as _id,
        {{ adapter.quote("Cust_Id") }} as customer_id,

        {{ adapter.quote("OL_id") }} as outlet_id,
        {{ adapter.quote("ExternalCode") }} outlet_external_code,
        {{ adapter.quote("DB_ID") }} as database_id,
        {{ adapter.quote("GeographyID") }} as geography_id,
        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,
        {{ adapter.quote("City_Id") }} as city_id,
        {{ adapter.quote("Distr_id") }} as distributor_id,
        {{ adapter.quote("Area_ID") }} as area_id,
        {{ adapter.quote("WarehouseBaseID") }} as warehouse_base_id,


        ----------  strings
        {{ adapter.quote("Cust_NAME") }} as customer_name,
        {{ adapter.quote("Cust_TradingName") }} as customer_trading_name,
        {{ adapter.quote("ZKPO") }} as zkpo,
        {{ adapter.quote("MFO") }} as mfo,
        {{ adapter.quote("Bank_Account") }} as bank_account,
        {{ adapter.quote("TAX_Number") }} as tax_number,
        {{ adapter.quote("VAT_Number") }} as vat_number,
        {{ adapter.quote("Cust_Address") }} as customer_adress,
        {{ adapter.quote("Cust_TradingAddress") }} as customer_trading_address,
        {{ adapter.quote("Bank_Name") }} as bank_name,
        {{ adapter.quote("DIRECTOR") }} as director,
        {{ adapter.quote("Email") }} as email,
        {{ adapter.quote("Phone") }} as phone,
        {{ adapter.quote("TradingPhone") }} as trading_phone,
        {{ adapter.quote("Comments") }} as comments,
        {{ adapter.quote("Passwd") }} as password,

        ----------  numerics
        {{ adapter.quote("Status") }} as status,
        cast({{ adapter.quote("PayFormMinValue") }} as INT) as payform_min_value,
        cast({{ adapter.quote("PayFormCurrentValue") }} as INT) as payform_current_value,
        cast({{ adapter.quote("PayFormMaxValue") }} as INT) as payform_max_value,
        cast({{ adapter.quote("DiscountMinValue") }} as INT) as discount_min_value,
        cast({{ adapter.quote("DiscountCurrentValue") }} as INT) as discount_current_value,
        cast({{ adapter.quote("DiscountMaxValue") }} as INT) as discount_max_value,
        
        ----------  booleans
        {{ adapter.quote("IsBlocked") }},
        {{ adapter.quote("Is2LevelMode") }},
        {{ adapter.quote("IsInExchangeEquipment") }},

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as valid_from,
        {{ adapter.quote("dbt_valid_to") }} as valid_to
        
        ----------  omited
        -- {{ adapter.quote("MerchMinValue") }},
        -- {{ adapter.quote("MerchMaxValue") }},
        -- {{ adapter.quote("DesktopRouteMinValue") }},
        -- {{ adapter.quote("DesktopRouteCurrentValue") }},
        -- {{ adapter.quote("DesktopRouteMaxValue") }},
        -- {{ adapter.quote("DesktopVisitMinValue") }},
        -- {{ adapter.quote("DesktopVisitCurrentValue") }},
        -- {{ adapter.quote("DesktopVisitMaxValue") }},
        -- {{ adapter.quote("CheckSchedule") }},
        -- {{ adapter.quote("IEConfiguration") }},
        -- {{ adapter.quote("SalesOrgCode") }},
        -- {{ adapter.quote("SyncInProgress") }},
        -- {{ adapter.quote("LastSyncDateTime") }},
        -- {{ adapter.quote("RenewSupervisorPasswd") }},
        -- {{ adapter.quote("RenewAdminPasswd") }},



    from
        source
)

select *
from
    renamed
