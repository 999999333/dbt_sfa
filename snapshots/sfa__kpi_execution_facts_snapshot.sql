{% snapshot sfa__kpi_execution_facts_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, KpiId, OlCard_id)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "ps_KPIExecutionFact_v") }}

{% endsnapshot %}
