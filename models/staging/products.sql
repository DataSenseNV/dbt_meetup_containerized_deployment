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
        'ITM-001' AS sku,
        'Product' as name,
        'Dummy' AS type,
        1 as price,
        'Product description' as description
{%- endset -%}

{% if source_exists('raw_products') %}
    SELECT *
    FROM {{ source(target.dbname, 'raw_products') }}
{% else %}
    {{ dummy_record }}
{% endif %}