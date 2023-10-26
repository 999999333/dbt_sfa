{% macro left_join_date_to_validity(original_table, original_id, original_date, join_table, join_id, join_valid_from, join_valid_to) %}

left join {{join_table}}

    on {{original_table}}.{{original_id}} = {{join_table}}.{{join_id}}
and
    {{original_table}}.{{original_date}} between {{join_table}}.{{join_valid_from}} and {{join_table}}.{{join_valid_to}}
and 
    {{original_table}}.country_id = {{join_table}}.country_id
    
{% endmacro %}