select 
    orders.id,
    orders.customer_id,
    date(orders.order_date) as order_date,
    orders.order_status,
    orders.payment_status,
    order_items.order_item_id,
    order_items.product_id,
    order_items.sku,
    order_items.quantity,
    {% for revenue_field in ["gross_revenue", "net_revenue", "refunded_revenue"] %}
    {{ convert_to_usd(revenue_field)}} as {{revenue_field}}_usd{{ "," if not loop.last }}
    {% endfor %}
from {{ ref('stg_dbt_test__raw_orders') }} orders
left join {{ ref('stg_dbt_test__raw_order_items') }} order_items
on orders.id = order_items.order_id
left join {{ ref('exchange_rates') }} exchange_rates
using(currency)
order by customer_id