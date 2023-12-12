{{
    config(
        materialized = 'table'
    )
}}

with questionnaire_base as (
    select * from {{ ref('stg_sfa__questionnaires') }}

),

questionnaire as (

   {{ get_latest_version(
        "questionnaire_base", 
            [
            'questionnaire_id',
            'questionnaire_external_code',
            'questionnaire_details',
            'questionnaire_name',
            'questionnaire_status'
            ]
        )
    }}
   
),

questionnaire_section_base as (
    select * from {{ ref('stg_sfa__questionnaire_sections') }}

),

questionnaire_section as (

   {{ get_latest_version(
        "questionnaire_section_base", 
            [
            'questionnaire_section_id',
            'questionnaire_section_external_code',
            'questionnaire_section_name',
            'questionnaire_section_status',
            'questionnaire_id'
            ]
        )
    }}
),        

questionnaire_item_base as (
    select * from {{ ref('stg_sfa__questionnaire_items') }}

),

questionnaire_item as (
    {{ get_latest_version(
        "questionnaire_item_base", 
            [
            'questionnaire_question_id',
            'questionnaire_section_id',
            'country_id',
            'country_code',
            'questionnaire_question_external_code',
            'questionnaire_question',
            'questionnaire_question_status',
            'questionnaire_question_sort_order',
            'questionnaire_question_weight',
            'questionnaire_question_is_read_only',
            'questionnaire_question_is_distribution'
            ]
        )
    }}
),

final as (
    select
        ----------  ids
        questionnaire_item.questionnaire_question_id as question_id,
        questionnaire_item.country_id as country_id,
        questionnaire_item.country_code as country_code,

        ----------  strings
        questionnaire.questionnaire_external_code as questionnaire_external_code,
        questionnaire_section.questionnaire_section_external_code as section_external_code,
        questionnaire_item.questionnaire_question_external_code as question_external_code,

        questionnaire.questionnaire_details as questionnaire_details,


        case
            when questionnaire.questionnaire_name like N'1 Druhotné vystavenie%'
            then N'1 Druhotné vystavenie'
            when questionnaire.questionnaire_name like N'2. Druhotné vystavení pro TT%'
            then N'd'
            when questionnaire.questionnaire_name like N'2. Druhotné vystavení pro MT%'
            then N'2. Druhotné vystavení pro MT'
            when questionnaire.questionnaire_name like '2. On-top%'
            then '2. On-top'
            when questionnaire.questionnaire_name like N'2. Pillér form MT%'
            then N'2. Pillér form MT'
            when questionnaire.questionnaire_name like N'2. Pillér form SF%'
            then N'2. Pillér form SF'
            when questionnaire.questionnaire_name like '6. On-Top MT%'
            then '6. On-Top MT'
            when questionnaire.questionnaire_name like '6. On-Top TT%'
            then '6. On-Top TT'
            else questionnaire.questionnaire_name
            
        end as questionnaire,

        questionnaire_section.questionnaire_section_name as section,
        questionnaire_item.questionnaire_question as question,

        ----------  numerics
        questionnaire.questionnaire_status as questionnaire_status,
        questionnaire_section.questionnaire_section_status as section_status,
        questionnaire_item.questionnaire_question_status as question_status,

        questionnaire_item.questionnaire_question_sort_order as question_sort_order,
        questionnaire_item.questionnaire_question_weight as weight,

        ----------  booleans
        questionnaire_item.questionnaire_question_is_read_only as is_read_only,
        questionnaire_item.questionnaire_question_is_distribution as is_distibution

        ----------  timestamps

        ----------  omited


    from questionnaire_item
    
    left join questionnaire_section
    on questionnaire_item.questionnaire_section_id = questionnaire_section.questionnaire_section_id

    left join questionnaire
    on questionnaire_section.questionnaire_id = questionnaire.questionnaire_id
)


--  -- questionnaire_item as (
--  --     select * from {{ ref('stg_sfa__questionnaire_items') }}
--  -- 
--  -- ),
--  -- 
--  final as (
--      select 
--   
--      from questionnaire
--      
--      left join questionnaire_section
--      on questionnaire.questionnaire_id = questionnaire_section.questionnaire_id
--  
--  )

select * from final