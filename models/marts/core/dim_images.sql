with sfa_file as (
    select * from {{ ref('stg_sfa__files') }}
),

response_image as (
    select * from {{ ref('stg_sfa__questionnaire_response_images') }}
),

final as (
    select 
        response_image.questionnaire_response_id,
        sfa_file.country_code,
        sfa_file.sfa_file_key,
        sfa_file.sfa_file_name,
        sfa_file.sfa_file_id,
        sfa_file.sfa_file_name_unique,
        sfa_file.comment,
        sfa_file.is_edited,
        sfa_file.content_file_key
        

    from 
    sfa_file
    left join response_image
    on sfa_file.sfa_file_id = response_image.sfa_file_id
)

select * from final