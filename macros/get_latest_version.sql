{% macro get_latest_version(table_name, columns) %}

{% set column_strings = [] %}
{% for column in columns %}
    {% do column_strings.append(table_name + "." + column) %}
{% endfor %}
{% set columns_list = ", ".join(column_strings) %}

select
    {{ columns_list }}
from [{{ table_name }}]

left join [{{ table_name }}] as table2
on [{{ table_name }}].[{{ columns[0] }}] = table2.[{{ columns[0] }}]
and [{{ table_name }}].dbt_valid_to < table2.dbt_valid_to

where table2.[{{ columns[0] }}] is null

{% endmacro %}
