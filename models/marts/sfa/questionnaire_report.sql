{{
    config(
        materialized = 'table'
    )
}}

with response as (
    select * from {{ ref('fact_questionnaire_responses') }}
),

question as (
    select * from {{ ref('dim_questions') }}
),

visit as (
    select * from {{ ref('fact_visit') }}
),

final as (
    select 
    response.visit_id,
    response.questionnaire_answer,
    visit.visit_date,
    response.visit_key,
    response.country_id,
    question.questionnaire,
    question.section,
    question.question

    from response
    left join question
    on response.question_id = question.question_id
    left join visit
    on response.visit_id = visit.visit_id

)

select * from final