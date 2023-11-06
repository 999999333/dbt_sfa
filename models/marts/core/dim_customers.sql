with customer as (
    select * from {{ ref('stg_sfa__customers') }}
),

final as (

    select
        ----------  ids
        dbt_scd_id as customer_id,
        outlet_external_code,
        country_id,
        country_code,

        ----------  strings
        customer_name,
        customer_trading_name,
        zkpo,
        mfo,
        tax_number,
        vat_number,
        customer_adress,
        email,
        phone,
        trading_phone,
        comments,
        password,

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        valid_from,
        valid_to    

        ----------  omited

    from customer
)

select * from final