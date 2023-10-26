{% docs dbt_scd_id %}
The system-generated surrogate key during snapshot.
{% enddocs %}

{% docs inaccessibility_reason_id %}
Identifier for the inaccessibility reason.
{% enddocs %}

{% docs inaccessibility_reason_external_code %}
External code related to the inaccessibility reason.
{% enddocs %}

{% docs country_id %}
The numerical ID associated with the country code, generated using the macro.
{% enddocs %}

{% docs inaccessibility_reason %}
Description of the inaccessibility reason.
{% enddocs %}

{% docs country_code %}
The original country code from the source data.
{% enddocs %}

{% docs sfa_status %}
Status indicator. `2` or `9` to be discovered what it means in real life.
{% enddocs %}

{% docs ulm %}
user_id, which made last modification to this entry
{% enddocs %}

{% docs dlm %}
Date of last modification
{% enddocs %}

{% docs dbt_valid_from %}
Start of the validity period for this record.
{% enddocs %}

{% docs dbt_valid_to %}
End of the validity period for this record, defaults to a future-proof date if not provided in the source.
{% enddocs %}

{% docs questionnaire_id %}
A surrogate key for the questionnaire, generated using a combination of the country code and document ID.
{% enddocs %}

{% docs questionnaire_key %}
The original Document_ID from the source table.
{% enddocs %}

{% docs questionnaire_question_id %}
A surrogate key for the questionnaire, generated using a combination of the country code and document item ID.
{% enddocs %}

{% docs questionnaire_question_key %}
The original Document_Item_ID from the source table.
{% enddocs %}

{% docs questionnaire_name %}
The name or title of the questionnaire.
{% enddocs %}

{% docs questionnaire_details %}
Detailed description or context related to the questionnaire.
{% enddocs %}

{% docs questionnaire_external_code %}
External code related to the questionnaire.
{% enddocs %}

{% docs questionnaire_pass_score %}
The passing score for the questionnaire, if applicable.
{% enddocs %}

{% docs questionnaire_status %}
Status indicator for the questionnaire.
{% enddocs %}

{% docs questionnaire_question_standard_id %}
Not used. A surrogate key for the question standard, generated using a combination of the country code and StandartDocumentItemId. 
{% enddocs %}

{% docs questionnaire_question_standard_key %}
Not used. The original StandartDocumentItemId from the source table.
{% enddocs %}

{% docs questionnaire_question %}
Question itself. The text of the question.
{% enddocs %}

{% docs questionnaire_question_target_value %}
The target or expected value for the questionnaire question.
{% enddocs %}

{% docs questionnaire_question_sort_order %}
The sort order of the question in its respective section or list.
{% enddocs %}

{% docs questionnaire_question_external_code %}
External **SAP code** related to the question. 
{% enddocs %}

{% docs questionnaire_question_weight %}
The weight or importance assigned to the question.
{% enddocs %}

{% docs questionnaire_question_status %}
Status indicator for the questionnaire question.
{% enddocs %}

{% docs questionnaire_question_response_format %}
The expected format or type of response for the questionnaire question.
{% enddocs %}

{% docs questionnaire_question_has_use_previous_answer %}
Indicator if the question uses the response from a previous questionnaire.
{% enddocs %}

{% docs questionnaire_question_is_read_only %}
Indicator if the question is read-only and cannot be modified.
{% enddocs %}

{% docs questionnaire_question_is_distribution %}
Indicator if the question is regarding distribution.
{% enddocs %}

{% docs questionnaire_section_id %}
A surrogate key for the questionnaire section, generated using a combination of the country code and Section_ID.
{% enddocs %}

{% docs questionnaire_section_key %}
The original Section_ID from the source table. It gets **repeated** between countries.
{% enddocs %}

{% docs questionnaire_section_parent_id %}
A surrogate key for the parent section of the questionnaire, generated using a combination of the country code and ParentSection_ID.
{% enddocs %}

{% docs questionnaire_section_parent_key %}
The original ParentSection_ID from the source table.
{% enddocs %}

{% docs sfa_bo_id %}
Not used. A surrogate key for the business object related to the questionnaire section, generated using a combination of the country code and BO_ID.
{% enddocs %}

{% docs sfa_bo_key %}
Not used. The original BO_ID from the source table.
{% enddocs %}

{% docs questionnaire_section_name %}
The name of the specific section.
{% enddocs %}

{% docs questionnaire_section_external_code %}
External code related to a specific section.
{% enddocs %}

{% docs questionnaire_section_level %}
The hierarchical level of the section within the questionnaire section's structure.
{% enddocs %}

{% docs questionnaire_section_sort_order %}
The sort order of the section within the questionnaire or within its parent section.
{% enddocs %}

{% docs questionnaire_section_grouping_type %}
Not used. Method used to group questions within the section.
{% enddocs %}

{% docs questionnaire_section_status %}
Status indicator for a specific section within the questionnaire.
{% enddocs %}

{% docs is_call_button %}
Indicator if the section has a call button functionality.
{% enddocs %}

{% docs is_photo_report %}
Indicator if the section requires a photo.
{% enddocs %}