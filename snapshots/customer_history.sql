{% snapshot customer_history %}

{{
    config(
      target_schema=target.schema,
      unique_key=dbt_utils.generate_surrogate_key(['id', 'name']),
      strategy='check',
      check_cols=['id', 'name'],
      invalidate_hard_deletes=True
    )
}}

select 
    id,
    name
from {{ ref('customers') }}

{% endsnapshot %}