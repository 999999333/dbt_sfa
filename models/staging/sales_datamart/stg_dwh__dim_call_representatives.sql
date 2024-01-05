with source as (
      select * from {{ source('pbi', 'dim_Call_Representative') }}
),
renamed as (
    select
        {{ adapter.quote("Call_Representative_Id") }},
        {{ adapter.quote("Country_Id") }},
        {{ adapter.quote("Call_Representative_Label") }},
        {{ adapter.quote("Call_Representative_Route_Type_Label") }}

    from source
)
select * from renamed
  