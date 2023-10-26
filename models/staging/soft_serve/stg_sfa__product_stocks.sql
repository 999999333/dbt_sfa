with source as (
    select * from {{ source('sfa', 'dbo_ProductStocks') }}
),

renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("W_id") }},
        {{ adapter.quote("Product_id") }},
        {{ adapter.quote("Stock") }},
        {{ adapter.quote("Required") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("StockEditAdd") }},
        {{ adapter.quote("StockEditTotal") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)

select * from renamed
