with source as (
      select * from {{ source('sfa', 'dbo_MobileModuleUserTimeTrack_v') }}
),
renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "MobileModuleUserID"]) }} as mobile_user_id,
        {{ adapter.quote("MobileModuleUserID") }} as mobile_user_key,
        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  strings
        {{ adapter.quote("StartLatitude") }} as start_latitude,
        {{ adapter.quote("StartLongitude") }} as start_longitude,
        {{ adapter.quote("EndLatitude") }} as end_latitude,
        {{ adapter.quote("EndLongitude") }} as end_longitude,

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        cast({{ adapter.quote("Date") }} as date) as day_date,
        cast({{ adapter.quote("StartTime") }} as time(2)) as day_start_time,
        cast({{ adapter.quote("EndTime") }} as time(2)) as day_end_time

        ----------  omited
--        {{ adapter.quote("DLM") }}

    from source
)
select * from renamed
  