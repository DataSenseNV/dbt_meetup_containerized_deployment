{# 
    This model references a table that is managed by a seed 
    However, the project might not compile if the seed has not run yet
    To avoid this, we can:
    - Check if the table exists, using some of the code we just wrote
    - If it exists, write the transformation the intented way
    - If it doesn’t, create a dummy, empty table instead with the exact same column names.
#}

{%- 
    set source_relation = adapter.get_relation(
        database=source(target.dbname, 'raw_customers').database,
        schema=source(target.dbname, 'raw_customers').schema,
        identifier=source(target.dbname, 'raw_customers').name
    )
-%}

{% set table_exists=source_relation is not none   %}

{% if table_exists %}
    SELECT 
        id,
        name
    FROM {{ source(target.dbname, 'raw_customers') }}
{% else %}
    SELECT 
        1 AS id,
        'Jim' AS name
{% endif %}

select * from {{ source(target.dbname, 'raw_customers') }}