{% snapshot sfa__warehouses_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key="concat(Country_Code, W_id)",
            updated_at="DLM",
        )
    }}

    select *
    from {{ source("sfa", "dbo_Warehouses_v") }}

{% endsnapshot %}
