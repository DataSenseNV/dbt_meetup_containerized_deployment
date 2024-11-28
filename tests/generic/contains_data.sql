{%- test contains_data(model, column_name) -%}

{{ config(
    enabled=true,
    tags=["promotion"],
)}}

-- This test checks if the table contains any data

with row_counts as (
    select count(*) as row_count from {{ model }} limit 1
),

empty_model as (
    select row_count from row_counts where row_count == 0
)

select *
from empty_model;

{%- endtest -%}