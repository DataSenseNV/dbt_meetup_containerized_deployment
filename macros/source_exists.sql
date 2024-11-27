{% macro source_exists(source_table) -%}

{# 
    This function checks if a source table exists in the source database.
    It outputs True if the table exists and False if it does not.
#}

{%- 
    set source_relation = adapter.get_relation(
        database=source(target.dbname, source_table).database,
        schema=source(target.dbname, source_table).schema,
        identifier=source(target.dbname, source_table).name
    )
-%}

{% do return(source_relation is not none) %}

{% endmacro %}