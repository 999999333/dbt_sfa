
{% macro add_default_row(model_ref) %}
{% set columns = adapter.get_columns_in_relation(model_ref) %}

union all

select
    {% for column in columns %}
        case 
            when '{{ column.data_type }}' in ('int', 'bigint', 'smallint', 'tinyint', 'numeric', 'decimal', 'float', 'real') then '-1'
            when '{{ column.data_type }}' in ('varchar', 'char', 'text', 'nvarchar', 'nchar') then 'N/A'
            -- Add more data type mappings as needed
            else null
        end as {{ column.name }}{{ ", " if not loop.last else "" }}
    {% endfor %}
{% endmacro %}