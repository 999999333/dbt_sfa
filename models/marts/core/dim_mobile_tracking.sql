{{
    config(
        materialized = 'table'
    )
}}

with mobile as (
    select * from {{ ref('stg_sfa__mobile_day_tracking_v') }}
)

select * from mobile