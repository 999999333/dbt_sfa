with source as (
    select * from {{ ref('sfa__document_sections_snapshot') }}
),
renamed as (
    select

        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Section_ID"]) }} as questionnaire_section_id,
        {{ adapter.quote("Section_ID") }} as questionnaire_section_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ParentSection_ID"]) }} as questionnaire_section_parent_id,
        {{ adapter.quote("ParentSection_ID") }} as questionnaire_section_parent_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Document_ID"]) }} as questionnaire_id,
        {{ adapter.quote("Document_ID") }} as questionnaire_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "BO_ID"]) }} as questionnaire_section_bo_id,
        {{ adapter.quote("BO_ID") }} as questionnaire_section_bo_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("Name") }} as questionnaire_section_name,
        {{ adapter.quote("ExternalCode") }} as questionnaire_section_external_code,

        ----------  numerics
        {{ adapter.quote("Level") }} as questionnaire_section_level,
        {{ adapter.quote("SortOrder") }} as questionnaire_section_sort_order,
        {{ adapter.quote("GroupingType") }} as questionnaire_section_grouping_type,
        {{ adapter.quote("Status") }} as questionnaire_section_status,

        ----------  booleans
        {{ adapter.quote("IsCallButton") }} as is_call_button,
        {{ adapter.quote("IsPhotoReport") }} as is_photo_report,

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as dbt_valid_from,
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to

        ----------  omited
        -- {{ adapter.quote("HReport_ID") }} as questionnaire_group_id,
        -- {{ adapter.quote("ULM") }},
        -- {{ adapter.quote("RandomQuestionsNumber") }},
        -- {{ adapter.quote("EnableCopy") }} as is_enabled_copy,
        -- {{ adapter.quote("ShootingAngle") }},



    from source
)
select *
from renamed
