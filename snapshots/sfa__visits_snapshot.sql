{% snapshot sfa__visits_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key="concat(Country_Code, OlCard_id)",
            updated_at="DLM",
        )
    }}

    select *
    from {{ source("sfa", "dbo_OutLetCardH_v") }}

{% endsnapshot %}
