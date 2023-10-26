{% snapshot sfa__staff_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, Staff_id)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_Staff_v") }}

{% endsnapshot %}
