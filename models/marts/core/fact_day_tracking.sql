{{
    config(
        materialized = 'table'
    )
}}

with mobile_user as (
    select * from {{ ref('stg_sfa__mobile_users_v') }}
),

mobile_tracking as (
    select * from {{ ref('stg_sfa__mobile_day_tracking_v') }}
),

final as (
    select 
        mobile_user.organizational_structure_id,
        mobile_user.mobile_user_id,
        mobile_user.country_id,
        mobile_user.country_code,
        mobile_tracking.day_date,
        mobile_tracking.day_start_time,
        mobile_tracking.day_end_time,
        mobile_tracking.start_latitude,
        mobile_tracking.start_longitude,
        mobile_tracking.end_latitude,
        mobile_tracking.end_longitude


    from mobile_user

    left join mobile_tracking
        on mobile_user.mobile_user_id = mobile_tracking.mobile_user_id

)

select * from final