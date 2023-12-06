with responded_on_visit as (
    select * from {{ ref('stg_sfa__questionnaire_responded_on_visit') }}
),

response_text as (
    select * from {{ ref('stg_sfa__questionnaire_response_texts') }}
),

response_image as (
    select * from {{ ref('stg_sfa__questionnaire_response_images') }}
),

final as (
    select

        responded_on_visit.visit_id,
        responded_on_visit.visit_key,
        responded_on_visit.questionnaire_response_id,
        responded_on_visit.questionnaire_response_key,
        responded_on_visit.country_id,

        response_image.question_id as question_id,
        response_image.sfa_file_id as image_id,
        response_image.question_id as image_question_id

    from
    responded_on_visit
    left join response_image
    on responded_on_visit.questionnaire_response_id = response_image.questionnaire_response_id

)


select * from final