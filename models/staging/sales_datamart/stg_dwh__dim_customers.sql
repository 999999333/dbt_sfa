with source as (
      select * from {{ source('pbi', 'dim_Customer') }}
),
renamed as (
    select
        {{ adapter.quote("Customer_Id") }},
        {{ adapter.quote("Customer_Segment_Id") }},
        {{ adapter.quote("Country_Id") }},
        {{ adapter.quote("Customer_Country_Id") }},
        {{ adapter.quote("Route_Id_Sales") }},
        {{ adapter.quote("Route_Id_Telesales") }},
        {{ adapter.quote("Customer_Label") }},
        {{ adapter.quote("Zip_Code") }},
        {{ adapter.quote("City") }},
        {{ adapter.quote("Address") }},
        {{ adapter.quote("Seasonal_Customer") }},
        {{ adapter.quote("VAT_Number") }},
        {{ adapter.quote("Customer_Source_Code") }},
        {{ adapter.quote("Customer_Source_Id") }},
        {{ adapter.quote("Customer_Source_Logical_Id") }}

    from source
)
select * from renamed
  