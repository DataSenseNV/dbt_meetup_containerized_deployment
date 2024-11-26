{# 
    This model references a table that is managed by a seed 
    However, the project might not compile if the seed has not run yet
    To avoid this, we can:
    - Check if the table exists, using the source_exists macro
    - If it exists, write the transformation the intented way
    - If it doesn’t, create a dummy, empty table instead with the exact same column names.
#}

{%- set dummy_record -%}
    SELECT 
        '1' AS id,
        '1' as order_id,
        'ITM-001' AS sku
{%- endset -%}

{% if source_exists('raw_items') %}
    SELECT *
    FROM {{ source(target.dbname, 'raw_items') }}
{% else %}
    {{ dummy_record }}
{% endif %}