with source as (
    select * from {{ ref('stg_sfa__questionnaire_sections') }}
)

select * from source