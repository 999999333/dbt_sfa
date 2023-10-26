{% snapshot sfa__product_groups_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, ProdGroup_ID)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_ProductGroups_v") }}

{% endsnapshot %}
