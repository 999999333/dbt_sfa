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
 
--Table without photo responses--
(
SELECT
    v.Visit_ID,
	r.Response_ID,
	v.Country_Code,
	s.Name AS Section,
	--q.item_id,
	--r.Item_ID,
    q.displayvalue AS Question,
	r.ResponseValue AS Response,
	Photo_Link = 'n/a'
    --q.section_id
 
FROM
L01_stage.sfa.dbo_DocumentItems_v q
 
LEFT JOIN L01_Stage.sfa.dbo_ResponsesSingleD_v r
ON q.item_id = r.Item_ID
 
LEFT JOIN L01_Stage.sfa.dbo_DocumentSections_v s
ON q.Section_ID = s.Section_ID
 
LEFT JOIN L01_Stage.sfa.dbo_QuestionnaireResponseOnVisit_v v
ON r.Response_ID = v.Response_ID
AND r.Country_Code = v.Country_Code
 
WHERE r.ResponseValue IS NOT NULL
 
 
UNION ALL
 
--Add Table with photo responses--
 
SELECT
	v.Visit_ID,
	r.Response_ID,
	v.Country_Code,
    --q.item_id,
	--r.object_id,
	s.Name AS Section,
    q.displayvalue AS Question,
	Response = 'Photo',
	CONCAT ('https://mattonicz.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=',c.ContentFileID)AS Photo_Link
    --q.section_id,
 
FROM
L01_stage.sfa.dbo_DocumentItems_v q
 
LEFT JOIN L01_stage.sfa.dbo_ResponsesSingleContentD_v r
ON q.item_id = r.object_id
 
LEFT JOIN l01_stage.sfa.dbo_ContentFiles_v AS c
ON r.contentid = c.contentid
 
LEFT JOIN L01_Stage.sfa.dbo_DocumentSections_v s
ON q.Section_ID = s.Section_ID
 
LEFT JOIN L01_Stage.sfa.dbo_QuestionnaireResponseOnVisit_v v
ON r.Response_ID = v.Response_ID
AND r.Country_Code = v.Country_Code
WHERE c.ContentFileID IS NOT NULL
 
) AS unioned
 