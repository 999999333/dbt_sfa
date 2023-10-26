with source as (
    select * from {{ source('sfa', 'dbo_OutletDistribution') }}
),

renamed as (
    select

        ----------  ids
        {{ generate_surrogate_key("OLCard_ID", "Valid_To") }},
        {{ adapter.quote("OLCard_ID") }} as visit_id,
        {{ adapter.quote("Product_id") }} as product_id,
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings

        ----------  numerics

        ----------  booleans
        {{ adapter.quote("IsPresent") }},

        ----------  timestamps
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

        ----------  omited
        -- {{ adapter.quote("Price") }},
        -- {{ adapter.quote("IsSetup") }},
        -- {{ adapter.quote("OutOfStockReason") }},        

    from source
)

select * from renamed
