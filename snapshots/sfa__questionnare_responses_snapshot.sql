{% snapshot sfa__questionnare_responses_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, Response_ID)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_ResponsesH_v") }}

{% endsnapshot %}
