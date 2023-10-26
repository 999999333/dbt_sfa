{% snapshot sfa__visit_gps_snapshot %}

    {{
        config(
            target_schema="snapshots",
            strategy="timestamp",
            unique_key = 'concat(Country_Code,OLCard_id)',
            updated_at="DLM",
        )
    }}

    select 
    *
    from {{ source("sfa", "dbo_OutletCardGPS_v") }}

{% endsnapshot %}