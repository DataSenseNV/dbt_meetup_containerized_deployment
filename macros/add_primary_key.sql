{% macro add_primary_key(table, columns) %}
{%- set pk_name = table.table ~ '_pkey' %}
{%- if execute %}
DO
$$
BEGIN
    IF NOT {{ is_incremental() }} AND NOT EXISTS (
        SELECT 1
        FROM   pg_constraint con
        JOIN   pg_class     cls 
        ON con.conrelid = cls.oid
        WHERE  con.contype = 'p'
        AND  cls.relname like '{{ table.table }}%'
    )
    THEN
        {% set drop_constraint = 'ALTER TABLE ' ~ table ~ ' DROP CONSTRAINT IF EXISTS ' ~ pk_name -%}
        {%- do run_query(drop_constraint) %}
        ALTER TABLE {{ table.table }}
        ADD CONSTRAINT {{ pk_name }} PRIMARY KEY ({{ columns|join(', ') }});
    END IF;
END
$$
{%- endif %}
{% endmacro %}