{% snapshot sfa__product_stocks_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, W_id, Product_id)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_ProductStocks_v") }}

{% endsnapshot %}
