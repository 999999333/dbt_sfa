{% macro convert_country_to_code(country_name) %}
case
  when {{ country_name }} = 'CZ' then 422
  when {{ country_name }} = 'SK' then 423
  when {{ country_name }} = 'HU' then 424
  when {{ country_name }} is null then -1
  else -2
end
{% endmacro %}