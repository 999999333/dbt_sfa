with source as (
    select * from {{ source('sfa', 'dbo_QuestionnaireResponseOnVisit_v') }}
),

renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Visit_ID"]) }} as visit_id,
        {{ adapter.quote("Visit_ID") }} as visit_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Response_ID"]) }} as questionnaire_response_id,
        {{ adapter.quote("Response_ID") }} as questionnaire_response_key,
    
        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_key

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps

        ----------  omited
        -- {{ adapter.quote("Valid_From") }},
        -- {{ adapter.quote("Valid_To") }}
        
    from source
)

select * from renamed
