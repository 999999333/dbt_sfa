{% snapshot sfa__kpi_execution_plans_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, KpiId, OL_ID, DateFrom)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "ps_KPIExecutionPlan_v") }}

{% endsnapshot %}
