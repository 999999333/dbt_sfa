{{
    config(
        materialized='table'
    )
}}

with 
final as (
    {{ dbt_utils.union_relations(
        relations=[
            ref('int_kmv_documents_closed_enhanced'),
            ref('int_kmv_documents_open_enhanced'),
            ref('int_pepsi_documents_closed_enhanced'),
            ref('int_pepsi_documents_open_enhanced')
            ]
        )
    }}
)

select * from final