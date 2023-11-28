with source as (
    select * from {{ source('sfa', 'ps_KPIExecutionPlan_v') }}
),

renamed as (
    select
    
        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "KpiId"]) }} as kpi_id,
        {{ adapter.quote("KpiId") }} as kpi_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OL_ID"]) }} as outlet_id,
        {{ adapter.quote("OL_ID") }} as outlet_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "KpiId", "OL_ID"]) }} as kpi_outlet_id,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  strings
        {{ adapter.quote("PlanValue") }} as plan_value,

        ----------  numerics
        {{ adapter.quote("Status") }} as status,

        ----------  booleans

        ----------  timestamps
        {{ adapter.quote("DateFrom") }} as date_from,
        {{ adapter.quote("DateTo") }} as date_to,
        {{ adapter.quote("DLM") }} as dlm
    
        ----------  omited

--        {{ adapter.quote("Valid_From") }},
--        {{ adapter.quote("Valid_To") }}

    from source
)

select * from renamed
  