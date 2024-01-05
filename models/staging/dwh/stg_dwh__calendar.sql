with source as (
      select * from {{ source('core', 'Calendar_v') }}
),
renamed as (
    select
        {{ adapter.quote("Calendar_Id") }} as calendar_id,
        cast(
            replace(
                cast({{ adapter.quote("Last_Of_Month") }} as varchar(10)),
                '-',
                '')
            as int) as last_of_month

    from source
)
select * from renamed
  