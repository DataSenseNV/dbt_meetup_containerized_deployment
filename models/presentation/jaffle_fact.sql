{{
  config(
    materialized='incremental',
    unique_key='order_item_id',
    on_schema_change='sync_all_columns'
  )
}}

WITH items AS (
    SELECT *
    FROM {{ ref('items') }}
),
customers AS (
    SELECT *
    FROM {{ ref('customers') }}
),
products AS (
    SELECT *
    FROM {{ ref('products') }}
),
stores AS (
    SELECT *
    FROM {{ ref('stores') }}
),
orders AS (
    SELECT *
    FROM {{ ref('orders') }}
)

SELECT
    CONCAT(o.id, '-', i.id) AS order_item_id,
    o.id AS order_id,
    o.customer AS customer_id,
    c.name AS customer_name,
    o.ordered_at,
    o.store_id,
    s.name AS store_name,
    s.opened_at AS store_opened_at,
    s.tax_rate AS store_tax_rate,
    o.subtotal,
    o.tax_paid,
    o.order_total,
    i.id AS item_id,
    i.sku AS item_sku,
    p.sku AS product_sku,
    p.name AS product_name,
    p.type AS product_type,
    p.price AS product_price,
    p.description AS product_description
FROM orders o
LEFT JOIN customers c ON o.customer = c.id
LEFT JOIN stores s ON o.store_id = s.id
LEFT JOIN items i ON o.id = i.order_id
LEFT JOIN products p ON i.sku = p.sku

{% if is_incremental() %}
    WHERE o.ordered_at > (SELECT MAX(ordered_at) FROM {{ this }})
{% endif %}