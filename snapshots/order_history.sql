{% snapshot order_history %}

{{
    config(
      target_schema=target.schema,
      unique_key=dbt_utils.generate_surrogate_key([id, ordered_at]),
      strategy='timestamp',
      updated_at='ordered_at'
    )
}}

select 
    id,
    customer,
    ordered_at,
    store_id,
    subtotal,
    tax_paid,
    order_total
from {{ ref('orders') }}

{% endsnapshot %}