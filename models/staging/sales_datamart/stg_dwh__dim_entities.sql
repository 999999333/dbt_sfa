with source as (
      select * from {{ source('pbi', 'dim_Entity') }}
),
renamed as (
    select
        {{ adapter.quote("Entity_Id") }} as entity_id,
        {{ adapter.quote("Country_Id") }} as country_id,
        {{ adapter.quote("Entity_SAP_Code") }} as entity_sap_code

    from source
)
select * from renamed
  