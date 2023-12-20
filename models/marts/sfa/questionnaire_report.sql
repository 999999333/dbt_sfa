{{
    config(
        materialized = 'incremental',
        unique_key = 'visit_question_id'
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
    {{ dbt_utils.generate_surrogate_key(["response.visit_id", "question.section"]) }} as visit_question_id,
    response.questionnaire_answer,
    visit.visit_date,
    response.visit_key,
    response.country_id,
    response.questionnaire_answer_step,
    question.questionnaire,
    question.section,
    question.question

    from response
    left join question
    on response.question_id = question.question_id
    left join visit
    on response.visit_id = visit.visit_id

    {% if is_incremental() %}

        where visit_date > (select max(visit_date) from {{ this }})

    {% endif %}


)

select * from final