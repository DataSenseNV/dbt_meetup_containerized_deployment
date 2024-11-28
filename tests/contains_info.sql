{%- test contains_data(model) -%}

{{ config(
    enabled=true,
    tags=["promotion"],
)}}

-- This test checks if the table contains any data

with test as (
    select count(*) as row_count from {{ model }} limit 1
)

select row_count from test where row_count == 0;

{%- endtest -%}