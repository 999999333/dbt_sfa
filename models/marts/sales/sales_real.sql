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

pepsi_open as (
    select * from {{ ref('int_pepsi_documents_open_enhanced') }}
),

pepsi_closed as (
    select * from {{ ref('int_pepsi_documents_closed_enhanced') }}
),

final as (
    {{ dbt_utils.union_relations(
        relations=[
            ref('int_kmv_documents_closed_enhanced'),
            ref('int_kmv_documents_open_enhanced'),
            ref('int_pepsi_documents_closed_enhanced'),
            ref('int_pepsi_documents_open_enhanced'),
            ]
        )
    }}
    


)

select * from final