with source as (
    select * from {{ source('sfa', 'dbo_Warehouses') }}
),

renamed as (
    select
    
        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "W_id", "Valid_From"]) }} as _id,
        {{ adapter.quote("W_id") }} as warehouse_id,
        {{ adapter.quote("WType_id") }} as warehouse_type_id,
        {{ adapter.quote("Cust_id") }} as customer_id,

        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("W_ExternalCode") }} as warehouse_external_code,
        {{ adapter.quote("W_ShortName") }} as warehouse_short_name,
        {{ adapter.quote("W_LongName") }} as warehouse_long_name,
        {{ adapter.quote("Address") }} as warehouse_address,
        {{ adapter.quote("Email") }} as warehouse_email,


        ----------  numerics
        {{ adapter.quote("DeliveryDelay") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("ULM") }},

        ----------  booleans
        {{ adapter.quote("StockAccounting") }},
        {{ adapter.quote("StockManagement") }},
        {{ adapter.quote("StockOrder") }},
        {{ adapter.quote("LotAccounting") }},
        {{ adapter.quote("StockNegative") }},
        {{ adapter.quote("CountHolidaysForDelivery") }},

        ----------  timestamps
        {{ adapter.quote("StartingStockDate") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Valid_From") }} as valid_from,
        {{ adapter.quote("Valid_To") }} as valid_to

        ----------  omited
        -- {{ adapter.quote("Priority") }},

    from source
)

select * from renamed
