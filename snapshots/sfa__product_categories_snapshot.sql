{% snapshot sfa__product_categories_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, ProdCategory_ID)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_ProductCategory_v") }}

{% endsnapshot %}
