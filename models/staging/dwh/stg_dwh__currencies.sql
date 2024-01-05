with source as (
      select * from {{ source('core', 'Currency_c') }}
),
renamed as (
    select
        {{ adapter.quote("Currency_Id") }},
        {{ adapter.quote("Currency_Code") }},
        {{ adapter.quote("Currency_Label") }},
        {{ adapter.quote("Mattoni_Main_Currency_flag") }},
        {{ adapter.quote("FXR_Calculation_flag") }}

    from source
)
select * from renamed
  