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
        '1' as customer,
        '1970-01-01T00:00:00' AS ordered_at,
        '1' as store_id,
        1 as subtotal,
        1 as tax_paid,
        1 as order_total
{%- endset -%}

{% if source_exists('raw_orders') %}
    SELECT *
    FROM {{ source(target.dbname, 'raw_orders') }}
{% else %}
    {{ dummy_record }}
{% endif %}