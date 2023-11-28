with responded_on_visit as (
    select * from {{ ref('stg_sfa__questionnaire_responded_on_visit') }}
),

response_text as (
    select * from {{ ref('stg_sfa__questionnaire_response_texts') }}
),

sfa_file as (
    select * from {{ ref('stg_sfa__files_v') }}
),

response_image as (
    select * from {{ ref('stg_sfa__questionnaire_response_images_v') }}
),

first_image as (
    select
    questionnaire_response_id,
    sfa_file_id,
    image_id
    from (
        select
            questionnaire_response_id,
            sfa_file_id,
            image_id,
            step,
            image_id,
            row_number() over (partition by sfa_file_id order by step) as rown 
        from response_image
    ) as subquery
    where rown = 1
),

final as (
    select 
        first_image.questionnaire_response_id,
        sfa_file.country_code,
        sfa_file.sfa_file_key,
        sfa_file.sfa_file_name,
        sfa_file.sfa_file_id,
        sfa_file.sfa_file_name_unique,
        sfa_file.comment,
        sfa_file.is_edited,
        sfa_file.content_file_key
        

    from 
    first_image
    left join sfa_file
    on first_image.sfa_file_id = sfa_file.sfa_file_id
)

final as (
    select
        responded_on_visit.visit_id,
        responded_on_visit.visit_key,
        responded_on_visit.questionnaire_response_id,
        responded_on_visit.questionnaire_response_key,
        responded_on_visit.country_id,

        coalesce(response_text.question_id, response_image.question_id) as question_id,
        response_text.questionnaire_answer,
        response_text.questionnaire_answer_external_code,

        response_image.sfa_file_id as image_id,
        coalesce(
            response_image.sfa_file_id,
            {{ dbt_utils.generate_surrogate_key(["questionnaire_answer_step", "response_text.question_id", "responded_on_visit.questionnaire_response_id"]) }}
            )  as sfa_file_id,
        response_image.question_id as image_question_id
    from
    responded_on_visit

    left join response_image
    on responded_on_visit.questionnaire_response_id = response_image.questionnaire_response_id
)


select * from final