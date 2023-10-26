with source as (
    select * from {{ ref('sfa__questionnare_responses_snapshot') }}
),

renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Response_ID"]) }} as link_id,
        {{ adapter.quote("Response_ID") }} as questionnaire_response_id,
        {{ adapter.quote("Document_ID") }} as questionnaire_id,
        {{ adapter.quote("SourceResponse_ID") }} as questionnaire_source_response_id,
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to

        ----------  omited
        -- {{ adapter.quote("Status") }},
        -- {{ adapter.quote("IsProcessed") }},
        -- {{ adapter.quote("DLM") }},

    from source
)

select * from renamed
