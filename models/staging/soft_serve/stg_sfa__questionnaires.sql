with source as (
    select * from {{ ref('sfa__documents_snapshot') }}
),

renamed as (
    select

        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Document_ID"]) }} as questionnaire_id,
        {{ adapter.quote("Document_ID") }} as questionnaire_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("Name") }} as questionnaire_name,
        {{ adapter.quote("Details") }} as questionnaire_details,
        {{ adapter.quote("Country_Code") }} as country_code,
        {{ adapter.quote("ExternalCode") }} as questionnaire_external_code,

        ----------  numerics
        {{ adapter.quote("PassScore") }} as questionnaire_pass_score,
        {{ adapter.quote("Status") }} as questionnaire_status,

        ----------  booleans

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as dbt_valid_from,
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- {{ adapter.quote("HighlightColor") }},
        -- {{ adapter.quote("ClearPreFilledResponses") }},
        -- {{ adapter.quote("ResetPreFieldResponses") }},
        -- {{ adapter.quote("UseContentMDB") }},
        -- {{ adapter.quote("UseContentCDB") }},
        -- {{ adapter.quote("ULM") }} as document_ulm,
        -- {{ adapter.quote("DocumentClassificationId") }} as document_classification_id,
        -- {{ adapter.quote("DocumentLinkStandartDocumentItemId") }} as document_link_standard_document_id,
        -- {{ adapter.quote("StandartDocumentItemId") }} as document_standard_document_id,
        -- {{ adapter.quote("DisplayLastResponseDate") }} as is_display_last_response_date,
        -- {{ adapter.quote("PromoActivities_ID") }} as promo_activities_key,
        -- {{ adapter.quote("ActivityId") }} as activity_id,

    from source
)
select * from renamed
  