with source as (
    select * from {{ ref('sfa__visit_inaccessibility_reasons_snapshot') }}
),

renamed as (
    select
        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Reason_id"]) }} as inaccessibility_reason_id,       
        {{ adapter.quote("Reason_id") }} as inaccessibility_reason_key,

        {{ adapter.quote("ExternalCode") }} as inaccessibility_reason_external_code,
        
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("Reason") }} as inaccessibility_reason,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  numerics
        {{ adapter.quote("Status") }} as status,
        {{ adapter.quote("ULM") }} as ulm,

        ----------  booleans

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as dbt_valid_from,
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to

        ----------  omited
        --{{ adapter.quote("IsLegal") }},



    from source
)

select * from renamed
