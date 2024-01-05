with source as (
      select * from {{ source('pbi', 'dim_Customer') }}
),
renamed as (
    select
        {{ adapter.quote("Customer_Id") }} as customer_id,
        {{ adapter.quote("Customer_Segment_Id") }} as customer_segment_id,
        {{ adapter.quote("Country_Id") }} as country_id,
        {{ adapter.quote("Customer_Source_Code") }} as customer_source_code

    from source
)
select * from renamed
  