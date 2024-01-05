with source as (
      select * from {{ source('pbi', 'dim_Country') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Id") }},
        {{ adapter.quote("Country_Label") }},
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Currency_Id") }},
        {{ adapter.quote("Mattoni_Entity_flag") }},
        {{ adapter.quote("Mattoni_Market_flag") }}

    from source
)
select * from renamed
  