{{
    config(
        materialized = 'table'
    )
}}

with mobile as (
    select * from {{ ref('stg_sfa__mobile_users_v') }}
)

select * from mobile