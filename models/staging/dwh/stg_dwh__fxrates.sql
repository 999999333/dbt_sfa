with source as (
      select * from {{ source('core', 'FXR_AVG_vs_BGT_Main_Currency_v') }}
),
renamed as (
    select
        {{ adapter.quote("Calendar_Id") }},
        {{ adapter.quote("Data_Source") }},
        {{ adapter.quote("FXR_Type_Id") }},
        {{ adapter.quote("FXR_Type_Label") }},
        {{ adapter.quote("Currency_Id_Buy") }},
        {{ adapter.quote("Currency_Code_Buy") }},
        {{ adapter.quote("Currency_Id_Sell") }},
        {{ adapter.quote("Currency_Code_Sell") }},
        {{ adapter.quote("Rate") }}

    from source
)
select * from renamed
  