{{
    config(
        materialized = 'table'
    )
}}

with mobile_tracking as (
    select * from {{ ref('stg_sfa__mobile_day_tracking_v') }}
),

start_coordinates as (
    select
        mobile_user_id,
        day_date,
        day_start_time,
        day_end_time,
        start_latitude as latitude,
        start_longitude as longtitude,
        'start' as geotype

    from 
        mobile_tracking
),

end_coordinates as (
    select
        mobile_user_id,
        day_date,
        day_start_time,
        day_end_time,
        end_latitude as latitude,
        end_longitude as longtitude,
        'end' as geotype

    from 
        mobile_tracking
),

final as (
    select *
    from start_coordinates

    union

    select *
    from end_coordinates

)

select * from final