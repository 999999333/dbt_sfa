with source as (
      select * from {{ source('sfa', 'ps_KPI') }}
),

renamed as (
    select
        {{ adapter.quote("Country_Code") }} as country_code,
        {{ adapter.quote("KpiId") }} as kpiid,
        {{ adapter.quote("ParentId") }} as parentid,
        {{ adapter.quote("ActivityType") }} as activitytype,
        {{ adapter.quote("Name") }} as name,
        {{ adapter.quote("Comment") }} as comment,
        {{ adapter.quote("ExternalCode") }} as externalcode,
        {{ adapter.quote("Type") }} as type,
        {{ adapter.quote("Level") }} as level,
        {{ adapter.quote("Status") }} as status,
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  