with source as (
      select * from {{ source('sap', 'customer_now_dvt_c_hv') }}
),
renamed as (
    select
        {{ adapter.quote("customer_id") }} as customer_id,
        {{ adapter.quote("customer_code") }} as customer_code

    from source
)
select * from renamed
  