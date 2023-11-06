{{
    config(
        materialized = 'table'
    )
}}


with product as (
    select * from {{ ref('stg_sfa__products')}}
)

select * from product