{{
    config(
        materialized = 'table'
    )
}}

with visit as (
    select * from {{ ref('stg_sfa__visits') }}
),

visit_with_db_ids as (
    select * from {{ ref('int_visit_with_db_ids') }}
),

visit_gps as (
    select * from {{ ref('stg_sfa__visit_gps') }}
)

final as (
    select 
        visit_with_db_ids.visit_id,
        visit_with_db_ids.country_id,
        visit_with_db_ids.visit_key,
        visit_with_db_ids.inaccessibility_reason_key,
        visit_gps.visit_start_latitude,
        visit_gps.visit_start_longtitude,
        visit_gps.visit_finish_latitude,
        visit_gps.visit_finish_longtitude,
        visit_gps.is_fake_gps

    from visit_with_db_ids

    left join visit_gps
        on visit_with_db_ids.visit_key = visit_gps.visit_key

)

select * from final