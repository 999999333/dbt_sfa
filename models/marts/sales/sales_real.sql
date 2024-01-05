{{
    config(
        materialized='view'
    )
}}

with kmv_open as (
    select * from {{ ref('int_kmv_documents_open_enhanced') }}
),

kmv_closed as (
    select * from {{ ref('int_kmv_documents_closed_enhanced') }}
),

final as (

    select * from kmv_open

    union all

    select * from kmv_closed
)

select * from final