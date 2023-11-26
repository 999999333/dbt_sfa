with source as (
    select * from {{ source('sfa', 'dbo_OutletDistribution_v') }}
),

renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OLCard_ID", "Product_id"]) }} as distribution_id,
        
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OLCard_ID"]) }} as visit_id,
        {{ adapter.quote("OLCard_ID") }} as visit_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Product_id"]) }} as product_id,
        {{ adapter.quote("Product_id") }} as product_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings

        ----------  numerics
        {{ adapter.quote("Price") }} as price,
        ----------  booleans
        case
            when {{ adapter.quote("IsPresent") }} = '1' then 1
            else 0
        end as is_present,
        {{ adapter.quote("IsSetup") }} as is_setup

        ----------  timestamps

        ----------  omited
        -- {{ adapter.quote("OutOfStockReason") }},        

    from source
)

select * from renamed
