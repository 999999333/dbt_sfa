{{
    config(
        materialized = 'table'
    )
}}

with sfa_file as (
    select * from {{ ref('stg_sfa__files_v') }}
),

response_image as (
    select * from {{ ref('stg_sfa__questionnaire_response_images_v') }}
),

responded_on_visit as (
    select * from {{ ref('stg_sfa__questionnaire_responded_on_visit') }}
),

question as (
    select * from {{ ref('dim_questions') }}
),

final as (
    select 
        responded_on_visit.visit_id,
        responded_on_visit.visit_key,
        response_image.question_id,
        sfa_file.country_code,
        sfa_file.sfa_file_id,
        sfa_file.sfa_file_name_unique,
        sfa_file.comment,
        sfa_file.is_edited,
        sfa_file.content_file_key,
        {{ dbt_utils.generate_surrogate_key(["responded_on_visit.visit_id", "question.section"]) }} as visit_question_id,
        CASE
            WHEN sfa_file.country_code = 'CZ' THEN
                CONCAT('https://mattonicz.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            WHEN sfa_file.country_code = 'HU' THEN
                CONCAT('https://mattonihu.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            WHEN sfa_file.country_code = 'SK' THEN
                CONCAT('https://mattonisk.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            ELSE
                NULL
        END AS image_url
        

    from 
    response_image
    left join sfa_file
    on response_image.sfa_file_id = sfa_file.sfa_file_id

    left join responded_on_visit
    on response_image.questionnaire_response_id = responded_on_visit.questionnaire_response_id

    left join question
    on response_image.question_id = question.question_id
)

select * from final