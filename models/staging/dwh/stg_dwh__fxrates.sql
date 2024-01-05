with source as (
      select * from {{ source('core', 'FXR_AVG_vs_BGT_Main_Currency_v') }}
),
renamed as (
    select
        {{ adapter.quote("Calendar_Id") }} as calendar_id,
        {{ adapter.quote("Currency_Id_Buy") }} as from_currency_id,
        {{ adapter.quote("Currency_Id_Sell") }} as to_currency_id,
        {{ adapter.quote("Rate") }} as fx_rate

    from source
)
select * from renamed
  