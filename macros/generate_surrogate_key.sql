{% macro generate_surrogate_key(column_1, column_2) %}
CONCAT(
        ISNULL(CAST({{ column_1 }} AS NVARCHAR(MAX)), '-1'),
        ISNULL(CAST({{ column_2 }} AS NVARCHAR(MAX)), '-1')
    )
    as _surrogate_key

{% endmacro %}