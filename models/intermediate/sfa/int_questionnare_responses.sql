{{
    config(
        materialized = 'view'
    )
}}

with questionnaire_response as (
    select * from {{ ref('stg_sfa__questionnaire_responses') }}
),

questionnare_responded_on_visit as (
    select * from {{ ref('stg_sfa__questionnaire_responded_on_visit') }}

),

final as (
    select
    questionnaire_response_id
    from
    questionnare_responded_on_visit

)

select * from final