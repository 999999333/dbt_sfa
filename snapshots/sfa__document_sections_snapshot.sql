{% snapshot sfa__document_sections_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, Section_ID)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_DocumentSections_v") }}

{% endsnapshot %}
