with source as (
      select * from {{ source('pbi', 'dim_Entity') }}
),
renamed as (
    select
        {{ adapter.quote("Entity_Id") }},
        {{ adapter.quote("Entity_Code") }},
        {{ adapter.quote("Entity_Label") }},
        {{ adapter.quote("Country_Id") }},
        {{ adapter.quote("Entity_PA_Code") }},
        {{ adapter.quote("Group_Name") }},
        {{ adapter.quote("Entity_SAP_Code") }}

    from source
)
select * from renamed
  