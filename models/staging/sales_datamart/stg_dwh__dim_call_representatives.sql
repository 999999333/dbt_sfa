with source as (
      select * from {{ source('pbi', 'dim_Call_Representative') }}
),
renamed as (
    select
        {{ adapter.quote("Call_Representative_Id") }} as call_representative_id,
        {{ adapter.quote("Call_Representative_Label") }} as call_representative_label

    from source
)
select * from renamed
  