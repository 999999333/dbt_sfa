with source as (
      select * from {{ source('sfa', 'dbo_ResponsesSingleD_v') }}
),
renamed as (
    select


       ----------  ids

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ResponseValueId"]) }} as questionnare_answer_id,
        {{ adapter.quote("ResponseValueId") }} as questionnare_answer_key,       

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Response_ID"]) }} as questionnaire_response_id,
        {{ adapter.quote("Response_ID") }} as questionnaire_response_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Item_ID"]) }} as question_id,
        {{ adapter.quote("Item_ID") }} as question_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,


        ----------  strings
        RIGHT({{ adapter.quote("ResponseValue") }}, LEN({{ adapter.quote("ResponseValue") }}) - 2) as questionnaire_answer,

        {{ adapter.quote("ExternalCode") }} as questionnaire_answer_external_code,

        ----------  numerics
        {{ adapter.quote("StepNumber") }} as questionnaire_answer_step,
        {{ adapter.quote("ScanMethod") }} as questionnaire_answer_scan_method

        ----------  booleans

        ----------  timestamps
        -- {{ adapter.quote("Valid_From") }},
        -- {{ adapter.quote("Valid_To") }}
        
        ----------  omited

 
    from source
)
select * from renamed
  