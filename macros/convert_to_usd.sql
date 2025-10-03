{% macro convert_to_usd(column_name) %}
    {{ column_name }} * exchange_rate
{% endmacro %}