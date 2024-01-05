with source as (
      select * from {{ source('pbi', 'dim_Country') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Id") }} as country_id,
        {{ adapter.quote("Currency_Id") }} as currency_id

    from source
)
select * from renamed
  