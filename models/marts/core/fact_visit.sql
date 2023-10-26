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

final as (
    select 
        visit_with_db_ids.visit_id,
        visit_with_db_ids.country_id,
        visit_with_db_ids.visit_key,
        visit_with_db_ids.inaccessibility_reason_key

    from visit_with_db_ids

)

select * from final