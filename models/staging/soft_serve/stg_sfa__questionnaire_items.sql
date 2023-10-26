with source as (
    select * from {{ ref('sfa__document_items_snapshot') }}
),
renamed as (
    select

        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Item_ID"]) }} as questionnaire_question_id,
        {{ adapter.quote("Item_ID") }} as questionnaire_question_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Section_ID"]) }} as questionnaire_section_id,
        {{ adapter.quote("Section_ID") }} as questionnaire_section_key,
        
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "StandartDocumentItemId"]) }} as questionnaire_question_standard_id,
        {{ adapter.quote("StandartDocumentItemId") }} as questionnaire_question_standard_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "BO_ID"]) }} as questionnaire_question_bo_id,
        {{ adapter.quote("BO_ID") }} as questionnaire_question_bo_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  strings
        {{ adapter.quote("DisplayValue") }} as questionnaire_question,
        {{ adapter.quote("TargetValue") }} as questionnaire_question_target_value,

        ----------  numerics
        {{ adapter.quote("SortOrder") }} as questionnaire_question_sort_order,
        {{ adapter.quote("ExternalCode") }} as questionnaire_question_external_code, 
        {{ adapter.quote("QuestionWeight") }} as questionnaire_question_weight,
        {{ adapter.quote("Status") }} as questionnaire_question_status,
        {{ adapter.quote("ResponseFormat") }} as questionnaire_question_response_format,

        ----------  booleans

        {{ adapter.quote("UseResponseFromPreviousQuestionnaire") }}  as questionnaire_question_has_use_previous_answer,
        {{ adapter.quote("IsReadOnly") }} as questionnaire_question_is_read_only,
        {{ adapter.quote("Distribution") }} as questionnaire_question_is_distribution,

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as dbt_valid_from,
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to

        ----------  omited
        -- {{ adapter.quote("HighlightInColor") }},
        -- {{ adapter.quote("Hint") }},
        -- {{ adapter.quote("IsProhibitEditingPreviousAnswer") }},
        -- {{ adapter.quote("UsePreviousVisitContent") }},
        -- {{ adapter.quote("ULM") }},
        -- {{ adapter.quote("ControlType") }} as questionnaire_control_type,
        -- {{ adapter.quote("TotalType") }} as questionnaire_total_type,
        -- {{ adapter.quote("ValueType") }} as questionnaire_value_type,
        -- {{ adapter.quote("UseContentCDB") }} as questionnaire_,
        -- {{ adapter.quote("UseContentMDB") }} as questionnaire_,
        -- {{ adapter.quote("HasRestrictionRules") }} as questionnaire_,
        -- {{ adapter.quote("HasValidationRules") }} as questionnaire_,
        -- {{ adapter.quote("HasMobileContentRules") }} as questionnaire_,
        -- {{ adapter.quote("MDBContentCountLimit") }}  as questionnaire_question_,
        -- {{ adapter.quote("BarCodeScanning") }} as questionnaire_question_is_,


    from source
)
select * from renamed
  