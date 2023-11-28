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

first_image as (
    select
    questionnaire_response_id,
    sfa_file_id,
    image_id
    from (
        select
            questionnaire_response_id,
            sfa_file_id,
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

select * from final