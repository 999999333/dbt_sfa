with source as (
      select * from {{ source('core', 'Currency_c') }}
),
renamed as (
    select
        {{ adapter.quote("Currency_Id") }} as currency_id,
        {{ adapter.quote("Currency_Code") }} as currency_code

    from source
)
select * from renamed
  