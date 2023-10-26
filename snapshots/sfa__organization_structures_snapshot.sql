{% snapshot sfa__organization_structures_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code, OrgStructureID)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_OrganizationalStructure_v") }}

{% endsnapshot %}
