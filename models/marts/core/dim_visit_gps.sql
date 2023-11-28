{{
    config(
        materialized = 'table'
    )
}}

with visit_gps as (
    select * from {{ ref('stg_sfa__visit_gps') }}
),

final as (
    select
        visit_id,
        visit_key,
        country_id,
        country_code,
        visit_start_latitude,
        visit_start_longtitude,
        visit_finish_latitude,
        visit_finish_longtitude,
        is_fake_gps,
        dlm

    from
        visit_gps
)

select * from final