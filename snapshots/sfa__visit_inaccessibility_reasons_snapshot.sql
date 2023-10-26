{% snapshot sfa__visit_inaccessibility_reasons_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, Reason_id)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_InaccessibilityReasons_v") }}

{% endsnapshot %}