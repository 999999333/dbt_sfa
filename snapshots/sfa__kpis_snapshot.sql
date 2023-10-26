{% snapshot sfa__kpis_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, KpiId)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "ps_KPI_v") }}

{% endsnapshot %}
