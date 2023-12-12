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

        ----------  ids
        visit_id,
        visit_key,
        
        country_id,
        country_code,

        ----------  strings

        ----------  numerics
        visit_start_latitude,
        visit_start_longtitude,
        visit_finish_latitude,
        visit_finish_longtitude,

        ----------  booleans
        is_fake_gps,

        ----------  timestamps
        dlm
        ----------  omited

    from
        visit_gps
)

select * from final