with source as (
      select * from {{ source('sfa', 'dbo_ResponsesSingleContentD_v') }}
),
renamed as (
    select
        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ContentID"]) }} as sfa_file_id,
        {{ adapter.quote("ContentID") }} as sfa_file_key,
    
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Response_ID", "Object_ID"]) }} as image_id,


        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Response_ID"]) }} as questionnaire_response_id,
        {{ adapter.quote("Response_ID") }} as questionnaire_response_key,
    
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Object_ID"]) }} as question_id,
        {{ adapter.quote("Object_ID") }} as question_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings

        ----------  numerics
        {{ adapter.quote("StepNumber") }} as step
        
        ----------  booleans

        ----------  timestamps
        -- {{ adapter.quote("Valid_From") }},
        -- {{ adapter.quote("Valid_To") }}

        ----------  omited
        -- {{ adapter.quote("EntityTypeID") }},


    from source
)
select * from renamed
  