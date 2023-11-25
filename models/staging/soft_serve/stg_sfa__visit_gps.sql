with source as (
    select * from {{ source('sfa', 'dbo_OutletCardGPS_v') }}
),

renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OLCard_id"]) }} as visit_id,
        {{ adapter.quote("OLCard_id") }} as visit_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,
        ----------  strings

        ----------  numerics
        {{ adapter.quote("Latitude") }} as visit_start_latitude,
        {{ adapter.quote("Longitude") }} as visit_start_longtitude,
        {{ adapter.quote("FinishLatitude") }} as visit_finish_latitude,
        {{ adapter.quote("FinishLongitude") }} as visit_finish_longtitude,

        ----------  booleans
        {{ adapter.quote("isFake") }} as is_fake_gps

        ----------  timestamps
        -- {{ adapter.quote("Valid_From") }} as valid_from,
        -- {{ adapter.quote("Valid_To") }} as valid_to

        ----------  omited
        -- {{ adapter.quote("DLM") }},

    from source
)

select * from renamed
