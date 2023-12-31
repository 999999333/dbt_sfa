{{
    config(
        materialized = 'table'
    )
}}

with customer as (
    select * from {{ ref('stg_sfa__customers') }}
),

final as (

    select
        ----------  ids
        customer_id,
        country_id,
        country_code,

        ----------  strings
        customer_name,
        customer_trading_name

        ----------  numerics

        ----------  booleans

        ----------  timestamps   

        ----------  omited

    from customer
    
    where
        dbt_valid_to >= cast('{{ var("future_proof_date") }}' as datetime2)
)

select * from final